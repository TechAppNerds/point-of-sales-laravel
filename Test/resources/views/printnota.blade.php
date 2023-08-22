@extends('layouts.app')

@section('style')
	<style type="text/css">
    	.div-button{
    		margin: 0px auto;
    		width: 74mm;
    	}
    	button{
    		width:74mm;
    		margin-top: 10px;
    		margin-bottom: 10px;
    	}
    	#nota{
    		margin: 0px auto;
    		border: 1px solid black;
    		width: 74mm;
    		padding: 10px;
    		background-color: white;
    	}
    	#header{
    		text-align: center;
    		padding-bottom: 10px;
    		border-bottom: 1px dashed black;
    	}
    	#footer{
    		text-align: center;
    	}
    	table{
    		width: 100%;
    	}

		@page {
		  size: A7;
		  margin: 0mm;
		}
		@media print {
		  html, body {
		    width: 74mm;/*148 x 210 mm a5*/
		    /*height: 105mm;*//*105 x 148 mm a6*/
		  }/*74 x 105 mm a7*/
		  body{
		    margin: 0px auto;
    		/*border: 1px solid black;*/
    		padding: 10px;
		  }
		}
    </style>
@endsection

@section('content')
	<div id="nota">
		<br>
		<div id="header">
			@isset($namatoko)
				@foreach($namatoko as $namatoko)
					{{$namatoko->Isi}}<br>
				@endforeach
				@foreach($alamat as $alamat)
					{{$alamat->Isi}}<br>
				@endforeach
				@foreach($telp as $telp)
					{{$telp->Isi}}<br>
				@endforeach
			@endisset
			@empty($namatoko)
			    (Nama Toko)<br>
				(Alamat)<br>
				(No Telp)<br>
			@endempty
		</div><br>
		<div id="content">
			@isset($kodenota)
			<table>
				<tr>
					@foreach ($kodenota as $kodenota)
					<td style="width: 50%">Nota : {{$kodenota->Kode}}</td>
					@endforeach
					@foreach ($kasir as $kasir)
					<td  style="width: 50%">Kasir : {{$kasir->name}}</td>
					@endforeach
				</tr>
				<tr>
					<td colspan="2">Tanggal : {{$tanggal}}</td>
				</tr>
			</table><br>
			<table  style="border-bottom: 1px dashed black;border-top: 1px dashed black">
				@if(session()->has('cart'))
					@foreach(session()->get('cart') as $itemcart)
						@if($itemcart['aktif']=='ya')
							<tr>
								<td colspan="3">{{str_limit($itemcart['name'], $limit = 20, $end = '...')}}</td>
							</tr>
							<tr>
								<td>{{$itemcart['qty']}}</td>
								<td>{{number_format($itemcart['price'],0,",",".")}}</td>
								<td style="text-align: right;">{{number_format($itemcart['subtotal'],0,",",".")}}</td>
							</tr>
						@endif
					@endforeach
				@endif
			</table>
			<table  style="text-align: right;">
				<tr>
					<td colspan="2">Total : </td>
					<td>{{number_format($total,0,",",".")}}</td>
				</tr>
				@if($carapembayaran=="Tunai")
				<tr>
					<td colspan="2">Pembayaran {{$carapembayaran}} : </td>
					<td>{{number_format($pembayaran,0,",",".")}}</td>
				</tr>
				<tr>
					<td colspan="2">Kembalian : </td>
					<td>{{number_format($kembalian,0,",",".")}}</td>
				</tr>
				@else
				<tr>
					<td colspan="2">Pembayaran {{$carapembayaran}} : </td>
					<td>{{number_format($pembayaran,0,",",".")}}</td>
				</tr>
				<tr>
					<td colspan="2">Kembalian : </td>
					<td>{{number_format($kembalian,0,",",".")}}</td>
				</tr>
				<tr>
					<td colspan="2">Nomer Kartu : </td>
					<td>{{$nomerkartu}}</td>
				</tr>
				<tr>
					<td colspan="2">Reff ID : </td>
					<td>{{$reffID}}</td>
				</tr>
				@endif
			</table>
			@endisset
		</div><br>			
		<div id="footer">
			<!-- <pre> -->
				@foreach($footer as $footer)
					{{$footer->Isi}}<br>
				@endforeach
			<!-- <pre> -->
		</div>
		<br>
	</div>
	<div class="div-button"><button onclick="printContent('nota')" class="btn btn-default">Print</button></div>
	<div class="div-button"><button onclick="buatnotabaru()" class="btn btn-default">Nota Baru</button></div>
@endsection

@section('scripts')
<script type="text/javascript">
	function printContent(nota){
		var restorepage = document.body.innerHTML;
		var printcontent = document.getElementById(nota).innerHTML;
		document.body.innerHTML = printcontent;
		window.print();
		document.body.innerHTML= restorepage;
		window.close();
	}
	function buatnotabaru(){
		{{ Session::forget('cart') }}
		{{ Session::forget('search')}}
		window.location="{{route('home')}}";
	}

</script>
@endsection