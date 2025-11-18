<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Auth\Middleware\RedirectIfAuthenticated;
use Illuminate\Auth\Middleware\Authenticate;
use Illuminate\Support\Facades\Session;




class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        /*---- Below  are defined what 'auth' and 'guest' middleware alias should if used in the routes ----*/

        // RedirectIfAuthenticated (alias 'guest'): This middle designed to prevent authenticated users from accessing certain routes that should only be accessed by guests (eg login page / registration page)

        //Redirect an Authenticated user to dashboarad
        RedirectIfAuthenticated::redirectUsing(function(){
            return route('admin.dashboard');
        });



        // Authenticate(alias 'guest'): This middle ensures that only authenticated users can access certain routes. If user in un-authenticated will be diected back to login page.

        //Redirect un-authenticated user to Login (Admin Login Page):
        Authenticate::redirectUsing(function(){
            Session::flash('fail', 'You must be logged in to access the admin area. Please Login to continue');
            return route('admin.login');
        });
    }
}
