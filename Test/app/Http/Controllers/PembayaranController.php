<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Session;
use Illuminate\Support\Facades\DB;
use DateTime;
use App\User;
use XmlParser;

class PembayaranController extends Controller
{
	public function index()
    {
        If(session("statusLogin") == "1") {
        	$cart = session('cart');
	        $message = "";
	        if(!empty($cart)){
	        	// jika ada barang yang dibeli maka boleh masuk ke halaman pembayaran
	        	return view('pembayaran',[ 'kd' => PembayaranController::TransactionCode() ]);
        	}else{
        		// jika tidak ada barang yang dibeli maka akan dikembalikan ke halaman home
				$message = "Belum ada barang yang dibeli";
            	return redirect('home')->with("message",$message);
        	}            
        }else{
            return redirect('login');
        }
    }

	public static function TransactionCode()
	{
		$ctr = DB::table('tjualh')->count();
		$ctr = $ctr + 1;
		$dir = 'C:\ConfigTerminal.xml';

        if (!file_exists($dir)) {
            $terminal = '111';
        } else {
            $xml = XmlParser::load($dir);

            $KdTerm = $xml->parse([
                'kode' => ['uses' => 'terminal.kode'],
            ]);

            $terminal = $KdTerm['kode'];
        }

		return $terminal . str_pad($ctr,4,"0",STR_PAD_LEFT);
	}

	public static function CountTotal($array)
	{
		$TempTotal = 0;
		for ($i=0; $i < count($array); $i++) { 
			if($array[$i]['aktif'] == 'ya'){
				$TempTotal+=$array[$i]['subtotal'];  
			}
		}
		return $TempTotal;
	}

    public static function StoreTransaction($cart,$total, $CashierId, $dt,$jenis)
    {
    	$kd = PembayaranController::TransactionCode();
    	DB::table('tjualh')->insert(
		    ['Kode' => $kd, 'Tanggal' => $dt, 'Total' => $total, 'Lunas' => 'Ya', 'IDKasir' => $CashierId, 'JenisPembayaran' => $jenis]
		);
		$IdHeader = DB::table('tjualh')->max('IDJualH');
    	for ($i=0; $i < count($cart); $i++) { 
    		DB::table('tjuald')->insert(
			    ['IDJualH' => $IdHeader, 'IDItem' => $cart[$i]['id'], 'NamaItem' => $cart[$i]['name'], 'Jumlah' => $cart[$i]['qty'], 'Harga' => $cart[$i]['price'], 'DiscPersen' => 0, 'Subtotal' => $cart[$i]['subtotal'], 'Aktif' => $cart[$i]['aktif']]
			);
			$IdDetail = DB::table('tjuald')->max('IDJualD');
			DB::table('tjurnalitem')->insert(
				['IDItem' => $cart[$i]['id'], 'Tanggal' => $dt, 'Jumlah' => $cart[$i]['qty'],'IDJualD' => $IdDetail, 'Aktif' => $cart[$i]['aktif']]
			);
    	}
    }

    public function CashMethod(Request $request)
    {
    	$totalbayar = PembayaranController::CountTotal(session('cart'));//total yang harus dibayar customer
    	$valuepembayaran = $request->input('nmUangPembayaran');
    	$uangpembayaran = filter_var($valuepembayaran, FILTER_SANITIZE_NUMBER_INT);
    	$message = "";

    	if($uangpembayaran >= $totalbayar){
    		$kembalian = $uangpembayaran - $totalbayar;
    		$cashier = $request->input('cashier');
	    	$now= new DateTime();
	    	
	    	PembayaranController::StoreTransaction(session('cart'),$totalbayar,$cashier,$now,'Tunai');

			$IDJualH = DB::table('tjualh')->max('IDJualH');		

			DB::table('tjualbayarkash')->insert(
			    ['IDJualH' => $IDJualH, 'IDKasir' => $cashier, 'Tanggal' => $now, 'Tunai' => $uangpembayaran, 'Total' => $totalbayar, 'Kembali' => $kembalian]
			);
			DB::table('tjualbayarkasd')->insert(
			    ['IDJualH' => $IDJualH, 'Metode' => 'Tunai', 'Nominal' => $totalbayar, 'Status' => 'Pending']
			);

			$kasir = User::select('name')->where('id',$cashier)->get();
			$kodenota = DB::table('tjualh')->select('Kode')->where('IDJualH',$IDJualH)->get();
			$namatoko = DB::table('TemplateNota')->where('Atribut','NamaToko')->get();
			$alamat = DB::table('TemplateNota')->where('Atribut','Alamat')->get();
			$telp = DB::table('TemplateNota')->where('Atribut','NoTelp')->get();
			$footer = DB::table('TemplateNota')->where('Atribut','Footer')->get();

			//pindah ke halaman print nota
	    	return view('printnota',['namatoko'=> $namatoko,'alamat'=>$alamat,'telp'=>$telp,'footer'=>$footer,'kodenota' => $kodenota,'kasir' => $kasir, 'tanggal' => $now->format('d-m-Y H:i:s'), 'total' => $totalbayar, 'carapembayaran' => "Tunai", 'pembayaran' => $uangpembayaran, 'kembalian' => $kembalian]);
	    }else{
	    	$message = "Pembayaran tidak cukup";
	    	$request->session()->flash('statusBayar', '0');
	    	$request->session()->flash('alertBayar', $message);
	    	return redirect(route('bayar'));
	    }
    }

    public function CardMethod(Request $request)
    {
    	$totalbayar = PembayaranController::CountTotal(session('cart'));
    	$stringjumlahbayar = $request->input('nmUangPembayaran');
    	$jumlahbayar = filter_var($stringjumlahbayar, FILTER_SANITIZE_NUMBER_INT);
    	$message = "";
	    $reffID = $request->input('ReffID');
	    $jeniskartu = $request->input('JenisKartu');
	    $namabank = $request->input('NamaBank');
	    $nomerkartu = $request->input('NomerKartu');
	    $keterangan = $request->get('Keterangan');
	    if(!empty($reffID) && !empty($jeniskartu) && !empty($namabank) && !empty($nomerkartu)){
	    	if($jumlahbayar >= $totalbayar){
	    		$kembalian = $jumlahbayar - $totalbayar;
	    		$cashier = $request->input('cashier');
		    	$now= new DateTime();
		    	
		    	PembayaranController::StoreTransaction(session('cart'),$totalbayar,$cashier,$now,'Kartu');

		    	$IDJualH = DB::table('tjualh')->max('IDJualH');

		    	DB::table('tjualbayarkash')->insert(
				    ['IDJualH' => $IDJualH, 'IDKasir' => $cashier, 'Tanggal' => $now, 'Kartu' => $totalbayar, 'Total' => $totalbayar, 'Kembali' => $kembalian] 
				);
		    	DB::table('tjualbayarkasd')->insert(
		    		['IDJualH' => $IDJualH, 'Metode' => $jeniskartu, 'Bank'=> $namabank, 'NomorKartu' => $nomerkartu, 'RefTrans' => $reffID, 'Nominal' => $totalbayar, 'Keterangan' => $keterangan, 'Status' => 'Pending']
		    	);

				$kasir = User::select('name')->where('id',$cashier)->get();
				$kodenota = DB::table('tjualh')->select('Kode')->where('IDJualH',$IDJualH)->get();
				$namatoko = DB::table('TemplateNota')->where('Atribut','NamaToko')->get();
				$alamat = DB::table('TemplateNota')->where('Atribut','Alamat')->get();
				$telp = DB::table('TemplateNota')->where('Atribut','NoTelp')->get();
				$footer = DB::table('TemplateNota')->where('Atribut','Footer')->get();

				//pindah ke halaman print nota
		    	return view('printnota',['namatoko'=> $namatoko,'alamat'=>$alamat,'telp'=>$telp,'footer'=>$footer,'kodenota' => $kodenota,'cart' => session('cart'), 'kasir' => $kasir, 'tanggal' => $now->format('d-m-Y H:i:s'), 'total' => $totalbayar, 'carapembayaran' => $jeniskartu, 'pembayaran' => $jumlahbayar, 'kembalian' => $kembalian, 'nomerkartu' => str_pad(substr($nomerkartu,0,2),strlen($nomerkartu),"x"), 'reffID' => $reffID]);
	    	}else{
	    		$message = "Pembayaran tidak cukup";
	    		$request->session()->flash('statusBayar', '0');
	    		$request->session()->flash('alertBayar', $message);
	    		return redirect(route('bayar'));
	    	}
	    }else{
	    	$message = "Data yang dibutuhkan belum lengkap";
    		$request->session()->flash('statusBayar', '0');
    		$request->session()->flash('alertBayar', $message);
	    	return redirect(route('bayar'));
	    }
    }
}
