@section('content')
<div class="container">
    <h1>Laporan Transaksi</h1>
	<h3>Filter</h3>
	<select class="form-control custom-select filter" name="Filter">
		<option value="1" selected>ID Nota</option>
		<option value="2">Kasir</option>
		<option value="3">Kategori Barang</option>
		<option value="4">Nama Barang</option>
		<option value="5">Total</option>
		<option value="6">Keuntungan</option>
		<option value="8">Tanggal</option>
		<option value="9">Stok Barang</option>
		<option value="10">Cara Pembayaran Tunai</option>
		<option value="11">Cara Pembayaran Kartu</option>
	</select>
	<br/>
	<div class="date">
		<b>Tanggal
		<input type="date" id="tanggal1" name="date1"> - <input type="date" id="tanggal2" name="date2"></b>
	</div>
	<br/>
	<div class="panel panel-default">
		<canvas id="myChart" height="100" width="350"></canvas>
	</div>
	<table class="table" style=background-color:white>
		<thead class='headhjual'>
			<tr>
				<th>ID Nota</th>
				<th>Tanggal</th>
                <th>Kasir</th>
				<th>Total Harga</th>
                <th>Jenis Pembayaran</th>
			</tr>
		</thead>
		<tbody class="bodyhjual">
			@foreach($hjual as $def =>$data)
            <tr id='data{{$data->IDJualH}}' class='hjual' data-id='{{$data->IDJualH}}'>
                <td>{{$data->IDJualH}}</td>
                <td>{{$data->Tanggal}}</td>
                <td>{{$data->name}}</td>
                <td>{{$data->Total}}</td>
                <td>{{$data->JenisPembayaran}}</td>
            </tr>
            @endforeach
		</tbody>
	</table>
	<h3>Detail</h3>
    <table class="table" style=background-color:white>
		<thead>
			<tr>
				<th>ID Barang</th>
				<th>Nama Barang</th>
                <th>Harga</th>
				<th>Jumlah</th>
                <th>Subtotal</th>
			</tr>
		</thead>
		<tbody class='djual'>

		</tbody>
	</table>
	<script src="{{ asset('js/Chart.min.js') }}"></script>
</div>
<script>
    $.ajaxSetup({
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      }
	});
	
	$("#tanggal1").change(function(){
		var tgl1 = $("#tanggal1").val();
		var tgl2 = $("#tanggal2").val();
		if(tgl1 != "" && tgl2 != ""){
			let jenis = $(".filter").val();
			$.ajax({
				type:'POST',
				url:'/filterlaporan',
				data: {jenis:jenis,tgl1:tgl1,tgl2:tgl2},
				success:function(response){
					success(response, jenis);				
				}
			});
		}
	});

	$("#tanggal2").change(function(){
		var tgl1 = $("#tanggal1").val();
		var tgl2 = $("#tanggal2").val();
		if(tgl1 != "" && tgl2 != ""){
			let jenis = $(".filter").val();
			$.ajax({
				type:'POST',
				url:'/filterlaporan',
				data: {jenis:jenis,tgl1:tgl1,tgl2:tgl2},
				success:function(response){
					success(response, jenis);				
				}
			});
		}
	});

    $(".filter").change(function(){
        let jenis = $(this).val();
        $.ajax({
			type:'POST',
			url:'/filterlaporan',
			data: {jenis:jenis},
			success:function(response){
				success(response, jenis);				
			}
        });
    });
	$(".hjual").click(function(){
        let id = $(this).data("id");
        $.ajax({
        type:'POST',
        url:'/showdjual',
        data: {id:id},
        success:function(response){
			var res = JSON.parse(response);
			var tr_str = "";
			if(res['data'] != null){
				for(var i=0; i<res['data'].length; i++){
				tr_str += "<tr>" +
					"<td>" + res['data'][i].IDItem + "</td>" +
					"<td>" + res['data'][i].NamaItem + "</td>" +
					"<td>" + res['data'][i].Harga + "</td>" +
					"<td>" + res['data'][i].Jumlah + "</td>" +
					"<td>" + res['data'][i].Subtotal + "</td>" +
				"</tr>";
				}
				
			}
			$(".djual").html(tr_str);
        }
        });
    });

	$(".pegawai").click(function(){
        let id = $(this).data("id");
        $.ajax({
        type:'POST',
        url:'/showdjualpegawai',
        data: {id:id},
        success:function(response){
			var res = JSON.parse(response);
			var tr_str = "";
			if(res['data'] != null){
				for(var i=0; i<res['data'].length; i++){
				tr_str += "<tr>" +
					"<td>" + res['data'][i].IDJualH + "</td>" +
					"<td>" + res['data'][i].Tanggal + "</td>" +
					"<td>" + res['data'][i].name + "</td>" +
					"<td>" + res['data'][i].Total + "</td>" +
					"<td>" + res['data'][i].JenisPembayaran + "</td>" +
				"</tr>";
				}
				
			}
			$(".djual").html(tr_str);
        }
        });
	});
	
	$.ajax({
        type:'POST',
        url:'/chart',
        success:function(res){
            var response = JSON.parse(res);
            var id = new Array();
            var total = new Array();
			var coloR = [];
			var dynamicColors = function() {
				var r = Math.floor(Math.random() * 255);
				var g = Math.floor(Math.random() * 255);
				var b = Math.floor(Math.random() * 255);
				return "rgb(" + r + "," + g + "," + b + ")";
			};
            if(response['data'] != null){
				for(var i=0; i<response['data'].length; i++){
                    id.push(response['data'][i].IDJualH);
                    total.push(response['data'][i].Total);
					coloR.push(dynamicColors());
                }
            }
            var ctx = document.getElementById("myChart").getContext('2d');
			var myChart = new Chart(ctx, {
				type: 'bar',
				data: {
					labels:id,
					datasets: [{
						label: 'Total Penjualan',
						data: total,
						backgroundColor: coloR,
						borderColor: 'rgba(200, 200, 200, 0.75)',
						borderWidth: 1
					}]
				},
				options: {
					scales: {
						yAxes: [{
							ticks: {
								beginAtZero:true
							}
						}]
					}
				}
			});
        }
	});

	function success(response, jenis){
		var x = new Array();
		var y = new Array();
		var color = [];
		var dynamicColors = function() {
			var r = Math.floor(Math.random() * 255);
			var g = Math.floor(Math.random() * 255);
			var b = Math.floor(Math.random() * 255);
			return "rgb(" + r + "," + g + "," + b + ")";
		};
		if(jenis == 1){
			var tr_head = "<tr>" +
				"<th>ID Nota</th>" +
				"<th>Tanggal</th>" + 
				"<th>Kasir</th>" +
				"<th>Total Harga</th>" +
				"<th>Jenis Pembayaran</th>" +
				"</tr>";
			$(".headhjual").html(tr_head);
			var res = JSON.parse(response);
			var tr_str = "";
			coloR = [];
			if(res['data'] != null){
				for(var i=0; i<res['data'].length; i++){
					tr_str += "<tr id='data" + res['data'][i].IDJualH + "' class='hjual' data-id='" + res['data'][i].IDJualH + "'>" +
						"<td>" + res['data'][i].IDJualH + "</td>" +
						"<td>" + res['data'][i].Tanggal + "</td>" +
						"<td>" + res['data'][i].name + "</td>" +
						"<td>" + res['data'][i].Total + "</td>" +
						"<td>" + res['data'][i].JenisPembayaran + "</td>" +
					"</tr>";
					x.push(res['data'][i].IDJualH);
					y.push(res['data'][i].Total);
					coloR.push(dynamicColors());
				}
			}
			var label = 'Total Penjualan per Nota';
			$(".bodyhjual").html(tr_str);
		}
		else if(jenis == 2){
			var tr_head = "<tr>" +
					"<th>Kasir</th>" +
					"<th>Total Penjualan</th>" +
				"</tr>"
			$(".headhjual").html(tr_head);
			var res = JSON.parse(response);
			var tr_str = "";
			coloR = [];
			if(res['data'] != null){
				for(var i=0; i<res['data'].length; i++){
					tr_str += "<tr id='data" + res['data'][i].id + "' class='pegawai' data-id='" + res['data'][i].id + "'>" +
						"<td>" + res['data'][i].name + "</td>" +
						"<td>" + res['data'][i].user_total + "</td>" +
					"</tr>";
					x.push(res['data'][i].name);
					y.push(res['data'][i].user_total);
					coloR.push(dynamicColors());
				}
			}
			var label = 'Total Penjualan per Kasir';
			$(".bodyhjual").html(tr_str);
		}
		else if(jenis == 3){
			var tr_head = "<tr>" +
					"<th>Kategori</th>" +
					"<th>Total Terjual</th>" +
				"</tr>"
			$(".headhjual").html(tr_head);
			var res = JSON.parse(response);
			var tr_str = "";
			coloR = [];
			if(res['data'] != null){
				for(var i=0; i<res['data'].length; i++){
					tr_str += "<tr>" +
						"<td>" + res['data'][i].Nama + "</td>" +
						"<td>" + res['data'][i].kat_total + "</td>" +
					"</tr>";
					x.push(res['data'][i].Nama);
					y.push(res['data'][i].kat_total);
					coloR.push(dynamicColors());
				}
			}
			var label = 'Total Penjualan per Kategori';
			$(".bodyhjual").html(tr_str);
		}
		else if(jenis == 4){
			var tr_head = "<tr>" +
					"<th>Nama</th>" +
					"<th>Total Terjual</th>" +
				"</tr>"
			$(".headhjual").html(tr_head);
			var res = JSON.parse(response);
			var tr_str = "";
			coloR = [];
			if(res['data'] != null){
				for(var i=0; i<res['data'].length; i++){
					tr_str += "<tr>" +
						"<td>" + res['data'][i].Nama + "</td>" +
						"<td>" + res['data'][i].item_total + "</td>" +
					"</tr>";
					x.push(res['data'][i].Nama);
					y.push(res['data'][i].item_total);
					coloR.push(dynamicColors());
				}
			}
			var label = 'Total Penjualan per Barang';
			$(".bodyhjual").html(tr_str);
		}
		else if(jenis == 5){
			var tr_head = "<tr>" +
				"<th>ID Nota</th>" +
				"<th>Tanggal</th>" + 
				"<th>Kasir</th>" +
				"<th>Total Harga</th>" +
				"<th>Jenis Pembayaran</th>" +
				"</tr>";
			$(".headhjual").html(tr_head);
			var res = JSON.parse(response);
			var tr_str = "";
			coloR = [];
			if(res['data'] != null){
				for(var i=0; i<res['data'].length; i++){
					tr_str += "<tr id='data" + res['data'][i].IDJualH + "' class='hjual' data-id='" + res['data'][i].IDJualH + "'>" +
						"<td>" + res['data'][i].IDJualH + "</td>" +
						"<td>" + res['data'][i].Tanggal + "</td>" +
						"<td>" + res['data'][i].name + "</td>" +
						"<td>" + res['data'][i].Total + "</td>" +
						"<td>" + res['data'][i].JenisPembayaran + "</td>" +
					"</tr>";
					x.push(res['data'][i].IDJualH);
					y.push(res['data'][i].Total);
					coloR.push(dynamicColors());
				}
			}
			var label = 'Total Penjualan';
			$(".bodyhjual").html(tr_str);
		}
		else if(jenis == 6){
			var tr_head = "<tr>" +
				"<th>ID Nota</th>" +
				//"<th>Tanggal</th>" +
				"<th>Harga Beli</th>"+
				"<th>Harga Jual</th>"+
				"<th>Keuntungan</th>"+
				"<th>Jumlah Barang</th>"
				"</tr>";
			$(".headhjual").html(tr_head);
			var res = JSON.parse(response);
			var tr_str = "";
			coloR = [];
			if(res['data'] != null){
				for(var i=0; i<res['data'].length; i++){
					tr_str += "<tr id='data" + res['data'][i].IDJualH + "' class='hjual' data-id='" + res['data'][i].IDJualH + "'>" +
						"<td>" + res['data'][i].IDJualH + "</td>" +
						//"<td>" + res['data'][i].Tanggal + "</td>" +
						"<td>" + res['data'][i].HargaBeli + "</td>"+
						"<td>" + res['data'][i].HargaJual + "</td>"+
						"<td>" + res['data'][i].Keuntungan + "</td>" +
						"<td>" + res['data'][i].JumlahBarang + "</td>"+
					"</tr>";
					x.push(res['data'][i].IDJualH);
					y.push(res['data'][i].Keuntungan);
					coloR.push(dynamicColors());
				}
			}
			var label = 'Total Keuntungan';
			$(".bodyhjual").html(tr_str);
		}
		else if(jenis == 8){
			var tr_head = "<tr>" +
				"<th>Tanggal</th>" + 
				"<th>Total Harga</th>" +
				"</tr>";
			$(".headhjual").html(tr_head);
			var res = JSON.parse(response);
			var tr_str = "";
			coloR = [];
			if(res['data'] != null){
				for(var i=0; i<res['data'].length; i++){
					tr_str += "<tr>" +
						"<td>" + res['data'][i].Tanggal + "</td>" +
						"<td>" + res['data'][i].date_total + "</td>" +
					"</tr>";
					x.push(res['data'][i].Tanggal);
					y.push(res['data'][i].date_total);
					coloR.push(dynamicColors());
				}
			}
			var label = 'Total Penjualan per Tanggal';
			$(".bodyhjual").html(tr_str);
		}
		else if(jenis == 9){
			var tr_head = "<tr>" +
					"<th>Nama</th>" +
					"<th>Stok</th>" +
				"</tr>"
			$(".headhjual").html(tr_head);
			var res = JSON.parse(response);
			var tr_str = "";
			coloR = [];
			if(res['data'] != null){
				for(var i=0; i<res['data'].length; i++){
					tr_str += "<tr>" +
						"<td>" + res['data'][i].Nama + "</td>" +
						"<td>" + res['data'][i].stok_total + "</td>" +
					"</tr>";
					x.push(res['data'][i].Nama);
					y.push(res['data'][i].stok_total);
					coloR.push(dynamicColors());
				}
			}
			var label = 'Total Stok';
			$(".bodyhjual").html(tr_str);
		}
		else if(jenis == 10){
			var tr_head = "<tr>" +
				"<th>ID Nota</th>" +
				"<th>Tanggal</th>" + 
				"<th>Kasir</th>" +
				"<th>Total Harga</th>" +
				"<th>Jenis Pembayaran</th>" +
				"</tr>";
			$(".headhjual").html(tr_head);
			var res = JSON.parse(response);
			var tr_str = "";
			coloR = [];
			if(res['data'] != null){
				for(var i=0; i<res['data'].length; i++){
					tr_str += "<tr id='data" + res['data'][i].IDJualH + "' class='hjual' data-id='" + res['data'][i].IDJualH + "'>" +
						"<td>" + res['data'][i].IDJualH + "</td>" +
						"<td>" + res['data'][i].Tanggal + "</td>" +
						"<td>" + res['data'][i].name + "</td>" +
						"<td>" + res['data'][i].Total + "</td>" +
						"<td>" + res['data'][i].JenisPembayaran + "</td>" +
					"</tr>";
					x.push(res['data'][i].IDJualH);
					y.push(res['data'][i].Total);
					coloR.push(dynamicColors());
				}
			}
			var label = 'Pembayaran Tunai';
			$(".bodyhjual").html(tr_str);
		}
		else if(jenis == 11){
			var tr_head = "<tr>" +
				"<th>ID Nota</th>" +
				"<th>Tanggal</th>" + 
				"<th>Kasir</th>" +
				"<th>Total Harga</th>" +
				"<th>Jenis Pembayaran</th>" +
				"</tr>";
			$(".headhjual").html(tr_head);
			var res = JSON.parse(response);
			var tr_str = "";
			coloR = [];
			if(res['data'] != null){
				for(var i=0; i<res['data'].length; i++){
					tr_str += "<tr id='data" + res['data'][i].IDJualH + "' class='hjual' data-id='" + res['data'][i].IDJualH + "'>" +
						"<td>" + res['data'][i].IDJualH + "</td>" +
						"<td>" + res['data'][i].Tanggal + "</td>" +
						"<td>" + res['data'][i].name + "</td>" +
						"<td>" + res['data'][i].Total + "</td>" +
						"<td>" + res['data'][i].JenisPembayaran + "</td>" +
					"</tr>";
					x.push(res['data'][i].IDJualH);
					y.push(res['data'][i].Total);
					coloR.push(dynamicColors());
				}
			}
			var label = 'Pembayaran Kartu';
			$(".bodyhjual").html(tr_str);
		}
		$("canvas").remove();
		$("div.panel").append('<canvas id="myChart" height="100" width="350"></canvas>');
		var ctx = document.getElementById("myChart").getContext('2d');
		var myChart = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: x,
				datasets: [{
					label: label,
					data: y,
					backgroundColor: coloR,
					borderColor: 'rgba(200, 200, 200, 0.75)',
					borderWidth: 1
				}]
			},
			options: {
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero:true
						}
					}]
				}
			}
		});
		$(".djual").empty();
		$(".hjual").click(function(){
			let id = $(this).data("id");
			$.ajax({
			type:'POST',
			url:'/showdjual',
			data: {id:id},
			success:function(response){
				var res = JSON.parse(response);
				var tr_str = "";
				if(res['data'] != null){
					for(var i=0; i<res['data'].length; i++){
					tr_str += "<tr>" +
						"<td>" + res['data'][i].IDItem + "</td>" +
						"<td>" + res['data'][i].NamaItem + "</td>" +
						"<td>" + res['data'][i].Harga + "</td>" +
						"<td>" + res['data'][i].Jumlah + "</td>" +
						"<td>" + res['data'][i].Subtotal + "</td>" +
					"</tr>";
					}
					
				}
				$(".djual").html(tr_str);
				}
			});
		});
	}
</script>