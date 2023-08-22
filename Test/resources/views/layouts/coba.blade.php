<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
<link rel="stylesheet" href="{{ asset('css/try.css') }}">
<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> -->
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!------ Include the above in your HEAD tag ---------->

        
        
        <!-- <nav class="navbar navbar-expand navbar-dark bg-primary"> <a href="#menu-toggle" id="menu-toggle" class="navbar-brand"><span class="navbar-toggler-icon"></span></a> <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample02" aria-controls="navbarsExample02" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
            <div class="collapse navbar-collapse" id="navbarsExample02">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active"> <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a> </li>
                    <li class="nav-item"> <a class="nav-link" href="#">Link</a> </li>
                </ul>
                <form class="form-inline my-2 my-md-0"> </form>
            </div>
        </nav> -->
        
        <div id="wrapper" class="toggled">
            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li id="barang"> <a href="javascript:void(0)">Master Barang</a> </li>
                    <li id="orang"> <a href="javascript:void(0)">Master Pegawai</a> </li>
                    <li id="category"> <a href="javascript:void(0)">Master Kategori</a> </li>
                    <li id="transaksi"> <a href="javascript:void(0)">Laporan Penjualan</a> </li>
                    <li id="grafik"> <a href="javascript:void(0)">Chart Penjualan</a> </li>
                </ul>
            </div> <!-- /#sidebar-wrapper -->
            <!-- Page Content -->
            <div id="page">
                @if(isset($res))
                   {!!$res!!}
                @endif
            </div> <!-- /#page-content-wrapper -->
        </div> <!-- /#wrapper -->
        <!-- Bootstrap core JavaScript -->
        <script src="{{ asset('js/jquery.min.js') }}"></script>
        <script src="{{ asset('js/bootstrap.bundle.min.js') }}"></script> <!-- Menu Toggle Script -->
        <script>
          $(function(){
            $("#menu-toggle").click(function(e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });

            $(window).resize(function(e) {
              if($(window).width()<=768){
                $("#wrapper").removeClass("toggled");
              }else{
                $("#wrapper").addClass("toggled");
              }
            });
          });
        </script>
        <script>
            $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
            });
            $("#category").click(function(){
                $.ajax({
                type:'GET',
                url:'/category',
                success:function(res){
                    $('#page').html(res);
                }
                });
            });
            $("#barang").click(function(){
                $.ajax({
                type:'GET',
                url:'/mstrbrg',
                success:function(res){
                    $('#page').html(res);
                }
                });
            });
            $("#orang").click(function(){
                $.ajax({
                type:'GET',
                url:'/mstrpgwi',
                success:function(res){
                    $('#page').html(res);
                }
                });
            });
            $("#transaksi").click(function(){
                $.ajax({
                type:'GET',
                url:'/transaksi',
                success:function(res){
                    $('#page').html(res);
                }
                });
            });
            $("#grafik").click(function(){
                $.ajax({
                type:'GET',
                url:'/grafik',
                success:function(res){
                    $('#page').html(res);
                }
                });
            });
        </script>
  </html>