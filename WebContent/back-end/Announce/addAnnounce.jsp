<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="Big5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Big5">
<title>Anti-G後台</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" mhref="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/base.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="icon" href="img/LogoSmallback.png" />
<link href="https://getbootstrap.com/docs/4.0/examples/dashboard/dashboard.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<style type="text/css">
nav.col-md-2.d-none.d-md-block.bg-light.sidebar {
	padding-top: 5%;
}

main.col-md-9.ml-sm-auto.col-lg-10.pt-3.px-4 {
	padding-top: 5%;
}
</style>
<body>

	<form method="post" action="<%=request.getContextPath()%>/announce/announce.do">
		<div class="form-group">
			<h3>編輯公告標題</h3>
			<input class="form-control" id="inputsm" type="text" name="announce_title">
		</div>
		<br>
		<div class="form-group">
			<h3>編輯公告內容</h3>
			<textarea class="form-control" rows="3" id="comment" name="announce_content" cols="80">
		</textarea>
		</div>

		<div class='col-sm-9' align='center'>
			<input type="submit" id="btn1" class="btn-primary" value="編輯完成">
			<input type="hidden" name="action" value="insert"> 
			<input type="hidden" name="requestURL" value="/back_end/Announce/addAnnounce.jsp">
		</div>
	</form>



</body>
		
      
              
				
				
</body>
	<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
	<script src="https://cdn.ckeditor.com/4.9.0/standard/ckeditor.js"></script>

<script>
	
</script>
</html>