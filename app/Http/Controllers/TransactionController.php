<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Transaction;
class TransactionController extends Controller
{
    //
    public function index()
    {
        $transactions = Transaction::all();
        return response()->json($transactions);
    }

    public function store(Request $request)
    {
        $request->validate([
            'amount' => 'required|numeric',
            'category' => 'required|string',
            'transaction_type' => 'required|in:income,expense',
            'frequency' => 'nullable|in:daily,weekly,monthly',
            'start_date' => 'nullable|date',
        ]);

        $transaction = Transaction::create($request->all());

        return response()->json($transaction, 201);
    }

    public function update(Request $request, Transaction $transaction)
    {
        $request->validate([
            'amount' => 'required|numeric',
            'category' => 'required|string',
            'transaction_type' => 'required|in:income,expense',
            'frequency' => 'nullable|in:daily,weekly,monthly',
            'start_date' => 'nullable|date',
        ]);

        $transaction->update($request->all());

        return response()->json($transaction, 200);
    }

    public function destroy(Transaction $transaction)
    {
        $transaction->delete();

        return response()->json(null, 204);
    }
}
