@section('content')
<div class="container">
    <h1>Master Pegawai</h1>
    {{ csrf_field() }}
        <div class="form-group col-md-12" style="padding: 0px">
            <label class="control-label col-md-2" for="uang" style="padding: 0px">Nama Pegawai</label>
            <div class="col-md-10" style="padding-right: 0px">
                <input type="text" class="form-control" name="nama" id="nama">
            </div>
        </div>
        <div class="form-group col-md-12" style="padding: 0px">
            <label class="control-label col-md-2" for="uang" style="padding: 0px">Username Pegawai</label>
            <div class="col-md-10" style="padding-right: 0px">
                <input type="text" class="form-control" name="username" id="username">
            </div>
        </div>
        <div class="form-group col-md-12" style="padding: 0px">
            <label class="control-label col-md-2" for="uang" style="padding: 0px">Password Pegawai</label>
            <div class="col-md-10" style="padding-right: 0px">
                <input type="password" class="form-control" name="password" id="password">
            </div>
        </div>
        <div class="form-group col-md-12" style="padding: 0px">
            <label class="control-label col-md-2" for="uang" style="padding: 0px">Alamat Pegawai</label>
            <div class="col-md-10" style="padding-right: 0px">
                <input type="text" class="form-control" name="alamat" id="alamat">
            </div>
        </div>
        <div class="form-group col-md-12" style="padding: 0px">
            <label class="control-label col-md-2" for="uang" style="padding: 0px">Nomor Telepon</label>
            <div class="col-md-10" style="padding-right: 0px">
                <input type="text" class="form-control" name="telepon" id="telepon">
            </div>
        </div>
        <div class="form-group col-md-12" style="padding: 0px">
            <label class="control-label col-md-2" for="uang" style="padding: 0px">Email Pegawai</label>
            <div class="col-md-10" style="padding-right: 0px">
                <input type="text" class="form-control" name="email" id="email">
            </div>
        </div>
        <div class="form-group col-md-12" style="padding: 0px">
            <label class="control-label col-md-2" for="uang" style="padding: 0px">Role Pegawai</label>
            <div class="col-md-10" style="padding-right: 0px">
                <input type="text" class="form-control" name="role" id="role">
            </div>
        </div>
        <input type="hidden" name="idpegawai" id="idpegawai">
        <button class="btn btn-primary btnInsertPegawai" type="submit" name="submit" value="insert">Insert</button>
        <button class="btn btn-primary btnUpdatePegawai" type="submit" name="submit" value="update">Update</button>
    <br><br>
    <table class="table" style=background-color:white>
		<thead>
			<tr>
				<th>Id Pegawai</th>
				<th>Nama Pegawai</th>
                <th>Username Pegawai</th>
                <th>Alamat Pegawai</th>
				<th>Nomor Telepon</th>
                <th>Email Pegawai</th>
                <th>Role Pegawai</th>
                <!-- <th>Status</th> -->
			</tr>
		</thead>
		<tbody class='bodypegawai'>
            @foreach($peg as $def =>$data)
            <tr class="pegawai" data-id='{{$data->id}}'>
                <td>{{$data->id}}</td>
                <td>{{$data->name}}</td>
                <td>{{$data->username}}</td>
                <td>{{$data->alamat}}</td>
                <td>{{$data->telepon}}</td>
                <td>{{$data->email}}</td>
                <td>{{$data->jabatan}}</td>
                @if($data->Aktif == "Ya")
                    <td><button class="editStatusPegawai btn btn-primary" id="id{{$data->id}}" data-id="{{$data->id}}" data-status="1">Aktif</button></td>
                @else
                    <td><button class="editStatusPegawai btn btn-primary" id="id{{$data->id}}" data-id="{{$data->id}}" data-status="0">Tidak Aktif</button></td>
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

    $(document).on('click', '.btnInsertPegawai', function(event){
        event.stopImmediatePropagation();
        let nama = $("#nama").val();
        let username = $('#username').val();
        let password = $("#password").val();
        let alamat = $("#alamat").val();
        let telepon = $("#telepon").val();
        let email = $("#email").val();
        let role = $("#role").val();
        let jenis = "insert";
        $.ajax({
        type:'POST',
        url:'/insertpegawai',
        data: {nama:nama, username:username, password:password, alamat:alamat, telepon:telepon, email:email, role:role, jenis:jenis},
        success:function(response){
            alert("Insert Success!");
            var res = JSON.parse(response);
            var tr_str = "";
            if(res['data'] != null){
                for(var i=0; i<res['data'].length; i++){
                    tr_str += "<tr class='pegawai' data-id='" + res['data'][i].id + "'>" +
                        "<td>" + res['data'][i].id + "</td>" +
                        "<td>" + res['data'][i].name + "</td>" +
                        "<td>" + res['data'][i].username + "</td>" +
                        "<td>" + res['data'][i].alamat + "</td>" +
                        "<td>" + res['data'][i].telepon + "</td>" +
                        "<td>" + res['data'][i].email + "</td>" +
                        "<td>" + res['data'][i].jabatan + "</td>";
                    if(res['data'][i].Aktif == "Ya"){
                        tr_str += "<td><button class='editStatusPegawai btn btn-primary' id='id" + res['data'][i].id + "' data-id='" + res['data'][i].id + "' data-status='1'>Aktif</button></td>"
                    }
                    else{
                        tr_str += "<td><button class='editStatusPegawai btn btn-primary' id='id" + res['data'][i].id + "' data-id='" + res['data'][i].id + "' data-status='0'>Tidak Aktif</button></td>"
                    }
                    tr_str += "</tr>";
                }
            }
            $(".bodypegawai").html(tr_str);
        }
        });
    });

    $(document).on('click', '.btnUpdatePegawai', function(event){
        event.stopImmediatePropagation();
        let id = $("#idpegawai").val();
        let nama = $("#nama").val();
        let username = $('#username').val();
        let password = $("#password").val();
        let alamat = $("#alamat").val();
        let telepon = $("#telepon").val();
        let email = $("#email").val();
        let role = $("#role").val();
        let jenis = "update";
        $.ajax({
        type:'POST',
        url:'/insertpegawai',
        data: {id:id, nama:nama, username:username, password:password, alamat:alamat, telepon:telepon, email:email, role:role, jenis:jenis},
        success:function(response){
            alert("Update Success!");
            var res = JSON.parse(response);
            var tr_str = "";
            if(res['data'] != null){
                for(var i=0; i<res['data'].length; i++){
                    tr_str += "<tr class='pegawai' data-id='" + res['data'][i].id + "'>" +
                        "<td>" + res['data'][i].id + "</td>" +
                        "<td>" + res['data'][i].name + "</td>" +
                        "<td>" + res['data'][i].username + "</td>" +
                        "<td>" + res['data'][i].alamat + "</td>" +
                        "<td>" + res['data'][i].telepon + "</td>" +
                        "<td>" + res['data'][i].email + "</td>" +
                        "<td>" + res['data'][i].jabatan + "</td>";
                    if(res['data'][i].Aktif == "Ya"){
                        tr_str += "<td><button class='editStatusPegawai btn btn-primary' id='id" + res['data'][i].id + "' data-id='" + res['data'][i].id + "' data-status='1'>Aktif</button></td>"
                    }
                    else{
                        tr_str += "<td><button class='editStatusPegawai btn btn-primary' id='id" + res['data'][i].id + "' data-id='" + res['data'][i].id + "' data-status='0'>Tidak Aktif</button></td>"
                    }
                    tr_str += "</tr>";
                }
            }
            $(".bodypegawai").html(tr_str);
        }
        });
    });


    $(document).on('click', '.editStatusPegawai', function(){
        let id = $(this).data("id");
        let status = $(this).data("status");
        $.ajax({
        type:'POST',
        url:'/editstatuspegawai',
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

    $(document).on('click', '.pegawai', function(event){
        event.stopImmediatePropagation();
        let id = $(this).data("id");
        $.ajax({
        type:'POST',
        url:'/updateinputmasterpegawai',
        data: {id:id},
        success:function(response){
			var res = JSON.parse(response);
            $("#nama").val(res['data'][0].name);
            $("#username").val(res['data'][0].username);
            $("#alamat").val(res['data'][0].alamat);
            $("#telepon").val(res['data'][0].telepon);
            $("#email").val(res['data'][0].email);
            $("#role").val(res['data'][0].jabatan);
            $("#idpegawai").val(res['data'][0].id);
        }
        });
    });
</script>