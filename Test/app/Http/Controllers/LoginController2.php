<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Mitemtree;
use App\Mitem;
use App\User;
use Illuminate\Contracts\Session\Session as SessionSession;
use Session;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\helpers;

class LoginController2 extends Controller
{
    public function showLoginPage()
    {
        return view('index');
    }

    public function LoginCheck(Request $request)
    {
        $username = $request->input('username');
        $pass = $request->input('pass');        
        if (Auth::attempt(['email' => $username, 'password' => $pass])) {
            // Authentication passed...
            $users = User::where('email', $username)->get();
            foreach ($users as $user) {
                if($user->Aktif == "Ya"){
                    if ($user->jabatan == "kasir") {
                        session(['statusLogin' => '1']);
                        session(['jabatan' => 'kasir']);
                        return redirect('home');        
                    }
                    else if($user->jabatan=="admin"){
                        session(['statusLogin' => '1']);
                        session(['jabatan' => 'admin']);
                        return redirect('board');
                    }
                    else {
                        // Jika yg login bukan kasir
                        session(['statusLogin' => '0']);
                        session(['alertLogin' => 'Hanya kasir yang bisa login']);
                        return redirect('login');
                    }
                }
                else{
                    session(['statusLogin' => '0']);
                    session(['alertLogin' => 'User Tidak Aktif']);
                    return redirect('login');
                }
            }
        }else{
            // Authentication not passed...
            session(['statusLogin' => '0']);
            session(['alertLogin' => 'Email atau password salah']);
            return redirect('login');
        }
    }

    public function Logout(Request $request)
    {
        $request->session()->flush();
        return redirect('login');
    }
}
