<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Mitemtree extends Model
{
	protected $table = 'mitemtree';

	public function mitem()
	{
		return $this->hasMany(Mitem::class);
	}
}
