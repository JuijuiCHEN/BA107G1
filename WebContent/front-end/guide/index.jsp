<%@page import="java.util.List"%>
<%@page import="com.guide.model.GuideIndexVO"%>
<%@page import="com.guide.model.GuideService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%
	GuideService aGuideService = new GuideService();
	List<String> indexTemplate = aGuideService.getGuideIndexVO(request.getContextPath());
%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="Big5">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport"
		content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>Title Page</title>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<link
		href="<%=request.getContextPath()%>/front-end/guide/guideCss/indexStyle.css"
		media="all" rel="stylesheet" type="text/css">
	<link
		href="<%=request.getContextPath()%>/front-end/guide/guideCss/indexStyle2.css"
		media="all" rel="stylesheet" type="text/css">
	<link
		href="<%=request.getContextPath()%>/front-end/guide/guideCss/indexStyle3.css"
		media="screen" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
				<div
					style="display: inline-block; vertical-align: top; width: 80%; text-align: right; margin-left: 39px;">
					<span>
						<button type="button" class="btn btn-lg" id="add" onclick="location.href='addGuide.jsp'">新增文章</button>
					</span>
				</div>
			</div>
			<div class="guidebook-index-page__description">
				<span>由Airbnb房東為您精選每座城市的最佳去處。從咖啡館、公園，到鮮為人知的隱秘景點，應有盡有，現在就來探索吧。</span>
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
<!-- 						TODO -->
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