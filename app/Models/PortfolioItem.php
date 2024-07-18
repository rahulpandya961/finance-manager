<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PortfolioItem extends Model
{
    use HasFactory;
    protected $fillable = [
        'portfolio_id', 'name', 'type', 'quantity', 'purchase_price'
    ];

    public function portfolio()
    {
        return $this->belongsTo(Portfolio::class);
    }
}
