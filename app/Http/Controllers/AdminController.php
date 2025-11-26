<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use SawaStacks\Utils\Kropify;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;

class AdminController extends Controller
{
    public function adminDashboard(Request $request)
    {

        $data = [
            'pageTitle' => 'Dashboard'
        ];

        return view('back.pages.dashboard', $data);
    }

    public function logoutHandler(Request $request)
    {

        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('admin.login')->with('fail', 'You are now logged out!');
    }

    public function profileView()
    {
        $data = [
            'pageTitle' => 'Profile'
        ];
        return view('back.pages.profile', $data);
    }

    public function updateprofilePicture(Request $request)
    {

        $user = User::findOrFail(auth()->id());
        $path = 'images/users/';
        $file = $request->file('profilePictureFile');
        $old_picture = $user->picture ?? null;
        $filename = 'IMG_' . uniqid() . '.png';


        $upload = Kropify::getFile($file, $filename)
            ->setPath($path)   // relative to /public
            ->useMove()                 // required to move into public/
            ->save();


        if ($upload) {
            // delete old profile picture
            if (basename($user->picture) && File::exists(public_path($path . basename($user->picture)))) {
                // \Log::info('--->Here I will display the path<---');
                File::delete(public_path($path . basename($user->picture)));
            }


            // Update DB
            $user->update(['picture' => $filename]);

            return response()->json(['status' => 1, 'message' => 'Your profile picture has been updated successfully']);
        }


        return response()->json(['status' => 0, 'message' => 'Something went wrong!']);
    }


    public function generalSettings(Request $request){
        $data = [
            'pageTitle'=> 'General settings'
        ];

        return view('back.pages.general_settings', $data);
    }


    public function updateLogo(Request $request){

    }


}
