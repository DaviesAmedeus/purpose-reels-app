<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\PostController;
use Illuminate\Support\Facades\Route;


//**FRONT-END ROUTES */
Route::controller(BlogController::class)->group(function () {
    Route::get('/', 'index')->name('home');
    Route::get('/about', 'about')->name('about');
    Route::get('/post/{slug}', 'readPost')->name('read_post');
    // displaying all posts associated with the selected category
    Route::get('/posts/category/{slug}', 'categoryPosts')->name('category_posts');
    // displaying all posts with the selected author username
    Route::get('/posts/author/{username}', 'authorPosts')->name('author_posts');
    // displaying all posts associated with the select tag
    Route::get('/posts/tag/{any}', 'tagPosts')->name('tag_posts');
    // displaying search results for posts
    Route::get('/search', 'searchPosts')->name('search_posts');
    Route::get('/contact', 'contactPage')->name('contact');
    // Round for guest user to send email
    Route::post('/contact', 'sendEmail')->name('send_email');

    Route::get('/privacy-policy', 'privacyPolicy')->name('privacy-policy');
    Route::get('/terms-and-conditions', 'termsAndConditions')->name('terms-and-conditions');
});


//**TESTING ROUTES */
Route::view('/example-page', 'example-page');
Route::view('/example-auth', 'example-auth');

//** ADMIN ROUTES */
Route::prefix('admin')->name('admin.')->group(function () {

    Route::middleware(['guest', 'preventBackHistory'])->group(function () {
        Route::controller(AuthController::class)->group(function () {
            Route::get('/login', 'loginForm')->name('login');
            // This route handles the login
            Route::post('/login', 'loginHandler')->name('login_handler');
            Route::get('/forgot-password', 'forgotForm')->name('forgot');
            Route::post('/send-password-reset-link', 'sendPasswordResetLink')->name('send_password_reset_link');
            Route::get('/password/reset/{token}', 'resetForm')->name('reset_password_form');
            Route::post('/reset-password-handler', 'resetPasswordHandler')->name('reset_password_handler');
        });
    });


    Route::middleware(['auth', 'preventBackHistory'])->group(function () {
        Route::controller(AdminController::class)->group(function () {
            Route::get('/dashboard', 'adminDashboard')->name('dashboard');
            Route::post('/logout', 'logoutHandler')->name('logout');
            Route::get('/profile', 'profileView')->name('profile');
            Route::post('/update-profile-picture', 'updateProfilePicture')->name('update_profile_picture');

            //Routes to only be accessed only by superAdmin
            Route::middleware(['onlySuperAdmin'])->group(function () {
                Route::get('/settings', 'generalSettings')->name('settings');
                Route::post('/update-logo', 'updateLogo')->name('update_logo');
                Route::post('/update-favicon', 'updateFavicon')->name('update_favicon');
                Route::get('/categories', 'categoriesPage')->name('categories');
                Route::get('/slider', 'manageSlider')->name('slider');
            });
        });


        Route::controller(PostController::class)->group(function () {
            Route::get('/post/new', 'addPost')->name('add_post');
            Route::post('/post/create', 'createPost')->name('create_post');
            Route::get('/posts', 'allPosts')->name('posts');
            Route::get('/post/{id}/edit', 'editPost')->name('edit_post');
            Route::post('/post/update', 'updatePost')->name('update_post');
        });
    });
});
