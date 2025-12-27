<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\PostController;
use Illuminate\Support\Facades\Route;

// Route::get('/', function () {
//     return view('front.pages.front-example');
// });

//**FRONT-END ROUTES */
Route::get('/', [BlogController::class, 'index'])->name('home');
Route::get('/post/{slug}', [BlogController::class, 'readPost'])->name('read_post');
// displaying all posts associated with the selected category
Route::get('/posts/category/{slug}', [BlogController::class, 'categoryPosts'])->name('category_posts');
// displaying all posts with the selected author username
Route::get('/posts/author/{username}', [BlogController::class, 'authorPosts'])->name('author_posts');
// displaying all posts associated with the select tag
Route::get('/posts/tag/{any}', [BlogController::class, 'tagPosts'])->name('tag_posts');
// displaying search results for posts
Route::get('/search', [BlogController::class, 'searchPosts'])->name('search_posts');


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

            // To only be accessed only by superAdmin
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
