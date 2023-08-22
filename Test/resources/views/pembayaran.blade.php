@extends('layouts.app')

@section('style')
<style type="text/css">
	.modal-header, h4, .close {
      background-color: #5cb85c;
      color:white !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-footer {
      background-color: #f9f9f9;
  }
</style>
@endsection

@section('content')
<div class="container">
	@if (session('statusBayar') == "0")
		<div class="alert alert-danger" style="text-align: center;">
			<span> {{ session('alertBayar') }} </span>
		</div>
	@endif

	<a href="home" class="btn btn-primary"><span class="glyphicon glyphicon-menu-left"></span>Back</a>
	<!-- === Menghitung total dari session cart === -->
	<?php $total = 0; ?>
	@if(session()->has('cart'))
		@foreach(session()->get('cart') as $DataCart)
			@if($DataCart['aktif']=='ya')
				<?php $total += $DataCart['subtotal']?>
			@endif
		@endforeach
	@endif
	<!-- ========================================== -->

	<div class="col-md-12">
		<!-- Menampilkan total yang harus dibayar -->
		<h3 class="col-md-6">Total : {{number_format($total,0,',','.')}}</h3>
		<!-- Menampilkan nomer nota sekarang -->
		@isset($kd)
			<h3 style="text-align: right;" class="col-md-6">Nomor Nota : {{$kd}}</h3>
		@endisset
	</div>
	
	<div class="panel-group col-md-4">
		<div class="panel panel-primary">
	      	<div class="panel-heading">Metode Pembayaran</div>
	      	<div class="panel-body">
	      		<button id="MtdTunai" class="col-md-12 btn btn-info">Tunai</button><br><br>
	      		<button id="MtdKartu" class="col-md-12 btn btn-info">Kartu</button>
	  		</div>
	    </div>
	</div>

	<div class="panel col-md-8" style="padding : 25px;">
		<div id="PanelDefault">
			Pilih Metode Pembayaran Terlebih Dahulu
		</div>
		<!-- ==================== Panel Tunai ==================== -->
		<div id="PanelTunai" style="display: none">
			<form action="{{route('cash')}}" method="post">
				{{ csrf_field() }}
				<input type="hidden" name="cashier" value={{ Auth::user()->id }}>
				<div class="form-group col-md-12" style="padding: 0px">
				    <label class="control-label col-md-2" for="uang" style="padding: 0px">Uang yang dibayarkan</label>
				    <div class="col-md-10" style="padding-right: 0px">
				        <input type="text" class="form-control" id="UangPembayaranTunai" name="nmUangPembayaran">
				    </div>
				</div>
				<div class="form-group col-md-12" style="padding: 0px">
				    <label class="control-label col-md-2" for="kembalian" style="padding: 0px">Uang kembalian</label>
				    <div class="col-md-10" style="padding-right: 0px">
				        <label id="UangKembalian" class="form-control"></label>
				        <!-- <input type="hidden" name="nmUangKembalian" id="HiddenUangKembalian"> -->
				    </div>
				</div>
				<button class="btn btn-primary" type="submit">Selesai </button>
			</form>
		</div>
		<!-- ====================================================== -->

		<!-- ==================== Panel Kartu ==================== -->
		<div id="PanelKartu" style="display: none">
			<form action="{{route('card')}}" method="post">
				{{csrf_field()}}
				<input type="hidden" name="cashier" value={{ Auth::user()->id }}>
				<!-- radio button jenis kartu -->
				<div>
				  <div class="col-md-6 col-xs-6" style="padding-left: 0px">
				    <div class="input-group">
				      <span class="input-group-addon">
				        <input type="radio" name="JenisKartu" value="Debit" checked>
				      </span>
				      <label class="form-control">Debit</label>
				    </div>
				  </div>
				  <div class="col-md-6 col-xs-6" style="padding-right: 0px">
				    <div class="input-group">
				      <span class="input-group-addon">
				        <input type="radio" name="JenisKartu" value="Kartu Kredit">
				      </span>
				      <label class="form-control">Kredit</label>
				    </div>
				  </div>
				</div>
				<!-- input box jumlah yang dibayarkan -->
				<div class="form-group col-md-12" style="padding: 0px">
					<br>
				    <label class="control-label col-md-2" for="uang" style="padding: 0px">Jumlah yang dibayarkan</label>
				    <div class="col-md-10" style="padding-right: 0px">
				        <input type="text" class="form-control" id="UangPembayaranKartu" name="nmUangPembayaran">
				    </div>
				</div>
				<!-- input box reff ID -->
				<div class="form-group col-md-12" style="padding: 0px">
				    <label class="control-label col-md-2" for="reffID" style="padding: 0px">Reff ID</label>
				    <div class="col-md-10" style="padding-right: 0px">
				        <input type="text" class="form-control" id="ReffID" name="ReffID">
				    </div>
				</div>
				<!-- input box nama bank -->
				<div class="form-group col-md-12" style="padding: 0px;">
				    <label class="control-label col-md-2" for="uang" style="padding: 0px">Bank</label>
				    <div class="col-md-10" style="padding-right: 0px">
				        <input type="text" class="form-control" id="NamaBank" name="NamaBank">
				    </div>
				</div>
				<!-- input box nomor kartu -->
				<div class="form-group col-md-12" style="padding: 0px">
				    <label class="control-label col-md-2" for="uang" style="padding: 0px">Nomor Kartu</label>
				    <div class="col-md-10" style="padding-right: 0px">
				        <input type="text" class="form-control" id="NomerKartu" name="NomerKartu">
				    </div>
				</div>
				<!-- input box keterangan -->
				<div class="form-group col-md-12" style="padding: 0px">
				    <label class="control-label col-md-2" for="uang" style="padding: 0px">Keterangan</label>
				    <div class="col-md-10" style="padding-right: 0px">
				        <textarea class="form-control" id="Keterangan" name="Keterangan" rows="3" style="resize:none"></textarea>
				    </div>
				</div>
				<button class="btn btn-primary" type="submit">Selesai </button>
			</form>
		</div>
		<!-- ============================================================ -->
	</div>
</div>
@endsection

@section('scripts')
<script>
    $(document).ready(function(){
        $("#MtdTunai").click(function(){
		    $("#PanelDefault").hide();
		    $("#PanelTunai").show();
		    $("#PanelKartu").hide();
		});
		$("#MtdKartu").click(function(){
			$("#PanelDefault").hide();
		    $("#PanelTunai").hide();
		    $("#PanelKartu").show();
		});

		$("#UangPembayaranTunai").number(true,0,',','.');
		$("#UangPembayaranKartu").number(true,0,',','.');

		$("#UangPembayaranTunai").keyup(function(){
			var total = '<?php echo $total; ?>';
			var bayar = $("#UangPembayaranTunai").val();
			var kembalian = 0
			if (parseInt(bayar) > parseInt(total)){
				kembalian = bayar - total;
			}else{
				kembalian = 0;
			}
			$("#UangKembalian").number(kembalian,0,',','.');
		});
		// $("#NomerKartu").keyup(function () { 
		//     this.value = this.value.replace(/[^0-9\.]/g,'');
		// });
		// $("#NomerKartu").number(true,0,"","");
		$("#NomerKartu").keydown(function (e) {
            // Allow: backspace, delete, tab, escape, enter
            if ($.inArray(e.keyCode, [8, 9, 27, 13]) !== -1 ||
                 // Allow: Ctrl/cmd+A
                (e.keyCode == 65 && (e.ctrlKey === true || e.metaKey === true)) ||
                 // Allow: Ctrl/cmd+C
                (e.keyCode == 67 && (e.ctrlKey === true || e.metaKey === true)) ||
                 // Allow: Ctrl/cmd+X
                (e.keyCode == 88 && (e.ctrlKey === true || e.metaKey === true)) ||
                 // Allow: home, end, left, right
                (e.keyCode >= 35 && e.keyCode <= 39) && (e.keyCode != 46)) {
                     // let it happen, don't do anything
                     return;
            }
            // Ensure that it is a number and stop the keypress
            if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105) && (e.keyCode != 46)) {
                e.preventDefault();
            }
        }); 		
        
    });
</script>
@endsection