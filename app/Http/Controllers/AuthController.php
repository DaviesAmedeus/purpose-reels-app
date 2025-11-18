<?php

namespace App\Http\Controllers;

use App\UserStatus;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function loginForm()
    {

        $data = [
            'pageTitle' => 'Login'
        ];

        return view('back.pages.auth.login', $data);
    }

    public function forgotForm()
    {

        $data = [
            'pageTitle' => 'Forgot Password'
        ];

        return view('back.pages.auth.forgot', $data);
    }

    public function loginHandler(Request $request)
    {

        // Check if the entered 'login_id' is 'email' or 'username'
        $fieldType = filter_var($request->login_id, FILTER_VALIDATE_EMAIL) ? 'email' : 'username';

        if ($fieldType == 'email') {
            $request->validate([
                'login_id' => 'required|email|exists:users,email',
                'password' => 'required|min:6'
            ], [
                'login_id.required' => 'Enter your email or username',
                'login_id.email' => 'Ivalid email address',
                'login_id.exists' => 'No account found for this email',
            ]);
        } else {
            $request->validate([
                'login_id' => 'required|exists:users,username',
                'password' => 'required|min:6'
            ], [
                'login_id.required' => 'Enter your email or username',
                'login_id.exists' => 'No account found for this username',
            ]);
        }

        $creds = array(
            $fieldType => $request->login_id,
            'password' => $request->password
        );

        if (Auth::attempt($creds)) {
            // check if the account is in inactive mode
            if (Auth::user()->status == UserStatus::Inactive) {
                Auth::logout();
                $request->session()->invalidate();
                $request->session()->regenerateToken();
                return redirect()->route('admin.login')->with('fail', 'Your  account is currently inactive. Please contact support at (support@purposereels.com) for further assistance');
            }


            // check if the account is in pending mode
            if (Auth::user()->status == UserStatus::Pending) {
                Auth::logout();
                $request->session()->invalidate();
                $request->session()->regenerateToken();
                return redirect()->route('admin.login')->with('fail', 'Your  account is currently pending approval. Please check your email for further instructions or contact support at (support@purposereels.com) for further assistance');
            }

              // Redirect the user to dashboard
                return redirect()->route('admin.dashboard');
        } else {
            return redirect()->route('admin.login')->withInput()->with('fail', 'Incorrect password!');
        }
    }
}
