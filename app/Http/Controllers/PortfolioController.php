<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Portfolio;
class PortfolioController extends Controller
{
    //
    public function index()
    {
        $portfolios = Portfolio::with('items')->get();
        return response()->json($portfolios);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string',
        ]);

        $portfolio = Portfolio::create($request->all());

        return response()->json($portfolio, 201);
    }

    public function update(Request $request, Portfolio $portfolio)
    {
        $request->validate([
            'name' => 'required|string',
        ]);

        $portfolio->update($request->all());

        return response()->json($portfolio, 200);
    }

    public function destroy(Portfolio $portfolio)
    {
        $portfolio->delete();

        return response()->json(null, 204);
    }
}
