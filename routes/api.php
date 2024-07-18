<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\IncomeController;
use App\Http\Controllers\ExpenseController;
use App\Http\Controllers\PortfolioController;
use App\Http\Controllers\PortfolioItemController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post('/registeruser', [RegisterController::class, 'register'])->name('register.user');
Route::post('/loginuser', [LoginController::class, 'login'])->name('login.user');

// Route::middleware('auth:api')->group( function () {

    Route::post('incomes/users', [IncomeController::class, 'store']);
    Route::get('incomes/get', [IncomeController::class, 'getData']);
    Route::delete('/incomes/delete/{id}', [IncomeController::class,'delete']);
    Route::get('/incomes/{id}/edit', [IncomeController::class, 'edit'])->name('incomes.edit');
    Route::put('/incomes/update/{id}', [IncomeController::class, 'update'])->name('incomes.update');

    Route::post('expenses/users', [ExpenseController::class, 'store']);
    Route::get('expenses/get', [ExpenseController::class, 'getData']);
    Route::delete('/expenses/delete/{id}', [ExpenseController::class,'delete']);
    Route::get('/expenses/{id}/edit', [ExpenseController::class, 'edit'])->name('expenses.edit');
    Route::put('/expenses/update/{id}', [ExpenseController::class, 'update'])->name('expenses.update');

    

    Route::get('/transactions', [TransactionController::class, 'index']);
    Route::post('/transactions', [TransactionController::class, 'store']);
    Route::put('/transactions/{transaction}', [TransactionController::class, 'update']);
    Route::delete('/transactions/{transaction}', [TransactionController::class, 'destroy']);




Route::get('/portfolios', [PortfolioController::class, 'index']);
Route::post('/portfolios', [PortfolioController::class, 'store']);
Route::put('/portfolios/{portfolio}', [PortfolioController::class, 'update']);
Route::delete('/portfolios/{portfolio}', [PortfolioController::class, 'destroy']);

Route::post('/portfolio-items', [PortfolioItemController::class, 'store']);

// });
// Route::middleware('auth:api')->post('incomes/users', [IncomeController::class, 'store'])->name('income.users');