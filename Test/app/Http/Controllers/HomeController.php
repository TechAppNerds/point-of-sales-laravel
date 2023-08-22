<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Item;
use App\Mitem;
use App\Mitemtree;
use App\User;
use Illuminate\Contracts\Session\Session as SessionSession;
use Session;
use Illuminate\Support\Facades\Hash;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        If (session("statusLogin") == "1") {
            if(session("jabatan") == "kasir"){
                $categories = Mitemtree::all();
                return view('home', [ 'categories' => $categories , 'kd' => app('App\Http\Controllers\PembayaranController')->TransactionCode()]);
            }
            else{
                return redirect('board');
            }
        }else{
            return redirect('login');
        }
    }

    public function SearchCategory(Request $request)
    {
        $search=[];
        $category = $request->input('SearchCategory');        
        if(isset($category)){
            $items = Mitem::where('IDItemTree', $category)->get();            
            foreach($items as $ItemSearch)
            {
                $search[] = array('id' => $ItemSearch->IDItem, 'kode' => $ItemSearch->Kode,'name' => $ItemSearch->Nama,'price' => $ItemSearch->HargaJual);
            }
        }
        Session::put('search', $search);
        return redirect('home');
    }

    public function SearchBarcode(Request $request){
        $barcode = $request->input('searchbarcode');
        if(isset($barcode)){
            $Item = Mitem::where('Barcode',$barcode)->get();
            HomeController::AddToCart($Item);
        }
        return redirect('home');
    }

    public function SearchFromItemBy(Request $request)
    {
        $search=[];
        $searchBy = $request->input('searchby');
        $cariberdasarkan = $request->input('SearchFrom');
        if(!empty($searchBy)){
            if($cariberdasarkan == "kode"){
                $items = Mitem::where('Kode', 'LIKE', '%' . $searchBy)->get();
            }else if($cariberdasarkan == "nama"){
                $items = Mitem::where('Nama', 'LIKE', '%' . $searchBy . '%')->get();
            }
            foreach($items as $ItemSearch)
            {
                $search[] = array('id' => $ItemSearch->IDItem, 'kode' => $ItemSearch->Kode,'name' => $ItemSearch->Nama,'price' => $ItemSearch->HargaJual);
            }
        }
        Session::put('search', $search);
        return redirect('home');
    }

    public function Cart(Request $request)
    {
        $ItemAddID = $request->input('ItemAdd');
        $Item = Mitem::where('IDItem',$ItemAddID)->get();
        HomeController::AddToCart($Item);
        return redirect('home');
    }

    public static function AddToCart($Item){
        $cart = session('cart');
        foreach($Item as $DataItem)
        {
            // cek barang tersebut ada di cart atau tidak
            $cek = 0;
            $idx = -1;
            if($cart != null){
                for($i=0;$i<count($cart);$i++){
                    if($cart[$i]['id'] == $DataItem->IDItem){
                        if($cart[$i]['aktif']=='ya'){
                            $cek = 1;                            
                        }else if($cart[$i]['aktif']=='tidak'){
                            $cek = 2;
                        }
                        $idx = $i;
                    }
                }
            }else $cart=array();
            if($cek == 2){
                // jika barang pernah di cancel dari cart terus dipesan ulang
                $cart[$idx]['aktif'] = 'ya';
                $cart[$idx]['qty'] = 1;
                $cart[$idx]['subtotal'] = $cart[$idx]['qty'] * $cart[$idx]['price'];
            }else if($cek == 1){
                // jika barang sudah ada di cart
                $cart[$idx]['qty'] += 1;
                $cart[$idx]['subtotal'] = $cart[$idx]['qty'] * $cart[$idx]['price'];
            }else if($cek == 0){
                // jika barang belum ada di cart
                $qty = 1;
                $subtotal = $qty * $DataItem->HargaJual;
                $newItem = array('id' => $DataItem->IDItem, 'kode' => $DataItem->Kode,'name' => $DataItem->Nama,'qty' => $qty,'price' => $DataItem->HargaJual,'subtotal' => $subtotal, 'aktif' => 'ya');
                array_push($cart, $newItem);
            }
        }
        Session::put('cart', $cart);
    }

    public function AddQuantity(Request $request)
    {        
        $cart = session('cart');
        $itemID = $request->input('PlusButton');
        for($i=0;$i<count($cart);$i++){
            if($cart[$i]['id'] == $itemID){
                $cart[$i]['qty'] += 1;
                $cart[$i]['subtotal'] = $cart[$i]['qty'] * $cart[$i]['price'];
            }
        }
        Session::put('cart', $cart);
        return redirect('home');
    }

    public static function CheckAuthentication($email,$password, Request $request){
        $cek = false;
        $message = "";
        $userinfo = User::where('email',$email)->get();
        if(count($userinfo)!=0){
            foreach($userinfo as $user){
                if (Hash::check($password, $user->password)) {
                    if ($user->jabatan == 'supervisor'){
                        $cek = true;
                        // $message = "supervisor";
                    }else{
                        $message = "Bukan supervisor.";
                        $request->session()->flash('statusAutentikasi', '0');
                        $request->session()->flash('alertAutentikasi', $message);
                    }
                }
                else{
                    $message = "Password yang dimasukkan salah.";
                    $request->session()->flash('statusAutentikasi', '0');
                    $request->session()->flash('alertAutentikasi', $message);
                }
            }
        } else {
            $message = "Email yang dimasukkan salah.";
            $request->session()->flash('statusAutentikasi', '0');
            $request->session()->flash('alertAutentikasi', $message);
        }
        
        return $cek;
    }

    public function ReduceQuantity(Request $request)
    {
        $cart = session('cart');
        $itemID = $request->input('MinusButton');
        for($i=0;$i<count($cart);$i++){
            if($cart[$i]['id'] == $itemID){
                if ($cart[$i]['qty'] - 1 > 0){
                    $cart[$i]['qty'] -= 1;
                    $cart[$i]['subtotal'] = $cart[$i]['qty'] * $cart[$i]['price'];
                }else unset($cart[$i]);
            }
        }
        Session::put('cart', array_values($cart));
        return redirect('home');
    }

    public function RemoveFromCart(Request $request){
        $cart = session('cart');
        $itemID = $request->input('RemoveButton');
        for($i=0;$i<count($cart);$i++){
            if($cart[$i]['id'] == $itemID){
                $cart[$i]['aktif'] = 'tidak';
                unset($cart[$i]);
            }
        }
        Session::put('cart', array_values($cart));
        return redirect('home');
    }

}
