@section('content')
<div class="container">
    <h1>Chart Penjualan</h1>
    <div>
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
	</div>
    <div class='date'></div>
    <br/>
    <div class="panel panel-default">
		<canvas id="myChart" height="100" width="350"></canvas>
	</div>
	<script src="{{ asset('js/Chart.min.js') }}"></script>
	<script src="{{ asset('js/bootstrap.min.js') }}"></script>
	<script src="{{ asset('js/xcharts.min.js') }}"></script>
	<script src="{{ asset('js/jquery.min.js') }}"></script>
</div>
<script>
    $.ajaxSetup({
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      }
    });
    $(".filter").change(function(){
        let jenis = $(this).val();
        $.ajax({
        type:'POST',
        url:'/filterchart',
        data: {jenis:jenis},
        success:function(res){
            $(".date").empty();
            var response = JSON.parse(res);
            var x = new Array();
            var y = new Array();
            var hargajual = new Array();
            var hargabeli = new Array();
            if(jenis == 1){
                if(response['data'] != null){
                    for(var i=0; i<response['data'].length; i++){
                        x.push(response['data'][i].IDJualH);
                        y.push(response['data'][i].Total);
                    }
                }
                var label = 'Total Penjualan per Nota';
            }
            else if(jenis == 2){
                if(response['data'] != null){
                    for(var i=0; i<response['data'].length; i++){
                        x.push(response['data'][i].name);
                        y.push(response['data'][i].user_total);
                    }
                }
                var label = 'Total Penjualan per Kasir';
            }
            else if(jenis == 3){
                if(response['data'] != null){
                    for(var i=0; i<response['data'].length; i++){
                        x.push(response['data'][i].Nama);
                        y.push(response['data'][i].kat_total);
                    }
                }
                var label = 'Total Penjualan per Kategori';
            }
            else if(jenis == 4){
                if(response['data'] != null){
                    for(var i=0; i<response['data'].length; i++){
                        x.push(response['data'][i].Nama);
                        y.push(response['data'][i].item_total);
                    }
                }
                var label = 'Total Penjualan per Barang';
            }
            else if(jenis == 5){
                if(response['data'] != null){
                    for(var i=0; i<response['data'].length; i++){
                        x.push(response['data'][i].IDJualH);
                        y.push(response['data'][i].Total);
                    }
                }
                var label = 'Total Penjualan';
            }
            else if(jenis == 6){
                if(response['data'] != null){
                    for(var i=0; i<response['data'].length; i++){
                        x.push(response['data'][i].IDJualH);
                        y.push(response['data'][i].Keuntungan);
                        //hargajual.push(response['data'][i].HargaJual);
                        //hargabeli.push(response['data'][i].HargaBeli)
                    }
                }
                var label = 'Total Keuntungan';
            }
            else if(jenis == 8){
                if(response['data'] != null){
                    for(var i=0; i<response['data'].length; i++){
                        x.push(response['data'][i].Tanggal);
                        y.push(response['data'][i].date_total);
                    }
                }
                var label = 'Total Penjualan per Tanggal';
            }
            else if(jenis == 9){
                if(response['data'] != null){
                    for(var i=0; i<response['data'].length; i++){
                        x.push(response['data'][i].Nama);
                        y.push(response['data'][i].stok_total);
                    }
                }
                var label = 'Total Stok';
            }
            else if(jenis == 10){
                if(response['data'] != null){
                    for(var i=0; i<response['data'].length; i++){
                        x.push(response['data'][i].IDJualH);
                        y.push(response['data'][i].Total);
                    }
                }
                var label = 'Pembayaran Tunai';
            }
            else if(jenis == 11){
                if(response['data'] != null){
                    for(var i=0; i<response['data'].length; i++){
                        x.push(response['data'][i].IDJualH);
                        y.push(response['data'][i].Total);
                    }
                }
                var label = 'Pembayaran Kartu';
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
                            hargajual: hargajual,
                            hargabeli: hargabeli,
                            backgroundColor: [
                            ],
                            borderColor: [
                            ],
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
    });

    $.ajax({
        type:'POST',
        url:'/chart',
        success:function(res){
            var response = JSON.parse(res);
            var id = new Array();
            var total = new Array();
            if(response['data'] != null){
				for(var i=0; i<response['data'].length; i++){
                    id.push(response['data'][i].IDJualH);
                    total.push(response['data'][i].Total);
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
                            backgroundColor: [
                            ],
                            borderColor: [
                            ],
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
</script>