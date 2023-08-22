<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->

<!DOCTYPE html>
<html>
<head>
<title>POS</title>
<!-- For-Mobile-Apps -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Lucid Login Form Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //For-Mobile-Apps -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" /> -->
<link rel="stylesheet" href="{{ asset('css/bootstrap.min.css') }}">
<!-- Style --> <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />

</head>
<body>
<div class="container">
@if (session('statusLogin') == "0")
<div class="alert alert-danger" style="text-align: center; margin-top:-50px;">
	<span style="font-family: 'Oswald-Regular';"> {{ session('alertLogin') }} </span>
    {{ session(['statusLogin' => '2']) }}
</div>
@endif
<h1>LOGIN</h1>
	<div class="signin">
     	<form class="form-horizontal" method="POST" action="{{ route('loginCheck') }}">
                        {{ csrf_field() }}
	      	<input name="username" type="text" class="user" placeholder="Email" />
	      	<input name="pass" type="password" class="pass" placeholder="Password" />
          	<input type="submit" value="LOGIN" />
	 	</form>
	</div>
</div>
<!-- <div class="footer">
     <p>Copyright &copy; 2015 Lucid Login Form. All Rights Reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
</div> -->
</body>

</html>
