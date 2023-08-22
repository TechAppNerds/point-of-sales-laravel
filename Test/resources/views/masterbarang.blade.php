
@section('content')
<div class="container">
    <h1>Master Barang</h1>
    {{ csrf_field() }}
        <div class="form-group col-md-12" style="padding: 0px">
            <label class="control-label col-md-2" for="uang" style="padding: 0px">Nama Barang</label>
            <div class="col-md-10" style="padding-right: 0px">
                <input type="text" class="form-control" name="nama" id="nama">
            </div>
        </div>
        <div class="form-group col-md-12" style="padding: 0px">
            <label class="control-label col-md-2" for="uang" style="padding: 0px">Kategori Barang</label>
            <div class="col-md-10" style="padding-right: 0px">
                <select class="form-control kategori" id="jeniskategori" name='kategori'>
                    @foreach($kategori as $abc =>$data)
                    <option value='{{$data->IDItemTree}}'>{{$data->Nama}}</option>
                    @endforeach
                </select>
            </div>
        </div>
        <div class="form-group col-md-12" style="padding: 0px">
            <label class="control-label col-md-2" for="uang" style="padding: 0px">Stok Barang</label>
            <div class="col-md-10" style="padding-right: 0px">
                <input type="text" class="form-control" name="stok" id="stok">
            </div>
        </div>
        <div class="form-group col-md-12" style="padding: 0px">
            <label class="control-label col-md-2" for="uang" style="padding: 0px">Satuan Barang</label>
            <div class="col-md-10" style="padding-right: 0px">
                <input type="text" class="form-control" name="satuan" id="satuan">
            </div>
        </div>
        <div class="form-group col-md-12" style="padding: 0px">
            <label class="control-label col-md-2" for="uang" style="padding: 0px">Harga Jual</label>
            <div class="col-md-10" style="padding-right: 0px">
                <input type="text" class="form-control" name="hargajual" id="hargajual">
            </div>
        </div>
        <div class="form-group col-md-12" style="padding: 0px">
            <label class="control-label col-md-2" for="uang" style="padding: 0px">Harga Beli</label>
            <div class="col-md-10" style="padding-right: 0px">
                <input type="text" class="form-control" name="hargabeli" id="hargabeli">
            </div>
        </div>
        <input type="hidden" name="idbarang" id="idbarang">
        <button class="btn btn-primary btnInsertBarang" type="submit" name="submit" value="insert">Insert</button>
        <button class="btn btn-primary btnUpdateBarang" type="submit" name="submit" value="update">Update</button>
    <br><br>
    <table class="table" style=background-color:white>
		<thead>
			<tr>
				<th>Kode Barang</th>
				<th>Nama Barang</th>
                <th>Kategori Barang</th>
				<th>Stok Barang</th>
                <th>Satuan Barang</th>
                <th>Harga Jual</th>
                <th>Harga Beli</th>
                <th>Status</th>
			</tr>
		</thead>
		<tbody class='bodybarang'>
            @foreach($brg as $abc =>$data)
            <tr class='barang' data-id='{{$data->IDItem}}'>
                <td>{{$data->IDItem}}</td>
                <td>{{$data->Nama}}</td>
                <td>{{$data->kategori}}</td>
                <td>{{$data->StokMin}}</td>
                <td>{{$data->Satuan}}</td>
                <td>{{$data->HargaJual}}</td>
                <td>{{$data->HargaBeli}}</td>
                @if($data->Aktif == "Ya")
                    <td><button class="editStatusBarang btn btn-primary" id="id{{$data->IDItem}}" data-id="{{$data->IDItem}}" data-status="1">Aktif</button></td>
                @else
                    <td><button class="editStatusBarang btn btn-primary" id="id{{$data->IDItem}}" data-id="{{$data->IDItem}}" data-status="0">Tidak Aktif</button></td>
                @endif
            </tr>
            @endforeach
		</tbody>
	</table>
</div>
<script>
    $.ajaxSetup({
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      }
    });

    $(document).on('click', '.btnInsertBarang', function(event){
        event.stopImmediatePropagation();
        let nama = $("#nama").val();
        let kategori = $('#jeniskategori').val();
        let stok = $("#stok").val();
        let satuan = $("#satuan").val();
        let hargajual = $("#hargajual").val();
        let hargabeli = $("#hargabeli").val();
        let jenis = "insert";
        $.ajax({
        type:'POST',
        url:'/insertbarang',
        data: {nama:nama, kategori:kategori, stok:stok, satuan:satuan, hargajual:hargajual, hargabeli:hargabeli, jenis:jenis},
        success:function(response){
            alert("Insert Success!");
            var res = JSON.parse(response);
            var tr_str = "";
            if(res['data'] != null){
                for(var i=0; i<res['data'].length; i++){
                    tr_str += "<tr class='barang' data-id='" + res['data'][i].IDItem + "'>" +
                        "<td>" + res['data'][i].IDItem + "</td>" +
                        "<td>" + res['data'][i].Nama + "</td>" +
                        "<td>" + res['data'][i].kategori + "</td>" +
                        "<td>" + res['data'][i].StokMin + "</td>" +
                        "<td>" + res['data'][i].Satuan + "</td>" +
                        "<td>" + res['data'][i].HargaJual + "</td>" +
                        "<td>" + res['data'][i].HargaBeli + "</td>";
                    if(res['data'][i].Aktif == "Ya"){
                        tr_str += "<td><button class='editStatusBarang btn btn-primary' id='id" + res['data'][i].IDItem + "' data-id='" + res['data'][i].IDItem + "' data-status='1'>Aktif</button></td>"
                    }
                    else{
                        tr_str += "<td><button class='editStatusBarang btn btn-primary' id='id" + res['data'][i].IDItem + "' data-id='" + res['data'][i].IDItem + "' data-status='0'>Tidak Aktif</button></td>"
                    }
                    tr_str += "</tr>";
                }
            }
            $(".bodybarang").html(tr_str);
        }
        });
    });

    $(document).on('click', '.btnUpdateBarang', function(event){
        event.stopImmediatePropagation();
        let id = $("#idbarang").val();
        let nama = $("#nama").val();
        let kategori = $('#jeniskategori').val();
        let stok = $("#stok").val();
        let satuan = $("#satuan").val();
        let hargajual = $("#hargajual").val();
        let hargabeli = $("#hargabeli").val();
        let jenis = "update";
        $.ajax({
        type:'POST',
        url:'/insertbarang',
        data: {id:id, nama:nama, kategori:kategori, stok:stok, satuan:satuan, hargajual:hargajual, hargabeli:hargabeli, jenis:jenis},
        success:function(response){
            alert("Update Success!");
            var res = JSON.parse(response);
            var tr_str = "";
            if(res['data'] != null){
                for(var i=0; i<res['data'].length; i++){
                    tr_str += "<tr class='barang' data-id='" + res['data'][i].IDItem + "'>" +
                        "<td>" + res['data'][i].IDItem + "</td>" +
                        "<td>" + res['data'][i].Nama + "</td>" +
                        "<td>" + res['data'][i].kategori + "</td>" +
                        "<td>" + res['data'][i].StokMin + "</td>" +
                        "<td>" + res['data'][i].Satuan + "</td>" +
                        "<td>" + res['data'][i].HargaJual + "</td>" +
                        "<td>" + res['data'][i].HargaBeli + "</td>";
                    if(res['data'][i].Aktif == "Ya"){
                        tr_str += "<td><button class='editStatusBarang btn btn-primary' id='id" + res['data'][i].IDItem + "' data-id='" + res['data'][i].IDItem + "' data-status='1'>Aktif</button></td>"
                    }
                    else{
                        tr_str += "<td><button class='editStatusBarang btn btn-primary' id='id" + res['data'][i].IDItem + "' data-id='" + res['data'][i].IDItem + "' data-status='0'>Tidak Aktif</button></td>"
                    }
                    tr_str += "</tr>";
                }
            }
            $(".bodybarang").html(tr_str);
        }
        });
    });

    $(document).on('click', '.editStatusBarang',function(){
        let id = $(this).data("id");
        let status = $(this).data("status");
        $.ajax({
        type:'POST',
        url:'/editstatusbarang',
        data: {id:id, status:status},
        success:function(res){
            if(status == 1){
                $('#id' + id).html("Tidak Aktif");
                $('#id' + id).data("status", "0");
            }
            else if(status == 0){
                $('#id' + id).html("Aktif");
                $('#id' + id).data("status", "1");
            }
        }
        });
    });

    $(document).on('click', '.barang', function(event){
        event.stopImmediatePropagation();
        let id = $(this).data("id");
        $.ajax({
        type:'POST',
        url:'/updateinputmasterbarang',
        data: {id:id},
        success:function(response){
			var res = JSON.parse(response);
            var tr_str = "";
            if(res['kategori'] != null){
				for(var i=0; i<res['kategori'].length; i++){
                    if(res['kategori'][i].IDItemTree == res['data'][0].kategori){
                        tr_str += "<option value='" + res['kategori'][i].IDItemTree + "' selected>" + res['kategori'][i].Nama + "</option>"
                    }
                    else{
                        tr_str += "<option value='" + res['kategori'][i].IDItemTree + "'>" + res['kategori'][i].Nama + "</option>"
                    }
                }
            }
            $(".kategori").html(tr_str);
            $("#nama").val(res['data'][0].Nama);
            $("#stok").val(res['data'][0].StokMin);
            $("#satuan").val(res['data'][0].Satuan);
            $("#hargajual").val(res['data'][0].HargaJual);
            $("#hargabeli").val(res['data'][0].HargaBeli);
            $("#idbarang").val(res['data'][0].IDItem);
        }
        });
    });
</script>