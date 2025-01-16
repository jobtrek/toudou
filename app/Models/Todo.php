<?php

namespace App\Models;

use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Get;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

#[ApiResource(

)]
class Todo extends Model
{
    /** @use HasFactory<\Database\Factories\TodoFactory> */
    use HasFactory;

    protected function casts(): array
    {
        return [
            'due_date' => 'datetime',
        ];
    }
}
