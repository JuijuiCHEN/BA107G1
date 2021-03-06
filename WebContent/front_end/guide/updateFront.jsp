<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.guide.model.*"%>

<%GuideVO guideVO = (GuideVO) request.getAttribute("guideVO");%>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="utf-8">
<style type="text/css">
.pac-container {
	background-color: #fff;
	position: absolute !important;
	z-index: 1000;
	border-radius: 2px;
	border-top: 1px solid #d9d9d9;
	font-family: Arial, sans-serif;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	overflow: hidden
}

.pac-logo:after {
	content: "";
	padding: 1px 1px 1px 0;
	height: 16px;
	text-align: right;
	display: block;
	background-image:
		url(https://maps.gstatic.com/mapfiles/api-3/images/powered-by-google-on-white3.png);
	background-position: right;
	background-repeat: no-repeat;
	background-size: 120px 14px
}

.hdpi.pac-logo:after {
	background-image:
		url(https://maps.gstatic.com/mapfiles/api-3/images/powered-by-google-on-white3_hdpi.png)
}

.pac-item {
	cursor: default;
	padding: 0 4px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	line-height: 30px;
	text-align: left;
	border-top: 1px solid #e6e6e6;
	font-size: 11px;
	color: #999
}

.pac-item:hover {
	background-color: #fafafa
}

.pac-item-selected, .pac-item-selected:hover {
	background-color: #ebf2fe
}

.pac-matched {
	font-weight: 700
}

.pac-item-query {
	font-size: 13px;
	padding-right: 3px;
	color: #000
}

.pac-icon {
	width: 15px;
	height: 20px;
	margin-right: 7px;
	margin-top: 6px;
	display: inline-block;
	vertical-align: top;
	background-image:
		url(https://maps.gstatic.com/mapfiles/api-3/images/autocomplete-icons.png);
	background-size: 34px
}

.hdpi .pac-icon {
	background-image:
		url(https://maps.gstatic.com/mapfiles/api-3/images/autocomplete-icons_hdpi.png)
}

.pac-icon-search {
	background-position: -1px -1px
}

.pac-item-selected .pac-icon-search {
	background-position: -18px -1px
}

.pac-icon-marker {
	background-position: -1px -161px
}

.pac-item-selected .pac-icon-marker {
	background-position: -18px -161px
}

.pac-placeholder {
	color: gray
}
</style>
<style type="text/css">
.pac-container {
	background-color: #fff;
	position: absolute !important;
	z-index: 1000;
	border-radius: 2px;
	border-top: 1px solid #d9d9d9;
	font-family: Arial, sans-serif;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	overflow: hidden
}

.pac-logo:after {
	content: "";
	padding: 1px 1px 1px 0;
	height: 16px;
	text-align: right;
	display: block;
	background-image:
		url(https://maps.gstatic.com/mapfiles/api-3/images/powered-by-google-on-white3.png);
	background-position: right;
	background-repeat: no-repeat;
	background-size: 120px 14px
}

.hdpi.pac-logo:after {
	background-image:
		url(https://maps.gstatic.com/mapfiles/api-3/images/powered-by-google-on-white3_hdpi.png)
}

.pac-item {
	cursor: default;
	padding: 0 4px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	line-height: 30px;
	text-align: left;
	border-top: 1px solid #e6e6e6;
	font-size: 11px;
	color: #999
}

.pac-item:hover {
	background-color: #fafafa
}

.pac-item-selected, .pac-item-selected:hover {
	background-color: #ebf2fe
}

.pac-matched {
	font-weight: 700
}

.pac-item-query {
	font-size: 13px;
	padding-right: 3px;
	color: #000
}

.pac-item-selected .pac-icon-search {
	background-position: -18px -1px
}

.pac-icon-marker {
	background-position: -1px -161px
}

.pac-item-selected .pac-icon-marker {
	background-position: -18px -161px
}

.pac-placeholder {
	color: gray
}
</style>
<style>
        body {
            background-image: url(http://p1.pichost.me/i/11/1344899.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            font-family: Arial, sans-serif;
            font-weight: bold;
            font-size: 14px;
        }

        .wrap {
            top: 50%;
            margin-top: -20%;
            text-align: center;
        }

        .wrap a {
            -webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
            -moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
            -ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
            -o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
            transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
            display: block;
            max-width: 180px;
            text-decoration: none;
            border-radius: 4px;
            padding: 20px 30px;
        }

        a.button {
            color: rgba(30, 22, 54, 0.6);
            box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
        }

        a.button:hover {
            color: rgba(255, 255, 255, 0.85);
            box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
        }

        a.button2 {
            color: rgba(30, 22, 54, 0.6);
            box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
        }

        a.button2:hover {
            color: rgba(255, 255, 255, 0.85);
            box-shadow: rgba(30, 22, 54, 0.7) 0 80px 0px 2px inset;
        }
    </style>

<link
	href="<%=request.getContextPath()%>/front_end/guide/guideCss/update1.css"
	media="all" rel="stylesheet" type="text/css">
<link
	href="<%=request.getContextPath()%>/front_end/guide/guideCss/style2.css"
	media="all" rel="stylesheet" type="text/css">

<link
	href="<%=request.getContextPath()%>/front_end/guide/guideCss/addGuide2.css"
	media="screen" rel="stylesheet" type="text/css">
<title>Anti-G旅遊指南</title>

 <jsp:include page="/front_end/basic/nav.jsp" flush="true"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
</head>

<body>
	<main id="site-content" role="main" tabindex="-1">
	<meta name="pinterest" content="nopin">
	<div id="lys-redesign-div">	
		<div data-hypernova-key="list_your_spacebundlejs"
			data-hypernova-id="e230101f-68ea-43dc-8299-9d3fd480ce6e">
			<div data-reactroot="">
				<div>
					<div class="list-your-space__progress">
						<div class="list-your-space__content">
							<div class="main-panel main-panel-progress space-sm-8" style="padding:30%;padding-top:30px;padding-bottom:0px;">
								<div class="_1mbllh6j">
									<h2 style="margin-bottom: 10px">編輯文章</h2>
								</div>
									<div>
										<div class="row">
											<form id="guideedit" METHOD="post" action="<%=request.getContextPath()%>/guide.do" >
											<div class="space-top-2 col-sm-12 col-md-12">
												<div style="margin-top: 10px;">
													<div class="_1a3dnh4">
														<div class="_9hxttoo">
															<div style="margin-bottom: 8px;">
																	<div class="_m2kx622">
																		<h3>標題</h3>
																	</div>
															</div>
															<div dir="ltr">
																<input name="guideTitle" type="text" class="form-control" value="<%=guideVO.getGuideTitle()%>" autocomplete="off">
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="space-top-2 col-sm-12">
												<div style="margin-top: 10px;">
													<div class="_1a3dnh4">
														<div class="_9hxttoo">
															<div style="margin-bottom: 8px;">
																<div class="_m2kx622">
																	<h3>內容</h3>
																</div>
															</div>
															<div dir="ltr">
																<div class="_buy62rq">
																	<div class="_178faes">
																	
																		<textarea name="guideContent" class="form-control" rows="10" autocomplete="off"><%=guideVO.getGuideContent()%></textarea>
																		<input type="hidden" name="guideId" value="<%=guideVO.getGuideId()%>">
																		<input type="hidden" name="action" value="updateFront">
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											</form>
										</div>
										<div style="margin-top: 20%; margin-right: 25%;">
                                           <div class="wrap">
												<a class="button" id="guideCommit" aria-busy="false">送出編輯</a>
                                           </div>
                                        </div>
									</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>
</body>
</html>

<script>
	document.getElementById("guideCommit").onclick = function() {
		 document.getElementById("guideedit").submit()
	}
</script>

