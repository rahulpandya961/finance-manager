<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\IncomeController;
use App\Http\Controllers\ExpenseController;
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

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/register', [RegisterController::class, 'registerView'])->name('register');
Route::get('/login', [LoginController::class, 'loginView'])->name('login');


// Route::middleware('auth')->group(function () {
Route::get('/incomes', [IncomeController::class, 'create'])->name('incomes.create');
Route::get('/expenses', [ExpenseController::class, 'create'])->name('expenses.create');
// });