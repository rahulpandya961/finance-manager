<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Income;
use App\Http\Requests\IncomeRequest;
use Illuminate\Support\Facades\Auth;
class IncomeController extends Controller
{
    //
    // public function __construct()
    // {
    //     $this->middleware('auth:api');
    // }
    public function create()
    {
        return view('income.index'); 
    }
    public function store(Request $request)
    {
        
        $income = new Income();
        $income->amount = $request->amount;
        $income->category = $request->category;
        $income->description = $request->description;
        $income->user_id = 1; 

        $income->save();

        return response()->json(['message' => 'Income added successfully', 'income' => $income], 201);
    }
    public function getData(){
        $incomes = Income::all(); // Example: Fetch all incomes, adjust as per your logic
        return response()->json($incomes);
    }
    public function delete($id)
    {
        $income = Income::findOrFail($id); // Find income by ID
        $income->delete();

        return response()->json(['message' => 'Income deleted successfully']);
    }
    public function edit($id)
    {
        $income = Income::findOrFail($id);
        return response()->json($income);
    }
    public function update(Request $request, $id)
    {
        $request->validate([
            'amount' => 'required|numeric',
            'category' => 'required|string',
            'description' => 'nullable|string',
        ]);

        $income = Income::findOrFail($id);
        $income->update($request->all());

        return $income;
    }
}
