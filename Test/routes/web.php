<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function (){
	return view('welcome');
});

// Route::get('blade/{id}', function ($id) {
//     return view('child',['id' => $id]);
// });

// Route::resource('items', 'ItemController');

Route::get('/index',function(){
    return view('index');
});
// Route::get('/welcome', function (){
//     return view('welcome');
// });

//Auth::routes();

Route::get('/board',function(){
	return view('layouts/board');
});

Route::get('/mstrpgwi','AdminController@getmstrpgwi');
Route::get('/mstrbrg','AdminController@getmstrbrg');
Route::get('/category','AdminController@getcategory');
Route::get('/transaksi','AdminController@gettransaksi');
Route::get('/grafik','AdminController@getgrafik');

Route::post('/editstatuskategori','AdminController@editstatuskategori');
Route::post('/editstatusbarang','AdminController@editstatusbarang');
Route::post('/editstatuspegawai','AdminController@editstatuspegawai');

Route::post('/updateinputmasterbarang','AdminController@updateinputmasterbarang');
Route::post('/updateinputmasterpegawai','AdminController@updateinputmasterpegawai');
Route::post('/updateinputmasterkategori','AdminController@updateinputmasterkategori');

Route::post('/insertbarang','AdminController@insertmstrbrg');

Route::post('/insertpegawai','AdminController@insertmstrpegawai');

Route::post('/insertcategory','AdminController@insertmstrcategory');

Route::post('/showtransaksi','AdminController@showtransaksi');

Route::post('/showdjual','AdminController@showdjual');
Route::post('/showdjualpegawai','AdminController@showdjualpegawai');

Route::post('/filterlaporan','AdminController@filterlaporan');

Route::post('/chart','AdminController@chart');

Route::post('/filterchart','AdminController@filterchart');

// Route::get('/barang',function(){
//    $brg=DB::table('mitem')->get();
//    return view('masterbarang',['brg'=>$brg]);
// });

// Route::get('/kategori',function(){
// 	return view('masterkategori');
// });

// Route::get('/mstrpgwi',function(){
// 	return view('masterpegawai');
// });

// Route::get('/laporan',function(){
// 	return view('laporantransaksi');
// });

// Route::get('/chart',function(){
// 	return view('chartpenjualan');
// });

Route::get('/home', 'HomeController@index')->name('home');

Route::post('/searchcategory', 'HomeController@SearchCategory');

// Route::post('/search', 'HomeController@SearchFromItemCode')->name('search');

Route::get('/search', 'HomeController@SearchFromItemBy')->name('search');

Route::get('/searchbarcode','HomeController@SearchBarcode')->name('searchbarcode');

Route::post('/add', 'HomeController@Cart')->name('add_item');

Route::post('/addqty', 'HomeController@AddQuantity')->name('add_qty');

Route::post('/reduceqty', 'HomeController@ReduceQuantity')->name('reduce_qty');

Route::post('/remove','HomeController@RemoveFromCart')->name('remove');

// Route::get('/pembayaran', function (){
//     return view('pembayaran');
// })->name('bayar');

Route::get('/pembayaran', 'PembayaranController@index')->name('bayar');

Route::get('/login', 'LoginController2@showLoginPage')->name('login');

Route::post('/loginCheck', 'LoginController2@LoginCheck')->name('loginCheck');

Route::post('/logout', 'LoginController2@Logout')->name('logout');


// Route::get('/login', 'LoginController2@showLoginPage')->name('showLogin');

Route::post('/cash','PembayaranController@CashMethod')->name('cash');

Route::post('/card','PembayaranController@CardMethod')->name('card');

Route::get('/print',function(){
	return view('printnota');
})->name('print');