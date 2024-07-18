<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PortfolioItem;
class PortfolioItemController extends Controller
{
    //
    public function store(Request $request)
    {
        $request->validate([
            'portfolio_id' => 'required|exists:portfolios,id',
            'name' => 'required|string',
            'type' => 'required|in:stock,bond,cryptocurrency',
            'quantity' => 'required|numeric',
            'purchase_price' => 'required|numeric',
        ]);

        $item = PortfolioItem::create($request->all());

        return response()->json($item, 201);
    }
}
