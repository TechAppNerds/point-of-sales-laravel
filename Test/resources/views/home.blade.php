@extends('layouts.app')

@section('style')
<style type="text/css">
    .ScrollList {
        background-color: white;
        /*height:350px;*/
        overflow-y:scroll;
    }
    .modal-header, h5, .close {
        background-color: #5cb85c;
        color:white !important;
        text-align: center;
        font-size: 30px;
    }
</style>
@endsection

@section('content')
<meta name="_token" content="{{ csrf_token() }}"/>

<div class="container">
    @if (session('statusAutentikasi') == "0")
        <div class="alert alert-danger" style="text-align: center;">
            <span> {{ session('alertAutentikasi') }} </span>
        </div>
    @endif
    
    <div class="list-group col-md-6">
        <!-- ===================== Combobox Kategori ===================== -->
        <div class="col-md-6 col-xs-12" style="padding: 1px;">
            <form method="post" action="searchcategory">
                {{ csrf_field() }}      <!--  semacam token yang dibutuhkan pada saat form melakukan method post -->
                <div class="input-group">
                    <select class="form-control col-md-6" name="SearchCategory">
                        <option disabled selected>Kategori</option>
                        @foreach ($categories as $category)
                            <option value={{$category->IDItemTree}}>{{ ucwords(strtolower($category->Nama)) }}</option>
                        @endforeach
                    </select>
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-search"></i></button>
                    </span>
                </div>
            </form>
            <br>
        </div>
        <!-- =============================================================== -->

        <!-- ======================== Search Barcode ======================== -->
        <div class="col-md-6 col-xs-12" style="padding: 1px;">
            <form method="get" action="searchbarcode">
                {{ csrf_field() }}
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></span>
                    <input type="text" name="searchbarcode" id="searchbarcode" class="form-control" autofocus placeholder="Barcode">
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span></button>
                    </span>
                </div>
            </form>
            <br>
        </div>
        <!-- =============================================================== -->

        <!-- ======================== Search Textbox ======================== -->
        <div class="col-md-12 col-xs-12" style="padding: 1px;">
            <form method="get" action="search">
                {{ csrf_field() }}
                <div class="input-group">
                    <div class="col-md-4" style="padding: 0px;">
                        <select class="form-control custom-select" name="SearchFrom">
                            <option value="kode" selected>Kode Barang</option>
                            <option value="nama">Nama Barang</option>
                        </select>
                    </div>
                    <div class="col-md-8" style="padding: 0px;">
                        <input type="text" name="searchby" id="searchby" class="form-control" placeholder="...">
                    </div>
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-primary" id="SrcCode">Cari</button>
                    </span>
                </div>
            </form>
            <br>
        </div>
        <!-- =============================================================== -->

        <!-- ========================== List Group Barang ========================== -->
        <h4 style="color: white; margin-bottom: 5px; margin-top: 5px;">List Barang :</h4>
        <ul id="ListBarang" class="list-group ScrollList" style="height: 357px;" >
            @if (session()->has('search'))
                @foreach (session()->get('search') as $DataSearch)
                    <li class="list-group-item" style="padding-bottom: 20px;" >
                        <form method="post" action={{route('add_item')}}>
                            {{ csrf_field() }}
                            ({{ $DataSearch['kode'] }})
                            {{ ucwords($DataSearch['name']) }}
                            <br>Rp. {{number_format($DataSearch['price'],0,',','.')}}   <!-- agar ada separatornya -->
                            <!-- number_format(value nya,jumlah angka dibelakang 0, simbol separator ribu, simbol separator desimal) -->
                            <input type="hidden" name="ItemAdd" value={{ $DataSearch['id'] }} >
                            <button type="submit" class="btn btn-primary btn-xs pull-right" style=" font-size: 17px;width: 30px;height: 30px;"><span class="glyphicon glyphicon-plus"></span></button>
                        </form>
                    </li>
                @endforeach            
            @endif
        </ul>
        <!-- =============================================================== -->
    </div>

    <div class="list-group col-md-6">
        <div style="height: 100px;">
            @if(session()->has('message'))
                <h4 style="color: red; text-align: center; padding: 30px; margin: 0px; font-weight: bold;">{{session()->get("message")}}</h4>
            @endif
            <!-- Menampilkan kode nota saat ini -->
            @isset($kd)
                <h3 style="text-align: right; padding-top: 30px; margin: 0px;">Nomor Nota : {{$kd}}</h3>
            @endisset
        </div>

        
        <h4 style="color: white; margin-bottom: 5px;">Barang yang dibeli :</h4>
        <!-- ==================== List Barang yang dibeli ==================== -->
        <ul class="list-group ScrollList" style="margin-bottom: 2px; height: 300px;">
            <?php $total = 0; ?>
            @if (session()->has('cart'))
                @foreach (session()->get('cart') as $DataCart)
                    @if ($DataCart['aktif'] == 'ya')
                    <li class="list-group-item" style="padding-bottom: 25px;" >
                        <!-- Button Hapus Barang -->
                        <form method="post" action="{{route('remove')}}">
                            {{ csrf_field() }}
                            <input type="hidden" name="RemoveButton" value={{ $DataCart['id'] }} >
                            <button class="btn btn btn-danger btn-xs pull-right" style="font-size: 17px;width: 30px;height: 30px;"><span class="glyphicon glyphicon-remove"></span></button>
                        </form>
                        <!-- Button Kurang Jumlah Barang -->
                        <form method="post" action="{{route('reduce_qty')}}">
                            {{ csrf_field() }}
                            <input type="hidden" name="MinusButton" value={{ $DataCart['id'] }} >
                            <button class="btn btn btn-warning btn-xs pull-right" style="font-size: 17px;width: 30px;height: 30px;margin-right: 10px;"><span class="glyphicon glyphicon-minus"></span></button>
                        </form>
                        <!-- Button Tambah Jumlah Barang -->    
                        <form method="post" action="{{route('add_qty')}}">
                            {{ csrf_field() }}
                            <input type="hidden" name="PlusButton" value={{ $DataCart['id'] }} >
                            <button class="btn btn-primary btn-xs pull-right" style="font-size: 17px;width: 30px;height: 30px; margin-right: 10px;"><span class="glyphicon glyphicon-plus"></span></button>
                        </form>
                        <!-- Data barang -->
                        <h4 class="list-group-item-heading">{{$DataCart['name']}}</h4>
                        <p class="list-group-item-text"><span>{{$DataCart['qty']}}</span> &emsp;{{number_format($DataCart['price'],0,',','.')}}</p>
                        <h4 class="pull-right" style="margin-top:0px">Rp. {{number_format($DataCart['subtotal'],0,',','.')}}</h4>
                        <?php $total += $DataCart['subtotal']; ?>
                    </li>
                    @endif
                @endforeach            
            @endif
        </ul>
        <!-- ============================================================ -->
        <!-- Menampilkan total yang harus dibayar -->
        <ul class="list-group">
            <li class="list-group-item" style="border-top: 2px solid gray">
                <h3 style="text-align: right; margin: 5px;">Total : Rp. {{number_format($total,0,',','.')}}</h3>
            </li>
        </ul>
        <a href="{{route('bayar')}}" class="btn btn-default pull-right">Pembayaran</a>
    </div>

    <!-- ====================== Modal ====================== -->
      <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header" style="padding:35px 50px;">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h5><span class="glyphicon glyphicon-lock"></span> Autentikasi</h5>
            </div>
            <div class="modal-body" style="padding:40px 50px;">
              <form id="FormAuthentication" role="form" method="post" action="{{route('reduce_qty')}}">
                {{ csrf_field() }}
                <div class="form-group">
                  <label for="usrname">Email</label>
                  <input type="text" class="form-control" id="TxtEmail" name="TxtEmail" placeholder="Enter email">
                </div>
                <div class="form-group">
                  <label for="psw">Password</label>
                  <input type="password" class="form-control" id="TxtPsw" name="TxtPsw" placeholder="Enter password">
                </div>
                <input type="hidden" id="IdCart" name="IdCart">
                <button type="submit" class="btn btn-success btn-block authentication">Login</button>
              </form>
            </div>
          </div>
        </div>
      </div> 
    <!-- ============================================================ -->

    </div>
</div>

<div id="vues">
<!--     @{{ message }}
    @{{aa}} -->
</div>
@endsection

@section('scripts')
<script>
    var app = new Vue({
      el: '#vues',
      data: {
        message: 'Hello Vue!'
      }
    })

    $(document).ready(function(){
        
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $(".btnminus").click(function(){
            $("#IdCart").val(this.id);
            $('#FormAuthentication').attr('action','{{route('reduce_qty')}}');
            $("#myModal").modal();
        });

        $(".btnerase").click(function(){
            $("#IdCart").val(this.id);
            $('#FormAuthentication').attr('action','{{route('remove')}}');
            $("#myModal").modal();
        });
    });
</script>
@endsection