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
        <input type="text" class="form-control" placeholder="搜尋民宿、體驗、或地區">
      </div>
      <button type="submit" class="btn btn-default">Go!</button>
    </form>
    </div>
<div>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Hi! Amos</a></li>
					<li><a href="#">預訂</a></li>
					<li><a href="#">訊息</a></li>
					<li><a href="#">社群</a></li>
					<!-- 下拉選單 -->
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">個人設定<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">帳號設定</a></li>
							<li><a href="#">身分切換</a></li>
							<li><a href="#">客服支援</a></li>
							<li><a href="#">登出</a></li>
						</ul>
					</li>
				</ul>
				</div>
  </div>

</nav>

  	
	</body>
</html>