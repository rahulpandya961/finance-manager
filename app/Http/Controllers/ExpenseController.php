<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Expense;
use Illuminate\Support\Facades\Auth;
class ExpenseController extends Controller
{
    //
    public function create()
    {
        return view('expense.index'); 
    }
    public function store(Request $request)
    {
        
        $Expense = new Expense();
        $Expense->amount = $request->amount;
        $Expense->category = $request->category;
        $Expense->description = $request->description;
        $Expense->user_id = 1; 

        $Expense->save();

        return response()->json(['message' => 'Expense added successfully', 'Expense' => $Expense], 201);
    }
    public function getData(){
        $Expenses = Expense::all(); // Example: Fetch all Expenses, adjust as per your logic
        return response()->json($Expenses);
    }
    public function delete($id)
    {
        $Expense = Expense::findOrFail($id); // Find Expense by ID
        $Expense->delete();

        return response()->json(['message' => 'Expense deleted successfully']);
    }
    public function edit($id)
    {
        $Expense = Expense::findOrFail($id);
        return response()->json($Expense);
    }
    public function update(Request $request, $id)
    {
        $request->validate([
            'amount' => 'required|numeric',
            'category' => 'required|string',
            'description' => 'nullable|string',
        ]);

        $Expense = Expense::findOrFail($id);
        $Expense->update($request->all());

        return $Expense;
    }
}
