<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\UserStatus;
use App\Models\User;
use App\Helpers\CMail;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

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


    public function sendPasswordResetLink(Request $request){

        // validate the form
        $request->validate([
            'email'=>'required|email|exists:users,email'
        ],[
            'emai.requred'=>'The :attribute is required',
            'emai.email'=>'Invalid email address',
            'emai.exists'=>'We can not find a user with this email address'
        ]);


        // Get user details
        $user = User::where('email', $request->email)->first();

        // Generate token
        $token = base64_encode(Str::random(64));

        // Check if there is an existing token
        $oldToken = DB::table('password_reset_tokens')
            ->where('email', $user->email)
            ->first();

        if($oldToken){
            // update the exist token
            DB::table('password_reset_tokens')
                ->where('email', $user->email)
                ->update([
                    'token'=>$token,
                    'created_at'=> Carbon::now()
                ]);
        }else{
            // insert new token to the table
            DB::table('password_reset_tokens')->insert([
                'email'=>$user->email,
                'token'=>$token,
                'created_at'=>Carbon::now()
            ]);
        }

        // create clickable action link
        $actionLink = route('admin.reset_password_form', ['token'=>$token]);
        $data= array(
            'actionLink'=>$actionLink,
           'user'=>$user
        );


        $mail_body = view('email-templates.forgot-template', $data)->render();

        $mailConfig = array(
            'recipient_address'=>$user->email,
            'recipient_name'=> $user->name,
            'subject'=> 'Reset Password',
            'body'=> $mail_body
        );

        if(CMail::send($mailConfig)){
            return redirect()->route('admin.forgot')->with('success', 'we have e-mailed your password reset link');
        }else{
                        return redirect()->route('admin.forgot')->with('fail', 'Something went wrong. Resetting password link not sent. Try again later!');
        }

    }

    public function resetForm(Request $request, $token=null){
            // check if the  the token exists
            $isTokenExists = DB::table('password_reset_tokens')
                ->where('token', $token)
                ->first();

                if(!$isTokenExists){
                    return redirect()->route('admin.login')->with('fail', 'Invalid token. Request another rest password link!');
                }else{
                    $data = [
                        'pageTitle'=> 'Reset Password',
                        'token'=> $token
                    ];

                    return view('back.pages.auth.reset', $data);
                }

    }

    public function resetPasswordHandler(Request $request){
        // validate form
        $request->validate([
            'new_password'=> 'required|min:6|required_with:new_password_confirmation|same:new_password_confirmation',
            'new_password_confirmation'=>'required'
        ]);

        // get token details
        $dbToken= DB::table('password_reset_tokens')
            ->where('token', $request->token)
            ->first();

        // get user with that token
        $user = User::where('email', $dbToken->email)->first();

        // update the user password
        User::where('email', $user->email)->update([
            'password'=>Hash::make($request->new_password)
        ]);

        // Send Notification email to this user email address that contains the password

        $data = array(
            'user' => $user,
            'new_password'=> $request->new_password
        );

        $mail_body = view('email-templates.password-changes-template', $data)->render();

        $mailConfig = array(
            'recipient_address'=>$user->email,
            'recipient_name'=>$user->name,
            'subject'=>'Password changed!',
            'body'=> $mail_body,
        );


        if(CMail::send($mailConfig)){
            // Delete the token form the DB if the email is sent
            DB::table('password_reset_tokens')
                ->where([
                    'email'=>$dbToken->email,
                    'token'=>$dbToken->token,
                ])->delete();

            return redirect()->route('admin.login')->with('success', 'Done! Your have resetted your password successfully. Use the new passworf to login.');
        }else{
             return redirect()->route('admin.reset_password_form', ['token'=>$dbToken->token])->with('fail', 'Something ent wrong try again later!');
        }







    }
}
