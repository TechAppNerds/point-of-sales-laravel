
@section('content')
<div class="container">
    <h1>Master Kategori</h1>
    {{ csrf_field() }}
        <div class="form-group col-md-12" style="padding: 0px">
            <label class="control-label col-md-2" for="uang" style="padding: 0px">Nama Kategori</label>
            <div class="col-md-10" style="padding-right: 0px">
                <input type="text" class="form-control" name="nama" id="nama">
            </div>
        </div>
        <input type="hidden" name="idkategori" id="idkategori">
        <button class="btn btn-primary btnInsertKategori" type="submit" name="submit" value="insert">Insert</button>
        <button class="btn btn-primary btnUpdateKategori" type="submit" name="submit" value="update">Update</button>
    <br><br>
    <table class="table" style=background-color:white>
		<thead>
			<tr>
				<th>Id Kategori</th>
				<th>Nama Kategori</th>
                <th>Status</th>
			</tr>
		</thead>
		<tbody class="bodykategori">
			@foreach($kat as $abc =>$data)
            <tr class="kategori" data-id='{{$data->IDItemTree}}'>
                <td>{{$data->IDItemTree}}</td>
                <td>{{$data->Nama}}</td>
                @if($data->Aktif == "Ya")
                    <td><button class="editStatusKategori btn btn-primary" id="id{{$data->IDItemTree}}" data-id="{{$data->IDItemTree}}" data-status="1">Aktif</button></td>
                @else
                    <td><button class="editStatusKategori btn btn-primary" id="id{{$data->IDItemTree}}" data-id="{{$data->IDItemTree}}" data-status="0">Tidak Aktif</button></td>
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

    $(document).on('click', '.btnInsertKategori', function(event){
        event.stopImmediatePropagation();
        let nama = $("#nama").val();
        let jenis = "insert";
        $.ajax({
        type:'POST',
        url:'/insertcategory',
        data: {nama:nama, jenis:jenis},
        success:function(response){
            alert("Insert Success!");
            var res = JSON.parse(response);
            var tr_str = "";
            if(res['data'] != null){
                for(var i=0; i<res['data'].length; i++){
                    tr_str += "<tr class='kategori' data-id='" + res['data'][i].IDItemTree + "'>" +
                        "<td>" + res['data'][i].IDItemTree + "</td>" +
                        "<td>" + res['data'][i].Nama + "</td>";
                    if(res['data'][i].Aktif == "Ya"){
                        tr_str += "<td><button class='editStatusKategori btn btn-primary' id='id" + res['data'][i].IDItemTree + "' data-id='" + res['data'][i].IDItemTree + "' data-status='1'>Aktif</button></td>"
                    }
                    else{
                        tr_str += "<td><button class='editStatusKategori btn btn-primary' id='id" + res['data'][i].IDItemTree + "' data-id='" + res['data'][i].IDItemTree + "' data-status='0'>Tidak Aktif</button></td>"
                    }
                    tr_str += "</tr>";
                }
            }
            $(".bodykategori").html(tr_str);
        }
        });
    });

    $(document).on('click', '.btnUpdateKategori', function(event){
        event.stopImmediatePropagation();
        let id = $("#idkategori").val();
        let nama = $("#nama").val();
        let jenis = "update";
        $.ajax({
        type:'POST',
        url:'/insertcategory',
        data: {id:id, nama:nama, jenis:jenis},
        success:function(response){
            alert("Update Success!");
            var res = JSON.parse(response);
            var tr_str = "";
            if(res['data'] != null){
                for(var i=0; i<res['data'].length; i++){
                    tr_str += "<tr class='kategori' data-id='" + res['data'][i].IDItemTree + "'>" +
                        "<td>" + res['data'][i].IDItemTree + "</td>" +
                        "<td>" + res['data'][i].Nama + "</td>";
                    if(res['data'][i].Aktif == "Ya"){
                        tr_str += "<td><button class='editStatusKategori btn btn-primary' id='id" + res['data'][i].IDItemTree + "' data-id='" + res['data'][i].IDItemTree + "' data-status='1'>Aktif</button></td>"
                    }
                    else{
                        tr_str += "<td><button class='editStatusKategori btn btn-primary' id='id" + res['data'][i].IDItemTree + "' data-id='" + res['data'][i].IDItemTree + "' data-status='0'>Tidak Aktif</button></td>"
                    }
                    tr_str += "</tr>";
                }
            }
            $(".bodykategori").html(tr_str);
        }
        });
    });

    $(document).on('click', '.editStatusKategori', function(){
        let id = $(this).data("id");
        let status = $(this).data("status");
        $.ajax({
        type:'POST',
        url:'/editstatuskategori',
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

    $(document).on('click', '.kategori', function(){
        let id = $(this).data("id");
        $.ajax({
        type:'POST',
        url:'/updateinputmasterkategori',
        data: {id:id},
        success:function(response){
			var res = JSON.parse(response);
            $("#nama").val(res['data'][0].Nama);
            $("#idkategori").val(res['data'][0].IDItemTree);
        }
        });
    });
</script>