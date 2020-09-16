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


Auth::routes();

Route::get('/', 'HomeController@index')->name('home');

Route::get('/user', 'HomeController@user')->name('user');
Route::get('/role', 'HomeController@role')->name('role');

Route::post('/subscriber','SubscriberController@store')->name('subscriber.store');

Route::get('/post/{slug}','PostController@details')->name('post.details');
Route::get('/posts','PostController@index')->name('post.index');

Route::group(['middleware'=>['auth']],function(){
	Route::post('favorite/{post}/add','FavoriteController@add')->name('post.favorite');
});

Route::group(['as'=> 'admin.', 'prefix'	=> 'admin', 'namespace' => 'admin', 'middleware'=> ['auth','admin']], function(){

	Route::get('/dashboard','DashboardController@index')->name('dashboard');
	Route::resource('tag','TagController');
	Route::resource('category','CategoryController');
	Route::get('post/pending','PostController@pending')->name('post.pending');

	Route::get('favorite','FavoriteController@index')->name('favorite');
	Route::get('favorite/post/{post}','FavoriteController@show')->name('favorite.show');
	Route::put('favorite/remove/{post}','FavoriteController@remove')->name('favorite.remove');

	Route::put('/post/{id}/approval','PostController@approval')->name('post.approval');
	Route::resource('post','PostController');
	Route::get('/subscriber','SubscriberController@index')->name('subscriber.index');
	Route::delete('/subscriber/{id}','SubscriberController@destroy')->name('subscriber.destroy');

	Route::get('/settings','SettingsController@index')->name('settings');
	Route::put('update_profile','SettingsController@update_profile')->name('settings.update');
	Route::put('update_password','SettingsController@update_password')->name('password.update');
});


Route::group(['as'=> 'author.', 'prefix'	=> 'author', 'namespace' => 'author', 'middleware'=> ['auth','author']], function(){

	Route::get('/dashboard','DashboardController@index')->name('dashboard');
	Route::resource('post','PostController');

	Route::get('/settings','SettingsController@index')->name('settings');
	Route::put('update_profile','SettingsController@update_profile')->name('settings.update');
	Route::put('update_password','SettingsController@update_password')->name('password.update');

	Route::get('favorite','FavoriteController@index')->name('favorite');
	Route::get('favorite/post/{post}','FavoriteController@show')->name('favorite.show');
	Route::put('favorite/remove/{post}','FavoriteController@remove')->name('favorite.remove');

});