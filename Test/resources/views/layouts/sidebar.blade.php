<head>
    <meta charset="utf-8">
</head>
<body>
    <aside class="main-sidebar">
        <section class="sidebar">    
            <ul class="sidebar-menu" data-widget="tree">
                <li class="treeview" id="barang">
                    <a href="javascript:void(0)">
                        <i class="fa fa-dashboard"></i> <span>Master Barang</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                </li>
                <li class="treeview" id="orang">
                    <a href="javascript:void(0)">
                        <i class="fa fa-dashboard"></i> <span>Master Pegawai</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                </li> 
                <li class="treeview" id="category">
                    <a href="javascript:void(0)">
                        <i class="fa fa-dashboard"></i> <span>Master Kategori</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                </li> 
                <li class="treeview" id="transaksi">
                    <a href="javascript:void(0)">
                        <i class="fa fa-dashboard"></i> <span>Laporan Penjualan</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                </li> 
                <li class="treeview" id="grafik">
                    <a href="javascript:void(0)">
                        <i class="fa fa-dashboard"></i> <span>Chart Penjualan</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                </li> 
            </ul>
        </section>
    </aside>
    <main class="page-content"></main>    
</body>

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
            $('main').html(res);
        }
        });
    });
    $("#barang").click(function(){
        $.ajax({
        type:'GET',
        url:'/mstrbrg',
        success:function(res){
            $('main').html(res);
        }
        });
    });
    $("#orang").click(function(){
        $.ajax({
        type:'GET',
        url:'/mstrpgwi',
        success:function(res){
            $('main').html(res);
        }
        });
    });
    $("#transaksi").click(function(){
        $.ajax({
        type:'GET',
        url:'/transaksi',
        success:function(res){
            $('main').html(res);
        }
        });
    });
    $("#grafik").click(function(){
        $.ajax({
        type:'GET',
        url:'/grafik',
        success:function(res){
            $('main').html(res);
        }
        });
    });
</script>