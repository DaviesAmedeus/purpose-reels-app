<?php

namespace App\Livewire\Admin;

use App\Models\User;
use App\Helpers\CMail;
use Livewire\Component;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

class Profile extends Component
{
    public $tab = null;
    public $tabname = 'personal_details';
    protected  $queryString = ['tab' => ['keep' => true]];

    public $name, $email, $username, $bio; //Personal details properties

    public $current_password, $new_password, $new_password_confirmation; // Update password properties

    protected $listeners = [
        'updateProfile' => 'refresh'
    ];



    public function selectTab($tab)
    {
        $this->tab = $tab;
    }

    public function mount()
    {
        $this->tab = Request('tab') ? Request('tab') : $this->tabname;

        // Pupulate
        $user = User::findOrfail(auth()->id());
        $this->name = $user->name;
        $this->email = $user->email;
        $this->username = $user->username;
        $this->bio = $user->bio;
    }

    public function updatePersonalDetails()
    {
        $user = User::findOrfail(auth()->id());
        $this->validate([
            'name' => 'required',
            'username' => 'required|unique:users,username,' . $user->id,
        ]);

        //  Update user info
        $user->name = $this->name;
        $user->username = $this->username;
        $user->bio = $this->bio;
        $updated = $user->save();

        sleep(0.5);

        if ($updated) {
            $this->dispatch('showToastr', ['type' => 'success', 'message' => 'Your personal details have been updated successfully']);
            $this->dispatch('updateTopUserInfo')->to(TopUserInfo::class);
        } else {
            $this->dispatch('showToastr', ['type' => 'error', 'message' => 'Ofcourse something went wrong!']);
        }
    }


    public function updatePassword()
    {
        $user = User::findOrfail(auth()->id());

        $this->validate([
            'current_password' => ['required', 'min:6', function ($attribute, $value, $fail) use ($user) {
                if (!Hash::check($value, $user->password)) {
                    return $fail(__('Your current password does not match our records'));
                }
            }],

            'new_password'=> 'required|min:5|confirmed'
        ]);

        // Update the user password
        $updated = $user->update(['password'=> Hash::make($this->new_password)]);

        if($updated){
            // send email to this user
            $data = array(
                'user'=> $user,
                'new_password'=>$this->new_password
            );

            $mail_body = view('email-templates.password-changes-template', $data)->render();

            $mail_config = array(
                'recipient_address'=> $user->email,
                'recipient_name'=> $user->name,
                'subject'=> 'Password Changed',
                'body'=> $mail_body
            );

            CMail::send($mail_config);

            // Logout and redirect the user to login page
            auth()->logout();
            Session::flash('info', 'Your passoword has been successfully changed. Please login with  your new password!');
            $this->redirectRoute('admin.login');

        }else{
            $this->dispatch('showToastr',['type'=>'error', 'message'=>'Something went wrong!']);
        }

    }




    public function render()
    {
        return view('livewire.admin.profile', [
            'user' => User::findOrFail(auth()->id())
        ]);
    }
}
