<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Mitemtree;
use App\Mitem;
use App\User;
use Session;
use DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\helpers;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class AdminController extends Controller
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function getmstrbrg()
    {
        $brg=DB::table('mitem')
            ->join('mitemtree', 'mitem.IDItemTree','=','mitemtree.IDItemTree')
            ->select('mitem.*', 'mitemtree.Nama as kategori')
            ->get();
        $kategori=DB::table('mitemtree')->where('Aktif', 'Ya')->get();
        return view('masterbarang',['brg'=>$brg, 'kategori'=>$kategori]);
    }

    public function getcategory()
    {
        $kat=DB::table('mitemtree')->get();
        return view('masterkategori',['kat'=>$kat]);
    }
    
    public function getmstrpgwi()
    {
        $peg=DB::table('users')->get();
        return view('masterpegawai',['peg'=>$peg]);
    }

    public function gettransaksi()
    {
        $hjual=DB::table('tjualh')
            ->join('users', 'tjualh.IDKasir','=','users.id')
            ->select('tjualh.*', 'users.name')->get();
        return view('laporantransaksi',['hjual'=>$hjual]);
        //return view('laporantransaksi');
    }

    public function showdjual(Request $req){
        $id = $req->input("id");
        $djual['data']=DB::table('tjuald')->where('IDJualH', $id)->get();
        return json_encode($djual);
    }

    public function showdjualpegawai(Request $req){
        $id = $req->input("id");
        $djualpegawai['data']=DB::table('tjualh')->where('IDKasir', $id)->get();
        return json_encode($djualpegawai);
    }

    public function filterlaporan(Request $req){
        $jenis = $req->input("jenis");
        $tgl1 = $req->input("tgl1");
        $tgl2 = $req->input("tgl2");
        if($jenis == 1){
            if($tgl1 == null || $tgl2 == null){
                $hjual['data']=DB::table('tjualh')
                ->join('users', 'tjualh.IDKasir','=','users.id')
                ->select('tjualh.*', 'users.name')->get();
            }else{
                $hjual['data']=DB::table('tjualh')
                ->join('users', 'tjualh.IDKasir','=','users.id')
                ->select('tjualh.*', 'users.name')
                ->where('Tanggal', '>=', $tgl1)
                ->where('Tanggal', '<=', $tgl2)->get();
            }
        }
        else if($jenis == 2){
            if($tgl1 == null || $tgl2 == null){
                $hjual['data']=DB::table('tjualh')
                ->join('users', 'tjualh.IDKasir','=','users.id')
                ->select('users.name', DB::raw('sum(tjualh.Total) as user_total'))
                ->groupBy('users.name')
                ->get();
            }
            else{
                $hjual['data']=DB::table('tjualh')
                ->join('users', 'tjualh.IDKasir','=','users.id')
                ->select('users.name', DB::raw('sum(tjualh.Total) as user_total'))
                ->where('tjualh.Tanggal', '>=', $tgl1)
                ->where('tjualh.Tanggal', '<=', $tgl2)
                ->groupBy('users.name')
                ->get();
            }
        }
        else if($jenis == 3){
            if($tgl1 == null || $tgl2 == null){
                $hjual['data']=DB::table('tjuald')
                ->join('mitem', 'tjuald.IDItem','=','mitem.IDItem')
                ->join('tjualh', 'tjuald.IDJualH','=','tjualh.IDJualH')
                ->join('mitemtree', 'mitem.IDItemTree','=','mitemtree.IDItemTree')
                ->select('mitemtree.Nama', DB::raw('count(tjuald.IDItem) as kat_total'))
                ->groupBy('mitemtree.Nama')
                ->get();
            }
            else{
                $hjual['data']=DB::table('tjuald')
                ->join('mitem', 'tjuald.IDItem','=','mitem.IDItem')
                ->join('tjualh', 'tjuald.IDJualH','=','tjualh.IDJualH')
                ->join('mitemtree', 'mitem.IDItemTree','=','mitemtree.IDItemTree')
                ->select('mitemtree.Nama', DB::raw('count(tjuald.IDItem) as kat_total'))
                ->where('tjualh.Tanggal', '>=', $tgl1)
                ->where('tjualh.Tanggal', '<=', $tgl2)
                ->groupBy('mitemtree.Nama')
                ->get();
            }
        }
        else if($jenis == 4){
            if($tgl1 == null || $tgl2 == null){
                $hjual['data']=DB::table('tjuald')
                ->join('mitem', 'tjuald.IDItem','=','mitem.IDItem')
                ->join('tjualh', 'tjuald.IDJualH','=','tjualh.IDJualH')
                ->select('mitem.Nama', DB::raw('count(tjuald.IDItem) as item_total'))
                ->groupBy('mitem.Nama')
                ->get();
            }
            else{
                $hjual['data']=DB::table('tjuald')
                ->join('mitem', 'tjuald.IDItem','=','mitem.IDItem')
                ->join('tjualh', 'tjuald.IDJualH','=','tjualh.IDJualH')
                ->select('mitem.Nama', DB::raw('count(tjuald.IDItem) as item_total'))
                ->where('tjualh.Tanggal', '>=', $tgl1)
                ->where('tjualh.Tanggal', '<=', $tgl2)
                ->groupBy('mitem.Nama')
                ->get();
            }
        }
        else if($jenis == 5){
            if($tgl1 == null || $tgl2 == null){
                $hjual['data']=DB::table('tjualh')
                ->join('users', 'tjualh.IDKasir','=','users.id')
                ->select('tjualh.*', 'users.name')
                ->orderBy('tjualh.Total', 'desc')->get();
            }
            else{
                $hjual['data']=DB::table('tjualh')
                ->join('users', 'tjualh.IDKasir','=','users.id')
                ->select('tjualh.*', 'users.name')
                ->where('tjualh.Tanggal', '>=', $tgl1)
                ->where('tjualh.Tanggal', '<=', $tgl2)
                ->orderBy('tjualh.Total', 'desc')->get();
            }
        }
        else if($jenis == 6){
            if($tgl1 == null || $tgl2 == null){
                $hjual['data']=DB::select("select tjualh.IDJualH, sum(tjuald.jumlah * u.Untung) as 'Keuntungan', sum(tjuald.jumlah * u.hargabeli) as 'HargaBeli', sum(tjuald.jumlah * u.hargajual) as 'HargaJual', sum(tjuald.jumlah) as 'JumlahBarang' from
                (select IDItem, HargaJual, HargaBeli, HargaJual-HargaBeli as 'Untung' from mitem) u, tjualh, tjuald
                where tjualh.IDJualH = tjuald.IDJualH and u.IDItem = tjuald.IDItem
                group by tjualh.IDJualH");
            }
            else{
                $hjual['data']=DB::select(DB::raw("select tjualh.IDJualH, sum(tjuald.jumlah * u.Untung) as 'Keuntungan', sum(tjuald.jumlah * u.hargabeli) as 'HargaBeli', sum(tjuald.jumlah * u.hargajual) as 'HargaJual', sum(tjuald.jumlah) as 'JumlahBarang' from
                (select IDItem, HargaJual, HargaBeli, HargaJual-HargaBeli as 'Untung' from mitem) u, tjualh, tjuald
                where tjualh.IDJualH = tjuald.IDJualH and u.IDItem = tjuald.IDItem and tjualh.Tanggal >= :tgl1 and tjualh.Tanggal <= :tgl2
                group by tjualh.IDJualH"), array("tgl1" => $tgl1, "tgl2" => $tgl2));
            }
        }
        else if($jenis == 8){
            if($tgl1 == null || $tgl2 == null){
                $hjual['data']=DB::table('tjualh')
                ->select('tjualh.Tanggal', DB::raw('sum(tjualh.Total) as date_total'))
                ->groupBy('tjualh.Tanggal')
                ->orderBy('tjualh.Tanggal', 'desc')->get();
            }
            else{
                $hjual['data']=DB::table('tjualh')
                ->select('tjualh.Tanggal', DB::raw('sum(tjualh.Total) as date_total'))
                ->where('tjualh.Tanggal', '>=', $tgl1)
                ->where('tjualh.Tanggal', '<=', $tgl2)
                ->groupBy('tjualh.Tanggal')
                ->orderBy('tjualh.Tanggal', 'desc')->get();
            }
        }
        else if($jenis == 9){
            $hjual['data']=DB::table('tjuald')
            ->join('mitem', 'tjuald.IDItem','=','mitem.IDItem')
            ->select('mitem.Nama', DB::raw('sum(mitem.stokMin) as stok_total'))
            ->groupBy('mitem.Nama')
            ->get();
        }
        else if($jenis == 10){
            if($tgl1 == null || $tgl2 == null){
                $hjual['data']=DB::table('tjualh')
                ->join('users', 'tjualh.IDKasir','=','users.id')
                ->select('tjualh.*', 'users.name')
                ->where('tjualh.JenisPembayaran', 'Tunai')
                ->orderBy('tjualh.Tanggal', 'desc')->get();
            }
            else{
                $hjual['data']=DB::table('tjualh')
                ->join('users', 'tjualh.IDKasir','=','users.id')
                ->select('tjualh.*', 'users.name')
                ->where('tjualh.JenisPembayaran', 'Tunai')
                ->where('tjualh.Tanggal', '>=', $tgl1)
                ->where('tjualh.Tanggal', '<=', $tgl2)
                ->orderBy('tjualh.Tanggal', 'desc')->get();
            }
        }
        else if($jenis == 11){
            if($tgl1 == null || $tgl2 == null){
                $hjual['data']=DB::table('tjualh')
                ->join('users', 'tjualh.IDKasir','=','users.id')
                ->select('tjualh.*', 'users.name')
                ->where('tjualh.JenisPembayaran', 'Kartu')
                ->orderBy('tjualh.Tanggal', 'desc')->get();
            }
            else{
                $hjual['data']=DB::table('tjualh')
                ->join('users', 'tjualh.IDKasir','=','users.id')
                ->select('tjualh.*', 'users.name')
                ->where('tjualh.JenisPembayaran', 'Kartu')
                ->where('tjualh.Tanggal', '>=', $tgl1)
                ->where('tjualh.Tanggal', '<=', $tgl2)
                ->orderBy('tjualh.Tanggal', 'desc')->get();
            }
        }
        return json_encode($hjual);
    }

    public function chart(){
        $hjual['data']=DB::table('tjualh')->get();
        return json_encode($hjual);
    }

    public function updateinputmasterbarang(Request $req){
        $id = $req->input("id");
        $barang['data']=DB::table('mitem')
            ->join('mitemtree', 'mitem.IDItemTree','=','mitemtree.IDItemTree')
            ->select('mitem.*', 'mitemtree.IDItemTree as kategori')
            ->where('mitem.IDItem', $id)
            ->get();
        $barang['kategori']=DB::table('mitemtree')->where('Aktif', 'Ya')->get();
        return json_encode($barang);
    }

    public function updateinputmasterpegawai(Request $req){
        $id = $req->input("id");
        $pegawai['data']=DB::table('users')
            ->where('users.id', $id)
            ->get();
        return json_encode($pegawai);
    }

    public function updateinputmasterkategori(Request $req){
        $id = $req->input("id");
        $kategori['data']=DB::table('mitemtree')
            ->where('mitemtree.IDItemTree', $id)
            ->get();
        return json_encode($kategori);
    }

    public function filterchart(Request $req){
        $jenis = $req->input("jenis");
        if($jenis == 1){
            $hjual['data']=DB::table('tjualh')
            ->join('users', 'tjualh.IDKasir','=','users.id')
            ->select('tjualh.*', 'users.name')->get();
        }
        else if($jenis == 2){
            $hjual['data']=DB::table('tjualh')
            ->join('users', 'tjualh.IDKasir','=','users.id')
            ->select('users.name', DB::raw('sum(tjualh.Total) as user_total'))
            ->groupBy('users.name')
            ->get();
        }
        else if($jenis == 3){
            $hjual['data']=DB::table('tjuald')
            ->join('mitem', 'tjuald.IDItem','=','mitem.IDItem')
            ->join('mitemtree', 'mitem.IDItemTree','=','mitemtree.IDItemTree')
            ->select('mitemtree.Nama', DB::raw('count(tjuald.IDItem) as kat_total'))
            ->groupBy('mitemtree.Nama')
            ->get();
        }
        else if($jenis == 4){
            $hjual['data']=DB::table('tjuald')
            ->join('mitem', 'tjuald.IDItem','=','mitem.IDItem')
            ->select('mitem.Nama', DB::raw('count(tjuald.IDItem) as item_total'))
            ->groupBy('mitem.Nama')
            ->get();
        }
        else if($jenis == 5){
            $hjual['data']=DB::table('tjualh')
            ->join('users', 'tjualh.IDKasir','=','users.id')
            ->select('tjualh.*', 'users.name')
            ->orderBy('tjualh.Total', 'desc')->get();
        }
        else if($jenis == 6){
            $hjual['data']=DB::select(DB::raw("select tjualh.IDJualH, sum(tjuald.jumlah * u.Untung) as 'Keuntungan', sum(tjuald.jumlah * u.hargabeli) as 'HargaBeli', sum(tjuald.jumlah * u.hargajual) as 'HargaJual', sum(tjuald.jumlah) as 'JumlahBarang' from
            (select IDItem, HargaJual, HargaBeli, HargaJual-HargaBeli as 'Untung' from mitem) u, tjualh, tjuald
            where tjualh.IDJualH = tjuald.IDJualH and u.IDItem = tjuald.IDItem
            group by tjualh.IDJualH"));
        }
        else if($jenis == 8){
            $hjual['data']=DB::table('tjualh')
            ->select('tjualh.Tanggal', DB::raw('sum(tjualh.Total) as date_total'))
            ->groupBy('tjualh.Tanggal')
            ->get();
        }
        else if($jenis == 9){
            $hjual['data']=DB::table('tjuald')
            ->join('mitem', 'tjuald.IDItem','=','mitem.IDItem')
            ->select('mitem.Nama', DB::raw('sum(mitem.stokMin) as stok_total'))
            ->groupBy('mitem.Nama')
            ->orderBy('stok_total', 'desc')
            ->get();
        }
        else if($jenis == 10){
            $hjual['data']=DB::table('tjualh')
            ->join('users', 'tjualh.IDKasir','=','users.id')
            ->select('tjualh.*', 'users.name')
            ->where('tjualh.JenisPembayaran', 'Tunai')
            ->orderBy('tjualh.Tanggal', 'desc')->get();
        }
        else if($jenis == 11){
            $hjual['data']=DB::table('tjualh')
            ->join('users', 'tjualh.IDKasir','=','users.id')
            ->select('tjualh.*', 'users.name')
            ->where('tjualh.JenisPembayaran', 'Kartu')
            ->orderBy('tjualh.Tanggal', 'desc')->get();
        }
        return json_encode($hjual);
    }

    

    public function getgrafik()
    {
        //$kat=DB::table('')->get();
        //return view('laporantransaksi',['kat'=>$kat]);
        return view('chartpenjualan');
    }

    public function editstatuskategori(Request $req){
        $id = $req->input("id");
        $stat = $req->input("status");
        if($stat == "0"){
            DB::table("mitemtree")->where('IDItemTree',$id)->update(['Aktif' => "Ya"]);
        }
        else{
            DB::table("mitemtree")->where('IDItemTree',$id)->update(['Aktif' => "Tidak"]);
        }
        //$kat=DB::table('mitemtree')->get();
        //return view('masterkategori',['kat'=>$kat]);
    }

    public function editstatusbarang(Request $req){
        $id = $req->input("id");
        $stat = $req->input("status");
        if($stat == "0"){
            DB::table("mitem")->where('IDItem',$id)->update(['Aktif' => "Ya"]);
        }
        else{
            DB::table("mitem")->where('IDItem',$id)->update(['Aktif' => "Tidak"]);
        }
        //$kat=DB::table('mitem')->get();
        //return view('masterbarang',['kat'=>$kat]);
    }

    public function editstatuspegawai(Request $req){
        $id = $req->input("id");
        $stat = $req->input("status");
        if($stat == "0"){
            DB::table("users")->where('id',$id)->update(['Aktif' => "Ya"]);
        }
        else{
            DB::table("users")->where('id',$id)->update(['Aktif' => "Tidak"]);
        }
        //$kat=DB::table('users')->get();
        //return view('masterpegawai',['kat'=>$kat]);
    }

    public function insertmstrbrg(Request $req){
        if($req->input("jenis") == 'insert'){
            $nama = $req->input("nama");
            $kategori = $req->input("kategori");
            $stok = $req->input("stok");
            $satuan = $req->input("satuan");
            $hargajual = $req->input("hargajual");
            $hargabeli = $req->input("hargabeli");
            DB::table('mitem')->insert(
                ['Nama' => $nama, 'IDItemTree' => $kategori, 'Satuan' => $satuan, 'HargaJual' => $hargajual, 'StokMin' => $stok, 'Aktif' => 'Ya', 'HargaBeli' => $hargabeli, 'InsertUser' => Auth::user()->email, 'InsertTime' => date('Y-m-d H:i:s')]
            );
            $barang["data"]=DB::table('mitem')
                ->join('mitemtree', 'mitem.IDItemTree','=','mitemtree.IDItemTree')
                ->select('mitem.*', 'mitemtree.Nama as kategori')
                ->get();
            return json_encode($barang);
            
        }
        else if($req->input("jenis") == 'update'){
            $id = $req->input("id");
            $nama = $req->input("nama");
            $kategori = $req->input("kategori");
            $stok = $req->input("stok");
            $satuan = $req->input("satuan");
            $hargajual = $req->input("hargajual");
            $hargabeli = $req->input("hargabeli");
            DB::table('mitem')->where('IDItem', $id)->update(
                ['Nama' => $nama, 'IDItemTree' => $kategori, 'Satuan' => $satuan, 'HargaJual' => $hargajual, 'StokMin' => $stok, 'Aktif' => 'Ya', 'HargaBeli' => $hargabeli, 'UpdateUser' => Auth::user()->email, 'UpdateTime' => date('Y-m-d H:i:s')]
            );
            $barang["data"]=DB::table('mitem')
                ->join('mitemtree', 'mitem.IDItemTree','=','mitemtree.IDItemTree')
                ->select('mitem.*', 'mitemtree.Nama as kategori')
                ->get();
            return json_encode($barang);
        }
    }

    public function insertmstrpegawai(Request $req){
        if($req->input("jenis") == 'insert'){
            $nama = $req->input("nama");
            $username = $req->input("username");
            $password = $req->input("password");
            $alamat = $req->input("alamat");
            $telepon = $req->input("telepon");
            $email = $req->input("email");
            $role = $req->input("role");
            DB::table('users')->insert(
                ['name' => $nama, 'username' => $username, 'email' => $email, 'password' => bcrypt($password), 'jabatan' => $role, 'alamat' => $alamat, 'telepon' => $telepon, 'created_at' => date('Y-m-d H:i:s')]
            );
            $pegawai["data"]=DB::table('users')->get();
            return json_encode($pegawai);
        }
        else if($req->input("jenis") == 'update'){
            $id = $req->input("id");
            $nama = $req->input("nama");
            $username = $req->input("username");
            $password = $req->input("password");
            $alamat = $req->input("alamat");
            $telepon = $req->input("telepon");
            $email = $req->input("email");
            $role = $req->input("role");
            DB::table('users')->where('id', $id)->update(
                ['name' => $nama, 'username' => $username, 'email' => $email, 'jabatan' => $role, 'alamat' => $alamat, 'telepon' => $telepon, 'updated_at' => date('Y-m-d H:i:s')]
            );
            $pegawai["data"]=DB::table('users')->get();
            return json_encode($pegawai);
        }
    }

    public function insertmstrcategory(Request $req){
        if($req->input("jenis") == 'insert'){
            $nama = $req->input("nama");
            DB::table('mitemtree')->insert(
                ['Nama' => $nama, 'InsertUser' => Auth::user()->email, 'InsertTime' => date('Y-m-d H:i:s')]
            );
            $kategori["data"]=DB::table('mitemtree')->get();
            return json_encode($kategori);
        }
        if($req->input("jenis") == 'update'){
            $id = $req->input("id");
            $nama = $req->input("nama");
            DB::table('mitemtree')->where("IDItemTree", $id)->update(
                ['Nama' => $nama, 'UpdateUser' => Auth::user()->email, 'UpdateTime' => date('Y-m-d H:i:s')]
            );
            $kategori["data"]=DB::table('mitemtree')->get();
            return json_encode($kategori);
        }
    }



    
}