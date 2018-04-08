<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.guide.model.*"%>
<%@ page import="com.guideImg.model.GuideImgVO"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% GuideVO guideVO = (GuideVO) request.getAttribute("guideVO");%>
<% List<GuideImgVO> imgList = guideVO.getGuideImgList();%>



<!DOCTYPE html>
<html>

<head>
<title>Anti-G旅遊指南</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link
	href="<%=request.getContextPath()%>/front-end/guide/guideCss/style.css"
	media="all" rel="stylesheet" type="text/css">
<link
	href="<%=request.getContextPath()%>/front-end/guide/guideCss/style4.css"
	media="screen" rel="stylesheet" type="text/css">

<script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>


<style data-aphrodite="data-aphrodite">
._ljkqu4 {
	padding-top: 24px !important;
	padding-bottom: 72px !important;
}

@media ( max-width : 743px) {
	._ljkqu4 {
		position: absolute !important;
		top: 0px !important;
		right: 0px !important;
		z-index: 1 !important;
		padding: 24px !important;
		display: inline-block !important;
	}
}

._12s6sbk {
	display: inline-block !important;
	float: right !important;
}

@media ( max-width : 743px) {
	._12s6sbk {
		position: relative !important;
		top: 1px !important;
		padding-left: 16px !important;
	}
}

._10rdc6v {
	height: 463px !important;
}

._nedp51 {
	text-align: left !important;
	float: left !important;
	height: 46px !important;
	display: inline-block !important;
}

._1xligvk {
	width: 100% !important;
	position: relative !important;
}

._ysxyvab {
	position: absolute !important;
	width: 100% !important;
	top: 0px !important;
}

._39300i {
	width: 85% !important;
	margin-left: auto !important;
}

@media ( min-width : 744px) {
	._39300i {
		width: 100% !important;
	}
}

._1sc94wj0 {
	border-bottom: 1px solid #DBDBDB !important;
	padding-top: 24px !important;
	padding-bottom: 0px !important;
}

._1kkopm5 {
	position: relative !important;
	height: 100% !important;
	width: 100% !important;
}

._9kqfyx {
	display: inline-block !important;
}

@media ( min-width : 744px) {
	._9kqfyx {
		padding-left: 18px !important;
	}
	._9kqfyx:first-child {
		padding-left: 0px !important;
	}
}

._1rp5252 {
	cursor: pointer !important;
	background-color: transparent !important;
	color: buttontext !important;
	border: 0px !important;
	display: block !important;
}

._1rp5252:active {
	outline: 0px !important;
}

._1rp5252:disabled {
	opacity: 0.5 !important;
	cursor: default !important;
	color: graytext !important;
}

._1f9rmq80 {
	border-bottom: 1px solid #DBDBDB !important;
	padding-top: 24px !important;
	padding-bottom: 24px !important;
}

}
._6tl8mk {
	padding-top: 0px !important;
	padding-bottom: 0px !important;
	cursor: pointer !important;
}

._1m8bb6v {
	position: absolute !important;
	display: block !important;
	border: 0px !important;
	margin: -1px !important;
	padding: 0px !important;
	height: 1px !important;
	width: 1px !important;
	clip: rect(0, 0, 0, 0) !important;
	overflow: hidden !important;
}

._qtix31 {
	display: table !important;
}

._ni9axhe {
	display: table-cell !important;
	vertical-align: middle !important;
}

._m2kx622 {
	font-weight: normal !important;
	margin: 0px !important;
	word-wrap: break-word !important;
	font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto,
		Helvetica Neue, sans-serif !important;
	font-size: 15px !important;
	line-height: 18px !important;
	letter-spacing: 0.2px !important;
	padding-top: 0px !important;
	padding-bottom: 0px !important;
	color: #484848 !important;
}

@
keyframes keyframe_1vunhnd {
	from {opacity: 0.1;
}

to {
	opacity: 0.3;
}

}
._13nd2f7d {
	font-weight: 700 !important;
	margin: 0px !important;
	word-wrap: break-word !important;
	font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto,
		Helvetica Neue, sans-serif !important;
	font-size: 36px !important;
	line-height: 40px !important;
	letter-spacing: -0.6px !important;
	padding-top: 6px !important;
	padding-bottom: 6px !important;
	color: #484848 !important;
}

@media ( max-width : 743px) {
	._13nd2f7d {
		font-size: 32px !important;
		line-height: 40px !important;
		letter-spacing: -0.6px !important;
	}
}

._rotqmn2 {
	margin: 0px !important;
	word-wrap: break-word !important;
	font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto,
		Helvetica Neue, sans-serif !important;
	font-size: 19px !important;
	line-height: 24px !important;
	letter-spacing: undefined !important;
	padding-top: 0px !important;
	padding-bottom: 0px !important;
	color: #484848 !important;
	font-weight: 300 !important;
}

._1ouw2w0 {
	padding-bottom: 16px !important;
}

._1i6x6g5 {
	width: 32px !important;
	height: 32px !important;
	border-radius: 32px !important;
	margin-right: 8px !important;
}

._mr7uf7w {
	position: relative !important;
	min-height: 1px !important;
	padding-left: 12px !important;
	padding-right: 12px !important;
	float: left !important;
	width: 28.5% !important;
}

._8alzzaw {
	position: relative !important;
	min-height: 1px !important;
	padding-left: 12px !important;
	padding-right: 12px !important;
	float: left !important;
	width: 71.5% !important;
}

._33hj8bi {
	font-weight: normal !important;
	margin: 0px !important;
	word-wrap: break-word !important;
	font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto,
		Helvetica Neue, sans-serif !important;
	font-size: 19px !important;
	line-height: 24px !important;
	letter-spacing: undefined !important;
	padding-top: 0px !important;
	padding-bottom: 0px !important;
	color: #484848 !important;
}

._b82bweu {
	color: #008489 !important;
	font: inherit !important;
	font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto,
		Helvetica Neue, sans-serif !important;
	text-decoration: none !important;
	-webkit-appearance: none !important;
	-moz-appearance: none !important;
	appearance: none !important;
	background: transparent !important;
	border: 0px !important;
	cursor: pointer !important;
	margin: 0px !important;
	padding: 0px !important;
	-webkit-user-select: auto !important;
	-moz-user-select: auto !important;
	-ms-user-select: auto !important;
	user-select: auto !important;
	text-align: left !important;
}

._b82bweu:hover {
	text-decoration: underline !important;
}

._b82bweu:focus {
	text-decoration: underline !important;
}

._b82bweu:active {
	color: #006C70 !important;
	outline: 0px !important;
}

._tvcjyp9 {
	color: #008489 !important;
	font: inherit !important;
	font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto,
		Helvetica Neue, sans-serif !important;
	text-decoration: none !important;
}

._tvcjyp9:hover {
	text-decoration: underline !important;
}

._tvcjyp9:focus {
	text-decoration: underline !important;
}

._tvcjyp9:active {
	color: #006C70 !important;
}
</style>
</head>

<style>
       #map {
        height: 350px;
        width: 100%;
       }
    </style>

<body>
		<div class="_ysxyvab" style="top: 80px;">
			<div class="page-container-responsive">
				<div class="col-lg-offset-7 col-lg-5 col-md-offset-6 col-md-6">
					<div class="_39300i" style="padding-top: 0">
						<div style="margin-left: 40px">
							<div class="_1sc94wj0">
								<div class="_10rdc6v carousel slide" id="myCarousel"
									data-ride="carousel">
									<div class="_1kkopm5">
									
										<!-- Indicators -->
										<ol class="carousel-indicators">
										<%for (int i = 0; i < imgList.size(); i++) {
											if(i==0){%>
												<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
											<% }else{%>
												<li data-target="#myCarousel" data-slide-to="<%=i %>"></li>
											<%} %>
										<%}%>
										</ol>

										<!-- Wrapper for slides -->
										<div class="carousel-inner">
												<%for (int i = 0; i < imgList.size(); i++) {
												if(i==0){%> 
												<div class="item active">
												<%}else{%>
												<div class="item">
												<%}%>
													<img src="<%=request.getContextPath()%>/guideImg.do?action=getOne_For_Display&guideImgId=<%=imgList.get(i).getGuideImgId()%>" alt="Los Angeles" class="_10rdc6v">
												</div>
												<%}%>
										</div>

										<!-- Left and right controls -->
										<a class="left carousel-control" style="background-image: none;" href="#myCarousel" data-slide="prev"> 
										<span class="glyphicon glyphicon-chevron-left"></span> 
										<span class="sr-only">Previous</span>
										</a> 
										<a class="right carousel-control" style="background-image: none;" href="#myCarousel" data-slide="next"> 
										<span class="glyphicon glyphicon-chevron-right"></span> 
										<span class="sr-only">Next</span>
										</a>
									</div>
								</div>
							</div>
							<div class="_ljkqu4">
								<div class="_nedp51">
									<div class="_9kqfyx">
										<button type="button" class="_1rp5252" style="padding: 0; margin: 0" aria-busy="false">
											<p>我要留言  <span class="fas fa-comment-alt fa-sm" ></span></p>
										</button>
									</div>
									
									
									<div class="_9kqfyx">
										<button type="button" class="_1rp5252" style="padding: 0; margin: 0" aria-busy="false">
											<p>我喜歡  <span class="far fa-heart fa-sm" ></span></p>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	

	<div id="main-hero-content" class="page-container-responsive">
		<div class="col-lg-7 col-md-6 col-sm-12">
			<div class="_11q3g7k">
				<div style="margin-bottom: 16px">
					<div class="_13nd2f7d">${guideVO.guideTitle}</div>

					<div class="_rotqmn2">
						<span><fmt:formatDate value="<%=guideVO.getGuideCreateTime()%>" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</div>
				</div>
			
				<div class="_1f9rmq80">
					<div class="row">
						<div class="hide-lg">
							<div class="col-sm-12"></div>
						</div>
						<div class="show-lg">
							<div class="_8alzzaw">
								<div>
									<div class="_1ouw2w0">
										<div class="_rotqmn2">${guideVO.guideContent}</div>
									</div>
									<img alt="" src="https://a0.muscache.com/im/pictures/710d0c96-2bc0-4037-870a-623d7e362f3f.jpg?aki_policy=profile_small" class="_1i6x6g5">
									<span>由<span>
									<a target="_blank" rel="noopener noreferrer" href="/users/show/9249211">
										<span>${guideVO.memId}</span>
									</a>
									</span>撰寫</span>
								</div>
							</div>
						</div>
					</div>
				</div>
							
					
						<div class="_1f9rmq80">
							<div class="_33hj8bi">
								<button type="button" class="_b82bweu" data-toggle="modal" data-target="#myModal">
									<span>查看來自${guideVO.guideCommSize}位會員的留言</span>
								</button>
							
					
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
     
  </div>

  </div>
</div>
</div>

						
						
				
				</div>
				<div class="_1f9rmq80">
					<div>
						<div class="row">
							<div class="hide-lg">
								<div class="col-sm-12">
									<div style="margin-bottom: 16px">
										<div class="_33hj8bi">
											<span>地址</span>
										</div>
									</div>
									<div>
										<div class="_rotqmn2">${guideVO.guideMap}</div>
									</div>
								</div>
							</div>
							<div class="show-lg">
								<div class="_mr7uf7w">
									<div class="_33hj8bi">
										<span>地址</span>
									</div>
								</div>
								<div class="_8alzzaw">
									<div class="_rotqmn2">${guideVO.guideMap}</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div style="margin-bottom: 32px"></div>
				
				<div class="_1pq2f04">
					<div id="map"></div>
				</div>
			</div>
		</div>
    
</body>
</html>
<script>
      function initMap() {
        var uluru = <%=guideVO.getGuideLatLng()%>;
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 16,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
    </script>
    
    
    <script async defer src="https://maps.googleapis.com/maps/api/js?region=cn&language=zh-TW&key=AIzaSyBuS1-gsXN4HrHQaqjuaFaMxIqcayPPaoY&callback=initMap">
    </script>
	
    
