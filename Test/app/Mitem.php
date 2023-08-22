<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Mitem extends Model
{
	protected $table = 'mitem';

	public function mitemtree()
	{
		return $this->belongsTo(Mitemtree::class);
	}
}
