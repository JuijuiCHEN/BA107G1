<%@page import="java.util.List"%>
<%@page import="com.guide.model.GuideIndexVO"%>
<%@page import="com.guide.model.GuideService"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="Big5"%>
<%
	GuideService aGuideService = new GuideService();
	List<String> indexTemplate = aGuideService.getGuideIndexVO(request.getContextPath());
%>

<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport"
		content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>Anti-G旅遊指南</title>
<!-- 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css"> -->
	<link href="<%=request.getContextPath()%>/front-end/guide/guideCss/style.css" media="all" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/front-end/guide/guideCss/style3.css" media="screen" rel="stylesheet" type="text/css">
<!-- 	<script src="https://code.jquery.com/jquery.js"></script> -->
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<style>
.wrap {
	top: 50%;
	margin-top: -20%;
	text-align: center;
}

#btncss a {
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	
	max-width: 180px;
	text-decoration: none;
	border-radius: 4px;
	padding: 20px 30px;
}

#btncss a.button {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}

#btncss a.button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
}

#btncss a.button2 {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}

#btncss a.button2:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 80px 0px 2px inset;
}
</style>
</head>

<body>
	<div class="guidebook-index-page__body">
		<div class="col-md-12">
			<div>
				<div style="display: inline-block">
					<h1 class="guidebook-index-page__title">
						<span>旅遊指南</span>
					</h1>
				</div>
				<div style="display: inline-block; vertical-align: top; text-align: right; float:right;">
					<span>
						<div style="margin-top: 60%; margin-bottom: 28px;">
						<div class="wrap">
							<div id="btncss">
							<a class="button" id="add" onclick="location.href='addGuideTitle.jsp'" aria-busy="false" style="font-size:15px">新增文章</a>
							</div>
						</div>
						</div>
					</span>
				</div>
				
			</div>
			<div class="guidebook-index-page__description">
				<span>由Anti會員為您精選每座城市的最佳去處。從咖啡館、公園，到鮮為人知的隱秘景點，應有盡有，現在就來探索吧。</span>
			</div>
			<div class="guidebook-index-page__hr"></div>
		</div>
		<div class="guidebook-index-page__content">
			<div>
				<h4 class="col-md-12 guidebook-index-page__content-title">
					<span>台灣</span>
				</h4>
				<div class="guidebook-index-page__cards row row-condensed-guidebook">
					<div class="guidebook-index-page__cards">
						<%for (int i = 0 ; i <indexTemplate.size();i++){%>
						<%=indexTemplate.get(i) %>
						<% }%>
					</div>
				</div>
				<div class="col-md-12">
					<div class="guidebook-index-page__hr"></div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>