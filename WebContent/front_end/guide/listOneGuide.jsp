<%@page import="oracle.net.aso.i"%>
<%@page import="com.mem.model.MemService"%>
<%@page import="com.mem.model.MemVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.guide.model.*"%>
<%@ page import="com.guideImg.model.GuideImgVO"%>
<%@page import="com.guideComm.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%GuideVO guideVO = (GuideVO) request.getAttribute("guideVO");%>
<%List<GuideImgVO> imgList = guideVO.getGuideImgList();%>
<%
	MemService memSvc = new MemService();
	MemVO memVO = memSvc.getOneMem(guideVO.getMemId());
%>
<%String memId = (String)session.getAttribute("memId"); %>

<!DOCTYPE html>
<html>

<head>
<title>Anti-G旅遊指南</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
<style type="text/css">
.item img {
  width:100%
}
._ljkqu4 {
	padding-top: 24px !important;
	padding-bottom: 72px !important;
    padding-left: 15px !important;
}

@media ( max-width : 743px) {
	._ljkqu4 {
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
	width: 100% !important;
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
/* 	display: block !important; */
}

._1rp5252:hover{
	color: #2076b7 !important;
	text-decoration: underline !important;
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
	color: #2076b7 !important;
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

._1mkvpvr {
	position: fixed !important;
	z-index: 2000 !important;
	top: 0px !important;
	right: 0px !important;
	bottom: 0px !important;
	left: 0px !important;
	overflow-y: auto !important;
	webkit-transform: translate3d(0, 0, 0) !important;
	background-color: rgba(255, 255, 255, 0.8) !important;
	display: -webkit-box !important;
	display: -moz-box !important;
	display: -ms-flexbox !important;
	display: -webkit-flex !important;
	display: flex !important;
}

._1mkvpvrA {
	position: fixed !important;
	overflow-y: auto !important;
	webkit-transform: translate3d(0, 0, 0) !important;
	background-color: rgba(255, 255, 255, 0) !important;
	display: -webkit-box !important;
	display: -moz-box !important;
	display: -ms-flexbox !important;
	display: -webkit-flex !important;
	display: flex !important;
}

@media ( max-width : 743px) {
	._1mkvpvr {
		background: none !important;
		overflow-y: hidden !important;
	}
}

._1k9frrx {
	display: -webkit- box !important;
	display: -moz- box !important;
	display: -ms- flexbox !important;
	display: -webkit- flex !important;
	display: flex !important;
	margin: auto !important;
	padding: 64 px !important;
	max-width: 760px !important;
	width: 100% !important;
	max-width: 760px !important;
}

._1k9frrx: focus {
	outline: none !important;
}

@media ( max-width : 1127 px) {
	._1k9frrx {
		max-width: 696px !important;
	}
}

@media ( max - width: 743 px) {
	._1k9frrx {
		padding: 0 px !important;
		margin: 0 px !important;
		display: block !important;
		max
		-
		width
		:
		none
		!important;
	}
}

._vyj67w {background - color:#ffffff!important;box - shadow:01px10px0rgba
	(0, 0, 0, 0.2)!important; - webkit - flex:1!important; - ms - flex:1!important;
	flex: 1 !important;
	width: 100% !important;
	position: relative !important;
}

._vyj67w: focus {
	outline: none !important;
}

@media ( max - width: 743 px) {
	._vyj67w {
		position: fixed !important;
		left: 0 px !important;
		right: 0 px !important;
		top: 0 px !important;
		bottom: 0 px !important;
		overflow
		-
		y
		:
		auto
		!important;
	}
}

._1dm128x {
	background-color: #ffffff !important;
	padding: 64 px !important;
	-
	moz
	-
	box
	-
	sizing
	:
	border
	-
	
	
	
	
	
	
	box
	!important;
	box
	-
	sizing
	:
	border
	-box
	!important;
}

@media ( max - width: 1127 px) {
	._1dm128x {
		padding: 32 px !important;
	}
}

@media ( max - width: 743 px) {
	._1dm128x {max - width:569px!important;
		margin: 0 auto !important;
	}
}

._p03egf {margin - bottom:16px!important;
	
}

._tpbrp {
	color: inherit !important;
	font-size: 1em !important;
	font-weight: inherit !important;
	line-height: inherit !important;
	margin: 0px !important;
	padding: 0px !important;
}

#comm1 {
	font-size: 28px;
	font-weight: 700;
}
</style>
<style>
#map {
	height: 400px;
	width: 100%;
}
</style>
<style>
p a {
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: block;
	/* margin: 20px auto; */
	max-width: 130px;
	text-decoration: none;
	border-radius: 4px;
	padding: 15px 20px;
}

p a.button {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}

p a.button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
}

p a.button2 {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}

p a.button2:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 80px 0px 2px inset;
}

.commcon {
	padding-top: 24px;
	padding-bottom: 24px;
}
</style>
</head>
<body style="font-weight: normal">
 <jsp:include page="/front_end/basic/nav.jsp" flush="true"/>
 <link href="<%=request.getContextPath()%>/front_end/guide/guideCss/style.css" media="all" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/front_end/guide/guideCss/style4.css" media="screen" rel="stylesheet" type="text/css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
	<div style="padding-top: 120px">
		<div class="col-lg-1"></div>
		<div id="main-hero-content" class="col-lg-5 col-sm-12 page-container-responsive">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="_11q3g7k">
					<div style="margin-bottom: 16px">
					<div class="_rotqmn2">
						<a href="<%=request.getContextPath()%>/guide.do?action=getOne_Area&guideArea=<%=guideVO.getGuideArea()%>">
							<span class="fas fa-arrow-left fa-lg"></span>返回<%=guideVO.getGuideArea()%>文章列表
						</a>
					</div>
					<br>
						<div class="_13nd2f7d">${guideVO.guideTitle}</div>
	
						<div class="_rotqmn2">
							<span>
							<fmt:formatDate
									value="<%=guideVO.getGuideCreateTime()%>"
									pattern="yyyy-MM-dd HH:mm:ss" />
									</span>
						</div>
					</div>
	
					<div class="_1f9rmq80">
						<div class="row">
							<div class="hide-lg">
								<div class="col-sm-12"></div>
							</div>
								<div class="_8alzzaw">
									<div>
										<div class="_1ouw2w0">
											<div class="_rotqmn2">${guideVO.guideContent}</div>
										</div>
										<img alt=""
											src="https://a0.muscache.com/im/pictures/710d0c96-2bc0-4037-870a-623d7e362f3f.jpg?aki_policy=profile_small"
											class="_1i6x6g5"> 
											<span>由 
											<span>【<%=memVO.getMem_name()%>】</span>
											撰寫
											</span>
									</div>
								</div>
						</div>
					</div>
	
					<div class="_1f9rmq80">
						<div class="_33hj8bi">
							<button type="button" class="_b82bweu" data-toggle="modal"
								data-target="#myModal" aria-disabled="false" aria-busy="false">
								<span>查看來自${guideVO.guideCommSize}位會員的留言</span>
							</button>
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
				<BR>
				<BR>
			</div>
		</div>
		<div class="col-lg-5 col-sm-12">
		<div class="col-lg-12 col-sm-12 page-container-responsive">
				<div class="col-lg-12 _39300i" style="padding:0px">
					<div class="" >
						<div class="col-sm-12">
							<div class=" carousel slide" id="myCarousel"
								data-ride="carousel">
								<div class="_1kkopm5">

									<!-- Indicators -->
									<ol class="carousel-indicators">
										<%
											for (int i = 0; i < imgList.size(); i++) {
												if (i == 0) {
										%>
										<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
										<%
											} else {
										%>
										<li data-target="#myCarousel" data-slide-to="<%=i%>"></li>
										<%
											}
										%>
										<%
											}
										%>
									</ol>

									<!-- Wrapper for slides -->
									<div class="carousel-inner">
										<%
											for (int i = 0; i < imgList.size(); i++) {
												if (i == 0) {
										%>
										<div class="item active">
											<%
												} else {
											%>
											<div class="item">
												<%
													}
												%>
												<img
													src="<%=request.getContextPath()%>/guideImg.do?action=getOne_For_Display&guideImgId=<%=imgList.get(i).getGuideImgId()%>"
													alt="Los Angeles" class="_10rdc6v">
											</div>
											<%
												}
											%>
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
							<%if(memId!=null){ %>
							<div class="col-sm-12 _ljkqu4">
								<div class="_nedp51">
									<div class="_9kqfyx">
										<button type="button" class="_1rp5252" data-toggle="modal"
											data-target="#myModal2" style="padding: 0; margin: 0"
											aria-busy="false">
											<p>
												 <span class="far fa-comment-alt fa-lg"></span>我要留言
											</p>
										</button>
									</div>


									<div class="_9kqfyx">
									<form METHOD="post" ACTION="<%=request.getContextPath()%>/guide/guide.do" style="margin-bottom: 0px;">
										<button type="submit" class="_1rp5252"
											style="padding: 0; margin: 0" aria-busy="false">
											<p>
												 <span class="far fa-thumbs-up fa-lg"></span>案讚
												  <input type="hidden" name="guideId" value="${guideVO.guideId}">
											</p>
										</button>
									</form>
									</div>

									<div class="_9kqfyx">
										<form ACTION="<%=request.getContextPath()%>/front_end/guideRep/addGuideRep.jsp" style="margin-bottom: 0px;">
											<button type="submit" class="_1rp5252" style="padding: 0; margin: 0" aria-busy="false">
												<p>
													<span class="far fa-frown fa-lg"></span>檢舉文章
													<input type="hidden" name="guideId" value="${guideVO.guideId}">
													<input type="hidden" name="memId" value=<%=memId%>>
												</p>
											</button>
										</form>
									</div>
									
									
									<%if(guideVO.getMemId().equals(memId)){ %>
									<div class="_9kqfyx">
										<form METHOD="post" ACTION="<%=request.getContextPath()%>/guide.do" style="margin-bottom: 0px;">
											<button type="submit" class="_1rp5252"
												style="padding: 0; margin: 0" aria-busy="false">
												<p>
													 <span class="fas fa-edit fa-lg"></span>編輯文章
													 <input type="hidden" name="guideId" value="${guideVO.guideId}">
													 <input type="hidden" name="memId" value="${guideVO.memId}">
													 <input type="hidden" name="action" value="fromListOne">
												</p>
											</button>
										</form>
									</div>
									<%}%>
								</div>
							</div>
						<%}%>	
						</div>
					</div>
				</div>
		</div>
	</div>
	</div>
	

	<!-- 查看留言跳窗開始 -->
	<div class="modal fade" id="myModal" role="dialog">
		<div>
			<div dir="ltr">
				<div class="_1mkvpvr">
					<div tabindex="-1" class="_1k9frrx">
						<div role="dialog" aria-labelledby="dls-modal__Tips from hosts"
							tabindex="-1" class="_vyj67w" aria-hidden="true">
							<div>
								<div role="document">
									<div class="_1dm128x"
										style="padding: 64px; background-color: #ffffff;">
										<div class="_p03egf">

											<button type="button" class="close" data-dismiss="modal"
												style="font-size: 30px; margin-right: 10px">&times;</button>
										</div>

										<section>
											<div>
												<div id="comm1">
													<span>留言</span>
												</div>
												<div>
													<div>
														<%
															GuideCommService commSvc = new GuideCommService();
															
															
															List<GuideCommVO> commList = commSvc.getAllFromGuideId(guideVO.getGuideId());
															
															for (int i = 0; i < commList.size(); i++) {
															MemVO memCommVO = memSvc.getOneMem(commList.get(i).getMemId());
														%>
														<div class="_1f9rmq80">
															<div>

																<div class="_1ouw2w0">
																	<div class="_rotqmn2"><%=commList.get(i).getCommContent()%></div>
																</div>
																<a href="/users/show/9129703" target="_blank"
																	rel="noopener noreferrer" class="_tvcjyp9"
																	aria-disabled="false" aria-busy="false"> <img
																	alt=""
																	src="https://a0.muscache.com/im/pictures/e44f92af-37d9-43ae-b4b7-366f590d8d1e.jpg?aki_policy=profile_x_medium"
																	class="_1i6x6g5"> <a target="_blank"
																	href="/users/show/9129703"> <span>
																	
																	【<%=memCommVO.getMem_name()%>】
																	</span>
																</a>

																</a>
																	<button type="button" class="_1rp5252"
																		style="margin-bottom: ); margin-left: 400px;"
																		aria-busy="false">
																		<p>
																		 <span class="far fa-frown fa-lg"></span>檢舉留言
																		</p>
																	</button>
															</div>
														</div>
														<%
															}
														%>
													</div>
												</div>
											</div>
										</section>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<!-- 撰寫留言跳窗開始 -->
	<div class="modal fade" id="myModal2" role="dialog">
		<div>
			<div dir="ltr">
				<div class="_1mkvpvr">
					<div tabindex="-1" class="_1k9frrx">
						<div role="dialog" aria-labelledby="dls-modal__Tips from hosts"
							tabindex="-1" class="_vyj67w" aria-hidden="true">
							<div>
								<div role="document">
									<div class="_1dm128x"
										style="padding: 64px; background-color: #ffffff;">
										<div class="_p03egf">

											<button type="button" class="close" data-dismiss="modal"
												style="font-size: 30px; margin-right: 10px">&times;</button>
										</div>

										<section>
											<div>
												<div id="comm1">
													<span>撰寫留言</span>
												</div>
												<div>
													<form METHOD="post" action="<%=request.getContextPath()%>/guideComm/guideComm.do" id="sub">
														<div class="commcon">
															<div>
																<textarea name="commContent" class="form-control" placeholder="輸入留言內容" autocomplete="off" rows="5"></textarea>
																<input type="hidden" name="guideId"
																	value="${guideVO.guideId}"> <input
																	type="hidden" name="memId" value="<%=memId %>"> <input
																	type="hidden" name="action" value="insert">
															</div>
														</div>
													</form>
												</div>
												<div style="margin-bottom: 28px; margin-right: 25%">
													<div class="_1pq2f04" style="text-align: center">
														<p>
															<a class="button" id="subcomm" aria-busy="false">送出留言</a>
														</p>
													</div>
												</div>
											</div>
										</section>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>






</body>
</html>
<script>
	function initMap() {
		var uluru =
<%=guideVO.getGuideLatLng()%>
	;
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 16,
			center : uluru
		});
		var marker = new google.maps.Marker({
			position : uluru,
			map : map
		});
	}
</script>


<script async defer
	src="https://maps.googleapis.com/maps/api/js?region=cn&language=zh-TW&key=AIzaSyBuS1-gsXN4HrHQaqjuaFaMxIqcayPPaoY&callback=initMap">
	
</script>
<script>
	document.getElementById("subcomm").onclick = function() {
		document.getElementById("sub").submit();
	}
</script>

