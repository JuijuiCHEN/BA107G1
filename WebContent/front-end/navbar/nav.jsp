<%@ page contentType="text/html; charset=utf-8" pageEncoding="Big5"%>
<!DOCTYPE html>
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>Title Page</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link href="<%=request.getContextPath()%>/front-end/navbar/css/nav.css" rel="stylesheet">

	</head>
	<body>
			<nav class="navbar navbar-inverse navbar-fixed-top navbar-custom">
    	
  <div class="container-fluid">
    <div class="navbar-header ">
  	<img class="navbar-brand navbar-brand-custom" src="<%=request.getContextPath()%>/front-end/navbar/images/LogoSmall2.png" id="nav-logo">
      <a class="navbar-brand " href="#">Anti-Gravity</a>
    <form class="navbar-form navbar-left navbar-form-custom" action="/action_page.php">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="�j�M���J�B����B�Φa��">
      </div>
      <button type="submit" class="btn btn-default">Go!</button>
    </form>
    </div>
<div>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Hi! Amos</a></li>
					<li><a href="#">�w�q</a></li>
					<li><a href="#">�T��</a></li>
					<li><a href="#">���s</a></li>
					<!-- �U�Կ�� -->
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">�ӤH�]�w<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">�b���]�w</a></li>
							<li><a href="#">��������</a></li>
							<li><a href="#">�ȪA�䴩</a></li>
							<li><a href="#">�n�X</a></li>
						</ul>
					</li>
				</ul>
				</div>
  </div>

</nav>

  	
	</body>
</html>