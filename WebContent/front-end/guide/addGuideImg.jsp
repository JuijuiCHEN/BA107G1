<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<% request.setCharacterEncoding("UTF-8");%>
<% String guideTitle = new String(request.getParameter("guideTitle").getBytes("ISO-8859-1"), "UTF-8");%>
<% String guideContent = new String(request.getParameter("guideContent").getBytes("ISO-8859-1"), "UTF-8");%>
<% String guideArea = new String(request.getParameter("guideArea").getBytes("ISO-8859-1"), "UTF-8");%>
<% String guideMap = new String(request.getParameter("guideMap").getBytes("ISO-8859-1"), "UTF-8");%>
<!-- 因guideLatLng有許多符號, 必須透過URLEncoder.encode編碼成unicode的樣子, 之後才會前後端都看得懂符號 -->
<% String guideLatLng =URLEncoder.encode(new String(request.getParameter("guideLatLng").getBytes("ISO-8859-1"), "UTF-8"));%> 
<%@ page import="com.guide.model.*"%>
<%GuideVO guideVO = (GuideVO) request.getAttribute("guideVO");%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Anti-G旅遊指南</title>


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>



<link
	href="<%=request.getContextPath()%>/front-end/guide/guideCss/addGuide1.css"
	media="all" rel="stylesheet" type="text/css">
<link
	href="<%=request.getContextPath()%>/front-end/guide/guideCss/addGuide2.css"
	media="screen" rel="stylesheet" type="text/css">

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
	/* left: 50%; */
	margin-top: -30%;
	/* margin-left: 30%; */
	text-align: center;
}

a {
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: block;
	/* margin: 20px auto; */
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
.fb_hidden {
	position: absolute;
	top: -10000px;
	z-index: 10001
}

.fb_reposition {
	overflow: hidden;
	position: relative
}

.fb_invisible {
	display: none
}

.fb_reset {
	background: none;
	border: 0;
	border-spacing: 0;
	color: #000;
	cursor: auto;
	direction: ltr;
	font-family: "lucida grande", tahoma, verdana, arial, sans-serif;
	font-size: 12px;
	font-style: normal;
	font-variant: normal;
	font-weight: normal;
	letter-spacing: normal;
	line-height: 1;
	margin: 0;
	overflow: visible;
	padding: 0;
	text-align: left;
	text-decoration: none;
	text-indent: 0;
	text-shadow: none;
	text-transform: none;
	visibility: visible;
	white-space: normal;
	word-spacing: normal
}

.fb_reset>div {
	overflow: hidden
}

.fb_link img {
	border: none
}

@
keyframes fb_transform {from { opacity:0;
	transform: scale(.95)
}

to {
	opacity: 1;
	transform: scale(1)
}

}
.fb_animate {
	animation: fb_transform .3s forwards
}

.fb_dialog {
	background: rgba(82, 82, 82, .7);
	position: absolute;
	top: -10000px;
	z-index: 10001
}

.fb_reset .fb_dialog_legacy {
	overflow: visible
}

.fb_dialog_advanced {
	padding: 10px;
	border-radius: 8px
}

.fb_dialog_content {
	background: #fff;
	color: #333
}

.fb_dialog_close_icon {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png)
		no-repeat scroll 0 0 transparent;
	cursor: pointer;
	display: block;
	height: 15px;
	position: absolute;
	right: 18px;
	top: 17px;
	width: 15px
}

.fb_dialog_mobile .fb_dialog_close_icon {
	top: 5px;
	left: 5px;
	right: auto
}

.fb_dialog_padding {
	background-color: transparent;
	position: absolute;
	width: 1px;
	z-index: -1
}

.fb_dialog_close_icon:hover {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png)
		no-repeat scroll 0 -15px transparent
}

.fb_dialog_close_icon:active {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png)
		no-repeat scroll 0 -30px transparent
}

.fb_dialog_loader {
	background-color: #f6f7f9;
	border: 1px solid #606060;
	font-size: 25px;
	padding: 20px
}

.fb_dialog_top_left, .fb_dialog_top_right, .fb_dialog_bottom_left,
	.fb_dialog_bottom_right {
	height: 10px;
	width: 10px;
	overflow: hidden;
	position: absolute
}

.fb_dialog_top_left {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/ye/r/8YeTNIlTZjm.png)
		no-repeat 0 0;
	left: -10px;
	top: -10px
}

.fb_dialog_top_right {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/ye/r/8YeTNIlTZjm.png)
		no-repeat 0 -10px;
	right: -10px;
	top: -10px
}

.fb_dialog_bottom_left {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/ye/r/8YeTNIlTZjm.png)
		no-repeat 0 -20px;
	bottom: -10px;
	left: -10px
}

.fb_dialog_bottom_right {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/ye/r/8YeTNIlTZjm.png)
		no-repeat 0 -30px;
	right: -10px;
	bottom: -10px
}

.fb_dialog_vert_left, .fb_dialog_vert_right, .fb_dialog_horiz_top,
	.fb_dialog_horiz_bottom {
	position: absolute;
	background: #525252;
	filter: alpha(opacity = 70);
	opacity: .7
}

.fb_dialog_vert_left, .fb_dialog_vert_right {
	width: 10px;
	height: 100%
}

.fb_dialog_vert_left {
	margin-left: -10px
}

.fb_dialog_vert_right {
	right: 0;
	margin-right: -10px
}

.fb_dialog_horiz_top, .fb_dialog_horiz_bottom {
	width: 100%;
	height: 10px
}

.fb_dialog_horiz_top {
	margin-top: -10px
}

.fb_dialog_horiz_bottom {
	bottom: 0;
	margin-bottom: -10px
}

.fb_dialog_iframe {
	line-height: 0
}

.fb_dialog_content .dialog_title {
	background: #6d84b4;
	border: 1px solid #365899;
	color: #fff;
	font-size: 15px;
	font-weight: bold;
	margin: 0
}

.fb_dialog_content .dialog_title>span {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yd/r/Cou7n-nqK52.gif)
		no-repeat 5px 50%;
	float: left;
	padding: 5px 0 7px 26px
}

body.fb_hidden {
	/* -webkit-transform: none; */
	height: 100%;
	margin: 0;
	overflow: visible;
	position: absolute;
	top: -10000px;
	left: 0;
	width: 100%
}

.fb_dialog.fb_dialog_mobile.loading {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/ya/r/3rhSv5V8j3o.gif)
		white no-repeat 50% 50%;
	min-height: 100%;
	min-width: 100%;
	overflow: hidden;
	position: absolute;
	top: 0;
	z-index: 10001
}

.fb_dialog.fb_dialog_mobile.loading.centered {
	width: auto;
	height: auto;
	min-height: initial;
	min-width: initial;
	background: none
}

.fb_dialog.fb_dialog_mobile.loading.centered #fb_dialog_loader_spinner {
	width: 100%
}

.fb_dialog.fb_dialog_mobile.loading.centered .fb_dialog_content {
	background: none
}

.loading.centered #fb_dialog_loader_close {
	color: #fff;
	display: block;
	padding-top: 20px;
	clear: both;
	font-size: 19px
}

#fb-root #fb_dialog_ipad_overlay {
	background: rgba(0, 0, 0, .45);
	position: absolute;
	bottom: 0;
	left: 0;
	right: 0;
	top: 0;
	width: 100%;
	min-height: 100%;
	z-index: 10000
}

#fb-root #fb_dialog_ipad_overlay.hidden {
	display: none
}

.fb_dialog.fb_dialog_mobile.loading iframe {
	visibility: hidden
}

.fb_dialog_content .dialog_header {
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#738ABA),
		to(#2C4987));
	border-bottom: 1px solid;
	border-color: #1d4088;
	color: #fff;
	font: 14px Helvetica, sans-serif;
	font-weight: bold;
	text-overflow: ellipsis;
	text-shadow: rgba(0, 30, 84, .296875) 0 -1px 0;
	vertical-align: middle;
	white-space: nowrap
}

.fb_dialog_content .dialog_header table {
	-webkit-font-smoothing: subpixel-antialiased;
	height: 43px;
	width: 100%
}

.fb_dialog_content .dialog_header td.header_left {
	font-size: 13px;
	padding-left: 5px;
	vertical-align: middle;
	width: 60px
}

.fb_dialog_content .dialog_header td.header_right {
	font-size: 13px;
	padding-right: 5px;
	vertical-align: middle;
	width: 60px
}

.fb_dialog_content .touchable_button {
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#4966A6),
		color-stop(.5, #355492), to(#2A4887));
	border: 1px solid #29487d;
	display: inline-block;
	margin-top: 3px;
	max-width: 85px;
	line-height: 18px;
	padding: 4px 12px;
	position: relative
}

.fb_dialog_content .dialog_header .touchable_button input {
	border: none;
	background: none;
	color: #fff;
	font: 12px Helvetica, sans-serif;
	font-weight: bold;
	margin: 2px -12px;
	padding: 2px 6px 3px 6px;
	text-shadow: rgba(0, 30, 84, .296875) 0 -1px 0
}

.fb_dialog_content .dialog_header .header_center {
	color: #fff;
	font-size: 17px;
	font-weight: bold;
	line-height: 18px;
	text-align: center;
	vertical-align: middle
}

.fb_dialog_content .dialog_content {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/y9/r/jKEcVPZFk-2.gif)
		no-repeat 50% 50%;
	border: 1px solid #555;
	border-bottom: 0;
	border-top: 0;
	height: 150px
}

.fb_dialog_content .dialog_footer {
	background: #f6f7f9;
	border: 1px solid #555;
	border-top-color: #ccc;
	height: 40px
}

#fb_dialog_loader_close {
	float: left
}

.fb_dialog.fb_dialog_mobile .fb_dialog_close_button {
	text-shadow: rgba(0, 30, 84, .296875) 0 -1px 0
}

.fb_dialog.fb_dialog_mobile .fb_dialog_close_icon {
	visibility: hidden
}

#fb_dialog_loader_spinner {
	animation: rotateSpinner 1.2s linear infinite;
	background-color: transparent;
	background-image:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/yD/r/t-wz8gw1xG1.png);
	background-repeat: no-repeat;
	background-position: 50% 50%;
	height: 24px;
	width: 24px
}

@
keyframes rotateSpinner { 0% {
	transform: rotate(0deg)
}

100%
{
transform
:
 
rotate
(360deg)

            
}
}
.fb_iframe_widget {
	display: inline-block;
	position: relative
}

.fb_iframe_widget span {
	display: inline-block;
	position: relative;
	text-align: justify
}

.fb_iframe_widget iframe {
	position: absolute
}

.fb_iframe_widget_fluid_desktop, .fb_iframe_widget_fluid_desktop span,
	.fb_iframe_widget_fluid_desktop iframe {
	max-width: 100%
}

.fb_iframe_widget_fluid_desktop iframe {
	min-width: 220px;
	position: relative
}

.fb_iframe_widget_lift {
	z-index: 1
}

.fb_hide_iframes iframe {
	position: relative;
	left: -10000px
}

.fb_iframe_widget_loader {
	position: relative;
	display: inline-block
}

.fb_iframe_widget_fluid {
	display: inline
}

.fb_iframe_widget_fluid span {
	width: 100%
}

.fb_iframe_widget_loader iframe {
	min-height: 32px;
	z-index: 2;
	zoom: 1
}

.fb_iframe_widget_loader .FB_Loader {
	background:
		url(https://static.xx.fbcdn.net/rsrc.php/v3/y9/r/jKEcVPZFk-2.gif)
		no-repeat;
	height: 32px;
	width: 32px;
	margin-left: -16px;
	position: absolute;
	left: 50%;
	z-index: 4
}

.fb_customer_chat_bounce_in {
	animation-duration: 250ms;
	animation-name: fb_bounce_in
}

.fb_customer_chat_bounce_out {
	animation-duration: 250ms;
	animation-name: fb_fade_out
}

.fb_invisible_flow {
	display: inherit;
	height: 0;
	overflow-x: hidden;
	width: 0
}

.fb_mobile_overlay_active {
	height: 100%;
	overflow: hidden;
	position: fixed;
	width: 100%
}

@keyframes fb_fade_out {
            from {
                opacity: 1
            }
            to {
                opacity: 0
            }
        }
 @keyframes fb_bounce_in {
            0% {
                opacity: 0;
                transform: scale(.8, .8);
                transform-origin: 100% 100%
            }
            10% {
                opacity: .1
            }
            20% {
                opacity: .2
            }
            30% {
                opacity: .3
            }
            40% {
                opacity: .4
            }
            50% {
                opacity: .5
            }
            60% {
                opacity: .6
            }
            70% {
                opacity: .7
            }
            80% {
                opacity: .8;
                transform: scale(1.03, 1.03)
            }
        }

.form-control{
background-color: #fff; 
 	font-family: Roboto; 
 	font-size: 15px; 
 	font-weight: 300; 
 	padding: 0 11px 0 13px; 
 	text-overflow: ellipsis; 
 	width: 300px; 
}
</style>

</head>

<body>
	<main id="site-content" role="main" tabindex="-1">
	<div id="lys-redesign-div">
		<div data-hypernova-key="list_your_spacebundlejs"
			data-hypernova-id="2a3b37d8-d154-4f9c-b90a-5f03110dcc60">
			<div data-reactroot>
				<div>
					<div class="bg-white">
						<div>
							<div class="landing-width bg-white row row-condensed list-your-space__landing-content">
								<span>
									<div class="col-md-6 landing__left-col fast-animation">
										<div class="landing__left-col-content">
											<div class="space-5">
												<h2 class="landing__title-title">
													<span>分享這次旅行的風景照吧！</span>
												</h2>
											</div>
											<div class="landing__step-content landing__wmpw-controls">
												<strong class="landing__step-number space-1 text-base text-branding text-light-gray">
													<span>步驟5</span>
												</strong>
												<div class="h3 landing__step-content-title space-3">
													<span>上傳想分享的照片</span>
												</div>
												
												
												<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/guide/guide.do" id="imgKeep" class="earning-estimation-container" data-prevent-default="true">
													<div class="earning-estimation">
														<div class="earning-estimation__body">
															<div class="row row-condensed space-1">
																<div class="col-sm-10">
                                              						 <input accept="image/*" name="upload[]" type="file" id="file-input" multiple /> 
                                              						 <input type="hidden" name="guideTitle" value="<%=guideTitle%>">
																	 <input type="hidden" name="guideContent" value="<%=guideContent%>">
																	 <input type="hidden" name="guideMap" value="<%=guideMap%>">
																	 <input type="hidden" name="guideLatLng" value="<%=guideLatLng%>">
																	 <input type="hidden" name="guideArea" value="<%=guideArea%>">
																	 <input type="hidden" name="action" value="insert">
																	 
																	 <div id="preview"></div>
																</div>
															</div>
														 </div>
													 </div>
												</form>
												
												
													<div style="margin-top: 20%; margin-bottom: 28px; margin-right: 50%;">
														<div class="wrap">
															<div>
																<a class="button" id="keep" aria-busy="false">繼續</a>
															</div>
														</div>
													</div>
											</div>
										</div>
									</div>
								</span>
								<div class="col-md-5 landing__right-col">
									<div>
										<div
											class="landing__animation hide-sm lys-vertical-align-middle-container">
											<span>
												<div
													class="landing__svg-container lys-vertical-align-middle"
													style="transition-duration: 250ms;">
													<div>
														<svg xmlns="http://www.w3.org/2000/svg"
															viewBox="0 0 576 1024" width="576" height="1024"
															preserveAspectRatio="xMidYMid meet"
															style="width: 100%; height: 100%;">
                                                                <defs>
                                                                    <clipPath
																id="animationMask_8AO8zFnN2T">
                                                                        <rect
																width="576" height="1024" x="0" y="0"></rect>
                                                                    </clipPath>
                                                                </defs>
                                                                <g
																clip-path="url(#animationMask_8AO8zFnN2T)">
                                                                    <g
																transform="matrix(1,0,0,1,0,0)" opacity="1">
                                                                        <rect
																width="576" height="1024" fill="#ffffff"></rect>
                                                                    </g>
                                                                    <g
																transform="matrix(0.9,0,0,0.9,342.9851,459.7503)"
																opacity="1" style="user-select: none;">
                                                                        <g
																opacity="1" transform="matrix(1,0,0,1,0,0)">
                                                                            <path
																stroke-linecap="round" stroke-linejoin="round"
																fill-opacity="0" stroke="rgb(86,90,92)"
																stroke-opacity="1" stroke-width="3"
																d="M0 0 M2.604,73.279 C2.604,73.279 4.743,92.55600000000001 3.101,106.796 C2.875,108.757 4.232,110.546 6.176,110.89 C6.176,110.89 6.176,110.89 6.176,110.89 C8.167,111.242 10.084000000000001,109.95599999999999 10.499,107.978 C11.927,101.17699999999999 12.435,86.61399999999999 9.426,71.758M0 0 M21.238,67.261 C21.238,67.261 26.511000000000003,89.898 33.39,102.944 C34.575,105.19 33.699,107.96499999999999 31.432,109.109 C31.432,109.109 31.432,109.109 31.432,109.109 C28.933999999999997,110.369 25.904,109.09100000000001 25.068,106.421 C22.191000000000003,97.23400000000001 16.301,78.035 14.577,69.466M0 0 M11.176,106.008 C11.176,106.008 11.395000000000001,106.179 11.842,106.361 C14.864,107.58800000000001 18.103,105.07 17.853,101.818 C17.853,101.818 15.926,75.133 15.926,75.133M0 0 M-2.574,74.758 C-2.574,74.758 -1.947,86.46 -2.604,92.097 C-2.71,93.00699999999999 -2.1260000000000003,93.842 -1.239,94.071 C-0.1200000000000001,94.359 1.4400000000000002,94.548 2.926,94.008M0 0 M-34.766,-92.585 C-24.771,-76.56099999999999 -7.574,-37.992000000000004 -4.574,-19.242M0 0 M-28.003,-100.84 C-28.003,-100.84 -2.907,-54.741 2.426,-19.408M0 0 M-10.853,-110.242 C-10.853,-110.242 -2.972,-46.604 -1.639,-37.271M0 0 M-3.77,-108.658 C-3.77,-108.658 4.759,-37.741 6.426,-19.408M0 0 M25.421,-107.288 C25.421,-107.288 14.758999999999999,-42.409000000000006 16.426,-18.742M0 0 M16.21,-98.676 C16.21,-98.676 10.759,-50.075 11.759,-19.075M0 0 M-21.687,-111.242 C-21.687,-111.242 -11.899000000000001,-78.03399999999999 -8.074,-56.742M0 0 M10.137,-97.226 C10.137,-97.226 5.259,-54.409000000000006 7.259,-19.742"></path>
                                                                        </g>
                                                                    </g>
                                                                    <g
																transform="matrix(0.9,0,0,0.9,373.7741,322.5012)"
																opacity="1" style="user-select: none;">
                                                                        <g
																opacity="1" transform="matrix(1,0,0,1,0,0)">
                                                                            <path
																fill="rgb(255,170,145)" fill-opacity="1"
																d="M0 0 M-23.27,10.565 C-23.275,10.655 -23.284,10.83 -23.293,11.014 C-23.602999999999998,10.975 -23.913,10.935 -24.234,10.894 C-24.450000000000003,11.159 -24.19,11.662 -24.699,11.843 C-24.765,11.689 -24.83,11.538 -24.941,11.28 C-25.061999999999998,11.34 -25.200999999999997,11.41 -25.33,11.474 C-25.496,11.306000000000001 -25.646,11.152000000000001 -25.797,10.999 C-25.833000000000002,11.022 -25.869999999999997,11.045 -25.906,11.068 C-25.839,11.372 -25.603,11.699 -25.913,11.964 C-26.044,12.076 -26.240000000000002,12.113000000000001 -26.428,12.14 C-26.701,12.4 -26.451,12.59 -26.234,12.785 C-26.328000000000003,12.847 -26.386,12.884 -26.453,12.928 C-26.591,12.760000000000002 -26.732,12.588000000000001 -26.941,12.332 C-26.897,13.09 -26.897,13.09 -27.183,13.405 C-27.342,13.351999999999999 -27.502,13.298 -27.671,13.241 C-27.784,13.045 -27.610999999999997,12.674 -28.048,12.634 C-28.095,12.729000000000001 -28.145,12.83 -28.21,12.962 C-28.303,12.913 -28.392,12.868 -28.506,12.808 C-28.584,12.907 -28.666,13.013 -28.721,13.083 C-28.556,13.428 -28.410999999999998,13.73 -28.266,14.032 C-28.294999999999998,14.06 -28.325,14.089 -28.355,14.117 C-28.481,14.075000000000001 -28.682,14.068000000000001 -28.72,13.986 C-28.939,13.515 -29.412,13.379 -29.8,13.1 C-30.085,13.463 -30.37,13.199 -30.68,13.06 C-30.846,13.25 -30.983,13.483 -30.796,13.667 C-30.415,14.042 -30.528,14.429 -30.647,14.85 C-30.956999999999997,14.591 -31.256,14.342 -31.555,14.093 C-31.602,14.115 -31.647,14.136 -31.694,14.158 C-31.68,14.357 -31.667,14.556000000000001 -31.649,14.814 C-31.754,14.998 -32.007999999999996,15.028 -32.211,14.954 C-32.619,14.806000000000001 -32.863,15.006 -33.052,15.292 C-33.188,15.497 -33.344,15.555 -33.571,15.578 C-34.033,15.625 -34.496,15.681 -34.948,15.783 C-35.251,15.850999999999999 -35.532000000000004,15.979999999999999 -35.712,15.7 C-36.989000000000004,16.112 -38.243,16.185 -39.453,16.112 C-39.538000000000004,15.729 -39.614999999999995,15.385 -39.693,15.033 C-39.952999999999996,14.985999999999999 -40.175,14.944999999999999 -40.43,14.899 C-40.378,14.786 -40.332,14.685 -40.293,14.6 C-40.533,14.408999999999999 -40.76,14.229000000000001 -41.012,14.028 C-40.885,13.861 -40.786,13.733 -40.691,13.609 C-40.797000000000004,13.309 -41.45,13.322000000000001 -41.066,12.817 C-41.228,12.718 -41.371,12.63 -41.561,12.513 C-41.274,12.414 -41.208,12.245 -41.284,11.985 C-41.342,11.786 -41.336,11.567 -41.353,11.357 C-41.385,10.966999999999999 -41.446999999999996,10.599 -41.778,10.32 C-41.882999999999996,10.231 -41.912000000000006,10.042 -41.956,9.893 C-42.196000000000005,9.069 -42.399,8.233 -42.68,7.424 C-42.804,7.0680000000000005 -43.083999999999996,6.766 -43.346,6.358 C-43.464999999999996,6.71 -43.549,6.957 -43.633,7.204 C-43.67,7.201 -43.707,7.197 -43.744,7.194 C-44.03,6.276 -44.445,5.374 -44.564,4.435 C-44.674,3.566 -45.111,2.8049999999999997 -45.183,1.944 C-45.191,1.8519999999999999 -45.261,1.721 -45.337,1.689 C-45.620000000000005,1.57 -45.589,1.329 -45.501,1.157 C-45.344,0.851 -45.171,0.507 -44.907,0.31 C-44.37799999999999,-0.08500000000000002 -43.819,-0.429 -43.155,-0.625 C-42.377,-0.855 -41.656000000000006,-1.27 -40.892,-1.555 C-40.293000000000006,-1.779 -39.666,-1.9270000000000003 -39.052,-2.111 C-38.735,-2.2060000000000004 -38.413000000000004,-2.287 -38.106,-2.408 C-37.724000000000004,-2.558 -37.353,-2.691 -36.93,-2.593 C-36.802,-2.563 -36.649,-2.599 -36.516,-2.636 C-35.867,-2.8160000000000003 -35.217999999999996,-3 -34.574,-3.197 C-34.193999999999996,-3.313 -33.826,-3.3569999999999998 -33.43,-3.251 C-33.24,-3.1999999999999997 -33.019000000000005,-3.258 -32.813,-3.269 C-32.262,-3.299 -31.709,-3.309 -31.162,-3.371 C-30.954,-3.394 -30.736,-3.5060000000000002 -30.562,-3.632 C-30.194000000000003,-3.899 -29.854,-4.203 -29.499,-4.488 C-28.854,-5.007000000000001 -28.342,-4.478 -28.144,-3.94 C-27.962999999999997,-3.449 -27.753,-2.96 -27.489,-2.509 C-27.167,-1.9609999999999999 -26.774,-1.4529999999999998 -26.382,-0.884 C-25.946,-1.072 -25.57,-0.912 -25.234,-0.537 C-24.948,-0.21800000000000003 -24.607,0.05099999999999999 -24.31,0.361 C-23.826999999999998,0.866 -23.249000000000002,1.057 -22.565,0.941 C-22.531000000000002,0.9349999999999999 -22.487000000000002,0.899 -22.466,0.91 C-21.925,1.204 -21.310000000000002,0.974 -20.754,1.155 C-20.396,1.272 -20.154,1.546 -20.003,1.861 C-19.815,2.253 -19.669,2.671 -19.565,3.093 C-19.490000000000002,3.399 -19.481,3.7329999999999997 -19.513,4.047 C-19.524,4.1499999999999995 -19.756,4.2299999999999995 -19.929,4.35 C-19.965999999999998,4.545999999999999 -19.926000000000002,4.7989999999999995 -20.164,5.039 C-20.335,5.210999999999999 -20.296,5.5889999999999995 -20.358,5.874 C-20.475,6.4159999999999995 -20.601000000000003,6.956 -20.716,7.498 C-20.741,7.617 -20.721,7.745 -20.747,7.863 C-20.781,8.019 -20.836000000000002,8.171 -20.888,8.322 C-20.926000000000002,8.433 -21.035999999999998,8.559999999999999 -21.008,8.645 C-20.898999999999997,8.98 -21.132,9.086 -21.34,9.215 C-21.704,9.442 -22.081,9.649999999999999 -22.435,9.892 C-22.698,10.071 -22.933,10.291 -23.27,10.565zM0 0 M13.732,2.891 C13.956,3.008 14.126,3.157 14.311,3.179 C14.577,3.21 14.826,3.199 14.859,3.592 C15.034,3.474 15.136000000000001,3.4040000000000004 15.23,3.341 C15.483,3.914 15.732,4.476 15.979,5.035 C16.252,4.942 16.471999999999998,4.867 16.743,4.774 C16.767,4.731 16.828,4.623 16.933,4.436 C17.164,4.787 17.378999999999998,5.054 17.307,5.456 C17.511999999999997,5.698 17.83,5.765 18.075,5.67 C18.354,5.561 18.522000000000002,5.639 18.722,5.779 C18.781000000000002,5.821 18.854,5.844 18.96,5.894 C18.926000000000002,6.1080000000000005 18.89,6.3309999999999995 18.859,6.529 C19.134,6.563 19.378,6.594 19.667,6.63 C19.539,6.88 19.448999999999998,7.058000000000001 19.357,7.235 C19.252,7.438000000000001 19.163,7.635 19.425,7.702 C19.376,7.969 19.333,8.202 19.276,8.513 C19.692,8.323 19.672,8.035 19.651,7.718 C19.794999999999998,7.737 19.904,7.7509999999999994 20.014,7.765 C19.980999999999998,7.999 19.951999999999998,8.205 19.923,8.41 C19.956,8.421 19.988,8.432 20.021,8.442 C20.078,8.355 20.135,8.268 20.199,8.169 C20.404,8.571 20.404,8.57 20.732,8.378 C21.194,9.046 21.713,9.683 22.099,10.393 C22.342,10.839 22.666999999999998,11.286999999999999 22.673,11.843 C22.674,11.912 22.697999999999997,11.995 22.74,12.049 C23.241,12.693999999999999 23.394,13.478 23.583,14.238 C23.636,14.45 23.482,14.717 23.412,14.955 C23.320999999999998,15.265 23.242,15.581 23.117,15.878 C22.897000000000002,16.399 22.649,16.907 22.407,17.419 C22.371,17.496000000000002 22.305999999999997,17.561 22.255,17.631 C22.23,17.614 22.203999999999997,17.598 22.179,17.581 C22.221999999999998,17.433 22.265,17.284 22.317,17.101 C22.033,17.116999999999997 21.96,17.270999999999997 21.905,17.47 C21.878,17.567 21.813000000000002,17.688 21.731,17.729 C21.455000000000002,17.866 21.158,17.962 20.879,18.094 C20.671000000000003,18.193 20.48,18.288 20.349,18.53 C20.214,18.779 19.96,18.979000000000003 19.724,19.155 C19.039,19.665000000000003 18.346,20.166 17.639,20.646 C16.713,21.274 15.769,21.876 14.836,22.495 C14.415000000000001,22.774 13.981,23.04 13.597,23.364 C13.370999999999999,23.555 13.197,23.59 12.963,23.406 C12.831,23.573999999999998 12.713000000000001,23.726 12.547,23.938 C12.073,23.455 11.605,22.983 11.144,22.505 C10.687,22.031 10.222999999999999,21.563 9.789,21.069 C9.541,20.787 9.348,20.457 9.127,20.151 C9.085,20.092 9.022,20.049 8.978,19.992 C8.462,19.324 7.901000000000001,18.683999999999997 7.453,17.973 C7.19,17.555999999999997 6.954000000000001,17.126 6.634,16.748 C6.589,16.695 6.555,16.61 6.558,16.541 C6.575,16.155 6.348,15.884 6.146,15.595 C6.0729999999999995,15.491000000000001 6.032,15.361 6,15.236 C5.87,14.738000000000001 5.856,14.203999999999999 5.461,13.796 C5.344,13.676 5.289000000000001,13.476 5.251,13.303 C5.077,12.507000000000001 4.9,11.711 4.761,10.909 C4.675,10.414000000000001 4.64,9.909 4.611,9.407 C4.596,9.148 4.841,9.074 5.03,8.996 C5.149,8.947000000000001 5.29,8.950000000000001 5.454,8.925 C5.39,8.596 5.534,8.398 5.822,8.298 C5.877,8.279 5.954,8.231 5.987,8.251 C6.37,8.491 6.803,8.187 7.189,8.369 C7.206,8.376999999999999 7.241,8.347 7.327,8.307 C7.244,8.172 7.166,8.043 7.083,7.909 C7.088,7.896 7.092,7.854 7.111,7.845 C7.462,7.673 7.812,7.498 8.169,7.338 C8.373000000000001,7.246 8.549,7.159000000000001 8.696,6.956 C8.824,6.7780000000000005 9.08,6.634 9.301,6.594 C9.793,6.505 10.08,6.137 10.446,5.874 C10.536,5.81 10.647,5.776 10.749,5.729 C11.479000000000001,5.397 12.24,5.091 12.776,4.474 C12.98,4.239 13.152000000000001,3.989 13.412,3.802 C13.491000000000001,3.746 13.524,3.571 13.513,3.456 C13.49,3.21 13.521999999999998,3.008 13.732,2.891zM0 0 M36.907,31.952 C36.833999999999996,32.125 36.785,32.243 36.753,32.32 C36.496,32.365 36.277,32.402 36.059,32.44 C35.963,32.457 35.861000000000004,32.501000000000005 35.771,32.484 C35.409,32.416000000000004 35.036,32.367 34.694,32.239 C33.965,31.964999999999996 33.244,31.666 32.535,31.342 C31.633999999999997,30.930999999999997 30.704,30.552 29.873,30.024 C29.490000000000002,29.781000000000002 29.081000000000003,29.661 28.702,29.452 C28.273000000000003,29.216 27.873,28.922 27.43,28.718 C26.866,28.458 26.403000000000002,28.105 25.986,27.642 C25.773,27.405 25.396,27.323 25.109,27.145 C24.807000000000002,26.957 24.527,26.735 24.234,26.532 C23.678,26.145 23.316,25.625 23.143,24.97 C23.111,24.849999999999998 23.073999999999998,24.687 22.985,24.635 C22.689,24.462000000000003 22.578,24.192 22.459,23.896 C22.341,23.605 22.159,23.338 21.991,23.07 C21.788999999999998,22.747 21.701,22.416 21.918,22.076 C22.061,21.852 22.032999999999998,21.637999999999998 21.932,21.426 C21.839,21.232 21.884,21.073 21.937,20.871 C22.133000000000003,20.128999999999998 22.47,19.419 22.476,18.631 C22.477,18.538 22.494999999999997,18.403 22.557,18.36 C22.81,18.181 22.738,17.913 22.811,17.679 C23.146,16.598 22.909,15.523 22.858,14.447 C22.82,13.652 23.182,13.013 23.921,12.654 C24.169999999999998,12.533 24.425,12.42 24.684,12.323 C25.121000000000002,12.16 25.526999999999997,12.196 25.906,12.504 C25.98,12.564 26.141000000000002,12.54 26.257,12.524 C26.715,12.462 27.17,12.382 27.628,12.322 C28.079,12.263 28.345,12.648 28.711,12.791 C29.159,12.967 29.62,13.106 30.076,13.261 C30.11,13.231 30.145,13.202 30.179,13.172 C30.206,13.425 30.234,13.677 30.268,13.994 C30.768,13.549999999999999 30.768,13.549 31.395,14.135 C31.843,13.845 32.153,13.875 32.676,14.249 C32.811,14.137 32.934000000000005,13.953 33.078,13.933 C33.413000000000004,13.888 33.665,14.075000000000001 33.809,14.352 C33.989999999999995,14.375 34.150999999999996,14.393999999999998 34.312,14.415 C34.504999999999995,14.440999999999999 34.72,14.535 34.887,14.481 C35.161,14.392 35.332,14.515 35.531,14.638 C35.623,14.695 35.753,14.777 35.831,14.75 C36.044000000000004,14.675 36.17,14.741000000000001 36.286,14.909 C36.319,14.957 36.385,15.014 36.436,15.014 C36.78,15.013 37.038,15.215 37.324,15.358 C37.658,15.525 38.023,15.639 38.338,15.834 C38.723,16.073 39.074,16.37 39.431,16.652 C39.486,16.695 39.545,16.825 39.521,16.864 C39.178,17.416 39.543,17.938 39.694,18.389 C40.071000000000005,19.512999999999998 40.237,20.664 40.415,21.82 C40.472,22.191 40.531,22.564 40.554,22.938 C40.636,24.266 40.411,25.563 40.135,26.854 C39.818,28.335 39.315999999999995,29.753999999999998 38.714,31.141 C38.539,31.543999999999997 38.369,31.948999999999998 38.187,32.349 C38.093999999999994,32.553 37.97,32.663000000000004 37.735,32.487 C37.489,32.303000000000004 37.218999999999994,32.151 36.907,31.952zM0 0 M-1.305,1.858 C-1.128,2.128 -1.018,2.297 -0.897,2.482 C-0.839,2.462 -0.757,2.4339999999999997 -0.662,2.401 C-0.5720000000000001,2.534 -0.48,2.668 -0.382,2.811 C-0.624,2.84 -0.846,2.872 -1.069,2.891 C-1.521,2.93 -1.592,3.0340000000000003 -1.439,3.458 C-1.419,3.5130000000000003 -1.386,3.5650000000000004 -1.377,3.583 C-1.463,3.845 -1.539,4.079 -1.63,4.359 C-1.6199999999999999,4.352 -1.657,4.397 -1.694,4.397 C-2.129,4.398000000000001 -2.488,4.508 -2.614,4.991 C-2.627,5.042999999999999 -2.6830000000000003,5.096 -2.733,5.123 C-3.1100000000000003,5.33 -3.491,5.532 -3.871,5.733 C-3.91,5.754 -3.987,5.752 -3.995,5.777 C-4.127,6.2090000000000005 -4.513,6.037999999999999 -4.791,6.137 C-5.093,6.244999999999999 -5.36,6.45 -5.646,6.606 C-6.05,6.827 -6.4510000000000005,7.053999999999999 -6.865,7.254 C-7.216,7.4239999999999995 -7.71,7.323 -7.982,7.04 C-8.229000000000001,6.782 -8.504,6.617 -8.875,6.613 C-8.999,6.612 -9.141,6.552 -9.243,6.476 C-10.42,5.6 -11.593,4.725 -12.464,3.51 C-13.092,2.634 -13.784,1.803 -14.428,0.938 C-14.829,0.3999999999999999 -15.191,-0.16699999999999993 -15.577,-0.716 C-16.134,-1.508 -16.698,-2.295 -17.26,-3.083 C-17.403000000000002,-3.2830000000000004 -17.415999999999997,-3.46 -17.208,-3.633 C-16.889,-3.899 -16.649,-4.207 -16.674,-4.663 C-16.68,-4.765000000000001 -16.584,-4.958 -16.524,-4.963 C-16.115000000000002,-4.995 -15.939,-5.365 -15.636,-5.546 C-14.831,-6.027 -14.054,-6.5569999999999995 -13.276,-7.082 C-12.943,-7.3069999999999995 -12.637,-7.574 -12.313,-7.812 C-12.223,-7.878 -12.110000000000001,-7.914 -12.005,-7.959 C-11.909,-8.001 -11.805,-8.026 -11.713,-8.075 C-11.251999999999999,-8.319999999999999 -10.793000000000001,-8.568 -10.336,-8.82 C-10.218,-8.885 -10.112,-8.971 -10.001,-9.049 C-9.915999999999999,-9.109 -9.84,-9.208 -9.747,-9.228 C-9.118,-9.36 -8.607000000000001,-9.773 -7.996,-9.951 C-7.556,-10.079 -7.131,-10.256 -6.698,-10.407 C-6.630000000000001,-10.431 -6.555,-10.436 -6.483,-10.45 C-6.209,-10.504 -5.937,-10.567 -5.662,-10.61 C-5.349,-10.658 -5.045999999999999,-10.696 -4.784,-10.417 C-4.678999999999999,-10.305 -4.460999999999999,-10.21 -4.318,-10.236 C-3.5719999999999996,-10.369 -3.159,-9.878 -2.714,-9.437 C-2.64,-9.363 -2.589,-9.261999999999999 -2.506,-9.203 C-2.295,-9.054 -2.258,-8.855 -2.267,-8.614 C-2.279,-8.294 -2.1990000000000003,-7.996 -1.997,-7.732 C-1.8770000000000002,-7.575 -1.707,-7.409000000000001 -1.879,-7.179 C-1.893,-7.16 -1.895,-7.113 -1.881,-7.094 C-1.639,-6.753 -1.3980000000000001,-6.409999999999999 -1.147,-6.076 C-0.768,-5.571999999999999 -0.34800000000000003,-5.096 -0.014,-4.565 C0.141,-4.319000000000001 0.29800000000000004,-4.109 0.511,-3.915 C0.717,-3.727 0.8619999999999999,-3.472 1.043,-3.254 C1.318,-2.923 1.6680000000000001,-2.708 2.084,-2.593 C2.1670000000000003,-2.57 2.2390000000000003,-2.51 2.265,-2.496 C2.484,-2.568 2.668,-2.628 2.859,-2.69 C2.887,-2.5789999999999997 2.905,-2.5479999999999996 2.9,-2.522 C2.846,-2.2529999999999997 2.691,-1.9580000000000002 2.756,-1.723 C2.8299999999999996,-1.4580000000000002 2.946,-1.212 2.93,-0.924 C2.9200000000000004,-0.736 2.5620000000000003,-0.19 2.394,-0.179 C2.317,-0.174 2.237,-0.24600000000000002 2.154,-0.27 C1.886,-0.34700000000000003 1.6609999999999998,-0.42 1.378,-0.181 C1.137,0.022999999999999993 0.75,0.05399999999999999 0.372,0.18 C0.762,0.359 1.3379999999999999,0.249 1.513,0.871 C1.295,0.857 1.072,0.845 0.85,0.824 C0.8089999999999999,0.82 0.766,0.754 0.735,0.762 C0.605,0.795 0.434,0.809 0.363,0.898 C0.22799999999999998,1.068 0.42700000000000005,1.162 0.531,1.25 C0.5840000000000001,1.295 0.6920000000000001,1.276 0.797,1.289 C0.652,1.626 0.377,1.565 0.076,1.49 C0.012999999999999998,1.8 -0.04300000000000001,2.0700000000000003 -0.116,2.431 C-0.381,2.238 -0.5640000000000001,2.077 -0.773,1.964 C-0.901,1.895 -1.0699999999999998,1.901 -1.305,1.858zM0 0 M4.07,46.094 C3.721,46.155 3.2760000000000002,46.337999999999994 2.861,46.285 C1.963,46.171 1.1159999999999999,46.415 0.29,46.622 C-0.47700000000000004,46.815 -1.1480000000000001,46.717 -1.862,46.513 C-2.536,46.32 -3.242,46.229 -3.899,45.994 C-4.181,45.893 -4.371,45.888 -4.647,45.958 C-4.835,46.006 -5.169,45.897000000000006 -5.282,45.743 C-5.597,45.315000000000005 -6.048,45.266 -6.493,45.199 C-6.601,45.183 -6.736,45.339 -6.879,45.43 C-7.141,45.396 -7.459,45.369 -7.77,45.309 C-7.922,45.278999999999996 -8.111,45.227 -8.198,45.117 C-8.322000000000001,44.96 -8.397,44.862 -8.634,44.892 C-8.738,44.905 -8.883000000000001,44.678000000000004 -8.992,44.545 C-9.141,44.364000000000004 -9.134,44.359 -9.505,44.537 C-9.41,44.729 -9.316,44.921 -9.146,45.264 C-9.496,45.151 -9.727,45.077 -9.991,44.992 C-9.911999999999999,43.851 -9.847000000000001,42.721000000000004 -9.752,41.593 C-9.656,40.462 -9.782,39.343 -9.841,38.218 C-9.880999999999998,37.449000000000005 -9.984,36.674 -9.599,35.908 C-9.376,35.465 -9.424,34.89 -9.334,34.377 C-9.254999999999999,33.922000000000004 -9.161999999999999,33.47 -9.062,33.019 C-8.892999999999999,32.257999999999996 -8.718,31.499 -8.537,30.741 C-8.434000000000001,30.31 -8.354,29.866 -8.193,29.456 C-7.789,28.43 -7.390000000000001,27.395 -6.791,26.463 C-6.567,26.115000000000002 -6.2410000000000005,25.833 -5.961,25.522 C-5.91,25.465999999999998 -5.821,25.418000000000003 -5.811,25.356 C-5.7139999999999995,24.745 -5.1450000000000005,24.583000000000002 -4.761,24.251 C-4.673,24.175 -4.506,24.178 -4.373,24.167 C-3.9720000000000004,24.133000000000003 -3.564,24.141000000000002 -3.169,24.076 C-2.449,23.957 -1.762,23.918 -1.157,24.439 C-1.07,24.514 -0.901,24.500999999999998 -0.768,24.511 C-0.647,24.52 -0.524,24.494 -0.404,24.503 C-0.328,24.509 -0.22599999999999998,24.596 -0.182,24.57 C0.538,24.143 1.323,24.576 2.084,24.383 C2.674,24.233999999999998 3.349,24.466 3.98,24.427 C4.443,24.398 4.896,24.209 5.351,24.081 C5.458,24.051 5.593,23.909000000000002 5.65,23.94 C6.284000000000001,24.281000000000002 7.093,24.367 7.47,25.088 C7.575,25.289 7.556,25.558 7.581,25.797 C7.619000000000001,26.16 7.785,26.392 8.16,26.486 C8.591,26.594 9.011999999999999,26.744 9.437,26.876 C9.427999999999999,26.936 9.419,26.995 9.41,27.055 C9.296,27.15 9.181999999999999,27.244999999999997 9.059,27.348 C9.029,27.685 9.796,27.977 8.99,28.375 C9.415000000000001,28.481 9.713,28.555 10.071,28.644 C9.706999999999999,28.912999999999997 9.950000000000001,29.501 9.413,29.768 C9.749,30.207 9.774000000000001,30.738 9.797,31.338 C9.469000000000001,31.514 9.4,31.818 9.628,32.241 C9.727,32.426 9.676,32.692 9.698,32.973 C10.138,32.847 10.405,33.028 10.472,33.424 C10.538,33.815 10.302999999999999,34.123 10.058,34.18 C10.102,34.44 10.141,34.687000000000005 10.184,34.932 C10.209,35.072 10.245999999999999,35.21 10.267,35.35 C10.368,36.04 10.46,36.731 10.566,37.42 C10.597000000000001,37.619 10.654,37.815999999999995 10.718,38.007 C10.862,38.44 11.049000000000001,38.836999999999996 10.919,39.342 C10.714,40.135999999999996 11.171,40.713 11.788,41.26 C11.606,41.562999999999995 11.455,41.9 11.229,42.176 C10.767,42.742000000000004 10.306000000000001,43.318999999999996 9.769,43.809 C9.278,44.257999999999996 8.715,44.647 8.134,44.975 C7.4750000000000005,45.346000000000004 6.77,45.644000000000005 6.066,45.926 C5.639,46.097 5.18,46.205 4.726,46.284 C4.555,46.314 4.356,46.183 4.07,46.094zM0 0 M-20.086,-7.213 C-20.302,-6.773 -20.671,-6.635000000000001 -21.137,-6.594 C-21.551000000000002,-6.557 -21.948,-6.434 -22.36,-6.644 C-22.442999999999998,-6.686 -22.621,-6.532 -22.758,-6.476 C-23.031,-6.365 -23.299,-6.234 -23.582,-6.164 C-23.716,-6.130999999999999 -23.895,-6.194 -24.028,-6.262 C-24.305999999999997,-6.404 -24.567,-6.577 -24.857,-6.751 C-24.867,-6.615 -24.877000000000002,-6.4750000000000005 -24.888,-6.315 C-25.078000000000003,-6.380000000000001 -25.331999999999997,-6.2700000000000005 -25.4,-6.575 C-25.404,-6.591 -25.523,-6.5840000000000005 -25.588,-6.581 C-25.89,-6.566000000000001 -26.053,-6.7170000000000005 -26.075,-7.003 C-26.317,-7.098 -26.544999999999998,-7.187 -26.801,-7.287 C-26.834999999999997,-7.208 -26.871,-7.122 -26.924,-6.997 C-27.154,-7.224 -27.364,-7.259 -27.469,-6.881 C-27.956,-7.484 -28.959,-7.661 -29.573,-7.282 C-29.648,-7.236 -29.775,-7.163 -29.816,-7.192 C-30.212999999999997,-7.472 -30.794999999999998,-7.3 -31.124,-7.713 C-31.349999999999998,-7.996 -31.614,-8.083 -31.949,-7.955 C-32.02,-8.058 -32.079,-8.139999999999999 -32.12,-8.2 C-32.754999999999995,-8.100999999999999 -33.315,-8.258 -33.829,-8.561 C-34.104,-8.724 -34.328,-8.885 -34.633,-8.622 C-34.694,-8.57 -34.911,-8.594000000000001 -34.968,-8.659 C-35.294000000000004,-9.030000000000001 -35.699,-9.239 -36.15,-9.432 C-36.939,-9.77 -37.332,-10.567 -37.311,-11.429 C-37.296,-12.05 -37.42,-12.676 -37.383,-13.294 C-37.328,-14.217 -37.574,-15.153999999999998 -37.269,-16.063 C-37.174,-16.345 -37.061,-16.623 -36.934,-16.892 C-36.732,-17.32 -36.539,-17.757 -36.29,-18.158 C-35.894999999999996,-18.793000000000003 -35.453,-19.398999999999997 -35.039,-20.022 C-34.882000000000005,-20.258999999999997 -34.657,-20.205000000000002 -34.436,-20.198 C-34.245,-20.192 -34.053,-20.208000000000002 -33.863,-20.195 C-33.703,-20.184 -33.538000000000004,-20.164 -33.387,-20.114 C-32.759,-19.905 -32.117,-19.843 -31.457,-19.81 C-30.911,-19.782999999999998 -30.368000000000002,-19.641 -29.829,-19.526 C-29.26,-19.405 -28.69,-19.278 -28.134,-19.11 C-27.765,-18.998 -27.415,-18.817 -27.064,-18.651 C-26.979,-18.611 -26.917,-18.512999999999998 -26.856,-18.433 C-26.811,-18.374 -26.796,-18.258 -26.745,-18.242 C-26.109,-18.042 -26.139,-17.338 -25.752,-16.939 C-25.358,-16.532 -25.117,-16.002 -24.984,-15.434 C-24.949,-15.286 -24.838,-15.145 -24.733,-15.026 C-24.462,-14.717 -24.166,-14.429 -23.898,-14.118 C-23.764,-13.963000000000001 -23.675,-13.769 -23.553,-13.602 C-23.451,-13.462 -23.334,-13.333 -23.219,-13.203 C-23.150000000000002,-13.125 -23.061,-13.062 -23.003,-12.978 C-22.695,-12.532 -22.375999999999998,-12.091 -22.095,-11.628 C-21.944,-11.379 -21.866999999999997,-11.087000000000002 -21.746,-10.819 C-21.502,-10.278 -21.491,-9.651 -21.129,-9.155 C-20.955000000000002,-8.917 -20.816,-8.639 -20.599,-8.452 C-20.331,-8.222 -20.244999999999997,-7.944999999999999 -20.194,-7.627 C-20.171,-7.484999999999999 -20.122,-7.348 -20.086,-7.213zM0 0 M-23.693,47.414 C-24.046000000000003,46.901 -23.968,46.406 -23.724,45.864 C-23.507,45.382 -23.397000000000002,44.865 -22.908,44.54 C-22.810000000000002,44.475 -22.87,44.181999999999995 -22.846,43.995 C-22.799,43.623999999999995 -22.778,43.244 -22.679,42.887 C-22.631999999999998,42.718 -22.451,42.559999999999995 -22.293,42.455 C-21.963,42.235 -21.608,42.054 -21.235,41.841 C-21.38,41.746 -21.528000000000002,41.647 -21.699,41.534 C-21.509,41.363 -21.471999999999998,41.013999999999996 -21.092,41.129 C-21.073,41.135 -21.005,40.998999999999995 -20.968,40.925 C-20.796,40.58 -20.529,40.494 -20.198,40.648 C-19.942,40.439 -19.702,40.243 -19.431,40.021 C-19.498,39.935 -19.57,39.841 -19.675,39.704 C-19.28,39.591 -19.112,39.378 -19.465,39.027 C-18.494,38.863 -17.674,37.861999999999995 -17.711,36.946 C-17.715999999999998,36.833999999999996 -17.715999999999998,36.648 -17.659,36.621 C-17.101,36.355000000000004 -16.929,35.605 -16.267,35.497 C-15.812,35.423 -15.553,35.184 -15.486,34.733 C-15.328000000000001,34.717999999999996 -15.200000000000001,34.706 -15.108,34.697 C-14.822000000000001,33.932 -14.3,33.407000000000004 -13.644,33.027 C-13.292,32.823 -12.973999999999998,32.675 -13.075,32.174 C-13.094999999999999,32.074 -12.934000000000001,31.849 -12.826,31.826 C-12.212,31.696 -11.729,31.376 -11.234,30.997 C-10.368,30.333 -9.241,30.394000000000002 -8.299,30.954 C-7.619999999999999,31.357 -6.849,31.611 -6.187,32.037 C-5.199,32.673 -4.008,32.983 -3.191,33.887 C-2.937,34.168 -2.699,34.465 -2.48,34.774 C-2.132,35.265 -1.768,35.75 -1.479,36.275 C-1.0210000000000001,37.108 -0.625,37.975 -0.193,38.822 C-0.028999999999999998,39.144000000000005 -0.229,39.359 -0.374,39.6 C-0.499,39.808 -0.6,40.031 -0.733,40.233 C-0.845,40.403 -0.969,40.574 -1.119,40.71 C-1.742,41.275 -2.211,41.949 -2.658,42.659 C-3.028,43.247 -3.522,43.76 -3.985,44.285 C-4.474,44.839999999999996 -4.97,45.392 -5.503,45.904 C-5.857,46.24400000000001 -6.2749999999999995,46.516999999999996 -6.677,46.803 C-6.7749999999999995,46.872 -6.92,46.881 -7.047,46.899 C-7.14,46.913000000000004 -7.2780000000000005,46.856 -7.328,46.903 C-7.945,47.482 -8.707,47.012 -9.39,47.192 C-10.086,47.376 -10.822000000000001,47.312000000000005 -11.535,47.106 C-11.721,47.052 -11.947000000000001,47.089 -12.144,47.131 C-12.655,47.239 -13.158,47.387 -13.67,47.49 C-13.926,47.542 -14.195,47.52 -14.456,47.551 C-14.674999999999999,47.577000000000005 -14.891,47.627 -15.107,47.673 C-15.235999999999999,47.7 -15.36,47.76 -15.49,47.772 C-16.176000000000002,47.836 -16.863,47.913999999999994 -17.551,47.937 C-17.921,47.949 -18.293,47.853 -18.666,47.82 C-19.417,47.754 -20.117,47.373999999999995 -20.892,47.467 C-21.264,47.510999999999996 -21.658,47.492 -22.001,47.617 C-22.423000000000002,47.769999999999996 -22.783,47.693 -23.167,47.552 C-23.338,47.489 -23.521,47.458 -23.693,47.414zM0 0 M-22.911,34.688 C-23.380000000000003,34.843 -23.769000000000002,34.972 -24.239,35.127 C-24.295,35.1 -24.470000000000002,35.016 -24.577,34.964 C-24.951,35.324 -25.253999999999998,35.654999999999994 -25.601,35.931 C-25.744999999999997,36.044999999999995 -25.986,36.031000000000006 -26.177,36.093 C-26.447,36.18000000000001 -26.718999999999998,36.269 -26.976,36.387 C-27.160999999999998,36.472 -27.311,36.667 -27.499,36.707 C-28.320999999999998,36.883 -28.707,37.511 -29.114,38.145 C-29.317,38.461000000000006 -29.616,38.661 -30.027,38.54 C-30.931,38.274 -31.868,38.083 -32.73,37.719 C-33.791999999999994,37.27 -34.652,36.484 -35.485,35.697 C-36.438,34.796 -37.41,33.907 -38.288,32.936 C-39.065,32.077 -39.727,31.115000000000002 -40.433,30.192 C-41.024,29.419 -41.606,28.639 -42.188,27.86 C-42.348,27.645 -42.501,26.07 -42.342,25.876 C-42.205999999999996,25.711000000000002 -42,25.547 -41.799,25.503 C-41.162,25.363 -40.732,25.105 -40.504,24.408 C-40.354,23.951 -39.926,23.532 -39.526,23.221 C-38.276,22.251 -36.854,21.503 -35.344,21.146 C-34.447,20.934 -33.690999999999995,20.52 -32.885,20.182 C-32.211,19.898999999999997 -31.641000000000002,19.374 -30.975,19.063 C-30.407,18.798 -29.763,18.7 -29.161,18.502 C-28.637,18.33 -28.118000000000002,18.137 -27.608,17.927 C-26.021,17.274 -24.418,16.772 -22.657,16.871 C-21.587,16.930999999999997 -20.505000000000003,16.748 -19.434,16.803 C-18.513,16.85 -17.588,17.025 -16.69,17.244 C-15.461000000000002,17.544 -14.244,17.902 -13.046,18.308 C-12.381,18.533 -11.732999999999999,18.857 -11.145,19.24 C-10.937999999999999,19.375 -10.823,19.828 -10.853,20.117 C-10.92,20.764 -10.724,21.238 -10.353,21.774 C-9.853,22.495 -9.542,23.347 -9.163,24.149 C-9.128,24.224 -9.153,24.398 -9.209,24.434 C-9.794,24.812 -9.805,25.624 -10.479,25.985 C-10.914,26.218 -11.193,26.75 -11.526,27.161 C-11.717,27.397000000000002 -11.844000000000001,27.677 -12.239,27.643 C-12.389000000000001,27.63 -12.645,27.743000000000002 -12.696,27.864 C-12.943999999999999,28.458000000000002 -13.465,28.598999999999997 -13.988,28.83 C-14.466,29.040999999999997 -14.847000000000001,29.467 -15.281,29.785 C-15.844000000000001,30.198 -16.448,30.490000000000002 -17.177,30.489 C-17.411,30.489 -17.782,30.59 -17.854,30.751 C-18.151999999999997,31.418000000000003 -18.838,31.508000000000003 -19.344,31.85 C-19.711000000000002,32.098 -20.164,32.215999999999994 -20.561,32.425 C-20.947,32.629 -21.298,32.863 -21.412,33.355 C-21.448,33.509 -21.72,33.697 -21.898,33.713 C-22.682,33.785000000000004 -22.684,33.765 -22.866,34.511 C-22.884,34.586000000000006 -22.904,34.660000000000004 -22.911,34.688zM0 0 M12.523,-26.718 C12.349,-26.454 12.147,-26.188 11.99,-25.897 C11.779,-25.506 11.831,-24.966 11.285,-24.76 C11.205,-24.73 11.158,-24.409 11.212,-24.267 C11.334999999999999,-23.947 11.245,-23.678 11.02,-23.511 C10.644,-23.232 10.734,-22.897 10.816,-22.554 C10.974,-21.894 10.752,-21.389 10.262,-20.97 C9.950000000000001,-20.703 9.751999999999999,-20.302 9.51,-19.956 C9.426,-19.836 9.399,-19.651 9.29,-19.579 C8.504999999999999,-19.064 7.949999999999999,-18.304 7.26,-17.688 C6.866,-17.336 6.53,-16.896 6.25,-16.444 C5.9,-15.877999999999998 5.3839999999999995,-15.609 4.786,-15.487 C3.9219999999999997,-15.31 3.04,-15.244000000000002 2.168,-15.412 C1.7420000000000002,-15.494000000000002 1.323,-15.653 0.924,-15.829 C0.028000000000000025,-16.225 -0.879,-16.61 -1.734,-17.084 C-2.435,-17.472 -3.073,-17.973 -3.729,-18.439 C-4.489,-18.979 -5.234,-19.54 -5.993,-20.081 C-6.44,-20.4 -6.539,-20.922 -6.326,-21.42 C-6.119999999999999,-21.903000000000002 -6.056,-22.448 -5.848,-22.93 C-5.504,-23.729 -5.056,-24.483 -4.722,-25.285 C-4.300000000000001,-26.298000000000002 -3.5380000000000003,-27.05 -2.875,-27.882 C-2.794,-27.984 -2.696,-28.126 -2.708,-28.238 C-2.766,-28.796 -2.4029999999999996,-29.065 -2.042,-29.384 C-1.7339999999999998,-29.656 -1.5140000000000002,-30.029 -1.247,-30.349 C-0.8050000000000002,-30.878 -0.361,-31.405 0.092,-31.925 C0.20500000000000002,-32.055 0.349,-32.160000000000004 0.487,-32.267 C0.919,-32.603 1.356,-32.935 1.79,-33.27 C1.825,-33.297000000000004 1.844,-33.35 1.881,-33.366 C3.1029999999999998,-33.885 4.165,-34.775 5.54,-34.945 C5.956,-34.997 6.319999999999999,-34.985 6.664,-34.673 C6.864,-34.491 7.172000000000001,-34.43 7.429,-34.308 C7.5200000000000005,-34.265 7.670999999999999,-34.21 7.677,-34.149 C7.709,-33.811 7.933999999999999,-33.863 8.164,-33.844 C8.374,-33.827 8.584,-33.75 8.782,-33.669 C9.576,-33.342999999999996 10.065,-32.595 10.814,-32.192 C11.062,-32.058 11.188,-31.711000000000002 11.394,-31.483 C11.832,-30.998 12.326,-30.558999999999997 12.269,-29.804 C12.25,-29.554 12.357,-29.296 12.395,-29.04 C12.455,-28.637 12.312,-28.239 12.574,-27.817 C12.73,-27.566 12.552,-27.107 12.523,-26.718zM0 0 M9.234,-8.632 C10.281,-8.665 10.778,-9.347 10.362,-10.184 C10.796,-10.245 11.195,-10.348 11.595,-10.348 C12.256,-10.348 12.888,-10.256 13.576,-10.426 C14.384,-10.626 15.272,-10.524000000000001 16.125,-10.519 C17.247,-10.513 18.369,-10.475 19.491,-10.451 C19.517,-10.450000000000001 19.543000000000003,-10.459 19.568,-10.455 C20.778000000000002,-10.246 21.988000000000003,-10.032 23.199,-9.83 C23.472,-9.784 23.755,-9.796 24.031,-9.761 C24.772,-9.667 25.516,-9.586 26.25,-9.451 C26.625,-9.382 26.994,-9.235 27.343,-9.075 C28.233,-8.668999999999999 29.11,-8.237 29.992,-7.815 C30.774,-7.441000000000001 31.566000000000003,-7.085 32.332,-6.679 C32.541000000000004,-6.5680000000000005 32.665000000000006,-6.302 32.837,-6.116 C33.078,-5.8549999999999995 33.297000000000004,-5.555 33.582,-5.353 C34.267,-4.869 34.370000000000005,-4.649 34.219,-3.809 C34.096000000000004,-3.1260000000000003 33.98,-2.44 33.906,-1.75 C33.826,-1 33.336999999999996,-0.538 32.73,-0.323 C31.912999999999997,-0.03300000000000003 31.345000000000002,0.5169999999999999 30.745,1.077 C30.334,1.46 29.893,1.8370000000000002 29.405,2.107 C29.038,2.31 28.574,2.431 28.155,2.427 C27.313000000000002,2.419 26.524,2.5109999999999997 25.735,2.852 C25.313,3.034 24.77,3.0700000000000003 24.309,2.998 C23.537000000000003,2.878 22.794,2.777 22.053,3.105 C21.986,3.135 21.898,3.123 21.82,3.12 C20.821,3.079 19.821,3.0509999999999997 18.824,2.989 C18.340000000000003,2.959 17.787,3.213 17.39,2.684 C17.359,2.6430000000000002 17.097,2.798 16.936,2.829 C16.084,2.996 15.326,2.652 14.59,2.323 C13.237,1.717 12.151,0.7699999999999999 11.361,-0.489 C11.199,-0.747 11.161999999999999,-1.0790000000000002 11.026,-1.356 C10.72,-1.9780000000000002 10.318,-2.5620000000000003 10.081,-3.208 C9.626999999999999,-4.4430000000000005 9.161,-5.685 9.279,-7.052 C9.322,-7.558 9.253,-8.074 9.234,-8.632zM0 0 M-8.336,18.773 C-8.755,18.852999999999998 -9.086,18.955000000000002 -9.422,18.972 C-10.499,19.027 -11.578000000000001,19.07 -12.656,19.077 C-13.013,19.079 -13.378,18.985 -13.726,18.887 C-15.254000000000001,18.459 -16.822,18.131999999999998 -18.146,17.173 C-18.757,16.729999999999997 -19.392000000000003,16.316 -19.984,15.85 C-20.208000000000002,15.674 -20.344,15.387 -20.518,15.148 C-20.791,14.772 -21.067,14.398 -21.332,14.017 C-21.474,13.812999999999999 -21.659,13.610000000000001 -21.715,13.38 C-21.796,13.048 -21.456000000000003,13.039000000000001 -21.257,12.909 C-21.074,12.789000000000001 -20.968,12.559999999999999 -20.813,12.392 C-20.201,11.725999999999999 -19.572000000000003,11.075 -18.972,10.399 C-18.253,9.59 -17.259999999999998,9.233 -16.351,8.728 C-15.863,8.456999999999999 -15.448,8.059000000000001 -14.988,7.735 C-14.427999999999999,7.341 -13.871,6.938 -13.284,6.587 C-12.347000000000001,6.026999999999999 -11.39,5.499 -10.432,4.976 C-10.201,4.85 -9.931000000000001,4.793 -9.678,4.707 C-9.549000000000001,4.663 -9.395,4.655 -9.292,4.578 C-8.393,3.9050000000000002 -7.333,3.87 -6.282,3.794 C-6.215,3.789 -6.12,3.824 -6.083,3.79 C-5.7540000000000004,3.491 -5.413,3.479 -4.996,3.621 C-4.470000000000001,3.8 -4.112,4.153 -3.773,4.558 C-3.662,4.691 -3.522,4.814 -3.372,4.899 C-2.697,5.281 -2.234,5.7509999999999994 -2.358,6.627 C-2.47,7.419 -2.488,8.224 -2.557,9.023 C-2.5709999999999997,9.182 -2.5909999999999997,9.363 -2.675,9.49 C-2.9949999999999997,9.974 -3.2750000000000004,10.443 -3.426,11.039 C-3.6380000000000003,11.873999999999999 -4.334,12.466 -5.011,12.952 C-5.457,13.272 -5.443,13.819 -5.861,14.13 C-6.342,14.488000000000001 -6.827,14.89 -7.166,15.375 C-7.603000000000001,16 -8.300999999999998,16.363 -8.633,17.119 C-8.866999999999999,17.652 -8.511000000000001,17.939 -8.486,18.342 C-8.479000000000001,18.448 -8.416,18.551 -8.336,18.773zM0 0 M10.897,21.827 C11.64,22.373 12.395999999999999,22.904 13.123,23.471 C14.296,24.384 15.463999999999999,25.305999999999997 16.607,26.255 C17.451,26.956 18.367,27.561 18.949,28.572 C19.315,29.208 20.002,29.653 20.499,30.223 C21.101,30.913999999999998 21.666,31.637999999999998 22.228,32.363 C22.808,33.111 23.368,33.875 23.927,34.639 C24.104,34.882000000000005 24.321,35.129999999999995 24.393,35.409 C24.607,36.24 24.954,37.047000000000004 24.722,37.963 C24.639000000000003,38.293 24.823,38.722 24.969,39.071 C25.431,40.18 25.186,41.191 24.605,42.165 C24.544,42.268 24.429000000000002,42.373000000000005 24.318,42.404 C23.696,42.577000000000005 23.059,42.699999999999996 22.445,42.897 C22.080000000000002,43.013999999999996 21.849,42.921 21.64,42.64 C21.336000000000002,42.232 20.98,42.010999999999996 20.415,42.04 C20.06,42.058 19.564,41.909 19.357,41.652 C18.967,41.17 18.459,41.033 17.941,40.851 C17.843999999999998,40.817 17.688000000000002,40.793 17.664,40.727 C17.356,39.885 16.368,39.826 15.897,39.175 C15.568,38.721 15.035,38.567 14.583,38.287 C14.046,37.954 13.633000000000001,37.424 13.159,36.985 C13.07,36.903 12.921000000000001,36.771 12.852,36.798 C12.290000000000001,37.018 12.052,36.561 11.775,36.27 C11.189,35.652 10.721,34.943 9.974,34.454 C9.456,34.115 9.096,33.532 8.666,33.058 C8.287,32.641 7.936999999999999,32.193 7.523,31.815 C6.593,30.966 6.269,29.934 6.269,28.687 C6.269,26.787000000000003 6.555000000000001,24.962 7.4,23.262 C7.69,22.679000000000002 8.11,22.124000000000002 8.588,21.684 C8.931999999999999,21.368000000000002 9.459,21.217 9.971,21.522 C10.239,21.680999999999997 10.534,21.794 10.817,21.928 C10.844,21.894000000000002 10.871,21.860000000000003 10.897,21.827zM0 0 M-3.855,20.951 C-3.634,20.755 -3.4250000000000003,20.571 -3.221,20.384 C-3.193,20.358 -3.176,20.308999999999997 -3.172,20.269 C-3.083,19.433 -2.551,18.909 -1.938,18.407 C-1.539,18.08 -1.244,17.629 -0.862,17.277 C-0.32399999999999995,16.781000000000002 0.19699999999999995,16.231 0.824,15.88 C1.394,15.561 1.972,15.188 2.645,15.067 C2.789,15.041 2.928,14.989 3.072,14.96 C3.511,14.872000000000002 3.9480000000000004,14.784 4.389,14.708 C4.767,14.643 4.908,14.722 5.094,15.057 C5.1290000000000004,15.121 5.165,15.215 5.22,15.232 C5.814,15.418999999999999 6.033,16.047 6.535,16.338 C6.599,16.375 6.659,16.417 6.761,16.481 C6.688,16.590000000000003 6.641,16.699 6.562,16.774 C6.328,16.994 6.057,17.179000000000002 5.849,17.42 C5.7330000000000005,17.555000000000003 5.72,17.776 5.649,17.953 C5.585,18.112 5.537000000000001,18.296000000000003 5.424,18.414 C5.1080000000000005,18.745 4.7410000000000005,19.029 4.434,19.367 C4.1000000000000005,19.734 3.816,20.145 3.501,20.53 C3.4099999999999997,20.642 3.3040000000000003,20.755000000000003 3.18,20.824 C2.6,21.146 2.021,21.472 1.423,21.759 C1.038,21.944 0.612,22.045 0.22,22.218 C-0.277,22.438 -0.77,22.312 -1.266,22.253 C-1.322,22.246 -1.391,22.226000000000003 -1.425,22.187 C-1.747,21.822000000000003 -2.225,21.833 -2.633,21.679 C-2.716,21.648 -2.804,21.619999999999997 -2.875,21.569 C-3.142,21.377 -3.338,21.064 -3.733,21.091 C-3.7760000000000002,21.094 -3.826,20.986 -3.855,20.951zM0 0 M-51.468,10.469 C-50.858000000000004,10.556 -50.278,10.606000000000002 -49.714,10.726 C-48.85,10.909 -47.997,11.142999999999999 -47.138,11.35 C-46.803999999999995,11.43 -46.463,11.485000000000001 -46.131,11.573 C-45.931,11.626000000000001 -45.742999999999995,11.719999999999999 -45.55,11.799 C-45.263999999999996,11.917 -44.986,12.059000000000001 -44.693,12.153 C-44.330999999999996,12.270000000000001 -44.169000000000004,12.477 -44.155,12.871 C-44.148,13.076 -44.083000000000006,13.279 -44.069,13.485 C-44.057,13.661999999999999 -44.044,13.854000000000001 -44.096,14.018 C-44.172,14.259 -44.297000000000004,14.487 -44.42,14.71 C-44.468,14.797 -44.562,14.908000000000001 -44.646,14.919 C-45.048,14.971 -45.268,15.241000000000001 -45.501,15.531 C-45.949999999999996,16.09 -46.62,16.182 -47.272,16.288 C-47.351,16.301000000000002 -47.439,16.236 -47.524,16.233 C-47.692,16.228 -47.882999999999996,16.193 -48.022,16.259 C-48.207,16.347 -48.358000000000004,16.38 -48.569,16.348 C-49.055,16.275 -49.556999999999995,16.301 -50.038,16.212 C-50.656,16.097 -51.33,16.093999999999998 -51.802,15.572 C-51.97,15.386 -52.178999999999995,15.201 -52.26,14.977 C-52.480999999999995,14.365 -52.691,13.741 -52.813,13.104 C-52.887,12.716999999999999 -52.793,12.296 -52.769,11.891 C-52.753,11.622 -52.718,11.353 -52.709,11.084 C-52.695,10.677999999999999 -52.542,10.523000000000001 -52.142,10.627 C-51.848000000000006,10.703000000000001 -51.614000000000004,10.719 -51.468,10.469zM0 0 M-1.839,-36.744 C-1.467,-36.252 -1.092,-35.809 -0.776,-35.326 C-0.29200000000000004,-34.587 0.14799999999999996,-33.819 0.612,-33.067 C0.792,-32.774 0.996,-32.496 1.169,-32.2 C1.2730000000000001,-32.021 1.3419999999999999,-31.821 1.422,-31.629 C1.5419999999999998,-31.344 1.639,-31.048000000000002 1.78,-30.774 C1.955,-30.436 1.924,-30.175 1.656,-29.886 C1.516,-29.735 1.419,-29.546 1.284,-29.39 C1.168,-29.256 1.043,-29.110999999999997 0.89,-29.031 C0.666,-28.913999999999998 0.417,-28.84 0.172,-28.768 C0.07599999999999998,-28.740000000000002 -0.067,-28.727 -0.135,-28.779 C-0.457,-29.025 -0.803,-28.990000000000002 -1.173,-28.948 C-1.8860000000000001,-28.868000000000002 -2.426,-29.275 -2.963,-29.659 C-3.028,-29.706 -3.0450000000000004,-29.814 -3.103,-29.876 C-3.2180000000000004,-29.998 -3.329,-30.157 -3.475,-30.208 C-3.668,-30.276 -3.7990000000000004,-30.359 -3.926,-30.53 C-4.219,-30.924 -4.593,-31.259 -4.872,-31.662 C-5.229,-32.179 -5.706,-32.657 -5.673,-33.36 C-5.6610000000000005,-33.611 -5.679,-33.888 -5.578,-34.104 C-5.303,-34.694 -5.013,-35.285000000000004 -4.65,-35.823 C-4.430000000000001,-36.15 -4.066,-36.381 -3.763,-36.652 C-3.562,-36.832 -3.3480000000000003,-36.998 -3.152,-37.183 C-2.8560000000000003,-37.461 -2.639,-37.463 -2.428,-37.107 C-2.273,-36.846 -2.1189999999999998,-36.67 -1.839,-36.744zM0 0 M-19.013,2.411 C-18.479000000000003,2.5100000000000002 -17.835,2.6300000000000003 -17.19,2.748 C-16.866,2.8070000000000004 -16.54,2.856 -16.218,2.924 C-15.987,2.973 -15.761,3.0460000000000003 -15.533,3.107 C-15.461,3.1260000000000003 -15.379,3.17 -15.317,3.152 C-14.944,3.043 -14.777000000000001,3.303 -14.585,3.533 C-14.461,3.682 -14.339,3.844 -14.183,3.953 C-13.874,4.169 -13.748999999999999,4.456 -13.735,4.82 C-13.721,5.162 -13.678999999999998,5.503 -13.652,5.845 C-13.623,6.21 -13.831,6.491 -14.071,6.696 C-14.368,6.949999999999999 -14.725999999999999,7.1450000000000005 -15.081,7.314 C-15.315999999999999,7.426 -15.593,7.449 -15.852,7.51 C-16.01,7.547 -16.173000000000002,7.567 -16.326,7.62 C-16.822,7.792 -17.269000000000002,7.823 -17.745,7.482 C-18.057000000000002,7.258 -18.474,7.128 -18.861,7.071 C-19.708000000000002,6.946 -20.308,6.48 -20.826,5.847 C-21.077,5.54 -21.285,5.232 -21.31,4.814 C-21.323999999999998,4.583 -21.454,4.362 -21.489,4.13 C-21.546,3.752 -21.604999999999997,3.367 -21.589,2.988 C-21.578,2.726 -21.301,2.667 -21.075,2.631 C-20.843999999999998,2.5949999999999998 -20.61,2.584 -20.377,2.559 C-19.962999999999997,2.515 -19.548000000000002,2.469 -19.013,2.411zM0 0 M-10.128,-19.349 C-10.286,-19.349 -10.364,-19.324 -10.403,-19.353 C-10.786000000000001,-19.641000000000002 -10.996,-19.415000000000003 -11.226,-19.12 C-11.467,-18.810000000000002 -11.783,-18.573999999999998 -12.022,-18.243 C-12.268,-17.901999999999997 -12.67,-17.634 -13.058,-17.45 C-13.246,-17.361 -13.582999999999998,-17.492 -13.809,-17.607 C-14.048,-17.729 -14.253,-17.901 -14.541,-17.922 C-14.65,-17.93 -14.779,-18.001 -14.854,-18.084 C-15.331,-18.605999999999998 -15.839999999999998,-19.102 -16.188,-19.731 C-16.31,-19.950000000000003 -16.336,-20.133000000000003 -16.182,-20.353 C-15.998,-20.617 -15.853,-20.909 -15.687,-21.185 C-15.633,-21.275 -15.581999999999999,-21.394000000000002 -15.498,-21.434 C-14.981,-21.679000000000002 -14.828,-22.253999999999998 -14.417,-22.601 C-14.165,-22.814 -14.013,-23.142 -13.794,-23.398 C-13.506,-23.733999999999998 -13.197000000000001,-24.052 -12.894,-24.375 C-12.712,-24.569 -12.312,-24.625 -12.013,-24.431 C-11.59,-24.157 -11.21,-23.819000000000003 -10.798,-23.527 C-10.133,-23.055 -9.806000000000001,-22.307000000000002 -9.303,-21.704 C-9.078000000000001,-21.434 -8.965,-21.054 -8.863,-20.706 C-8.763,-20.362 -9.031,-19.846 -9.372,-19.744 C-9.588,-19.679 -9.738,-19.573999999999998 -9.895,-19.433 C-9.972999999999999,-19.363 -10.109,-19.355 -10.128,-19.349zM0 0 M29.14,-21.623 C29.14,-21.868000000000002 29.088,-22.051 29.149,-22.183 C29.332,-22.581 29.201,-22.953 29.124,-23.336 C29.044999999999998,-23.729 29.127000000000002,-23.864 29.518,-24.082 C29.592000000000002,-24.124000000000002 29.689,-24.183 29.709,-24.253 C29.806,-24.596 30.059,-24.752 30.366,-24.868 C30.723,-25.003 31.042,-25.177999999999997 31.16,-25.595 C31.186,-25.686999999999998 31.359,-25.75 31.475,-25.8 C31.675,-25.887 31.885000000000005,-25.953 32.09,-26.029 C32.543000000000006,-26.196 32.742999999999995,-26.609 32.983,-26.974 C33.156,-27.236 33.422999999999995,-27.315 33.681,-27.431 C34.062,-27.602 34.510000000000005,-27.707 34.798,-27.979 C35.159,-28.319 35.456,-28.769000000000002 35.651,-29.228 C35.830000000000005,-29.650000000000002 36.16,-29.735 36.5,-29.868 C36.566,-29.894 36.687000000000005,-29.845 36.719,-29.883 C36.959,-30.168 37.237,-30.000999999999998 37.518,-30.014 C38.031,-30.038 38.317,-29.641 38.73,-29.494 C38.961,-29.412 39.08,-29.032999999999998 39.269,-28.804 C39.436,-28.601 39.498999999999995,-28.372 39.44,-28.132 C39.405,-27.991000000000003 39.302,-27.848000000000003 39.191,-27.748 C38.650000000000006,-27.26 38.006,-26.948 37.342,-26.654 C36.381,-26.229 35.446999999999996,-25.745 34.501,-25.286 C33.964999999999996,-25.026 33.415,-24.791 32.896,-24.502 C32.274,-24.156 31.642,-23.808999999999997 31.087,-23.371 C30.807,-23.15 30.455000000000002,-22.866 30.535,-22.358 C30.554,-22.236 30.264,-22.017 30.076,-21.922 C29.821,-21.793 29.527,-21.742 29.14,-21.623zM0 0 M9.886,-4.971 C9.918999999999999,-4.901 9.946,-4.873 9.943,-4.848 C9.885,-4.308 10.153,-3.907 10.417,-3.46 C10.687,-3.003 10.567,-2.3729999999999998 10.92,-1.91 C10.937,-1.887 10.913,-1.821 10.892,-1.783 C10.677999999999999,-1.391 10.937999999999999,-1.128 11.196,-0.95 C11.39,-0.816 11.450000000000001,-0.716 11.368,-0.522 C11.224,-0.181 11.326,0.13 11.491,0.421 C11.674999999999999,0.747 11.682,1.098 11.704,1.453 C11.718,1.6740000000000002 11.753,1.896 11.809,2.11 C11.863999999999999,2.319 11.827,2.525 11.677,2.631 C11.574,2.7039999999999997 11.359,2.6830000000000003 11.221,2.632 C10.221,2.2590000000000003 9.307,1.735 8.458,1.084 C7.763,0.551 7.037,0.059 6.326,-0.453 C6.217,-0.532 6.109,-0.616 6.011,-0.708 C5.871,-0.839 5.859,-0.998 5.956,-1.159 C6.299,-1.729 6.6259999999999994,-2.312 6.997,-2.864 C7.45,-3.537 8.027000000000001,-4.101 8.627,-4.647 C9.004000000000001,-4.989 9.408,-5.047 9.886,-4.971zM0 0 M-23.997,-24.567 C-23.91,-24.454 -23.823,-24.342000000000002 -23.771,-24.274 C-22.835,-24.061 -21.925,-23.889000000000003 -21.038,-23.635 C-20.697,-23.537000000000003 -20.411,-23.25 -20.096,-23.057 C-19.96,-22.974 -19.819,-22.887999999999998 -19.668,-22.842 C-19.375999999999998,-22.753 -19.124,-22.418 -19.259,-22.163 C-19.467,-21.77 -19.556,-21.287000000000003 -19.988,-21.036 C-20.051,-20.999000000000002 -20.116,-20.933 -20.179,-20.935 C-20.712,-20.95 -21.253,-20.843999999999998 -21.77,-21.101 C-22.073999999999998,-21.252 -22.416999999999998,-21.323 -22.735,-21.448 C-22.852999999999998,-21.494 -22.965,-21.579 -23.054,-21.671 C-23.209,-21.83 -23.319000000000003,-22.039 -23.492,-22.172 C-23.982,-22.548000000000002 -24.161,-23.031 -24.106,-23.634 C-24.079,-23.929000000000002 -24.101,-24.228 -24.101,-24.526 C-24.066,-24.54 -24.032,-24.553 -23.997,-24.567zM0 0 M25.406,-14.408 C25.493,-14.295 25.580000000000002,-14.182 25.632,-14.115 C26.568,-13.902000000000001 27.477999999999998,-13.73 28.365,-13.476 C28.706,-13.378 28.991999999999997,-13.091 29.307,-12.898 C29.442999999999998,-12.815 29.584,-12.729 29.735,-12.683 C30.027,-12.594 30.279,-12.259 30.144,-12.004 C29.936,-11.610999999999999 29.846999999999998,-11.128 29.415,-10.877 C29.352,-10.84 29.287,-10.774 29.224,-10.776 C28.691,-10.791 28.15,-10.685 27.633,-10.942 C27.329,-11.093 26.986,-11.164 26.668,-11.289 C26.55,-11.334999999999999 26.438,-11.42 26.349,-11.512 C26.194,-11.671000000000001 26.083000000000002,-11.881 25.911,-12.013 C25.421000000000003,-12.389 25.242,-12.873 25.297,-13.475 C25.324,-13.77 25.302,-14.07 25.302,-14.368 C25.337,-14.382 25.371,-14.394 25.406,-14.408zM0 0 M44.4,-7.125 C44.882,-7.035 45.237,-6.967 45.593,-6.903 C46.416000000000004,-6.755 47.195,-6.876 47.935,-7.272 C48.069,-7.344 48.253,-7.433 48.376,-7.395 C49.268,-7.117999999999999 50.193,-7.273 51.088,-7.143 C51.469,-7.088 51.804,-6.715 52.302,-6.395 C51.973,-6.287999999999999 51.800999999999995,-6.216 51.623,-6.179 C50.498,-5.945 49.37,-5.72 48.245,-5.486 C48.07,-5.45 47.894,-5.398 47.733,-5.322 C46.846,-4.904 45.922,-4.551 45.129,-3.957 C44.708999999999996,-3.642 44.203,-3.485 43.837,-3.036 C43.61600000000001,-2.7640000000000002 43.065999999999995,-2.759 42.544,-2.597 C42.623999999999995,-3.723 42.326,-4.8149999999999995 43.404,-5.547 C43.510000000000005,-5.619 43.586999999999996,-5.7459999999999996 43.656,-5.861 C43.906,-6.2749999999999995 44.147999999999996,-6.695 44.4,-7.125zM0 0 M35.495,9.709 C36.004,9.571 36.588,9.542 36.997,9.26 C37.319,9.038 37.691,8.275 37.581,8.147 C37.108000000000004,7.596 37.144,7.064 37.542,6.636 C38.007000000000005,6.1370000000000005 38.589,5.5200000000000005 39.19,5.431 C40.028999999999996,5.308 41.137,5.349 41.765,5.814 C43.053,6.766 44.452,6.746 45.861,6.782 C47.001,6.811 47.73,7.263 48.354,8.203 C49.385,9.758 50.549,11.224 51.641,12.739 C51.861,13.044 52.034,13.39 52.182,13.737 C52.887,15.385 51.909,16.727 50.082,16.591 C49.647,16.559 49.205,16.416 48.799,16.248 C45.247,14.776000000000002 41.69,13.312 38.162,11.785 C37.159,11.351 36.244,10.714 35.288,10.17 C35.357,10.016 35.425999999999995,9.863 35.495,9.709zM0 0 M-19.747,-29.469 C-19.238,-29.607000000000003 -18.654,-29.636 -18.245,-29.918 C-17.923000000000002,-30.14 -17.551000000000002,-30.903 -17.661,-31.031 C-18.134,-31.581999999999997 -18.099,-32.114000000000004 -17.7,-32.542 C-17.235,-33.041000000000004 -16.653,-33.658 -16.052,-33.747 C-15.213,-33.87 -14.104000000000001,-33.828 -13.476,-33.363 C-12.189,-32.411 -10.790000000000001,-32.431000000000004 -9.381,-32.395 C-8.241,-32.366 -7.512,-31.916 -6.888,-30.975 C-5.857,-29.42 -4.693,-27.954 -3.601,-26.439 C-3.381,-26.134 -3.2070000000000003,-25.788 -3.059,-25.441 C-2.354,-23.793 -3.333,-22.451 -5.16,-22.587 C-5.594,-22.62 -6.0360000000000005,-22.762 -6.442,-22.93 C-9.994,-24.402 -13.551,-25.865 -17.079,-27.392 C-18.082,-27.826 -18.997,-28.463 -19.953,-29.007 C-19.884,-29.161 -19.816,-29.315 -19.747,-29.469zM0 0 M-12.422,-11.895 C-12.109,-11.584 -11.956,-11.241999999999999 -11.881,-10.847 C-11.847,-10.668 -11.743,-10.493 -11.638,-10.339 C-11.329,-9.887 -11.138,-9.358 -10.691,-8.992 C-10.513,-8.846 -10.29,-8.67 -10.347,-8.355 C-10.359,-8.291 -10.197,-8.210999999999999 -10.161,-8.12 C-10.118,-8.011999999999999 -10.072000000000001,-7.8389999999999995 -10.124,-7.779 C-10.186,-7.708 -10.392,-7.6690000000000005 -10.466,-7.719 C-10.671,-7.8580000000000005 -10.898,-8.018999999999998 -11.008,-8.229 C-11.126999999999999,-8.456 -11.234,-8.645 -11.438,-8.823 C-11.686,-9.038 -11.838000000000001,-9.365 -12.025,-9.648 C-12.099,-9.759 -12.138,-9.898 -12.225,-9.995 C-12.334999999999999,-10.117999999999999 -12.339,-10.23 -12.34,-10.391 C-12.341,-10.602 -12.435,-10.825 -12.535,-11.019 C-12.745000000000001,-11.425 -12.751000000000001,-11.477 -12.422,-11.895zM0 0 M21.322,-19.841 C21.354,-19.598000000000003 21.384999999999998,-19.36 21.406,-19.203 C22.169999999999998,-19.104 22.889,-19.011 24.056,-18.86 C22.881,-17.212 21.971999999999998,-15.863 20.964,-14.594 C20.796999999999997,-14.383 20.086,-14.348999999999998 19.813,-14.524 C18.802,-15.172999999999998 18.16,-17.458000000000002 18.411,-18.649 C18.596,-19.527 18.986,-19.826999999999998 19.864,-19.709 C20.329,-19.646 20.822,-19.789 21.322,-19.841zM0 0 M8.363,-39.285 C8.24,-39.324999999999996 8.132,-39.36000000000001 8.023,-39.395 C7.995,-39.352000000000004 7.946,-39.311 7.941,-39.265 C7.888,-38.817 7.86,-38.367 7.847,-37.916 C7.836,-37.535 7.912999999999999,-37.178 8.135,-36.855 C8.296,-36.620999999999995 8.431000000000001,-36.367999999999995 8.608,-36.071 C8.688,-36.043 8.835,-36.018 8.954,-35.946 C9.149000000000001,-35.827 9.362,-35.707 9.499,-35.534 C9.672,-35.315 9.766,-35.035999999999994 9.912,-34.794 C10.06,-34.55 10.23,-34.319 10.396,-34.073 C10.314,-33.914 10.257,-33.783 10.183,-33.664 C10.107,-33.543 10.014,-33.431999999999995 9.898,-33.275 C9.623,-33.436 9.362,-33.589 9.062,-33.765 C8.995,-33.608000000000004 8.95,-33.482 8.889,-33.365 C8.831999999999999,-33.256 8.637,-33.254 8.616,-33.366 C8.520999999999999,-33.874 8.124,-34.17400000000001 7.851,-34.581 C7.803,-34.498000000000005 7.741,-34.437 7.754,-34.407 C7.81,-34.276999999999994 7.8629999999999995,-34.132999999999996 7.96,-34.037 C8.27,-33.732 8.354000000000001,-33.353 8.377,-32.888 C8.267000000000001,-32.894 8.146,-32.864999999999995 8.066,-32.91 C7.793000000000001,-33.065 7.535,-33.245 7.24,-33.436 C7.046,-33.433 6.824,-33.139 6.563,-33.414 C6.5169999999999995,-33.463 6.340999999999999,-33.43 6.249,-33.385 C6.045,-33.287 5.886,-33.088 5.597,-33.136 C5.448,-33.27 5.28,-33.421 5.104,-33.579 C4.982,-33.467 4.8839999999999995,-33.378 4.752,-33.257 C4.566,-33.381 4.3790000000000004,-33.506 4.192,-33.63 C4.098,-33.692 4.006,-33.800000000000004 3.907,-33.807 C3.363,-33.847 3.034,-34.24 2.675,-34.56 C2.1149999999999998,-35.06 1.501,-35.478 0.875,-35.886 C0.49,-36.137 0.12399999999999997,-36.418 -0.232,-36.708 C-0.466,-36.899 -0.5499999999999999,-37.175999999999995 -0.581,-37.477 C-0.6769999999999999,-38.410999999999994 -0.618,-39.33 -0.292,-40.213 C-0.09199999999999997,-40.756 0.09100000000000001,-41.299 0.195,-41.871 C0.262,-42.238 0.37,-42.601 0.628,-42.899 C0.853,-43.159 0.7400000000000001,-43.597 1.086,-43.801 C1.167,-44.209 1.5270000000000001,-44.442 1.715,-44.79 C1.8860000000000001,-45.108 2.2279999999999998,-45.33 2.48,-45.608 C2.751,-45.906 3.008,-46.218 3.266,-46.527 C3.5060000000000002,-46.815 3.731,-47.116 3.981,-47.395 C4.14,-47.572 4.237,-47.86 4.601,-47.722 C4.784,-47.652 5.022,-47.949 5.223,-47.69 C5.644,-47.671 5.952999999999999,-47.42700000000001 6.292,-47.209 C7.511,-46.42400000000001 8.418,-45.358999999999995 9.161,-44.135 C9.235999999999999,-44.010999999999996 9.287,-43.87 9.378,-43.76 C9.773,-43.283 9.698,-42.741 9.613,-42.196 C9.581999999999999,-42 9.49,-41.8 9.51,-41.611 C9.56,-41.141999999999996 9.343,-40.778999999999996 9.114,-40.416 C8.886000000000001,-40.053999999999995 8.641,-39.702999999999996 8.363,-39.285zM0 0 M24.464,-27.267 C24.604999999999997,-26.9 24.799,-26.526 24.566,-26.119 C24.541999999999998,-26.078 24.548000000000002,-25.995 24.574,-25.953 C24.933,-25.369 24.367,-25.085 24.166,-24.684 C23.849,-24.634 23.708,-24.265 23.342,-24.26 C23.169999999999998,-24.257 22.991999999999997,-24.081999999999997 22.83,-23.967 C22.647,-23.837 22.477999999999998,-23.686 22.29,-23.534 C22.038999999999998,-23.698999999999998 21.827,-23.839 21.606,-23.985 C21.07,-23.631 20.564999999999998,-23.836000000000002 20.069,-24.056 C19.837,-24.159000000000002 19.631,-24.319 19.4,-24.428 C19.081,-24.578 19.005000000000003,-24.903 18.856,-25.169 C18.616000000000003,-25.169 18.340999999999998,-25.085 18.191,-25.186 C17.891,-25.388 17.479000000000003,-25.442 17.309,-25.842 C17.182000000000002,-26.141 16.935,-26.341 16.619,-26.459 C16.525,-26.494 16.435,-26.595 16.386,-26.688 C16.163,-27.112 15.816,-27.41 15.435,-27.68 C15.104000000000001,-27.914 14.777,-28.151 14.45,-28.39 C14.309999999999999,-28.492 14.168,-28.595000000000002 14.042,-28.713 C13.499,-29.223000000000003 13.445,-29.564 13.811,-30.246 C14.261,-31.084999999999997 14.717,-31.921 15.178,-32.754 C15.260000000000002,-32.902 15.360000000000001,-33.053 15.486,-33.163 C15.860000000000001,-33.492 16.189999999999998,-33.867 16.383,-34.315 C16.553,-34.708 16.933,-34.866 17.167,-35.179 C17.241000000000003,-35.278 17.493,-35.224 17.63,-35.3 C17.881,-35.44 18.106,-35.625 18.349,-35.795 C18.708,-35.804 19.003,-35.683 19.315,-35.499 C19.756,-35.238 20.241,-35.041999999999994 20.726,-34.867 C21.051,-34.75 21.322,-34.558 21.426,-34.267 C21.558999999999997,-33.895 21.831000000000003,-33.725 22.129,-33.548 C22.555,-33.295 22.968999999999998,-33.005 23.203,-32.567 C23.357,-32.279 23.561999999999998,-32.069 23.787,-31.852 C23.991999999999997,-31.653 24.14,-31.395000000000003 24.348,-31.199 C24.942,-30.639000000000003 25.207,-29.897 25.327,-29.148 C25.426000000000002,-28.53 25.298000000000002,-27.867 24.655,-27.478 C24.585,-27.436 24.54,-27.352 24.464,-27.267zM0 0 M-49.221,-15.333 C-49.44,-15.5 -49.618,-15.636 -49.805,-15.779 C-49.747,-15.84 -49.714,-15.902999999999999 -49.684,-15.902 C-49.022,-15.878 -48.36,-15.847999999999999 -47.698,-15.815 C-47.438,-15.802 -47.18,-15.768 -46.92,-15.765 C-46.486000000000004,-15.76 -46.063,-15.711 -45.637,-15.61 C-45.107,-15.485 -44.562999999999995,-15.369 -43.971,-15.546 C-43.913999999999994,-15.402999999999999 -43.864,-15.278 -43.805,-15.13 C-43.443,-14.99 -43,-15.203 -42.65,-14.931 C-42.132999999999996,-14.949 -41.739000000000004,-14.622000000000002 -41.286,-14.46 C-41.011,-14.361 -40.909,-14.155 -40.797,-13.924 C-40.678999999999995,-14.224 -40.565999999999995,-14.512 -40.437,-14.839 C-40.297,-14.757 -40.128,-14.716000000000001 -40.068,-14.611 C-39.986,-14.47 -39.854,-14.456000000000001 -39.672,-14.39 C-39.863,-14.190000000000001 -40.015,-14.033 -40.18,-13.86 C-39.931,-13.474 -39.632000000000005,-13.193 -39.206,-13.042 C-39.116,-13.092 -39.016,-13.148 -38.913,-13.206 C-38.638999999999996,-12.966 -38.316,-12.76 -38.296,-12.338 C-37.932,-12.175999999999998 -37.872,-11.783000000000001 -37.671,-11.499 C-37.474,-11.22 -37.311,-10.916 -37.11,-10.586 C-37.239,-10.499 -37.376,-10.406 -37.532,-10.301 C-37.135999999999996,-9.938 -37.411,-9.520000000000001 -37.436,-9.117 C-37.437,-9.093000000000002 -37.464,-9.057 -37.487,-9.05 C-37.677,-8.993 -37.842,-8.915 -37.876,-8.686 C-37.879,-8.665 -37.981,-8.642 -38.034,-8.649 C-38.176,-8.667 -38.316,-8.700000000000001 -38.444,-8.724 C-38.739000000000004,-8.562 -38.986999999999995,-8.391 -38.821,-8.003 C-39.038,-7.832 -39.24,-7.673 -39.439,-7.517 C-39.634,-7.508 -39.884,-7.632000000000001 -39.975,-7.389 C-40.038000000000004,-7.219 -39.987,-7.006 -39.987,-6.788 C-40.284,-6.458 -40.644000000000005,-6.4990000000000006 -40.965,-6.759 C-41.153000000000006,-6.912 -41.282999999999994,-6.797 -41.48,-6.768 C-41.58,-6.9079999999999995 -41.677,-7.074000000000001 -41.804,-7.214 C-42.051,-7.484 -42.199,-7.463 -42.483,-7.143 C-42.501999999999995,-7.122 -42.527,-7.107 -42.549,-7.089 C-42.577,-7.096 -42.607,-7.098 -42.633,-7.109 C-42.781000000000006,-7.169 -42.917,-7.368 -43.089,-7.206 C-43.25,-7.054 -43.263999999999996,-6.854 -43.141,-6.656 C-43.1,-6.59 -43.071999999999996,-6.515000000000001 -43.01,-6.386 C-43.222,-6.436 -43.379,-6.493 -43.54,-6.506 C-43.676,-6.517 -43.815999999999995,-6.476999999999999 -43.958,-6.459 C-44.016999999999996,-6.579 -44.066,-6.679 -44.109,-6.767 C-44.160000000000004,-6.71 -44.230000000000004,-6.588 -44.267,-6.597 C-44.848000000000006,-6.7410000000000005 -45.45099999999999,-6.757 -46.032,-6.93 C-46.413,-7.044 -46.633,-7.361000000000001 -46.981,-7.488 C-47.356,-7.625 -47.418,-7.984000000000001 -47.559,-8.294 C-47.665,-8.526 -47.781,-8.745 -47.997,-8.923 C-48.211,-9.1 -48.342999999999996,-9.375 -48.516,-9.604 C-48.687,-9.83 -48.914,-10.030999999999999 -49.024,-10.283 C-49.136,-10.538 -49.11,-10.85 -49.187,-11.125 C-49.400999999999996,-11.888 -49.384,-12.666 -49.397,-13.445 C-49.400999999999996,-13.705 -49.39,-13.967 -49.422,-14.223 C-49.491,-14.784 -49.501,-14.783 -49.221,-15.333zM0 0 M50.082,34.078 C49.941,34.06 49.8,34.042 49.675,34.026 C49.574,34.190000000000005 49.474000000000004,34.354 49.383,34.502 C49.099000000000004,34.463 49.186,34.222 49.082,34.1 C48.928,33.919000000000004 48.68,33.896 48.579,34.094 C48.452,34.343 48.346000000000004,34.602000000000004 48.216,34.89 C48.112,34.79 48.043,34.692 47.948,34.636 C47.776,34.534000000000006 47.595,34.434 47.405,34.631 C47.373000000000005,34.664 47.256,34.631 47.188,34.603 C47.167,34.595 47.157000000000004,34.476 47.182,34.454 C47.436,34.235 47.387,34.012 47.204,33.78 C46.985,33.651 46.836000000000006,33.862 46.651,33.897 C46.496,33.927 46.315,33.755 46.147,34.006 C46.065999999999995,33.873 46.007,33.754000000000005 45.928,33.651 C45.826,33.519000000000005 45.719,33.312999999999995 45.594,33.297 C45.38,33.269 45.428999999999995,33.103 45.346,33.016 C45.229,32.893 45.093,32.783 44.947,32.697 C44.199000000000005,32.255 43.555,31.695 43.018,31.012 C42.93,30.900000000000002 42.821,30.801 42.711,30.709 C42.326,30.387 42.071,29.967000000000002 41.821,29.545 C41.625,29.214000000000002 41.54,28.873 41.628,28.472 C41.719,28.053 41.714,27.614 41.771,27.186 C41.902,26.203 42.253,25.293 42.709,24.419 C42.787000000000006,24.269000000000002 42.815,24.083 43.01,24.022 C43.33,23.923 43.537,23.574 43.926,23.623 C44.124,23.648 44.327000000000005,23.646 44.551,23.657 C44.657000000000004,23.534 44.783,23.413 44.875,23.271 C44.948,23.158 44.906,22.976 45.083,22.921 C45.232,23.029 45.354000000000006,23.236 45.581,23.032 C45.663000000000004,22.959 45.768,22.891 45.873,22.868 C46.239999999999995,22.787 46.546,22.98 46.861,23.119 C47.192,23.265 47.449,23.465 47.479,23.871 C47.493,24.063 47.648,24.159 47.834,24.194 C48.155,24.255 48.42,24.369 48.563,24.711 C48.763000000000005,25.186999999999998 48.782000000000004,25.179 49.353,25.054 C49.984,25.426 50.39,26.093 51.077,26.5 C50.974,26.655 50.884,26.79 50.776,26.953 C50.933,27.095 51.123,27.221 51.248,27.394 C51.379999999999995,27.576999999999998 51.442,27.81 51.551,28.012 C51.674,28.239 51.815000000000005,28.455000000000002 51.962,28.699 C51.933,28.808000000000003 51.898,28.941 51.856,29.102 C51.935,29.123 52.013000000000005,29.168 52.084,29.159 C52.243,29.137999999999998 52.391,29.159 52.443,29.317 C52.515,29.534 52.608,29.77 52.583,29.986 C52.555,30.229 52.411,30.46 52.308,30.692 C52.288,30.737000000000002 52.227,30.768 52.18,30.797 C52.059,30.871000000000002 51.928,30.932 51.814,31.016 C51.675,31.118 51.549,31.237000000000002 51.417,31.35 C51.486000000000004,31.574 51.711,31.769999999999996 51.536,32.047 C51.382,32.04 51.221000000000004,32.032000000000004 51.02,32.023 C50.830000000000005,32.787000000000006 50.653,33.544999999999995 50.056,34.099 C50.056,34.099 50.082,34.078 50.082,34.078zM0 0 M-23.023,-28.531 C-23.215,-28.817999999999998 -23.322999999999997,-28.907 -23.333,-29.006 C-23.415999999999997,-29.854 -24.154999999999998,-30.091 -24.668,-30.546 C-24.788999999999998,-30.439999999999998 -24.871,-30.369 -24.962,-30.289 C-25.283,-30.443 -25.186,-30.784000000000002 -25.3,-31.027 C-25.406000000000002,-31.253 -25.513,-31.463 -25.469,-31.729 C-25.553,-31.701 -25.621000000000002,-31.699 -25.649,-31.664 C-25.753,-31.538 -25.714000000000002,-31.306 -25.934,-31.267 C-26.145,-31.23 -26.333,-31.285 -26.482,-31.454 C-26.410999999999998,-31.685000000000002 -26.27,-31.521 -26.157,-31.511 C-25.953,-31.753999999999998 -26.41,-31.718 -26.336,-31.913 C-26.272,-32.067 -26.209,-32.22 -26.147,-32.37 C-26.462,-32.577999999999996 -26.556,-32.275 -26.731,-32.159 C-26.918000000000003,-32.034 -27.118,-31.927000000000003 -27.352,-31.789 C-27.687,-32.039 -27.851000000000003,-32.445 -28.1,-32.81 C-28.277,-32.718 -28.422,-32.643 -28.575,-32.563 C-29.046,-33.254000000000005 -29.5,-33.95 -29.906,-34.674 C-30.127,-35.067 -30.333000000000002,-35.881 -30.341,-36.347 C-30.448,-36.436 -30.586,-36.528000000000006 -30.695,-36.648 C-30.791,-36.753 -30.853,-36.889 -30.931,-37.012 C-31.172,-37.058 -31.415,-37.103 -31.677,-37.153 C-31.647,-37.232 -31.644,-37.287 -31.615,-37.309 C-31.305,-37.543 -31.173,-37.812999999999995 -31.343,-38.205 C-31.467,-38.492 -31.538,-38.803 -31.633,-39.105 C-31.423,-39.379999999999995 -31.232,-39.629 -31.018,-39.91 C-30.509,-39.870999999999995 -30.084,-40.11 -29.674,-40.38 C-29.067,-40.779 -28.409000000000002,-41.067 -27.728,-41.31 C-27.269000000000002,-41.474000000000004 -26.859,-41.422000000000004 -26.407,-41.185 C-25.723,-40.827000000000005 -25.19,-40.321 -24.687,-39.763 C-24.629,-39.699 -24.593,-39.611999999999995 -24.528,-39.559 C-23.735999999999997,-38.919 -23.139,-38.1 -22.493,-37.327 C-22.311999999999998,-37.11 -22.201,-36.831 -22.006,-36.631 C-21.808,-36.429 -21.759,-36.201 -21.685,-35.949 C-21.627,-35.751 -21.416999999999998,-35.596 -21.232,-35.37 C-21.232,-35.208 -21.287000000000003,-34.963 -21.216,-34.761 C-21.156000000000002,-34.591 -20.952,-34.472 -20.812,-34.331 C-21.211000000000002,-33.839000000000006 -20.739,-33.486000000000004 -20.553,-33.06 C-20.682000000000002,-33.050000000000004 -20.763,-33.047000000000004 -20.843,-33.036 C-20.968,-33.02 -21.046,-32.893 -20.98,-32.809 C-20.911,-32.721 -20.823,-32.648 -20.753,-32.56 C-20.63,-32.405 -20.514000000000003,-32.243 -20.414,-32.11 C-20.508000000000003,-31.759999999999998 -20.615000000000002,-31.48 -20.794,-31.209 C-20.961000000000002,-30.957 -21.006,-30.625 -21.105,-30.327 C-21.55,-30.263 -21.55,-30.262999999999998 -22.049,-29.802 C-22.302,-29.849999999999998 -22.576,-29.92 -22.853,-29.942 C-22.921000000000003,-29.947 -23.063,-29.799 -23.064,-29.72 C-23.066,-29.552 -22.976000000000003,-29.385 -22.963,-29.215 C-22.95,-29.056 -22.989,-28.892999999999997 -23.023,-28.531z"></path>
                                                                        </g>
                                                                    </g>
                                                                    <g
																transform="matrix(0.9,0,0,0.9,375.7991,323.8512)"
																opacity="1" style="user-select: none;">
                                                                        <g
																opacity="1" transform="matrix(1,0,0,1,0,0)">
                                                                            <path
																stroke-linecap="round" stroke-linejoin="round"
																fill-opacity="0" stroke="rgb(86,90,92)"
																stroke-opacity="1" stroke-width="3"
																d="M0 0 M-49.26,-2.044 C-51.504999999999995,2.1999999999999997 -55.435,5.522 -59.994,7.029 C-61.171,7.418 -62.548,7.827999999999999 -63.011,8.978 C-63.681000000000004,10.643 -61.904,12.229000000000001 -60.301,13.037 C-51.826,17.311 -40.839,17.432 -32.214,13.471M0 0 M-37.547,25.638 C-41.047,30.138 -46.735,31.97 -49.756,32.68 C-51.718,33.141 -51.733,34.861 -51.105,35.741 C-48.41,39.519999999999996 -43.891999999999996,41.019 -39.297,41.721 C-34.062,42.520999999999994 -24.630000000000003,39.721 -20.297,34.888M0 0 M-11.214,28.805 C-11.887,32.53 -11.509,39.875 -9.513,43.091 C-6.4350000000000005,48.049 -0.17999999999999972,49.959 5.615,50.642 C6.845000000000001,50.787000000000006 8.335999999999999,50.778999999999996 9.017,49.745 C9.956999999999999,48.318 8.503,46.599999999999994 7.645,45.123 C4.167999999999999,39.138 10.743,30.905 7.329,24.883M0 0 M7.017,39.803 C13.34,45.189 22,47.728 30.23,46.61 C31.695,46.411 33.396,45.88999999999999 33.842,44.48 C34.144,43.525 33.724000000000004,42.474000000000004 33.091,41.697 C32.458,40.92 31.626,40.333999999999996 30.911,39.632 C28.414,37.183 27.578,34.138000000000005 28.203,31.888M0 0 M44.764,15.342 C50.975,19.071 51.903,31.076999999999998 46.478,38.11 C46.244,38.414 45.841,38.306999999999995 45.594,38.013 C39.828,31.137999999999998 24.953,34.138000000000005 21.578,27.013M0 0 M-40.683,-9.202 C-43.924,-6.879 -48.57,-7.722999999999999 -51.96,-9.822 C-55.046,-11.732999999999999 -56.923,-17.41 -56.755,-21.024 C-56.732,-21.513 -56.219,-21.813 -55.778,-21.601 C-53.378,-20.447 -49.588,-19.923 -47.286,-20.522 C-43.878,-21.407999999999998 -40.781,-24.164 -37.317,-23.53M0 0 M-20.547,-42.237 C-24.547,-41.987 -28.722,-44.605 -30.309,-46.86 C-30.699,-47.414 -31.122,-48.071 -31.795,-48.147 C-32.549,-48.232 -33.144999999999996,-47.534 -33.525,-46.878 C-35.4,-43.644 -35.707,-39.546 -34.335,-36.069 C-32.963,-32.592000000000006 -29.942,-29.808 -26.365,-28.724M0 0 M5.607,-39.245 C5.607,-39.245 9.566,-52.279 9.566,-52.279 C9.73,-52.818000000000005 9.348,-53.362 8.787,-53.412 C5.478000000000001,-53.707 2.065,-52.775000000000006 -0.617,-50.81 C-3.592,-48.63 -5.627,-45.209 -6.124,-41.554M0 0 M7.237,-42.97 C12.176,-47.957 20.025000000000002,-49.825 26.681,-47.597 C27.641000000000002,-47.276 28.74,-46.64 28.706,-45.628 C28.674,-44.667 27.651,-44.104 26.8,-43.658 C23.588,-41.975 20.945,-39.228 19.388,-35.954M0 0 M13.301,4.603 C14.124,7.135999999999999 16.619999999999997,8.529 19.008,8.858 C21.396,9.187000000000001 23.812,8.706000000000001 26.218,8.755 C28.196,8.795 30.303,9.291 31.811,10.648 C32.172,10.972999999999999 32.717,10.641 32.685,10.123 C32.322,4.241999999999999 28.371,-1.2469999999999999 23.238,-2.695M0 0 M22.102,-13.357 C29.878,-15.203999999999999 34.791999999999994,-13.146999999999998 41.221,-8.363 C41.55,-8.118 41.704,-7.683 41.575,-7.293 C40.453,-3.9000000000000004 38.153,-1.111 33.403,0.139M0 0 M48.036,17.926 C50.822,18.366999999999997 53.444,17.555 55.909,16.184 C58.138999999999996,14.943000000000001 61.907,11.973 63.416,9.493 C63.681,9.057 63.629,8.498999999999999 63.296,8.113 C58.999,3.1319999999999997 51.91,-0.633 45.596,0.139M0 0 M41.476,-15.469 C46.313,-17.344 52.121,-16.424 56.154,-13.167 C56.301,-13.048 56.397,-12.873 56.413,-12.684 C56.642999999999994,-9.904 55.518,-6.52 53.385,-4.778M0 0 M25.877,-31.658 C26.997999999999998,-34.455 30.195999999999998,-35.711999999999996 33.089,-36.556 C35.647999999999996,-37.303 38.46,-38.129 40.138,-40.105 C40.458999999999996,-40.483 41.049,-40.410000000000004 41.269,-39.966 C43.088,-36.300000000000004 43.178000000000004,-31.798000000000002 41.447,-28.082 C39.56,-24.03 35.564,-21.032 31.146,-20.354M0 0 M3.392,-22.47 C6.135,-24.904999999999998 9.206,-26.971 12.495,-28.595 C13.116,-28.901999999999997 13.795,-29.2 14.479,-29.09 C15.783,-28.881 16.399,-27.366 16.585,-26.058 C17.064,-22.688 16.261,-19.153 14.375,-16.32M0 0 M-6.232,-1.193 C-6.424,1.108 -6.616,3.41 -6.808,5.711 C-6.891,6.704000000000001 -6.8790000000000004,7.9 -6.043,8.441 C-5.618,8.716000000000001 -5.082,8.738 -4.576,8.722 C-0.7429999999999994,8.602 3.002,6.741 5.412,3.757M0 0 M-16.009,-19.901 C-19.557000000000002,-18.837 -22.819,-16.84 -25.392,-14.176 C-26.011,-13.535 -26.067,-12.523 -25.504,-11.833 C-22.638,-8.317 -18.067999999999998,-6.217 -13.527,-6.427M0 0 M-30.76,42.487 C-29.810000000000002,45.235 -29.584,48.227 -30.091,51.089 C-30.251,51.993 -29.621,52.848 -28.708,52.94 C-21.125999999999998,53.708 -13.915,50.787 -9.381,44.638M0 0 M-11.233,15.106 C-11.615,18.006999999999998 -12.888000000000002,20.782999999999998 -14.835,22.967 C-15.513000000000002,23.727 -16.325000000000003,24.557000000000002 -16.248,25.573 C-16.173000000000002,26.565 -15.265,27.276 -14.374,27.72 C-11.975000000000001,28.915 -9.097,29.112000000000002 -6.558,28.253 C-4.019,27.395 -1.851,25.491999999999997 -0.67,23.086M0 0 M-31.654,9.566 C-31.078,11.966000000000001 -31.413000000000004,14.574000000000002 -32.578,16.751 C-33.042,17.618000000000002 -33.653999999999996,18.565 -33.364,19.504 C-33.047999999999995,20.531000000000002 -31.823999999999998,20.95 -30.755,21.056 C-27.718,21.358 -22.603,19.731 -20.381,17.638M0 0 M-33.108,-6.109 C-33.108,-6.109 -36.858,-2.758 -36.858,-2.758 C-37.273999999999994,-2.386 -37.354,-1.768 -37.046,-1.305 C-36.201,-0.03600000000000003 -34.952,0.9739999999999999 -33.513,1.529 C-31.766,2.202 -29.758999999999997,2.1959999999999997 -28.016,1.513M0 0 M-3.937,-9.642 C-3.937,-9.642 -5.761,-14.134 -5.761,-14.134 C-5.872,-14.409 -5.731000000000001,-14.732000000000001 -5.448,-14.82 C-1.9460000000000006,-15.904 2.168,-14.767 4.577,-11.991M0 0 M-10.478,-22.479 C-11.217,-25.087 -11.955,-27.695 -12.694,-30.303 C-12.941,-31.174 -13.078,-32.336999999999996 -12.285,-32.775 C-11.781,-33.054 -11.156,-32.863 -10.615,-32.666 C-9.205,-32.153999999999996 -7.796,-31.642 -6.386,-31.13M0 0 M40.356,-26.294 C42.536,-25.687 45.027,-26.384 46.577,-28.034 C47.039,-28.526 47.507,-29.14 48.181,-29.181 C48.957,-29.229 49.535999999999994,-28.488 49.879,-27.79 C51.652,-24.183999999999997 50.904,-19.498 48.097,-16.623M0 0 M-45.372,16.514 C-47.497,19.272 -50.277,21.522 -53.415,23.031 C-53.793,23.212999999999997 -53.991,23.646 -53.839,24.037 C-52.527,27.412 -49.781,30.213 -46.418,31.565M0 0 M-34.466,-34.415 C-38.549,-34.368 -41.443,-33.153 -44.893,-30.971 C-45.523,-30.573 -45.641,-29.669999999999998 -45.096,-29.162 C-43.354,-27.538999999999998 -42.243,-25.239 -42.103,-22.859M0 0 M13.661,23.449 C17.895,26.186 24.151,27.796 30.369,23.96 C30.953,23.6 31.195,22.869 30.934,22.235 C29.087,17.74 26.744,16.358 22.649,14.395M0 0 M-22.171,-37.299 C-22.171,-37.299 -19.6,-43.787 -19.6,-43.787 C-18.941000000000003,-45.451 -17.543999999999997,-46.437999999999995 -16.092,-46.236 C-13.713999999999999,-45.904999999999994 -12.405,-44.865 -10.322,-43.362"></path>
                                                                        </g>
                                                                    </g>
                                                                    <g
																transform="matrix(0.9,0.0073,-0.0073,0.9,306.5594,339.2664)"
																opacity="1" style="user-select: none;">
                                                                        <g
																opacity="1" transform="matrix(1,0,0,1,0,0)">
                                                                            <path
																fill="rgb(255,180,0)" fill-opacity="1"
																d="M0 0 M-5.372,4.638 C-5.42,4.664 -5.5120000000000005,4.715 -5.61,4.768 C-5.688000000000001,4.596 -5.765,4.423 -5.846,4.245 C-6.051,4.218 -6.228,4.511 -6.482,4.306 C-6.424,4.223 -6.367,4.142 -6.269,4.003 C-6.338,3.96 -6.418,3.9099999999999997 -6.492,3.864 C-6.458,3.7249999999999996 -6.425,3.5989999999999998 -6.394,3.473 C-6.417,3.461 -6.441000000000001,3.451 -6.464,3.439 C-6.6000000000000005,3.5700000000000003 -6.693,3.795 -6.928,3.719 C-7.027,3.687 -7.109,3.597 -7.182,3.509 C-7.402,3.451 -7.42,3.64 -7.452,3.813 C-7.514,3.7840000000000003 -7.5520000000000005,3.766 -7.596,3.745 C-7.553,3.621 -7.5089999999999995,3.494 -7.443,3.305 C-7.819999999999999,3.567 -7.818999999999999,3.568 -8.072,3.52 C-8.094999999999999,3.421 -8.118,3.322 -8.142,3.217 C-8.077,3.097 -7.83,3.068 -7.948,2.83 C-8.012,2.836 -8.08,2.843 -8.169,2.851 C-8.173,2.788 -8.177,2.727 -8.182,2.649 C-8.258000000000001,2.64 -8.338999999999999,2.6319999999999997 -8.392,2.626 C-8.517,2.82 -8.628,2.99 -8.738,3.16 C-8.761999999999999,3.1540000000000004 -8.786000000000001,3.147 -8.81,3.141 C-8.828000000000001,3.063 -8.886999999999999,2.9579999999999997 -8.857,2.912 C-8.684,2.651 -8.763000000000002,2.363 -8.742,2.075 C-9.019,2.043 -8.974,1.813 -9,1.609 C-9.151,1.583 -9.313,1.5870000000000002 -9.349,1.741 C-9.422,2.056 -9.658000000000001,2.12 -9.912,2.192 C-9.877,1.9500000000000002 -9.842,1.7180000000000002 -9.808,1.485 C-9.834,1.4680000000000002 -9.86,1.4509999999999998 -9.886,1.434 C-9.984,1.504 -10.083,1.573 -10.21,1.664 C-10.338000000000001,1.668 -10.434000000000001,1.5470000000000002 -10.46,1.419 C-10.512,1.162 -10.693,1.0999999999999999 -10.9,1.093 C-11.048,1.088 -11.127,1.026 -11.211,0.916 C-11.381,0.6930000000000001 -11.557,0.47200000000000003 -11.752,0.271 C-11.883000000000001,0.136 -12.039,0.032 -11.951,-0.149 C-12.567,-0.676 -13.001,-1.2999999999999998 -13.346,-1.946 C-13.175,-2.1109999999999998 -13.023,-2.259 -12.866,-2.411 C-12.924,-2.56 -12.972999999999999,-2.6870000000000003 -13.03,-2.833 C-12.955,-2.842 -12.889,-2.85 -12.833,-2.857 C-12.81,-3.0410000000000004 -12.789,-3.215 -12.765,-3.408 C-12.639000000000001,-3.395 -12.540999999999999,-3.385 -12.447,-3.375 C-12.325999999999999,-3.524 -12.54,-3.8569999999999998 -12.158,-3.819 C-12.158,-3.934 -12.158,-4.035 -12.158,-4.17 C-12.016,-4.053 -11.908,-4.073 -11.798,-4.194 C-11.714,-4.287 -11.599,-4.353 -11.496,-4.428 C-11.305,-4.568 -11.136,-4.715999999999999 -11.097,-4.975 C-11.084,-5.0569999999999995 -10.996,-5.132 -10.933,-5.202 C-10.584999999999999,-5.586 -10.218,-5.954000000000001 -9.89,-6.355 C-9.746,-6.531000000000001 -9.679,-6.771 -9.551,-7.035 C-9.77,-6.985 -9.924,-6.9510000000000005 -10.078,-6.916 C-10.088,-6.936 -10.098,-6.956 -10.108,-6.976 C-9.725000000000001,-7.414 -9.392,-7.913000000000001 -8.946,-8.271 C-8.533,-8.603000000000002 -8.279,-9.069 -7.858,-9.378 C-7.813,-9.411 -7.767,-9.489 -7.775,-9.538 C-7.803,-9.721 -7.67,-9.780999999999999 -7.553,-9.79 C-7.346,-9.806 -7.114,-9.826 -6.929,-9.752 C-6.558,-9.605 -6.204,-9.424999999999999 -5.893,-9.145 C-5.529,-8.817 -5.087000000000001,-8.576 -4.698,-8.273 C-4.393000000000001,-8.035 -4.119,-7.759 -3.83,-7.501 C-3.681,-7.368 -3.537,-7.227 -3.378,-7.107 C-3.18,-6.958 -2.994,-6.808999999999999 -2.911,-6.56 C-2.886,-6.484 -2.819,-6.417000000000001 -2.758,-6.36 C-2.46,-6.083 -2.16,-5.807 -1.855,-5.537 C-1.675,-5.378 -1.536,-5.2010000000000005 -1.465,-4.964 C-1.431,-4.8500000000000005 -1.3319999999999999,-4.755 -1.261,-4.652 C-1.0719999999999998,-4.378 -0.892,-4.096 -0.687,-3.834 C-0.6090000000000001,-3.734 -0.483,-3.657 -0.363,-3.607 C-0.10899999999999999,-3.5020000000000002 0.15599999999999997,-3.423 0.415,-3.33 C0.8859999999999999,-3.162 0.775,-2.731 0.561,-2.459 C0.36500000000000005,-2.21 0.179,-1.948 0.03,-1.669 C-0.151,-1.33 -0.28800000000000003,-0.967 -0.457,-0.585 C-0.223,-0.41999999999999993 -0.18600000000000003,-0.176 -0.273,0.116 C-0.34700000000000003,0.364 -0.377,0.625 -0.443,0.876 C-0.55,1.285 -0.466,1.643 -0.19,1.959 C-0.176,1.975 -0.144,1.986 -0.143,2 C-0.12399999999999999,2.372 0.19,2.617 0.272,2.96 C0.325,3.181 0.261,3.391 0.146,3.569 C0.0030000000000000027,3.79 -0.16499999999999998,3.9979999999999998 -0.35,4.185 C-0.484,4.319999999999999 -0.653,4.43 -0.825,4.513 C-0.882,4.54 -0.996,4.446 -1.113,4.395 C-1.226,4.438 -1.343,4.539 -1.542,4.492 C-1.685,4.458 -1.8679999999999999,4.598 -2.034,4.656 C-2.3499999999999996,4.7669999999999995 -2.668,4.873 -2.984,4.985 C-3.053,5.010000000000001 -3.113,5.06 -3.182,5.084 C-3.273,5.116 -3.369,5.135 -3.463,5.156 C-3.532,5.170999999999999 -3.6319999999999997,5.156 -3.667,5.197 C-3.8049999999999997,5.359 -3.9339999999999997,5.272 -4.066,5.206 C-4.298,5.090000000000001 -4.524,4.962 -4.761,4.856 C-4.936,4.777 -5.124,4.725 -5.372,4.638zM0 0 M-23.586,18.99 C-23.743,18.904999999999998 -23.861,18.797 -23.992,18.779 C-24.179000000000002,18.754 -24.356,18.759 -24.375,18.481 C-24.5,18.563000000000002 -24.573,18.61 -24.64,18.654 C-24.812,18.246 -24.982,17.844 -25.15,17.446 C-25.343999999999998,17.509 -25.5,17.558999999999997 -25.693,17.621 C-25.711000000000002,17.651 -25.756,17.727 -25.832,17.858 C-25.991,17.607 -26.14,17.415000000000003 -26.084,17.132 C-26.226,16.958000000000002 -26.451,16.907 -26.625,16.971 C-26.824,17.044 -26.942,16.988 -27.082,16.887 C-27.124000000000002,16.857 -27.174999999999997,16.839 -27.249,16.802 C-27.221999999999998,16.651 -27.194,16.495 -27.169,16.355 C-27.363,16.327 -27.535999999999998,16.302 -27.74,16.273 C-27.645999999999997,16.098 -27.580000000000002,15.973 -27.513,15.849 C-27.437,15.707 -27.371000000000002,15.567 -27.556,15.517 C-27.518,15.328999999999999 -27.484,15.164 -27.44,14.945 C-27.737000000000002,15.074 -27.726,15.28 -27.715,15.504 C-27.816,15.488999999999999 -27.893,15.478 -27.971,15.466 C-27.945,15.301 -27.923,15.155999999999999 -27.9,15.011 C-27.923,15.003 -27.945,14.995 -27.968,14.987 C-28.009,15.048 -28.051,15.109 -28.098,15.178 C-28.238,14.891 -28.238,14.891 -28.472,15.023 C-28.791,14.545 -29.15,14.088 -29.415,13.581 C-29.581,13.261999999999999 -29.807,12.941 -29.804,12.548 C-29.804,12.499 -29.82,12.440999999999999 -29.849,12.402 C-30.196,11.94 -30.294,11.383 -30.418,10.843 C-30.453,10.692 -30.341,10.505999999999998 -30.289,10.338 C-30.221,10.12 -30.160999999999998,9.897 -30.069,9.689 C-29.907,9.323 -29.724999999999998,8.966 -29.548,8.607 C-29.520999999999997,8.552999999999999 -29.474999999999998,8.508 -29.438,8.459 C-29.419999999999998,8.471 -29.403000000000002,8.482999999999999 -29.385,8.495 C-29.417,8.6 -29.448999999999998,8.704 -29.488,8.833 C-29.287,8.825000000000001 -29.234,8.717 -29.192,8.577 C-29.172,8.509 -29.125,8.424000000000001 -29.066,8.396 C-28.869,8.302000000000001 -28.658,8.238 -28.459,8.148 C-28.311,8.081 -28.174,8.016 -28.078,7.846 C-27.98,7.671 -27.798000000000002,7.5329999999999995 -27.629,7.411 C-27.138,7.058 -26.642,6.712000000000001 -26.136,6.381 C-25.473,5.948 -24.797,5.534 -24.13,5.107 C-23.829,4.914000000000001 -23.519,4.731999999999999 -23.243,4.507 C-23.081,4.374 -22.957,4.352 -22.794,4.485 C-22.699,4.368 -22.613,4.262 -22.493,4.114 C-22.163999999999998,4.462 -21.838,4.8 -21.518,5.144 C-21.2,5.485 -20.878,5.821999999999999 -20.577,6.177 C-20.405,6.38 -20.273,6.614999999999999 -20.12,6.834 C-20.091,6.8759999999999994 -20.046999999999997,6.9079999999999995 -20.016,6.949 C-19.659,7.428 -19.27,7.887 -18.962,8.395 C-18.781,8.693 -18.619,9.001 -18.397,9.272 C-18.366,9.31 -18.343,9.370000000000001 -18.346,9.419 C-18.363,9.692 -18.206,9.886 -18.066,10.093 C-18.016,10.167 -17.988,10.261 -17.967,10.35 C-17.881,10.703999999999999 -17.877000000000002,11.082 -17.603,11.375 C-17.522000000000002,11.462 -17.485,11.603000000000002 -17.46,11.726 C-17.346,12.291 -17.232,12.857 -17.143,13.426 C-17.088,13.777000000000001 -17.069,14.135 -17.055,14.49 C-17.048,14.674 -17.221,14.722999999999999 -17.356,14.776 C-17.441000000000003,14.809 -17.54,14.805 -17.657,14.821 C-17.616,15.054 -17.719,15.192 -17.924,15.26 C-17.963,15.273 -18.019000000000002,15.306000000000001 -18.042,15.291 C-18.310000000000002,15.117 -18.619999999999997,15.327 -18.891,15.193 C-18.903,15.187 -18.928,15.209000000000001 -18.989,15.236 C-18.932000000000002,15.332 -18.878999999999998,15.424 -18.822,15.52 C-18.826,15.529 -18.828,15.559 -18.842,15.565 C-19.092,15.683 -19.342,15.802 -19.596,15.911 C-19.742,15.972999999999999 -19.868,16.033 -19.974,16.175 C-20.067,16.299 -20.249,16.398 -20.406,16.424 C-20.755,16.480999999999998 -20.963,16.737000000000002 -21.225,16.919 C-21.289,16.963 -21.369,16.986 -21.442,17.018 C-21.963,17.244 -22.503,17.452 -22.89,17.882 C-23.037,18.046000000000003 -23.162,18.22 -23.348,18.349 C-23.404,18.388 -23.43,18.512 -23.424,18.593 C-23.410999999999998,18.767 -23.436,18.91 -23.586,18.99zM0 0 M-11.832,5.276 C-11.844000000000001,5.13 -11.854,5.032 -11.859,4.967 C-11.698,4.843 -11.56,4.738 -11.423,4.633 C-11.363,4.587 -11.308,4.519 -11.24,4.498 C-10.965,4.414000000000001 -10.69,4.313 -10.408,4.278 C-9.805,4.202999999999999 -9.199,4.149 -8.592,4.116 C-7.821000000000001,4.074 -7.042,4 -6.277,4.064 C-5.925,4.093 -5.6,4.0280000000000005 -5.262,4.035 C-4.88,4.043 -4.497,4.102 -4.118,4.083 C-3.6340000000000003,4.058 -3.186,4.134 -2.731,4.303 C-2.4979999999999998,4.389 -2.209,4.31 -1.946,4.329 C-1.67,4.35 -1.3960000000000001,4.401 -1.12,4.436 C-0.5960000000000001,4.502 -0.15899999999999997,4.73 0.198,5.12 C0.263,5.192 0.349,5.29 0.429,5.294 C0.696,5.305999999999999 0.871,5.453 1.06,5.614 C1.246,5.772 1.468,5.89 1.681,6.015 C1.937,6.165 2.1180000000000003,6.362 2.091,6.676 C2.0730000000000004,6.883 2.1710000000000003,7.02 2.317,7.13 C2.451,7.231 2.4779999999999998,7.356 2.514,7.515 C2.647,8.097999999999999 2.671,8.709999999999999 2.952,9.257 C2.985,9.322 3.0210000000000004,9.422 2.994,9.474 C2.8840000000000003,9.689 3.03,9.847 3.065,10.035 C3.225,10.903 3.7769999999999997,11.559000000000001 4.201,12.284 C4.515,12.82 4.497,13.391 4.116,13.907 C3.9879999999999995,14.081 3.853,14.251000000000001 3.709,14.412 C3.466,14.682 3.1719999999999997,14.805 2.799,14.729 C2.726,14.713999999999999 2.625,14.789 2.55,14.842 C2.256,15.05 1.9709999999999999,15.270999999999999 1.676,15.478 C1.386,15.682 1.063,15.512 0.758,15.545 C0.385,15.586 0.017000000000000015,15.656 -0.354,15.714 C-0.367,15.747 -0.38,15.780000000000001 -0.393,15.813 C-0.503,15.648000000000001 -0.614,15.484 -0.752,15.277 C-0.9359999999999999,15.764999999999999 -0.9359999999999999,15.765 -1.581,15.587 C-1.785,15.95 -2.0100000000000002,16.043 -2.507,15.973 C-2.56,16.099 -2.578,16.27 -2.671,16.336 C-2.8859999999999997,16.488999999999997 -3.128,16.45 -3.327,16.311 C-3.46,16.361 -3.5789999999999997,16.406000000000002 -3.698,16.449 C-3.8409999999999997,16.501 -4.022,16.514 -4.118,16.612 C-4.275,16.773 -4.438,16.749000000000002 -4.62,16.736 C-4.704,16.73 -4.823,16.72 -4.867,16.767 C-4.987,16.896 -5.098,16.896 -5.239,16.822 C-5.279,16.801 -5.345,16.785999999999998 -5.38,16.804 C-5.617,16.929 -5.87,16.882 -6.119,16.887 C-6.41,16.893 -6.702999999999999,16.947 -6.991,16.926 C-7.343999999999999,16.9 -7.693,16.821 -8.042,16.756 C-8.096,16.746 -8.184,16.678 -8.181,16.642 C-8.143999999999998,16.137 -8.584,15.908 -8.852,15.651 C-9.519,15.011 -10.049999999999999,14.277 -10.591,13.543 C-10.764999999999999,13.306999999999999 -10.94,13.071 -11.091,12.821 C-11.628,11.934 -11.942,10.956 -12.218,9.965 C-12.535,8.828 -12.701,7.665 -12.787,6.49 C-12.812000000000001,6.148000000000001 -12.841,5.8069999999999995 -12.86,5.465 C-12.87,5.2909999999999995 -12.824000000000002,5.1690000000000005 -12.598,5.206 C-12.362,5.244000000000001 -12.119000000000002,5.2509999999999994 -11.832,5.276zM0 0 M-15.462,-9.242 C-15.337,-9.051 -15.259,-8.932 -15.173,-8.801 C-15.132,-8.815 -15.074,-8.835 -15.007,-8.858 C-14.943,-8.764000000000001 -14.878,-8.669 -14.809,-8.568 C-14.979999999999999,-8.548 -15.136000000000001,-8.526 -15.294,-8.512 C-15.614,-8.484 -15.664,-8.41 -15.556,-8.11 C-15.542,-8.071 -15.519,-8.035 -15.512,-8.022 C-15.573,-7.836 -15.627,-7.671 -15.692,-7.473 C-15.685,-7.478 -15.711,-7.446 -15.737,-7.446 C-16.045,-7.444999999999999 -16.299000000000003,-7.367999999999999 -16.388,-7.026 C-16.398000000000003,-6.989 -16.437,-6.9510000000000005 -16.472,-6.932 C-16.739,-6.785 -17.008000000000003,-6.643000000000001 -17.277,-6.501 C-17.305,-6.486000000000001 -17.36,-6.487 -17.365,-6.47 C-17.458,-6.165 -17.732,-6.285 -17.928,-6.215 C-18.142,-6.139 -18.331,-5.994 -18.533,-5.883 C-18.819000000000003,-5.727 -19.103,-5.566000000000001 -19.396,-5.424 C-19.644000000000002,-5.304 -19.994,-5.375 -20.186,-5.576 C-20.361,-5.758 -20.555,-5.875 -20.818,-5.878 C-20.906000000000002,-5.8790000000000004 -21.006,-5.920999999999999 -21.078,-5.975 C-21.910999999999998,-6.595 -22.742,-7.2139999999999995 -23.358,-8.074 C-23.803,-8.693999999999999 -24.292,-9.281 -24.748,-9.893 C-25.032,-10.274000000000001 -25.287,-10.676 -25.56,-11.064 C-25.953999999999997,-11.624 -26.353,-12.181000000000001 -26.751,-12.739 C-26.852,-12.881 -26.860999999999997,-13.005 -26.714,-13.128 C-26.488,-13.317 -26.319,-13.533999999999999 -26.337,-13.857 C-26.341,-13.928999999999998 -26.274,-14.066 -26.231,-14.069 C-25.942,-14.092 -25.817,-14.354 -25.602,-14.482 C-25.032,-14.822999999999999 -24.482999999999997,-15.197000000000001 -23.932,-15.569 C-23.695999999999998,-15.728000000000002 -23.481,-15.917000000000002 -23.251,-16.085 C-23.187,-16.132 -23.107000000000003,-16.157 -23.033,-16.189 C-22.965,-16.218 -22.892000000000003,-16.237000000000002 -22.827,-16.271 C-22.501,-16.444 -22.175,-16.619 -21.852,-16.798 C-21.769000000000002,-16.843999999999998 -21.692999999999998,-16.905 -21.615,-16.96 C-21.555,-17.003 -21.500999999999998,-17.073 -21.435,-17.087 C-20.99,-17.18 -20.628,-17.471999999999998 -20.196,-17.598 C-19.885,-17.689 -19.584,-17.814 -19.278,-17.921 C-19.23,-17.938 -19.177,-17.942 -19.126,-17.952 C-18.932000000000002,-17.990000000000002 -18.740000000000002,-18.035 -18.545,-18.065 C-18.324,-18.099 -18.107999999999997,-18.126 -17.923,-17.928 C-17.848999999999997,-17.849 -17.695,-17.782 -17.594,-17.8 C-17.066000000000003,-17.894000000000002 -16.774,-17.547 -16.459,-17.235 C-16.407,-17.183 -16.371000000000002,-17.11 -16.312,-17.069 C-16.163,-16.964 -16.137,-16.823 -16.143,-16.653 C-16.152,-16.426 -16.094,-16.215 -15.951,-16.028 C-15.866,-15.916999999999998 -15.746,-15.8 -15.868,-15.637 C-15.878,-15.623000000000001 -15.879,-15.591 -15.869,-15.577 C-15.697,-15.336 -15.528,-15.093 -15.35,-14.857 C-15.081999999999999,-14.5 -14.784,-14.163 -14.548,-13.787 C-14.439,-13.613000000000001 -14.327,-13.465 -14.176,-13.328 C-14.03,-13.195 -13.928,-13.013 -13.8,-12.859 C-13.606,-12.625 -13.358,-12.472999999999999 -13.064,-12.392 C-13.006,-12.376 -12.954,-12.333 -12.936,-12.323 C-12.781,-12.374 -12.65,-12.417 -12.515,-12.461 C-12.495000000000001,-12.382 -12.483,-12.360000000000001 -12.487,-12.342 C-12.525,-12.152000000000001 -12.633999999999999,-11.943 -12.588,-11.777 C-12.536,-11.588999999999999 -12.454,-11.415000000000001 -12.465,-11.211 C-12.472,-11.078 -12.725,-10.691999999999998 -12.844,-10.684 C-12.899,-10.681 -12.956,-10.731 -13.014,-10.748 C-13.203999999999999,-10.802999999999999 -13.363,-10.854000000000001 -13.564,-10.685 C-13.735,-10.541 -14.008000000000001,-10.519 -14.275,-10.43 C-13.999,-10.302999999999999 -13.592,-10.381 -13.468,-9.941 C-13.622,-9.951 -13.78,-9.96 -13.937,-9.974 C-13.966,-9.977 -13.996,-10.024000000000001 -14.018,-10.018 C-14.110000000000001,-9.994000000000002 -14.231,-9.985000000000001 -14.281,-9.922 C-14.377,-9.802000000000001 -14.236,-9.735 -14.162,-9.673 C-14.124,-9.641 -14.048,-9.654 -13.974,-9.645 C-14.077,-9.405999999999999 -14.271,-9.45 -14.484,-9.503 C-14.529,-9.283 -14.568,-9.092 -14.62,-8.837 C-14.808,-8.972999999999999 -14.937000000000001,-9.088 -15.085,-9.168 C-15.176,-9.216999999999999 -15.296,-9.212000000000002 -15.462,-9.242zM0 0 M-30.023,-3.206 C-29.980999999999998,-3.386 -29.977,-3.637 -29.867,-3.825 C-29.628,-4.2330000000000005 -29.571,-4.689 -29.501,-5.128 C-29.436,-5.535 -29.251,-5.837 -29.006,-6.138 C-28.775,-6.422 -28.586,-6.742 -28.339,-7.009 C-28.232999999999997,-7.1240000000000006 -28.191,-7.213 -28.168,-7.36 C-28.152,-7.46 -28.032,-7.598000000000001 -27.935,-7.621 C-27.665,-7.6850000000000005 -27.549,-7.89 -27.425,-8.09 C-27.395,-8.138 -27.443,-8.236 -27.457,-8.323 C-27.387,-8.442 -27.308,-8.589 -27.215,-8.726 C-27.169999999999998,-8.793000000000001 -27.106,-8.872 -27.036,-8.891 C-26.935000000000002,-8.918 -26.872,-8.934000000000001 -26.838,-9.054 C-26.823,-9.107000000000001 -26.683999999999997,-9.129999999999999 -26.598,-9.155 C-26.480999999999998,-9.189 -26.48,-9.184 -26.489,-9.399 C-26.601,-9.392999999999999 -26.712,-9.386999999999999 -26.912,-9.376 C-26.785999999999998,-9.520999999999999 -26.701999999999998,-9.617 -26.607,-9.726 C-26.076,-9.454 -25.547,-9.19 -25.026,-8.913 C-24.503,-8.635 -23.94,-8.466 -23.388,-8.263 C-23.011000000000003,-8.124 -22.617,-8.014 -22.329,-7.672 C-22.162,-7.473999999999999 -21.877000000000002,-7.379 -21.649,-7.231 C-21.447,-7.1 -21.249000000000002,-6.962 -21.053,-6.821 C-20.723000000000003,-6.584 -20.394000000000002,-6.344 -20.068,-6.102 C-19.882,-5.964 -19.687,-5.834 -19.523,-5.673 C-19.114,-5.268 -18.699,-4.864 -18.375,-4.385 C-18.254,-4.2059999999999995 -18.185,-3.992 -18.093,-3.794 C-18.076,-3.758 -18.072,-3.705 -18.044,-3.688 C-17.771,-3.516 -17.81,-3.21 -17.73,-2.957 C-17.712,-2.899 -17.748,-2.82 -17.77,-2.754 C-17.836,-2.555 -17.923,-2.36 -17.973,-2.157 C-18.064,-1.787 -18.186,-1.45 -18.56,-1.267 C-18.613999999999997,-1.2409999999999999 -18.643,-1.1560000000000001 -18.675,-1.094 C-18.704,-1.038 -18.717,-0.9740000000000001 -18.746,-0.918 C-18.764,-0.883 -18.827,-0.852 -18.823,-0.826 C-18.766000000000002,-0.39299999999999996 -19.135,-0.10500000000000004 -19.199,0.3 C-19.249000000000002,0.613 -19.499,0.8900000000000001 -19.61,1.201 C-19.691,1.429 -19.693,1.685 -19.725,1.93 C-19.733,1.988 -19.693,2.081 -19.719,2.102 C-20.013,2.336 -20.220000000000002,2.7070000000000003 -20.643,2.74 C-20.761,2.749 -20.887,2.6839999999999997 -21.007,2.647 C-21.189,2.5909999999999997 -21.334,2.622 -21.456,2.783 C-21.596999999999998,2.968 -21.754,3.139 -21.905,3.316 C-21.932000000000002,3.299 -21.959,3.283 -21.986,3.266 C-22.008,3.192 -22.029999999999998,3.117 -22.054,3.037 C-22.209,2.953 -22.508000000000003,3.262 -22.533,2.794 C-22.671000000000003,2.976 -22.767,3.104 -22.883,3.257 C-22.936999999999998,3.027 -23.27,3.0229999999999997 -23.288,2.711 C-23.567,2.782 -23.827,2.684 -24.12,2.572 C-24.137,2.379 -24.268,2.2840000000000003 -24.518,2.306 C-24.627000000000002,2.316 -24.745,2.236 -24.884,2.189 C-24.914,2.426 -25.057000000000002,2.516 -25.26,2.467 C-25.461000000000002,2.419 -25.56,2.243 -25.537,2.114 C-25.671,2.081 -25.797,2.05 -25.924,2.02 C-25.996,2.003 -26.069,1.9929999999999999 -26.141,1.974 C-26.493,1.881 -26.844,1.782 -27.196,1.692 C-27.298000000000002,1.666 -27.404,1.654 -27.509,1.645 C-27.747,1.625 -27.974999999999998,1.633 -28.191,1.467 C-28.529999999999998,1.205 -28.900000000000002,1.306 -29.289,1.49 C-29.397000000000002,1.341 -29.528000000000002,1.199 -29.614,1.034 C-29.791,0.696 -29.973,0.356 -30.098,-0.002 C-30.212999999999997,-0.33 -30.283,-0.68 -30.321,-1.026 C-30.364,-1.4180000000000001 -30.362000000000002,-1.818 -30.353,-2.214 C-30.347,-2.4539999999999997 -30.305,-2.696 -30.25,-2.93 C-30.229,-3.0180000000000002 -30.124,-3.0869999999999997 -30.023,-3.206zM0 0 M20.44,6.321 C20.167,6.665 19.817999999999998,6.7139999999999995 19.403,6.661 C19.034,6.614 18.664,6.648 18.344,6.386 C18.28,6.3340000000000005 18.095,6.433000000000001 17.964,6.456 C17.705,6.501 17.444,6.565 17.183,6.572 C17.06,6.575 16.916999999999998,6.487 16.813,6.402 C16.596999999999998,6.2250000000000005 16.402,6.023 16.181,5.816 C16.147000000000002,5.933 16.11,6.054 16.07,6.192 C15.916,6.099 15.674,6.146 15.673,5.867 C15.673,5.853 15.567,5.835 15.509,5.826 C15.242,5.782 15.129,5.62 15.164,5.365 C14.969999999999999,5.236000000000001 14.788,5.114 14.583,4.978 C14.539,5.0409999999999995 14.49,5.109 14.42,5.208 C14.263,4.965 14.086,4.896000000000001 13.922,5.206 C13.611,4.586 12.768,4.241 12.159,4.455 C12.085,4.481 11.959,4.5200000000000005 11.929,4.487 C11.635,4.166 11.095,4.205 10.885,3.782 C10.741,3.491 10.527,3.366 10.209,3.414 C10.166,3.311 10.132,3.227 10.107,3.167 C9.533,3.1319999999999997 9.072,2.889 8.681,2.526 C8.470999999999998,2.331 8.306000000000001,2.147 7.99,2.319 C7.9270000000000005,2.3529999999999998 7.742,2.2920000000000003 7.704,2.224 C7.489999999999999,1.838 7.174,1.577 6.817,1.323 C6.191,0.877 6,0.10499999999999998 6.182,-0.644 C6.314,-1.1840000000000002 6.324999999999999,-1.7560000000000002 6.475,-2.289 C6.699,-3.0860000000000003 6.662,-3.9509999999999996 7.102,-4.688 C7.238,-4.917 7.39,-5.138 7.552,-5.349 C7.81,-5.6850000000000005 8.062,-6.03 8.356,-6.333 C8.822,-6.813000000000001 9.324,-7.258 9.805,-7.724 C9.988,-7.901 10.174,-7.812 10.366,-7.764 C10.532,-7.723 10.702,-7.7 10.866,-7.652 C11.004,-7.612 11.145,-7.564 11.267,-7.491 C11.776,-7.189 12.327,-7.012 12.897,-6.858 C13.369,-6.7299999999999995 13.816,-6.503 14.265,-6.3 C14.739,-6.085 15.213999999999999,-5.8660000000000005 15.668,-5.613 C15.969999999999999,-5.445 16.241,-5.22 16.516,-5.008 C16.583,-4.957 16.618,-4.859 16.657,-4.778 C16.686,-4.718 16.674999999999997,-4.614 16.717,-4.59 C17.235,-4.294 17.076,-3.684 17.338,-3.262 C17.605,-2.831 17.715,-2.322 17.723,-1.8 C17.724999999999998,-1.6640000000000001 17.796,-1.5190000000000001 17.865,-1.395 C18.043,-1.073 18.247,-0.765 18.422,-0.442 C18.51,-0.281 18.55,-0.09500000000000001 18.625,0.074 C18.687,0.21599999999999997 18.765,0.351 18.841,0.487 C18.886000000000003,0.568 18.951999999999998,0.64 18.987,0.725 C19.171999999999997,1.174 19.366,1.6199999999999999 19.524,2.078 C19.609,2.324 19.62,2.594 19.675,2.852 C19.785,3.371 19.676,3.9210000000000003 19.898,4.424 C20.005,4.665 20.073,4.935 20.227,5.14 C20.417,5.3919999999999995 20.439999999999998,5.6499999999999995 20.424,5.938 C20.416999999999998,6.066 20.434,6.196 20.44,6.321zM0 0 M-8.083,27.83 C-8.339,27.782999999999998 -8.549999999999999,27.745 -8.806,27.698 C-8.825,27.671 -8.885,27.587999999999997 -8.921,27.537 C-9.184,27.608999999999998 -9.407,27.686 -9.637,27.726 C-9.732000000000001,27.743 -9.840000000000002,27.675 -9.944,27.655 C-10.091000000000001,27.628 -10.238,27.6 -10.386,27.59 C-10.492999999999999,27.583 -10.611,27.635 -10.708,27.606 C-11.131,27.48 -11.468,27.673 -11.815,27.863 C-11.988,27.958 -12.177,27.974 -12.336,27.815 C-12.686,27.465 -13.07,27.141000000000002 -13.376,26.756 C-13.753,26.282 -13.952,25.702 -14.138,25.129 C-14.350999999999999,24.473000000000003 -14.575000000000001,23.819 -14.736,23.15 C-14.878,22.558 -14.942,21.946 -15.035,21.343 C-15.113,20.838 -15.184,20.332 -15.257,19.826 C-15.277,19.687 -14.951,18.921 -14.829,18.872 C-14.725000000000001,18.83 -14.588,18.805999999999997 -14.484,18.836 C-14.155,18.932 -13.892000000000001,18.921 -13.611,18.657 C-13.427000000000001,18.484 -13.124,18.399 -12.861,18.356 C-12.040000000000001,18.223000000000003 -11.196000000000002,18.236 -10.409,18.452 C-9.942,18.580000000000002 -9.489,18.579 -9.032,18.626 C-8.65,18.665000000000003 -8.254,18.567 -7.869,18.591 C-7.54,18.612000000000002 -7.218,18.729000000000003 -6.891,18.789 C-6.606,18.842000000000002 -6.317,18.882 -6.029,18.914 C-5.133,19.012 -4.267,19.185 -3.48,19.674 C-3.002,19.971 -2.456,20.159 -1.976,20.454 C-1.563,20.708000000000002 -1.1789999999999998,21.022 -0.82,21.349 C-0.32899999999999996,21.797 0.14299999999999996,22.268 0.593,22.757 C0.843,23.028000000000002 1.06,23.341 1.235,23.666 C1.2970000000000002,23.781 1.235,24.017999999999997 1.149,24.144 C0.9550000000000001,24.426 0.9259999999999999,24.692999999999998 0.962,25.034 C1.011,25.491999999999997 0.9400000000000001,25.964 0.913,26.429 C0.91,26.471999999999998 0.855,26.546 0.82,26.549 C0.45499999999999996,26.576 0.24600000000000002,26.948 -0.156,26.945 C-0.41500000000000004,26.943 -0.679,27.119 -0.936,27.224 C-1.084,27.285 -1.212,27.381999999999998 -1.386,27.267 C-1.452,27.223 -1.5979999999999999,27.211000000000002 -1.652,27.254 C-1.916,27.465 -2.192,27.398999999999997 -2.492,27.374 C-2.766,27.351 -3.0490000000000004,27.451 -3.329,27.489 C-3.693,27.538 -4.044,27.52 -4.38,27.336 C-4.4879999999999995,27.276999999999997 -4.6850000000000005,27.230999999999998 -4.759,27.287 C-5.064,27.52 -5.403,27.387999999999998 -5.723,27.418 C-5.955,27.439999999999998 -6.1930000000000005,27.381 -6.429,27.378 C-6.658,27.375 -6.8790000000000004,27.394 -7.056,27.592 C-7.111,27.654 -7.284,27.672 -7.37,27.635 C-7.75,27.471 -7.746,27.461000000000002 -8.018,27.759 C-8.045,27.789 -8.073,27.819 -8.083,27.83zM0 0 M0.559,-7.712 C0.3350000000000001,-7.779 0.10299999999999998,-7.8660000000000005 -0.136,-7.916 C-0.458,-7.9830000000000005 -0.8300000000000001,-7.832000000000001 -1.092,-8.175 C-1.1300000000000001,-8.225000000000001 -1.368,-8.191 -1.457,-8.122 C-1.6580000000000001,-7.967 -1.867,-7.973 -2.033,-8.097 C-2.311,-8.304 -2.529,-8.17 -2.755,-8.039 C-3.189,-7.787 -3.5940000000000003,-7.838 -3.995,-8.096 C-4.25,-8.26 -4.5760000000000005,-8.315999999999999 -4.873,-8.414 C-4.976,-8.448 -5.113,-8.428 -5.187,-8.49 C-5.719,-8.937 -6.375,-9.168 -6.958,-9.527 C-7.291,-9.732 -7.675000000000001,-9.876999999999999 -8.054,-9.979 C-8.529,-10.107 -8.829,-10.416 -9.042,-10.814 C-9.35,-11.389 -9.584999999999999,-12 -9.651,-12.654 C-9.683,-12.973 -9.658999999999999,-13.304 -9.619,-13.624 C-9.528,-14.343 -9.447,-15.066999999999998 -9.293,-15.774 C-9.167,-16.352999999999998 -8.947000000000001,-16.911 -8.756,-17.475 C-8.535,-18.128 -8.296000000000001,-18.775000000000002 -8.073,-19.428 C-7.942,-19.813000000000002 -7.592,-19.993000000000002 -7.194,-19.948 C-6.808,-19.904 -6.409,-19.975 -6.023,-19.93 C-5.3839999999999995,-19.855999999999998 -4.755,-19.698 -4.115,-19.631 C-3.3070000000000004,-19.547 -2.612,-19.167 -1.882,-18.873 C-1.793,-18.837 -1.672,-18.798 -1.595,-18.83 C-1.212,-18.99 -0.944,-18.788999999999998 -0.641,-18.601 C-0.383,-18.439999999999998 -0.07299999999999998,-18.364 0.211,-18.242 C0.6799999999999999,-18.041 1.147,-17.839 1.612,-17.628 C1.7280000000000002,-17.575 1.834,-17.495 1.939,-17.42 C2.269,-17.185000000000002 2.597,-16.945 2.926,-16.709 C2.952,-16.69 2.9939999999999998,-16.688 3.013,-16.665 C3.6399999999999997,-15.908999999999999 4.496,-15.346 4.908,-14.407 C5.033,-14.123 5.101999999999999,-13.863000000000001 4.954,-13.553 C4.867999999999999,-13.372000000000002 4.89,-13.141 4.858,-12.933 C4.8469999999999995,-12.859 4.8389999999999995,-12.74 4.797,-12.723 C4.564,-12.629000000000001 4.6499999999999995,-12.481 4.685,-12.314 C4.717,-12.162 4.708,-11.995 4.692,-11.838 C4.63,-11.206 4.202999999999999,-10.701 4.076,-10.085 C4.034,-9.881 3.814,-9.717 3.696,-9.523 C3.4450000000000003,-9.11 3.2390000000000003,-8.667 2.692,-8.547 C2.511,-8.507000000000001 2.35,-8.376999999999999 2.177,-8.296 C1.904,-8.168 1.592,-8.184 1.348,-7.909 C1.203,-7.745 0.841,-7.774 0.559,-7.712zM0 0 M11.076,5.658 C11.515,6.025 11.965,5.928 12.1,5.436 C12.299,5.569 12.499,5.673 12.662,5.818 C12.931000000000001,6.058 13.155,6.325 13.497,6.506 C13.899,6.718 14.223,7.082999999999999 14.569,7.395 C15.024000000000001,7.805 15.466999999999999,8.228000000000002 15.915,8.646 C15.924999999999999,8.656 15.94,8.662 15.949,8.673 C16.366,9.198 16.779999999999998,9.725 17.2,10.247 C17.294999999999998,10.365 17.413999999999998,10.463 17.514,10.578 C17.782,10.886 18.055,11.189 18.305,11.511 C18.433,11.674999999999999 18.53,11.869 18.614,12.061 C18.829,12.55 19.028000000000002,13.045 19.234,13.538 C19.417,13.975 19.610999999999997,14.407 19.775,14.851 C19.82,14.972000000000001 19.774,15.126 19.776,15.264 C19.779,15.458 19.759,15.659 19.802,15.845 C19.905,16.292 19.867,16.419 19.5,16.706 C19.201,16.94 18.904999999999998,17.177 18.624,17.431 C18.319,17.707 17.952,17.718 17.626,17.585 C17.188000000000002,17.406000000000002 16.756,17.423 16.308,17.433 C16.001,17.44 15.686,17.432 15.389,17.365 C15.165999999999999,17.314 14.932,17.195 14.763,17.041 C14.423,16.732 14.068,16.483 13.623,16.335 C13.385,16.256 13.151000000000002,16.073 12.989,15.876 C12.718,15.546999999999999 12.452,15.235 12.031,15.099 C11.993,15.087 11.959999999999999,15.051 11.93,15.021 C11.538,14.641 11.142,14.266 10.758,13.878 C10.572,13.69 10.254,13.591999999999999 10.285,13.232 C10.287,13.203999999999999 10.124,13.171999999999999 10.047,13.126 C9.64,12.884 9.456,12.469999999999999 9.276,12.068 C8.945,11.33 8.846,10.548 8.982,9.748 C9.01,9.584 9.116,9.436 9.161,9.273 C9.263,8.908 9.311,8.524000000000001 9.449,8.175 C9.713,7.507000000000001 9.976,6.832 10.521,6.318 C10.723,6.127999999999999 10.881,5.892 11.076,5.658zM0 0 M-31.461,12.079 C-31.651,12.028 -31.809,12.003 -31.952,11.943 C-32.410000000000004,11.748999999999999 -32.867000000000004,11.55 -33.316,11.336 C-33.464000000000006,11.265 -33.597,11.153 -33.722,11.042 C-34.27,10.557 -34.855000000000004,10.105 -35.212,9.441 C-35.377,9.134 -35.557,8.836 -35.709,8.523 C-35.766000000000005,8.405 -35.765,8.258000000000001 -35.789,8.124 C-35.827,7.913 -35.867,7.702 -35.9,7.49 C-35.918,7.377 -35.953,7.256 -35.93,7.149 C-35.897,6.995 -35.755,7.0600000000000005 -35.646,7.046 C-35.546,7.033 -35.455,6.959 -35.357,6.92 C-34.969,6.766 -34.577999999999996,6.623 -34.193,6.463 C-33.732,6.272 -33.247,6.324 -32.768,6.297 C-32.511,6.2829999999999995 -32.259,6.2 -32.003,6.158 C-31.691,6.107 -31.379,6.053 -31.065,6.025 C-30.563000000000002,5.981000000000001 -30.06,5.954000000000001 -29.557,5.929 C-29.436,5.923 -29.312,5.954000000000001 -29.19,5.969 C-29.128,5.977 -29.061,6.0040000000000004 -29.003,5.993 C-28.495,5.894 -28.048000000000002,6.093 -27.596,6.273 C-27.567,6.284999999999999 -27.535,6.319 -27.513,6.312 C-27.316000000000003,6.2540000000000004 -27.171999999999997,6.317 -27.028,6.46 C-26.846,6.64 -26.767,6.859 -26.708,7.095 C-26.689,7.173 -26.655,7.251 -26.61,7.317 C-26.407,7.611 -26.308999999999997,7.898999999999999 -26.537,8.238 C-26.743,8.543999999999999 -26.912,8.875 -27.101,9.193 C-27.139,9.256 -27.184,9.327 -27.244,9.363 C-27.474,9.5 -27.685,9.638 -27.868,9.855 C-28.124,10.159 -28.531,10.264999999999999 -28.91,10.331 C-29.16,10.373999999999999 -29.264,10.604 -29.5,10.649 C-29.772,10.700999999999999 -30.054000000000002,10.77 -30.292,10.903 C-30.599,11.075000000000001 -30.962,11.085 -31.252,11.332 C-31.456,11.506 -31.366,11.697999999999999 -31.437,11.87 C-31.456,11.915 -31.448999999999998,11.971 -31.461,12.079zM0 0 M21.886,7.208 C22.487,7.325 23.090999999999998,7.429 23.688,7.562 C24.65,7.777 25.613000000000003,7.998 26.568,8.243 C27.273,8.424 27.995,8.527 28.631,8.968 C29.031,9.246 29.569,9.317 30.029,9.518 C30.586,9.761000000000001 31.13,10.035 31.673,10.311 C32.233,10.595 32.786,10.892999999999999 33.338,11.193 C33.513,11.288 33.715,11.376 33.837,11.523 C34.201,11.961 34.638,12.346 34.759,12.961 C34.802,13.182 35.035,13.388 35.221,13.556 C35.812999999999995,14.09 35.953,14.766 35.881,15.515 C35.873,15.594000000000001 35.835,15.69 35.777,15.74 C35.453,16.02 35.105,16.275 34.793,16.567 C34.608,16.741 34.443,16.751 34.238,16.642 C33.94,16.483 33.663,16.451999999999998 33.333,16.63 C33.125,16.741999999999997 32.785000000000004,16.791999999999998 32.588,16.697 C32.218,16.519 31.872999999999998,16.58 31.511,16.618 C31.442999999999998,16.625 31.343,16.656000000000002 31.31,16.623 C30.886,16.205000000000002 30.276999999999997,16.451 29.81,16.194 C29.483999999999998,16.015 29.12,16.073999999999998 28.77,16.034 C28.352999999999998,15.986999999999998 27.954,15.786 27.546,15.657 C27.468999999999998,15.633000000000001 27.343,15.596 27.309,15.632 C27.034000000000002,15.923 26.761000000000003,15.717 26.513,15.621 C25.986,15.417 25.504,15.123999999999999 24.917,15.043 C24.51,14.987 24.13,14.739 23.737,14.577 C23.391,14.435 23.054000000000002,14.265 22.698,14.156 C21.9,13.911000000000001 21.412,13.383999999999999 21.058,12.636 C20.519,11.495999999999999 20.173,10.322 20.197,9.062 C20.205,8.629999999999999 20.299,8.177 20.461,7.778 C20.578,7.491 20.851,7.25 21.244,7.288 C21.45,7.308 21.659000000000002,7.291 21.867,7.291 C21.873,7.263000000000001 21.88,7.236 21.886,7.208zM0 0 M6.922,24.262 C7.077999999999999,24.123 7.226,23.994 7.37,23.861 C7.39,23.843 7.402,23.808 7.405,23.78 C7.468,23.188000000000002 7.844,22.817 8.278,22.462 C8.56,22.230999999999998 8.77,21.912 9.04,21.663 C9.42,21.312 9.790000000000001,20.923 10.233,20.674 C10.636000000000001,20.448 11.045000000000002,20.183 11.521,20.098 C11.623000000000001,20.08 11.721,20.043 11.823,20.023 C12.133000000000001,19.961 12.443000000000001,19.898 12.755,19.845 C13.023000000000001,19.799 13.123,19.855 13.254,20.092 C13.279,20.137 13.304,20.203 13.343,20.215 C13.763,20.347 13.918,20.792 14.273,20.998 C14.318,21.024 14.362,21.053 14.434,21.099 C14.383,21.177 14.348999999999998,21.253999999999998 14.293,21.307 C14.126999999999999,21.462999999999997 13.935,21.593999999999998 13.788,21.764 C13.706,21.858999999999998 13.698,22.014999999999997 13.647,22.141 C13.602,22.253999999999998 13.568,22.384 13.488,22.467 C13.264,22.701 13.004000000000001,22.901999999999997 12.787,23.141 C12.551,23.401 12.350000000000001,23.692 12.127,23.964 C12.062000000000001,24.043 11.986999999999998,24.123 11.899,24.172 C11.488999999999999,24.400000000000002 11.079,24.631 10.656,24.834 C10.383000000000001,24.965 10.083,25.036 9.805,25.158 C9.453,25.313000000000002 9.105,25.224 8.754,25.183 C8.715,25.178 8.665,25.165 8.641,25.137 C8.413,24.879 8.076,24.886000000000003 7.787,24.777 C7.728,24.755000000000003 7.665,24.735000000000003 7.615,24.699 C7.426,24.563000000000002 7.288,24.342000000000002 7.008,24.361 C6.978,24.363 6.943,24.287 6.922,24.262zM0 0 M6.517,-28.477 C7.25,-28.373 7.946000000000001,-28.311999999999998 8.624,-28.168 C9.662,-27.948 10.688,-27.666999999999998 11.72,-27.418 C12.121,-27.320999999999998 12.530999999999999,-27.257 12.93,-27.151 C13.17,-27.087 13.397,-26.974 13.628,-26.879 C13.971,-26.737000000000002 14.306,-26.567 14.658,-26.453 C15.093,-26.313 15.288,-26.065 15.304,-25.591 C15.312,-25.344 15.391,-25.1 15.408,-24.853 C15.423,-24.64 15.437,-24.411 15.375,-24.213 C15.283,-23.923000000000002 15.134,-23.649 14.986,-23.381 C14.928,-23.276 14.816,-23.143 14.715,-23.13 C14.232,-23.067 13.966999999999999,-22.744 13.687,-22.395 C13.146999999999998,-21.723 12.341999999999999,-21.613 11.559,-21.485 C11.463999999999999,-21.47 11.358,-21.549 11.256,-21.552 C11.055,-21.558 10.824,-21.599999999999998 10.657,-21.52 C10.435,-21.413999999999998 10.254,-21.375 10.001,-21.413 C9.417,-21.501 8.814,-21.469 8.235,-21.576 C7.492999999999999,-21.714000000000002 6.682,-21.718 6.115,-22.345 C5.913,-22.569 5.663,-22.79 5.566,-23.06 C5.3,-23.796 5.048,-24.545 4.901,-25.311 C4.811999999999999,-25.776 4.925,-26.282 4.954,-26.769 C4.973,-27.092 5.015,-27.413999999999998 5.026,-27.738 C5.043,-28.224999999999998 5.226,-28.412 5.707,-28.287 C6.06,-28.195 6.341,-28.177 6.517,-28.477zM0 0 M1.328,-26.432 C1.706,-26.362 2.162,-26.278 2.618,-26.194 C2.847,-26.151999999999997 3.078,-26.116999999999997 3.306,-26.069 C3.469,-26.034 3.628,-25.983 3.79,-25.94 C3.841,-25.926000000000002 3.9,-25.895 3.944,-25.908 C4.208,-25.986 4.325,-25.801000000000002 4.461,-25.638 C4.549,-25.533 4.636,-25.418000000000003 4.746,-25.341 C4.965000000000001,-25.188000000000002 5.053,-24.986 5.063,-24.728 C5.0729999999999995,-24.486 5.102,-24.244 5.121,-24.002 C5.141,-23.744 4.994,-23.544999999999998 4.825,-23.4 C4.615,-23.221 4.362,-23.083000000000002 4.11,-22.963 C3.9440000000000004,-22.884 3.7479999999999998,-22.867 3.565,-22.824 C3.453,-22.798000000000002 3.337,-22.782999999999998 3.229,-22.746 C2.878,-22.624 2.5620000000000003,-22.602 2.225,-22.844 C2.004,-23.002000000000002 1.71,-23.094 1.436,-23.135 C0.836,-23.224 0.411,-23.553 0.045,-24.001 C-0.133,-24.218 -0.27899999999999997,-24.436 -0.297,-24.732 C-0.307,-24.895 -0.39999999999999997,-25.052 -0.424,-25.216 C-0.46399999999999997,-25.484 -0.507,-25.756 -0.495,-26.024 C-0.487,-26.209 -0.29100000000000004,-26.252000000000002 -0.131,-26.277 C0.032,-26.303 0.19799999999999998,-26.310000000000002 0.363,-26.327 C0.6559999999999999,-26.358 0.9490000000000001,-26.391 1.328,-26.432zM0 0 M21.333,-14.218 C21.169999999999998,-14.218 21.089,-14.192 21.049,-14.222 C20.655,-14.517999999999999 20.437,-14.286 20.201,-13.982 C19.952,-13.662999999999998 19.627,-13.42 19.381,-13.079 C19.127,-12.727 18.714,-12.450999999999999 18.314,-12.261 C18.121,-12.168999999999999 17.773,-12.304 17.54,-12.423 C17.293,-12.549 17.083000000000002,-12.725999999999999 16.786,-12.748 C16.674000000000003,-12.755999999999998 16.541999999999998,-12.829999999999998 16.464,-12.915 C15.972999999999999,-13.453 15.448,-13.963000000000001 15.089,-14.611 C14.964,-14.837000000000002 14.937000000000001,-15.025 15.095,-15.252 C15.285,-15.524000000000001 15.434000000000001,-15.824000000000002 15.605,-16.109 C15.661,-16.202 15.713,-16.325 15.799,-16.366 C16.332,-16.619 16.491000000000003,-17.211000000000002 16.914,-17.568 C17.174000000000003,-17.787000000000003 17.329,-18.125 17.555,-18.389 C17.852,-18.735 18.17,-19.064 18.483,-19.396 C18.671,-19.596 19.082,-19.654 19.39,-19.454 C19.825,-19.172 20.218,-18.822999999999997 20.642,-18.522 C21.326999999999998,-18.035999999999998 21.665,-17.266 22.183,-16.644 C22.415,-16.366 22.531,-15.974 22.636,-15.615 C22.739,-15.261000000000001 22.462999999999997,-14.73 22.112,-14.625 C21.889,-14.558 21.735,-14.450000000000001 21.573,-14.304 C21.492,-14.231 21.351999999999997,-14.224 21.333,-14.218zM0 0 M-23.282,22.118 C-23.282,21.944 -23.317999999999998,21.814 -23.275,21.721 C-23.145,21.439 -23.239,21.176000000000002 -23.293,20.905 C-23.349,20.627000000000002 -23.291,20.531 -23.015,20.377 C-22.962,20.348 -22.893,20.306 -22.879,20.256 C-22.810000000000002,20.013 -22.631,19.903000000000002 -22.414,19.821 C-22.161,19.725 -21.936,19.602 -21.852,19.307 C-21.834,19.241999999999997 -21.712,19.198 -21.63,19.162 C-21.488,19.101 -21.34,19.053 -21.195,19 C-20.874,18.882 -20.733,18.589 -20.563,18.331 C-20.441,18.145 -20.250999999999998,18.09 -20.069,18.008 C-19.8,17.887 -19.483,17.812 -19.279,17.62 C-19.024,17.379 -18.813000000000002,17.061 -18.675,16.736 C-18.548000000000002,16.437 -18.314,16.377000000000002 -18.074,16.283 C-18.027,16.265 -17.942,16.3 -17.919,16.273 C-17.75,16.070999999999998 -17.553,16.188 -17.354,16.179 C-16.991,16.162 -16.788,16.444 -16.496,16.548 C-16.331999999999997,16.605999999999998 -16.249,16.874000000000002 -16.115,17.036 C-15.996999999999998,17.18 -15.952,17.342 -15.994,17.511 C-16.019,17.611 -16.092000000000002,17.712 -16.17,17.783 C-16.553,18.129 -17.008000000000003,18.349 -17.478,18.557 C-18.158,18.857999999999997 -18.82,19.200999999999997 -19.489,19.525 C-19.868000000000002,19.709 -20.256999999999998,19.875 -20.624,20.08 C-21.064,20.325 -21.511,20.57 -21.904,20.88 C-22.102,21.035999999999998 -22.352,21.238 -22.295,21.597 C-22.281000000000002,21.683 -22.487000000000002,21.839 -22.62,21.906 C-22.8,21.997 -23.008,22.034 -23.282,22.118zM0 0 M-11.741,-28.192 C-11.717,-28.143 -11.697999999999999,-28.123 -11.7,-28.105 C-11.741,-27.723 -11.551,-27.439 -11.365,-27.123 C-11.174,-26.8 -11.259,-26.354 -11.009,-26.026 C-10.997,-26.01 -11.013,-25.963 -11.028,-25.936 C-11.179,-25.659 -10.995000000000001,-25.472 -10.813,-25.346 C-10.676,-25.251 -10.634,-25.181 -10.692,-25.044 C-10.794,-24.803 -10.719999999999999,-24.582 -10.604,-24.376 C-10.473999999999998,-24.146 -10.47,-23.897000000000002 -10.454,-23.646 C-10.444,-23.490000000000002 -10.42,-23.333 -10.38,-23.182 C-10.341000000000001,-23.034 -10.367,-22.887999999999998 -10.473,-22.813 C-10.546000000000001,-22.761 -10.697999999999999,-22.776 -10.796,-22.812 C-11.504,-23.076 -12.149999999999999,-23.446 -12.751,-23.907 C-13.242999999999999,-24.284 -13.757,-24.632 -14.26,-24.994 C-14.337,-25.05 -14.412999999999998,-25.11 -14.482,-25.175 C-14.581,-25.268 -14.590000000000002,-25.38 -14.521,-25.494 C-14.278,-25.898 -14.048,-26.310000000000002 -13.785,-26.701 C-13.465,-27.177 -13.056000000000001,-27.577 -12.631,-27.963 C-12.365,-28.205000000000002 -12.078999999999999,-28.246 -11.741,-28.192zM0 0 M-18.761,22.833 C-18.7,22.912999999999997 -18.639,22.992 -18.602,23.04 C-17.939,23.191 -17.294999999999998,23.313 -16.668,23.493 C-16.427,23.561999999999998 -16.224999999999998,23.765 -16.002,23.902 C-15.905999999999999,23.961000000000002 -15.806,24.022 -15.699,24.054 C-15.493,24.116999999999997 -15.314,24.355 -15.409,24.535 C-15.556000000000001,24.813 -15.618,25.155 -15.924,25.332 C-15.969,25.358 -16.016,25.404 -16.06,25.403 C-16.436999999999998,25.392 -16.82,25.468 -17.186,25.286 C-17.401,25.179000000000002 -17.644,25.128999999999998 -17.869,25.04 C-17.951999999999998,25.006999999999998 -18.031000000000002,24.948 -18.094,24.883 C-18.204,24.77 -18.282,24.622 -18.404,24.528 C-18.751,24.262 -18.877000000000002,23.918999999999997 -18.838,23.493 C-18.819000000000003,23.284 -18.835,23.072999999999997 -18.835,22.862 C-18.810000000000002,22.851999999999997 -18.785999999999998,22.843 -18.761,22.833zM0 0 M1.45,14.67 C1.643,14.545 1.786,14.453 1.928,14.36 C2.255,14.144 2.481,13.852 2.605,13.478 C2.627,13.411 2.661,13.321 2.715,13.294 C3.1079999999999997,13.1 3.3729999999999998,12.748999999999999 3.719,12.504 C3.8659999999999997,12.4 4.1000000000000005,12.418 4.373,12.366 C4.295,12.509 4.261,12.589 4.212,12.659 C3.905,13.102 3.594,13.543000000000001 3.287,13.986 C3.239,14.055000000000001 3.1959999999999997,14.129000000000001 3.166,14.207 C2.999,14.636000000000001 2.799,15.054 2.721,15.512 C2.68,15.755 2.5580000000000003,15.971999999999998 2.579,16.243 C2.592,16.407 2.407,16.585 2.282,16.809 C1.946,16.400000000000002 1.492,16.126 1.622,15.529 C1.635,15.47 1.619,15.402 1.606,15.341 C1.5570000000000002,15.119 1.503,14.898 1.45,14.67zM0 0 M-17.784,-22.884 C-17.561999999999998,-22.664 -17.454,-22.422 -17.401,-22.143 C-17.377,-22.017 -17.303,-21.892000000000003 -17.229,-21.783 C-17.009999999999998,-21.463 -16.875,-21.089 -16.559,-20.83 C-16.433,-20.726999999999997 -16.274,-20.602 -16.315,-20.379 C-16.323,-20.334 -16.21,-20.277 -16.184,-20.213 C-16.154,-20.137 -16.12,-20.014000000000003 -16.157,-19.972 C-16.201,-19.922 -16.347,-19.894 -16.399,-19.929 C-16.544,-20.026999999999997 -16.705000000000002,-20.143 -16.783,-20.291 C-16.867,-20.452 -16.942,-20.584 -17.087,-20.71 C-17.262,-20.862000000000002 -17.37,-21.094 -17.503,-21.294 C-17.555,-21.373 -17.581999999999997,-21.470000000000002 -17.644,-21.539 C-17.721999999999998,-21.626 -17.724999999999998,-21.706 -17.726,-21.82 C-17.727,-21.969 -17.793,-22.127 -17.864,-22.264 C-18.012,-22.552 -18.017,-22.588 -17.784,-22.884zM0 0 M16.316,-9.814 C16.224,-9.613 16.272,-9.431000000000001 16.317,-9.23 C16.443,-8.665000000000001 16.535,-8.092 16.634,-7.521 C16.646,-7.455 16.618000000000002,-7.382000000000001 16.553,-7.299 C16.475,-7.48 16.396,-7.662 16.317,-7.842 C16.15,-8.221 16.03,-8.616000000000001 15.955,-9.021 C15.895,-9.345 16.023999999999997,-9.617 16.316,-9.814zM0 0 M6.348,27.404 C6.354,27.451999999999998 6.361000000000001,27.498 6.365,27.529 C6.514,27.548 6.654,27.566 6.882,27.596 C6.651999999999999,27.918 6.475,28.180999999999997 6.278,28.429 C6.244999999999999,28.47 6.106,28.477 6.053,28.443 C5.8549999999999995,28.316000000000003 5.7299999999999995,27.87 5.779,27.637 C5.8149999999999995,27.465 5.8919999999999995,27.407 6.063,27.43 C6.154,27.442 6.2509999999999994,27.414 6.348,27.404z"></path>
                                                                        </g>
                                                                    </g>
                                                                    <g
																transform="matrix(0.9,0.0073,-0.0073,0.9,302.7326,339.4608)"
																opacity="1" style="user-select: none;">
                                                                        <g
																opacity="1" transform="matrix(1,0,0,1,0,0)">
                                                                            <path
																stroke-linecap="round" stroke-linejoin="round"
																fill-opacity="0" stroke="rgb(86,90,92)"
																stroke-opacity="1" stroke-width="3"
																d="M0 0 M-26.857,8.584 C-28.519,10.258 -30.208000000000002,11.968 -31.277,14.07 C-32.346000000000004,16.172 -32.714,18.769000000000002 -31.66,20.879 C-30.826,22.548000000000002 -29.122,23.750999999999998 -27.27,23.979 C-25.418,24.207 -23.474,23.451 -22.261,22.034M0 0 M-24.724,23.941 C-24.743,26.256999999999998 -23.531,28.546999999999997 -21.607,29.836 C-19.683,31.125 -17.102999999999998,31.372 -14.969,30.473M0 0 M-13.348,27.355 C-14.627,29.434 -14.169,32.340999999999994 -12.484,34.108 C-10.799,35.875 -8.097999999999999,36.498 -5.731,35.903 C-3.364,35.308 -0.47500000000000003,31.68 -0.649,31.773M0 0 M-32.233,2.356 C-33.422999999999995,3.697 -33.914,5.627000000000001 -33.509,7.373 C-33.104,9.119 -31.813,10.636000000000001 -30.154,11.316M0 0 M-26.438,-16.109 C-26.744,-17.923000000000002 -25.986,-19.878 -24.538,-21.013 C-23.09,-22.148000000000003 -21.012,-22.417 -19.323,-21.687M0 0 M9.839,-35.101 C10.67,-36.519 12.416,-37.34 14.038,-37.075 C15.66,-36.81 17.054,-35.476 17.391,-33.867M0 0 M22.258,-31.442 C25.541999999999998,-32.016 28.999,-29.219 29.124,-25.888M0 0 M25.801,-23.598 C28.232999999999997,-25.439999999999998 31.932999999999996,-25.358 34.282,-23.411M0 0 M29.344,-18.358 C31.662000000000003,-17.528000000000002 33.309,-15.106 33.23,-12.645M0 0 M-2.652,34.811 C-1.372,36.443 0.786,37.339999999999996 2.846,37.098 C4.906000000000001,36.855 6.796,35.481 7.662,33.597M0 0 M5.203,31.084 C7.978,33.492 12.125,34.191 15.536,32.826 C18.947,31.461000000000002 21.467000000000002,28.093 21.815,24.436M0 0 M21.437,27.66 C22.506,28.487000000000002 23.948999999999998,28.810000000000002 25.269,28.518 C26.589,28.226 27.761,27.323 28.381,26.122M0 0 M-17.308,-0.222 C-17.281,1.438 -16.526,3.073 -15.28,4.17 C-14.033999999999999,5.2669999999999995 -12.316,5.809 -10.666,5.625M0 0 M-15.454,3.859 C-16.525000000000002,5.162 -16.976,6.952 -16.65,8.606 C-16.323999999999998,10.26 -15.227,11.747 -13.742,12.546M0 0 M-6.65,9.773 C-5.966,11.359 -4.568,12.62 -2.921,13.138 C-1.2739999999999998,13.656 0.5940000000000001,13.421999999999999 2.063,12.514M0 0 M-4.29,21.894 C-1.415,23.543 2.6399999999999997,22.672 4.585,19.989M0 0 M12.724,17.492 C14.381,18.080000000000002 16.259999999999998,18.016000000000002 17.874,17.318 C19.488,16.62 20.821,15.293999999999999 21.527,13.684M0 0 M3.555,2.369 C5.209,3.2630000000000003 7.308,3.279 8.975,2.41 C10.642,1.5410000000000001 11.83,-0.18899999999999983 12.044,-2.057M0 0 M11.12,0.536 C12.274999999999999,1.3010000000000002 13.059,2.601 13.197,3.979 C13.334999999999999,5.357 12.824,6.788 11.843,7.766M0 0 M20.777,5.474 C23.307000000000002,6.12 26.201,4.522 27.002,2.037M0 0 M27.274,20.74 C29.435000000000002,22.759999999999998 33.208,22.699 35.302,20.609M0 0 M-4.015,-20.231 C-3.8289999999999997,-21.765 -2.761,-23.161 -1.329,-23.742 C0.10299999999999998,-24.323 1.8410000000000002,-24.065 3.043,-23.093M0 0 M7.774,-12.322 C9.006,-13.87 11.039,-14.743 13.01,-14.569 C14.981,-14.396 16.83,-13.182 17.772,-11.442M0 0 M11.259,-14.879 C11.536,-16.281 12.402,-17.556 13.604,-18.329 C14.806,-19.102 16.326,-19.363 17.717,-19.034M0 0 M-16.006,-7.569 C-14.958,-10.289 -11.573,-11.843 -8.827,-10.865M0 0 M24.979,6.142 C26.512,7.798 29.49,7.768000000000001 30.991,6.083M0 0 M-27.38,2.19 C-29.34,2.157 -31.353,1.647 -32.868,0.403 C-34.383,-0.8420000000000001 -35.302,-2.9070000000000005 -34.85,-4.815 C-34.592,-5.905 -33.82,-6.8629999999999995 -32.85,-7.403 C-31.735000000000003,-8.024 -31.016,-9.211 -30.918,-10.484 C-30.823999999999998,-11.713000000000001 -30.342000000000002,-12.915000000000001 -29.513,-13.829 C-28.065,-15.426 -25.641,-16.056 -23.599,-15.366M0 0 M-17.563,-25.825 C-17.849,-28.59 -16.137,-31.444 -13.563,-32.494 C-11.882000000000001,-33.18 -9.927,-33.059 -8.29,-32.287 C-7.279999999999999,-31.81 -6.09,-32.138999999999996 -5.523,-33.101 C-4.992999999999999,-34 -4.13,-34.705 -3.113,-34.949 C-1.221,-35.403 0.9179999999999999,-34.190000000000005 1.501,-32.334"></path>
                                                                        </g>
                                                                    </g>
                                                                    <g></g>
                                                                    <g
																transform="matrix(0.9,0,0,0.9,339.7802,266.0892)"
																opacity="1" style="user-select: none;">
                                                                        <g
																opacity="1" transform="matrix(1,0,0,1,0,0)">
                                                                            <path
																fill="rgb(255,180,0)" fill-opacity="1"
																d="M0 0 M7.37,3.949 C7.322,3.9749999999999996 7.229,4.026 7.131,4.079 C7.053,3.9069999999999996 6.977,3.734 6.896,3.556 C6.691,3.529 6.513999999999999,3.822 6.26,3.617 C6.318,3.534 6.375,3.4530000000000003 6.473,3.314 C6.404,3.271 6.324,3.2209999999999996 6.25,3.175 C6.284,3.037 6.316000000000001,2.9099999999999997 6.347,2.784 C6.324000000000001,2.7729999999999997 6.300999999999999,2.762 6.278,2.75 C6.1419999999999995,2.8810000000000002 6.049,3.105 5.814,3.029 C5.715,2.997 5.633,2.908 5.56,2.82 C5.34,2.762 5.321,2.95 5.289,3.123 C5.226999999999999,3.0940000000000003 5.1899999999999995,3.077 5.146,3.056 C5.189,2.932 5.2330000000000005,2.805 5.299,2.616 C4.922000000000001,2.878 4.923,2.878 4.67,2.831 C4.647,2.7319999999999998 4.624,2.632 4.6,2.527 C4.665,2.407 4.912,2.379 4.794,2.141 C4.7299999999999995,2.147 4.662000000000001,2.153 4.573,2.161 C4.569000000000001,2.098 4.564,2.038 4.559,1.96 C4.4830000000000005,1.951 4.4030000000000005,1.942 4.349,1.936 C4.224,2.13 4.114,2.301 4.004,2.471 C3.9799999999999995,2.4650000000000003 3.956,2.4579999999999997 3.932,2.452 C3.914,2.374 3.854,2.2689999999999997 3.884,2.223 C4.0569999999999995,1.9619999999999997 3.979,1.674 4,1.386 C3.723,1.3539999999999999 3.768,1.124 3.742,0.92 C3.591,0.894 3.428,0.898 3.392,1.052 C3.319,1.367 3.085,1.4309999999999998 2.83,1.503 C2.865,1.262 2.899,1.0290000000000001 2.933,0.796 C2.907,0.779 2.881,0.761 2.855,0.744 C2.757,0.8140000000000001 2.659,0.884 2.532,0.975 C2.404,0.979 2.308,0.857 2.282,0.729 C2.23,0.472 2.049,0.41000000000000003 1.842,0.403 C1.6940000000000002,0.398 1.615,0.336 1.531,0.226 C1.361,0.0030000000000000027 1.185,-0.21699999999999997 0.99,-0.418 C0.859,-0.5529999999999999 0.7030000000000001,-0.6579999999999999 0.791,-0.839 C0.17500000000000004,-1.366 -0.259,-1.9889999999999999 -0.604,-2.635 C-0.43299999999999994,-2.8 -0.281,-2.948 -0.124,-3.1 C-0.182,-3.249 -0.23099999999999998,-3.376 -0.288,-3.522 C-0.21299999999999997,-3.5309999999999997 -0.147,-3.5389999999999997 -0.091,-3.546 C-0.069,-3.73 -0.047,-3.9040000000000004 -0.023,-4.097 C0.10300000000000001,-4.0840000000000005 0.19999999999999998,-4.075 0.294,-4.065 C0.415,-4.214 0.20199999999999996,-4.546 0.584,-4.508 C0.584,-4.623 0.584,-4.724 0.584,-4.859 C0.726,-4.742 0.833,-4.763 0.943,-4.884 C1.027,-4.977 1.1420000000000001,-5.043 1.245,-5.118 C1.4360000000000002,-5.258 1.606,-5.404999999999999 1.645,-5.664 C1.658,-5.7459999999999996 1.746,-5.821 1.809,-5.891 C2.157,-6.275 2.524,-6.644 2.852,-7.045 C2.996,-7.2219999999999995 3.0629999999999997,-7.460999999999999 3.191,-7.725 C2.972,-7.675 2.818,-7.640000000000001 2.664,-7.605 C2.6540000000000004,-7.625 2.6439999999999997,-7.646000000000001 2.634,-7.666 C3.017,-8.104000000000001 3.3499999999999996,-8.603 3.796,-8.961 C4.209,-9.293000000000001 4.463,-9.758000000000001 4.884,-10.067 C4.929,-10.1 4.975,-10.178 4.967,-10.227 C4.939,-10.41 5.073,-10.469999999999999 5.189,-10.479 C5.397,-10.495 5.628,-10.515 5.813,-10.441 C6.183999999999999,-10.294 6.538,-10.113999999999999 6.849,-9.834 C7.213,-9.506 7.653999999999999,-9.266 8.043,-8.962 C8.347999999999999,-8.724 8.622,-8.448 8.911,-8.19 C9.059999999999999,-8.056999999999999 9.205,-7.917 9.364,-7.797 C9.562000000000001,-7.648 9.748,-7.497999999999999 9.831,-7.249 C9.856,-7.173 9.923,-7.106000000000001 9.984,-7.049 C10.282,-6.771000000000001 10.582,-6.496 10.887,-6.226 C11.067,-6.067 11.206,-5.891 11.277,-5.654 C11.311,-5.54 11.41,-5.444 11.481,-5.341 C11.67,-5.067 11.85,-4.785 12.055,-4.523 C12.133,-4.423 12.259,-4.346 12.379,-4.296 C12.633,-4.191 12.898,-4.112 13.157,-4.019 C13.628,-3.851 13.518,-3.42 13.303,-3.148 C13.107000000000001,-2.899 12.921,-2.637 12.772,-2.358 C12.591000000000001,-2.019 12.454,-1.6560000000000001 12.285,-1.274 C12.519,-1.109 12.556,-0.865 12.469,-0.573 C12.395,-0.32499999999999996 12.365,-0.064 12.299,0.187 C12.192,0.596 12.275,0.954 12.551,1.27 C12.565,1.286 12.598,1.296 12.599,1.31 C12.618,1.682 12.931999999999999,1.9260000000000002 13.014,2.27 C13.067,2.491 13.003,2.702 12.888,2.88 C12.746,3.1 12.576,3.309 12.391,3.496 C12.257,3.6310000000000002 12.088000000000001,3.7409999999999997 11.916,3.824 C11.860000000000001,3.851 11.745000000000001,3.757 11.628,3.706 C11.515,3.749 11.398,3.849 11.199,3.802 C11.056,3.7680000000000002 10.874,3.9080000000000004 10.708,3.966 C10.392,4.077 10.074,4.183 9.758,4.295 C9.688999999999998,4.32 9.629000000000001,4.3709999999999996 9.56,4.395 C9.469000000000001,4.427 9.373,4.446 9.279,4.467 C9.209999999999999,4.481999999999999 9.11,4.465999999999999 9.075,4.507 C8.937,4.669 8.808,4.583 8.676,4.517 C8.444,4.401000000000001 8.218,4.272 7.981,4.166 C7.806,4.087000000000001 7.618,4.036 7.37,3.949zM0 0 M15.639,2.802 C15.482,2.717 15.363,2.61 15.232,2.592 C15.043999999999999,2.5660000000000003 14.868,2.571 14.849,2.293 C14.724,2.375 14.651,2.422 14.584,2.466 C14.411999999999999,2.0580000000000003 14.241999999999999,1.6560000000000001 14.074,1.258 C13.879999999999999,1.321 13.724,1.3719999999999999 13.531,1.434 C13.513,1.464 13.47,1.539 13.393,1.67 C13.234,1.419 13.084000000000001,1.2269999999999999 13.14,0.944 C12.998000000000001,0.77 12.773,0.72 12.599,0.784 C12.4,0.857 12.282,0.7999999999999999 12.142,0.699 C12.1,0.6689999999999999 12.05,0.652 11.976,0.615 C12.003,0.46399999999999997 12.03,0.30700000000000005 12.055,0.167 C11.860999999999999,0.139 11.688,0.11499999999999999 11.484,0.086 C11.578,-0.089 11.644,-0.21400000000000002 11.711,-0.339 C11.788,-0.481 11.854000000000001,-0.621 11.669,-0.671 C11.707,-0.859 11.74,-1.0230000000000001 11.784,-1.243 C11.487,-1.113 11.498000000000001,-0.908 11.509,-0.684 C11.408,-0.6990000000000001 11.33,-0.71 11.253,-0.722 C11.279,-0.887 11.302,-1.032 11.325,-1.177 C11.302,-1.185 11.279,-1.193 11.256,-1.201 C11.215,-1.1400000000000001 11.174000000000001,-1.079 11.127,-1.01 C10.987,-1.297 10.986,-1.2959999999999998 10.752,-1.164 C10.433,-1.642 10.074,-2.1 9.809,-2.607 C9.642999999999999,-2.926 9.418,-3.2459999999999996 9.421,-3.639 C9.421,-3.6879999999999997 9.405,-3.746 9.376,-3.785 C9.029,-4.247 8.93,-4.804 8.806,-5.344 C8.770999999999999,-5.495 8.883000000000001,-5.681 8.935,-5.849 C9.003,-6.067 9.062999999999999,-6.2909999999999995 9.155,-6.499 C9.317,-6.864999999999999 9.499,-7.222 9.676,-7.581 C9.703,-7.635000000000001 9.748999999999999,-7.68 9.786,-7.729 C9.804,-7.7170000000000005 9.821,-7.704999999999999 9.839,-7.693 C9.807,-7.587999999999999 9.775,-7.484 9.736,-7.355 C9.937000000000001,-7.363 9.99,-7.471 10.032,-7.611 C10.052,-7.678999999999999 10.1,-7.764 10.158,-7.792 C10.354999999999999,-7.886 10.566,-7.949999999999999 10.765,-8.04 C10.913,-8.107 11.05,-8.172 11.146,-8.342 C11.244000000000002,-8.517000000000001 11.427,-8.655 11.596,-8.777 C12.087,-9.129999999999999 12.583,-9.475 13.089,-9.806 C13.752,-10.238999999999999 14.427,-10.653 15.094,-11.08 C15.395,-11.273 15.705,-11.456 15.981,-11.681 C16.144,-11.814 16.267,-11.835999999999999 16.43,-11.703 C16.525,-11.82 16.611,-11.926 16.731,-12.074 C17.060000000000002,-11.727 17.386,-11.386999999999999 17.706,-11.043 C18.024,-10.702 18.346,-10.366 18.647,-10.011 C18.819,-9.808 18.952,-9.572999999999999 19.105,-9.354 C19.134,-9.312 19.177,-9.280000000000001 19.208,-9.239 C19.564999999999998,-8.760000000000002 19.955000000000002,-8.3 20.263,-7.792 C20.444000000000003,-7.494 20.605,-7.187 20.827,-6.916 C20.858,-6.878 20.881,-6.817 20.878,-6.768 C20.861,-6.495 21.018,-6.301 21.158,-6.094 C21.208000000000002,-6.0200000000000005 21.237,-5.9270000000000005 21.258,-5.838 C21.343999999999998,-5.484 21.347,-5.106 21.622,-4.813 C21.703,-4.726 21.739,-4.585 21.764,-4.462 C21.878,-3.897 21.993000000000002,-3.331 22.082,-2.762 C22.137,-2.411 22.156000000000002,-2.054 22.17,-1.698 C22.177000000000003,-1.515 22.004,-1.4649999999999999 21.869,-1.412 C21.784,-1.379 21.685000000000002,-1.383 21.568,-1.367 C21.609,-1.133 21.505,-0.9950000000000001 21.3,-0.927 C21.261,-0.914 21.206,-0.881 21.183,-0.896 C20.915,-1.07 20.604,-0.861 20.333,-0.995 C20.320999999999998,-1.001 20.296,-0.979 20.235,-0.952 C20.291999999999998,-0.856 20.346,-0.764 20.403,-0.668 C20.398999999999997,-0.659 20.396,-0.629 20.382,-0.623 C20.132,-0.505 19.882,-0.386 19.628,-0.277 C19.482,-0.21500000000000002 19.357000000000003,-0.155 19.251,-0.013 C19.158,0.111 18.975,0.21 18.818,0.236 C18.469,0.293 18.261,0.55 17.999,0.732 C17.935,0.776 17.856,0.7979999999999999 17.783,0.83 C17.262,1.056 16.721,1.264 16.334,1.694 C16.187,1.8579999999999999 16.062,2.032 15.876,2.161 C15.82,2.2 15.794,2.324 15.8,2.405 C15.813,2.5789999999999997 15.789,2.722 15.639,2.802zM0 0 M-15.031,6.532 C-15.044,6.386 -15.052999999999999,6.288 -15.058,6.223 C-14.897,6.099 -14.759,5.994000000000001 -14.622,5.889 C-14.561,5.843 -14.508000000000001,5.7749999999999995 -14.439,5.754 C-14.164,5.67 -13.889,5.569 -13.607,5.534 C-13.004,5.459 -12.398,5.405 -11.791,5.372 C-11.02,5.33 -10.241000000000001,5.256 -9.476,5.32 C-9.124,5.349 -8.799,5.284000000000001 -8.461,5.291 C-8.079,5.299 -7.696,5.357 -7.317,5.338 C-6.833,5.314 -6.385,5.390000000000001 -5.93,5.559 C-5.697,5.6450000000000005 -5.4079999999999995,5.565 -5.145,5.585 C-4.869,5.606 -4.595,5.657 -4.319,5.692 C-3.795,5.758 -3.3569999999999998,5.986000000000001 -3.001,6.376 C-2.936,6.448 -2.85,6.546 -2.77,6.55 C-2.503,6.561999999999999 -2.3289999999999997,6.7090000000000005 -2.139,6.87 C-1.9529999999999998,7.0280000000000005 -1.731,7.146 -1.518,7.271 C-1.262,7.421 -1.0810000000000002,7.619000000000001 -1.108,7.932 C-1.1260000000000001,8.139000000000001 -1.028,8.276 -0.882,8.386 C-0.748,8.487 -0.7210000000000001,8.612 -0.685,8.771 C-0.552,9.354000000000001 -0.528,9.966 -0.247,10.513 C-0.214,10.578 -0.178,10.677 -0.205,10.729 C-0.315,10.943999999999999 -0.169,11.103 -0.134,11.291 C0.024999999999999994,12.159 0.5780000000000001,12.815 1.002,13.54 C1.316,14.075999999999999 1.298,14.647 0.917,15.163 C0.789,15.337 0.654,15.508 0.51,15.668 C0.267,15.937999999999999 -0.027000000000000024,16.061 -0.4,15.985 C-0.47300000000000003,15.969999999999999 -0.5740000000000001,16.044999999999998 -0.649,16.098 C-0.9430000000000001,16.305999999999997 -1.228,16.527 -1.523,16.734 C-1.813,16.938000000000002 -2.1359999999999997,16.767999999999997 -2.441,16.801 C-2.814,16.842 -3.182,16.912 -3.553,16.97 C-3.566,17.003 -3.579,17.035999999999998 -3.592,17.069 C-3.702,16.904 -3.813,16.740000000000002 -3.951,16.533 C-4.135,17.021 -4.135,17.021 -4.78,16.843 C-4.984,17.206 -5.2090000000000005,17.297 -5.706,17.228 C-5.759,17.355 -5.777,17.526 -5.87,17.592 C-6.085,17.744999999999997 -6.326,17.706 -6.526,17.567 C-6.659,17.617 -6.7780000000000005,17.662 -6.897,17.705 C-7.04,17.756999999999998 -7.221,17.77 -7.317,17.868 C-7.474,18.029 -7.637,18.005000000000003 -7.819,17.992 C-7.903,17.986 -8.022,17.976 -8.066,18.023 C-8.186,18.152 -8.297,18.152 -8.438,18.078 C-8.478,18.057 -8.544,18.041999999999998 -8.579,18.06 C-8.816,18.185 -9.068,18.138 -9.317,18.143 C-9.608,18.149 -9.902,18.202 -10.19,18.181 C-10.543,18.155 -10.892,18.077 -11.241,18.012 C-11.295,18.002 -11.383000000000001,17.934 -11.38,17.898 C-11.343,17.393 -11.783,17.164 -12.051,16.907 C-12.718,16.267 -13.248999999999999,15.532 -13.79,14.798 C-13.963999999999999,14.563 -14.139,14.327 -14.29,14.077 C-14.827,13.19 -15.141,12.212 -15.417,11.221 C-15.734,10.083 -15.9,8.921000000000001 -15.986,7.746 C-16.011,7.404000000000001 -16.040000000000003,7.063 -16.059,6.721 C-16.069000000000003,6.547 -16.022,6.425 -15.796,6.462 C-15.559999999999999,6.5 -15.318000000000001,6.507 -15.031,6.532zM0 0 M13.613,12.931 C13.738,13.122 13.817,13.241 13.903,13.372 C13.944,13.358 14.002,13.337 14.069,13.314 C14.133000000000001,13.408 14.197999999999999,13.502999999999998 14.267,13.604 C14.096,13.623999999999999 13.939,13.647 13.781,13.661 C13.461,13.689 13.411,13.763 13.519,14.063 C13.533,14.102 13.556000000000001,14.138 13.563,14.151 C13.502,14.337 13.449,14.501999999999999 13.384,14.7 C13.391,14.694999999999999 13.365,14.727 13.339,14.727 C13.031,14.728 12.776,14.805 12.687,15.147 C12.677999999999999,15.184000000000001 12.638,15.222 12.603,15.241 C12.336,15.388 12.067,15.530000000000001 11.798,15.672 C11.77,15.687000000000001 11.715000000000002,15.686 11.71,15.703 C11.616000000000001,16.008 11.343,15.888 11.147,15.958 C10.933,16.034 10.744,16.18 10.542,16.29 C10.256,16.445999999999998 9.972999999999999,16.607 9.68,16.749 C9.432,16.869 9.082,16.798000000000002 8.89,16.597 C8.715,16.415000000000003 8.52,16.298000000000002 8.257,16.295 C8.169,16.294 8.068999999999999,16.252 7.997,16.198 C7.164,15.578000000000001 6.335,14.959 5.718,14.099 C5.273,13.479000000000001 4.784000000000001,12.892 4.328,12.28 C4.0440000000000005,11.899 3.789,11.497 3.515,11.109 C3.121,10.549 2.722,9.991999999999999 2.324,9.434 C2.223,9.292 2.2140000000000004,9.168 2.361,9.045 C2.587,8.857 2.7569999999999997,8.639000000000001 2.739,8.316 C2.735,8.244000000000002 2.802,8.107 2.845,8.104 C3.1340000000000003,8.081 3.258,7.819 3.473,7.691 C4.043,7.35 4.592,6.976 5.143,6.604 C5.379,6.445 5.593999999999999,6.257 5.824,6.088 C5.888,6.041 5.969,6.016 6.043,5.984 C6.111,5.955 6.183999999999999,5.936 6.249,5.902 C6.574999999999999,5.729 6.901,5.554 7.224,5.375 C7.307,5.329 7.383,5.268 7.461,5.213 C7.521,5.17 7.574,5.1000000000000005 7.64,5.086 C8.084999999999999,4.993 8.447,4.7010000000000005 8.879,4.575 C9.19,4.484 9.492,4.359 9.798,4.252 C9.846,4.234999999999999 9.899,4.231 9.95,4.221 C10.144,4.183 10.336,4.138 10.531,4.108 C10.753,4.074 10.966999999999999,4.047 11.152,4.245 C11.225999999999999,4.324 11.380999999999998,4.39 11.482,4.372 C12.01,4.278 12.302000000000001,4.6259999999999994 12.617,4.938 C12.669,4.989999999999999 12.705,5.063 12.764,5.104 C12.912999999999998,5.2090000000000005 12.939,5.35 12.933,5.52 C12.924,5.747 12.981,5.957 13.124,6.144 C13.209000000000001,6.255 13.329,6.372999999999999 13.207,6.536 C13.197000000000001,6.55 13.196,6.582 13.206,6.596 C13.376999999999999,6.837 13.546999999999999,7.079 13.725,7.316 C13.993,7.672 14.290999999999999,8.01 14.527,8.386 C14.636,8.559999999999999 14.748,8.707 14.899,8.845 C15.045,8.978000000000002 15.147,9.159 15.275,9.313 C15.47,9.547 15.716999999999999,9.700000000000001 16.011,9.781 C16.07,9.797 16.122,9.84 16.14,9.85 C16.295,9.799 16.426,9.756 16.561,9.712 C16.58,9.791 16.593,9.812999999999999 16.589,9.831 C16.549999999999997,10.022 16.441,10.23 16.487,10.396 C16.538999999999998,10.584000000000001 16.621,10.758 16.61,10.962 C16.602999999999998,11.094999999999999 16.35,11.481000000000002 16.231,11.489 C16.176000000000002,11.492 16.12,11.442 16.062,11.425 C15.872000000000002,11.370000000000001 15.713000000000001,11.318999999999999 15.512,11.488 C15.341000000000001,11.632 15.067,11.654 14.8,11.743 C15.076,11.870000000000001 15.484,11.792 15.608,12.232 C15.454,12.222 15.296,12.214 15.139,12.199 C15.11,12.196 15.079,12.149 15.057,12.155 C14.965,12.178999999999998 14.844000000000001,12.187999999999999 14.794,12.251 C14.698,12.370999999999999 14.839,12.438 14.913,12.5 C14.951,12.532 15.026000000000002,12.519 15.101,12.528 C14.998000000000001,12.767000000000001 14.803999999999998,12.723 14.591,12.67 C14.546,12.889 14.507,13.081 14.455,13.336 C14.267,13.200000000000001 14.138,13.085 13.99,13.005 C13.899000000000001,12.956000000000001 13.779,12.960999999999999 13.613,12.931zM0 0 M-24.005,-0.25 C-23.962999999999997,-0.43 -23.958,-0.681 -23.848,-0.869 C-23.608999999999998,-1.277 -23.552,-1.733 -23.482,-2.172 C-23.416999999999998,-2.579 -23.233,-2.881 -22.988,-3.182 C-22.756999999999998,-3.4659999999999997 -22.567,-3.7849999999999997 -22.32,-4.052 C-22.214,-4.167 -22.173,-4.257 -22.15,-4.404 C-22.134,-4.504 -22.013,-4.642 -21.916,-4.665 C-21.646,-4.728 -21.529999999999998,-4.934 -21.406,-5.134 C-21.375999999999998,-5.183000000000001 -21.424,-5.28 -21.438,-5.367 C-21.368,-5.486 -21.289,-5.632 -21.196,-5.769 C-21.151,-5.836 -21.087,-5.9159999999999995 -21.017,-5.935 C-20.916,-5.962 -20.852999999999998,-5.978 -20.819,-6.098 C-20.804,-6.151 -20.665,-6.1739999999999995 -20.579,-6.199 C-20.462,-6.233 -20.461,-6.228 -20.47,-6.443 C-20.581999999999997,-6.436999999999999 -20.693,-6.431 -20.893,-6.42 C-20.767,-6.5649999999999995 -20.683999999999997,-6.661 -20.589,-6.77 C-20.058,-6.497999999999999 -19.528000000000002,-6.234 -19.007,-5.957 C-18.484,-5.679 -17.921,-5.510000000000001 -17.369,-5.307 C-16.992,-5.168 -16.598,-5.058 -16.31,-4.716 C-16.142999999999997,-4.518 -15.858,-4.423 -15.63,-4.275 C-15.428,-4.144 -15.23,-4.006 -15.034,-3.865 C-14.704,-3.628 -14.375,-3.388 -14.049,-3.146 C-13.863,-3.008 -13.668,-2.879 -13.504,-2.717 C-13.094999999999999,-2.3120000000000003 -12.68,-1.908 -12.356,-1.429 C-12.235,-1.25 -12.166,-1.036 -12.074,-0.838 C-12.057,-0.8019999999999999 -12.054,-0.749 -12.026,-0.732 C-11.753,-0.56 -11.791,-0.254 -11.711,-0.001 C-11.693,0.057 -11.729,0.137 -11.751,0.203 C-11.817,0.402 -11.904,0.5960000000000001 -11.954,0.799 C-12.045,1.169 -12.167,1.506 -12.541,1.689 C-12.595,1.715 -12.624,1.8 -12.656,1.862 C-12.685,1.9180000000000001 -12.698,1.9819999999999998 -12.727,2.038 C-12.746,2.074 -12.808,2.104 -12.805,2.13 C-12.748,2.5629999999999997 -13.116,2.851 -13.18,3.256 C-13.229,3.569 -13.479999999999999,3.846 -13.591,4.157 C-13.671999999999999,4.385 -13.674,4.641 -13.706,4.886 C-13.713999999999999,4.944 -13.674,5.037 -13.7,5.058 C-13.994,5.292 -14.201,5.662999999999999 -14.624,5.696 C-14.742,5.705 -14.868,5.64 -14.988,5.603 C-15.17,5.547 -15.315,5.579000000000001 -15.437,5.74 C-15.578,5.925 -15.735,6.095000000000001 -15.886,6.272 C-15.912999999999998,6.255 -15.940000000000001,6.239000000000001 -15.967,6.222 C-15.989,6.148000000000001 -16.011,6.074 -16.035,5.994 C-16.19,5.91 -16.489,6.218 -16.514,5.75 C-16.652,5.932 -16.749,6.0600000000000005 -16.865,6.213 C-16.918999999999997,5.983 -17.250999999999998,5.979 -17.269,5.667 C-17.548,5.7379999999999995 -17.808,5.64 -18.101,5.528 C-18.118,5.335 -18.249,5.239999999999999 -18.499,5.262 C-18.608,5.271999999999999 -18.726,5.191999999999999 -18.865,5.145 C-18.895,5.382 -19.037,5.473000000000001 -19.241,5.424 C-19.442,5.375 -19.541,5.199 -19.518,5.07 C-19.652,5.037 -19.778000000000002,5.006 -19.905,4.976 C-19.977,4.959 -20.052,4.949 -20.123,4.93 C-20.475,4.837 -20.825,4.739 -21.177,4.648 C-21.279,4.622 -21.384999999999998,4.61 -21.49,4.601 C-21.727999999999998,4.581 -21.956,4.59 -22.172,4.423 C-22.511,4.162 -22.882,4.262 -23.271,4.446 C-23.379,4.297 -23.509,4.155 -23.595,3.99 C-23.772,3.652 -23.954,3.3120000000000003 -24.079,2.954 C-24.194,2.6260000000000003 -24.264,2.276 -24.302,1.93 C-24.345,1.5379999999999998 -24.343,1.138 -24.334,0.742 C-24.328,0.502 -24.286,0.26 -24.231,0.026 C-24.21,-0.062 -24.105999999999998,-0.131 -24.005,-0.25zM0 0 M-3.864,5.875 C-4.12,5.828 -4.3309999999999995,5.79 -4.587,5.743 C-4.606,5.716 -4.666,5.633 -4.702,5.582 C-4.965,5.654 -5.188,5.731 -5.418,5.771 C-5.513,5.788 -5.6209999999999996,5.719 -5.725,5.7 C-5.8709999999999996,5.672000000000001 -6.0200000000000005,5.645 -6.168,5.635 C-6.275,5.628 -6.3919999999999995,5.68 -6.489,5.651 C-6.912,5.5249999999999995 -7.2490000000000006,5.718 -7.596,5.908 C-7.769,6.003 -7.958000000000001,6.019 -8.117,5.86 C-8.467,5.510000000000001 -8.851,5.186 -9.157,4.801 C-9.534,4.327 -9.733,3.747 -9.919,3.174 C-10.132,2.518 -10.356,1.864 -10.517,1.195 C-10.658999999999999,0.6030000000000001 -10.723,-0.009000000000000008 -10.816,-0.612 C-10.894,-1.117 -10.965,-1.623 -11.038,-2.129 C-11.058,-2.268 -10.732,-3.0340000000000003 -10.61,-3.083 C-10.506,-3.125 -10.369,-3.149 -10.265,-3.119 C-9.936,-3.023 -9.673,-3.034 -9.392,-3.298 C-9.208,-3.471 -8.905,-3.5570000000000004 -8.642,-3.599 C-7.821,-3.732 -6.977,-3.7190000000000003 -6.19,-3.503 C-5.723000000000001,-3.375 -5.27,-3.3760000000000003 -4.813,-3.329 C-4.431,-3.29 -4.036,-3.3890000000000002 -3.65,-3.365 C-3.3209999999999997,-3.3440000000000003 -2.999,-3.227 -2.672,-3.167 C-2.387,-3.114 -2.098,-3.073 -1.81,-3.041 C-0.914,-2.943 -0.04800000000000004,-2.77 0.739,-2.281 C1.217,-1.9840000000000002 1.763,-1.7959999999999998 2.243,-1.501 C2.6559999999999997,-1.2469999999999999 3.039,-0.9339999999999999 3.398,-0.607 C3.8890000000000002,-0.15899999999999997 4.362,0.31300000000000006 4.812,0.802 C5.062,1.073 5.279,1.3860000000000001 5.454,1.711 C5.516,1.826 5.454000000000001,2.063 5.368,2.189 C5.174,2.47 5.1450000000000005,2.738 5.181,3.079 C5.23,3.5370000000000004 5.159,4.009 5.132,4.474 C5.129,4.517 5.074,4.591 5.039,4.594 C4.6739999999999995,4.621 4.465,4.993 4.063,4.99 C3.804,4.988 3.54,5.163 3.283,5.269 C3.135,5.33 3.007,5.4270000000000005 2.833,5.312 C2.7670000000000003,5.268000000000001 2.621,5.256 2.567,5.299 C2.303,5.510000000000001 2.027,5.444 1.727,5.419 C1.453,5.396 1.17,5.4959999999999996 0.89,5.534 C0.526,5.583 0.17500000000000002,5.565 -0.161,5.381 C-0.269,5.322 -0.466,5.276 -0.54,5.332 C-0.8460000000000001,5.5649999999999995 -1.184,5.433 -1.504,5.463 C-1.736,5.485 -1.974,5.425 -2.21,5.422 C-2.44,5.419 -2.66,5.438999999999999 -2.837,5.637 C-2.8920000000000003,5.699 -3.065,5.717 -3.151,5.68 C-3.5309999999999997,5.516 -3.527,5.506 -3.799,5.804 C-3.826,5.8340000000000005 -3.854,5.864 -3.864,5.875zM0 0 M-4.922,-4.636 C-5.146,-4.703 -5.378,-4.79 -5.617,-4.84 C-5.939,-4.907 -6.311,-4.755 -6.573,-5.098 C-6.611000000000001,-5.148 -6.848,-5.114 -6.937,-5.045 C-7.138,-4.89 -7.3469999999999995,-4.897 -7.513,-5.021 C-7.791,-5.229 -8.008999999999999,-5.094 -8.235,-4.963 C-8.668999999999999,-4.711 -9.075000000000001,-4.761 -9.476,-5.019 C-9.731000000000002,-5.183 -10.056,-5.239 -10.353,-5.337 C-10.456,-5.3709999999999996 -10.594,-5.351 -10.668,-5.413 C-11.2,-5.86 -11.855,-6.092 -12.438,-6.451 C-12.771,-6.656 -13.155000000000001,-6.8 -13.534,-6.902 C-14.009,-7.03 -14.31,-7.339 -14.523,-7.737 C-14.831,-8.312 -15.065,-8.923 -15.131,-9.577 C-15.163,-9.897 -15.139999999999999,-10.227 -15.1,-10.547 C-15.009,-11.266 -14.927999999999999,-11.989999999999998 -14.774,-12.697 C-14.648,-13.276 -14.428,-13.834999999999999 -14.237,-14.399 C-14.016,-15.052 -13.777000000000001,-15.699 -13.554,-16.352 C-13.423,-16.737000000000002 -13.073,-16.916 -12.675,-16.871 C-12.289000000000001,-16.826999999999998 -11.889999999999999,-16.898000000000003 -11.504,-16.853 C-10.865,-16.779 -10.235,-16.622 -9.596,-16.555 C-8.788,-16.471 -8.093,-16.09 -7.363,-15.796 C-7.274,-15.76 -7.152,-15.721 -7.075,-15.753 C-6.692,-15.913 -6.425,-15.713000000000001 -6.122,-15.525 C-5.864,-15.364 -5.553999999999999,-15.288 -5.27,-15.166 C-4.800999999999999,-14.965 -4.332,-14.762 -3.868,-14.551 C-3.752,-14.498 -3.647,-14.418 -3.542,-14.343 C-3.2119999999999997,-14.108 -2.8840000000000003,-13.869 -2.555,-13.633 C-2.5290000000000004,-13.613999999999999 -2.487,-13.610999999999999 -2.468,-13.588 C-1.841,-12.831999999999999 -0.9849999999999999,-12.269 -0.573,-11.33 C-0.44799999999999995,-11.046 -0.379,-10.786000000000001 -0.527,-10.476 C-0.613,-10.295000000000002 -0.591,-10.065 -0.623,-9.857 C-0.634,-9.783 -0.641,-9.664 -0.683,-9.647 C-0.916,-9.553 -0.8310000000000001,-9.404 -0.796,-9.237 C-0.764,-9.085 -0.773,-8.919 -0.789,-8.762 C-0.851,-8.13 -1.278,-7.625 -1.405,-7.009 C-1.447,-6.805000000000001 -1.666,-6.641 -1.784,-6.447 C-2.035,-6.034 -2.242,-5.591 -2.789,-5.471 C-2.97,-5.431 -3.13,-5.300000000000001 -3.303,-5.219 C-3.576,-5.091 -3.888,-5.1080000000000005 -4.132,-4.833 C-4.276999999999999,-4.6690000000000005 -4.64,-4.698 -4.922,-4.636zM0 0 M2.168,-21.652 C2.607,-21.285 3.056,-21.381999999999998 3.191,-21.874 C3.3899999999999997,-21.741 3.591,-21.637999999999998 3.754,-21.493 C4.023,-21.253 4.247000000000001,-20.986 4.589,-20.805 C4.9910000000000005,-20.593 5.3149999999999995,-20.228 5.661,-19.916 C6.116,-19.506 6.558999999999999,-19.082 7.007,-18.664 C7.0169999999999995,-18.654 7.032,-18.649 7.04,-18.638 C7.457,-18.113000000000003 7.872,-17.586 8.292,-17.063 C8.387,-16.945 8.505,-16.848 8.605,-16.733 C8.873000000000001,-16.425 9.147,-16.122 9.397,-15.8 C9.525,-15.636000000000001 9.621,-15.442 9.705,-15.25 C9.92,-14.761 10.120000000000001,-14.266 10.326,-13.773 C10.509,-13.336 10.701,-12.903 10.866,-12.459 C10.911,-12.338 10.865,-12.184999999999999 10.867,-12.046 C10.870000000000001,-11.851999999999999 10.850000000000001,-11.651 10.893,-11.465 C10.996,-11.018 10.959,-10.892000000000001 10.592,-10.605 C10.294,-10.371 9.996,-10.133 9.715,-9.879 C9.41,-9.603 9.044,-9.593 8.718,-9.726 C8.28,-9.905000000000001 7.848000000000001,-9.887 7.4,-9.877 C7.093,-9.870000000000001 6.777,-9.878 6.48,-9.945 C6.257000000000001,-9.996 6.024,-10.115 5.855,-10.269 C5.515000000000001,-10.578 5.159000000000001,-10.828000000000001 4.714,-10.976 C4.476000000000001,-11.055000000000001 4.242,-11.238000000000001 4.08,-11.435 C3.809,-11.764000000000001 3.5429999999999997,-12.075000000000001 3.122,-12.211 C3.084,-12.223 3.0519999999999996,-12.26 3.022,-12.29 C2.63,-12.67 2.233,-13.044 1.849,-13.432 C1.663,-13.620000000000001 1.345,-13.718 1.376,-14.078 C1.378,-14.106 1.2149999999999999,-14.138 1.138,-14.184 C0.7309999999999999,-14.425999999999998 0.5469999999999999,-14.842 0.367,-15.243 C0.035999999999999976,-15.982000000000001 -0.06200000000000001,-16.762 0.074,-17.562 C0.102,-17.726000000000003 0.20800000000000002,-17.874 0.253,-18.037 C0.355,-18.401999999999997 0.403,-18.786 0.541,-19.135 C0.805,-19.803 1.0670000000000002,-20.478 1.612,-20.992 C1.814,-21.182000000000002 1.973,-21.418 2.168,-21.652zM0 0 M12.502,-17.646 C12.88,-17.576 13.336,-17.491 13.792,-17.407 C14.020999999999999,-17.365 14.252,-17.331 14.48,-17.283 C14.643,-17.249000000000002 14.802,-17.195999999999998 14.964,-17.153 C15.015,-17.139 15.073,-17.107999999999997 15.117,-17.121 C15.381,-17.198999999999998 15.499,-17.015 15.635,-16.852 C15.722999999999999,-16.747 15.81,-16.632 15.92,-16.555 C16.139,-16.402 16.226,-16.2 16.236,-15.942 C16.246000000000002,-15.7 16.276000000000003,-15.457999999999998 16.295,-15.216 C16.316000000000003,-14.957999999999998 16.168,-14.758 15.999,-14.613 C15.789,-14.433 15.536000000000001,-14.296 15.284,-14.176 C15.118,-14.097 14.922,-14.081 14.739,-14.038 C14.627,-14.012 14.511000000000001,-13.997000000000002 14.403,-13.96 C14.052,-13.838000000000001 13.735999999999999,-13.815999999999999 13.399,-14.058 C13.177999999999999,-14.216 12.884,-14.307 12.61,-14.348 C12.011,-14.437000000000001 11.584999999999999,-14.766 11.219,-15.214 C11.040999999999999,-15.431000000000001 10.895000000000001,-15.649000000000001 10.877,-15.945 C10.867,-16.108 10.775,-16.266 10.75,-16.43 C10.71,-16.698 10.667,-16.97 10.679,-17.238 C10.687,-17.423 10.883,-17.465 11.043,-17.49 C11.206,-17.516 11.372000000000002,-17.523 11.537,-17.541 C11.83,-17.572 12.123000000000001,-17.605 12.502,-17.646zM0 0 M22.939,8.125 C22.776,8.125 22.695,8.151 22.655,8.121 C22.26,7.825 22.044999999999998,8.057 21.808,8.361 C21.559,8.680000000000001 21.233999999999998,8.924000000000001 20.988,9.265 C20.733999999999998,9.617 20.320999999999998,9.892000000000001 19.921,10.082 C19.727999999999998,10.174000000000001 19.38,10.039 19.147,9.92 C18.9,9.794 18.689,9.617 18.392,9.595 C18.28,9.587000000000002 18.148,9.514000000000001 18.07,9.429 C17.579,8.891 17.055,8.38 16.696,7.732 C16.571,7.506 16.544,7.3180000000000005 16.702,7.091 C16.892000000000003,6.819 17.041,6.519 17.212,6.234 C17.268,6.141 17.32,6.018000000000001 17.406,5.977 C17.939,5.7250000000000005 18.097,5.132000000000001 18.52,4.775 C18.78,4.556 18.936,4.218 19.162,3.954 C19.459,3.608 19.776,3.279 20.089,2.947 C20.276999999999997,2.747 20.689,2.6889999999999996 20.997,2.889 C21.433,3.171 21.824,3.52 22.248,3.821 C22.933,4.307 23.271,5.077 23.789,5.699 C24.021,5.977 24.137,6.369 24.242,6.728 C24.345000000000002,7.082 24.069,7.6129999999999995 23.718,7.718 C23.495,7.785 23.340999999999998,7.893 23.179,8.039 C23.098,8.112 22.958,8.119 22.939,8.125zM0 0 M-19.218,-13.194 C-19.157,-13.114 -19.096,-13.035 -19.059,-12.987 C-18.396,-12.836 -17.752,-12.715 -17.125,-12.535 C-16.884,-12.466 -16.680999999999997,-12.263 -16.458,-12.126 C-16.362,-12.067 -16.262,-12.006 -16.155,-11.974 C-15.949000000000002,-11.911 -15.770999999999999,-11.673 -15.866,-11.493 C-16.012999999999998,-11.215 -16.075,-10.874 -16.381,-10.696 C-16.426000000000002,-10.67 -16.473,-10.623000000000001 -16.517,-10.624 C-16.894,-10.635 -17.276,-10.56 -17.642,-10.742 C-17.857,-10.849 -18.099999999999998,-10.898 -18.325,-10.987 C-18.407999999999998,-11.02 -18.488,-11.08 -18.551,-11.145 C-18.660999999999998,-11.258 -18.739,-11.406 -18.861,-11.5 C-19.208000000000002,-11.766 -19.334000000000003,-12.108 -19.295,-12.534 C-19.276000000000003,-12.743 -19.292,-12.955 -19.292,-13.166 C-19.267000000000003,-13.176 -19.243,-13.184000000000001 -19.218,-13.194zM0 0 M-2.688,20.946 C-2.495,20.821 -2.3529999999999998,20.729 -2.211,20.636 C-1.884,20.419999999999998 -1.657,20.128 -1.533,19.754 C-1.511,19.686 -1.477,19.597 -1.423,19.57 C-1.03,19.376 -0.766,19.025000000000002 -0.42,18.78 C-0.273,18.676000000000002 -0.03900000000000001,18.694 0.234,18.642 C0.15600000000000003,18.785 0.123,18.865 0.074,18.935 C-0.23299999999999998,19.378 -0.544,19.817999999999998 -0.851,20.261 C-0.899,20.33 -0.942,20.405 -0.972,20.483 C-1.139,20.912 -1.339,21.330000000000002 -1.417,21.788 C-1.458,22.031 -1.5799999999999998,22.247 -1.559,22.518 C-1.546,22.682000000000002 -1.732,22.861 -1.857,23.085 C-2.193,22.676000000000002 -2.647,22.401 -2.517,21.804 C-2.504,21.744999999999997 -2.52,21.677 -2.533,21.616 C-2.582,21.394 -2.6350000000000002,21.174000000000003 -2.688,20.946zM0 0 M-9.384,-19.774 C-9.162,-19.554000000000002 -9.054,-19.312 -9.001,-19.033 C-8.977,-18.907 -8.903,-18.782 -8.829,-18.673 C-8.610000000000001,-18.352999999999998 -8.475000000000001,-17.979 -8.159,-17.72 C-8.033000000000001,-17.616999999999997 -7.875,-17.491999999999997 -7.916,-17.269 C-7.924,-17.223999999999997 -7.8100000000000005,-17.167 -7.785,-17.103 C-7.755,-17.027 -7.721,-16.904 -7.758,-16.862 C-7.802,-16.811999999999998 -7.948,-16.784 -8,-16.819 C-8.145,-16.916999999999998 -8.306000000000001,-17.032 -8.384,-17.18 C-8.468,-17.341 -8.544,-17.474 -8.688,-17.6 C-8.863000000000001,-17.753 -8.969999999999999,-17.984 -9.103,-18.184 C-9.155,-18.263 -9.184,-18.36 -9.245,-18.429 C-9.322999999999999,-18.516 -9.325000000000001,-18.596 -9.326,-18.71 C-9.327,-18.859 -9.393,-19.017 -9.464,-19.154 C-9.612,-19.442 -9.617,-19.478 -9.384,-19.774zM0 0 M5.827,-23.085 C5.735,-22.884 5.783,-22.701 5.828,-22.5 C5.954000000000001,-21.935 6.045999999999999,-21.363000000000003 6.145,-20.792 C6.156999999999999,-20.726000000000003 6.1290000000000004,-20.653 6.064,-20.57 C5.986,-20.751 5.9079999999999995,-20.933 5.829,-21.113 C5.662,-21.492 5.541,-21.887 5.466,-22.292 C5.406000000000001,-22.616000000000003 5.535,-22.888 5.827,-23.085zM0 0 M-3.254,-17.408 C-3.248,-17.361 -3.241,-17.314999999999998 -3.237,-17.284 C-3.088,-17.265 -2.9480000000000004,-17.245 -2.72,-17.216 C-2.9490000000000003,-16.894000000000002 -3.127,-16.631 -3.324,-16.383 C-3.3569999999999998,-16.342 -3.495,-16.336000000000002 -3.548,-16.37 C-3.746,-16.497 -3.871,-16.942 -3.822,-17.175 C-3.786,-17.346 -3.7089999999999996,-17.405 -3.538,-17.382 C-3.4469999999999996,-17.37 -3.352,-17.398 -3.254,-17.408z"></path>
                                                                        </g>
                                                                    </g>
                                                                    <g
																transform="matrix(0.9,0,0,0.9,338.4302,225.5892)"
																opacity="1" style="user-select: none;">
                                                                        <g
																opacity="1" transform="matrix(1,0,0,1,0,0)">
                                                                            <path
																stroke-linecap="round" stroke-linejoin="round"
																fill-opacity="0" stroke="rgb(86,90,92)"
																stroke-opacity="1" stroke-width="3"
																d="M0 0 M-20.277,42.659 C-21.884,43.361 -23.393,44.376 -24.422,45.796 C-25.451,47.216 -25.95,49.074999999999996 -25.496,50.769 C-24.964,52.756 -23.215,54.233 -21.298,54.977 C-19.380999999999997,55.721 -17.288,55.847 -15.235,55.964M0 0 M-19.082,55.964 C-19.725,57.836 -19.355,60.022 -18.132,61.579 C-17.053,62.953 -15.339,63.798 -13.596,63.853 C-13.177,63.866 -12.823,64.168 -12.721,64.575 C-12.327,66.153 -11.83,67.732 -10.766,68.944 C-9.535,70.346 -7.292,71.05099999999999 -5.761,69.984M0 0 M-6.051,65.038 C-5.883,67.827 -4.021,70.447 -1.442,71.523 C1.1370000000000002,72.59899999999999 4.307,72.08 6.408,70.238M0 0 M-19.944,28.039 C-22.145,29.956000000000003 -22.865,33.381 -21.622,36.022M0 0 M-14.693,28.475 C-14.061,25.837000000000003 -12.471,23.298000000000002 -10.008,22.161 C-7.544999999999999,21.024 -4.199,21.692 -2.829,24.033M0 0 M2.152,20.248 C3.161,18.381 4.888,16.864 6.94,16.323 C8.992,15.782 11.344,16.304 12.828,17.822 C14.312,19.34 14.757,21.846 13.706,23.69M0 0 M14.83,20.646 C17.158,20.104 19.753999999999998,20.944000000000003 21.322,22.748 C22.89,24.552 23.361,27.24 22.5,29.47M0 0 M12.827,63.619 C16.772,63.627 20.570999999999998,60.874 21.79,57.122M0 0 M19.079,55.68 C21.130000000000003,57.135 24.096,57.149 26.16,55.713 C28.224,54.277 29.244,51.492000000000004 28.594,49.063M0 0 M22.162,35.513 C24.269,35.47 26.352,36.696999999999996 27.338,38.559 C28.324,40.422 28.166,42.833 26.946,44.551M0 0 M-7.867,48.297 C-8.089,50.089 -7.279,51.973 -5.826,53.046 C-4.372999999999999,54.119 -2.336,54.339999999999996 -0.688,53.601M0 0 M3.854,51.941 C4.896,52.989000000000004 6.466,53.485 7.921,53.227 C9.377,52.968999999999994 10.677999999999999,51.962 11.296,50.619M0 0 M-11.038,35.945 C-11.878,37.146 -12.028,38.796 -11.417,40.128 C-10.806,41.46 -9.458,42.424 -8,42.571M0 0 M4.843,32.23 C7.6370000000000005,32.849 9.691,35.819 9.284,38.652M0 0 M-1.005,43.467 C0.17200000000000015,45.454 2.7810000000000006,46.461999999999996 4.988,45.782M0 0 M-2,60.631 C-1.1059999999999999,62.275 1.3549999999999998,62.788000000000004 2.832,61.64M0 0 M-58.437,8.4 C-59.297999999999995,7.0760000000000005 -61.580999999999996,7.601 -62.315,9 C-63.049,10.398 -62.652,12.121 -62.017,13.567 C-60.480000000000004,17.069 -57.606,19.964000000000002 -54.115,21.527M0 0 M-52.076,27.918 C-53.359,26.782 -55.634,27.095000000000002 -56.562,28.536 C-57.76,30.395000000000003 -56.461,33.037 -54.495,34.049 C-52.528999999999996,35.062 -50.190999999999995,34.907999999999994 -47.986,34.73M0 0 M-59.559,46.081 C-62.788,46.861000000000004 -64.89,50.712 -63.799,53.85 C-62.708,56.988 -58.67100000000001,58.704 -55.654,57.313M0 0 M-46.517,45.296 C-48.857,45.369 -50.811,47.841 -50.342,50.135 C-49.873,52.428999999999995 -47.105,53.935 -44.924,53.084M0 0 M-53.154,64.849 C-54.512,64.96300000000001 -55.775,65.86099999999999 -56.329,67.106 C-56.883,68.351 -56.704,69.89 -55.879,70.975 C-54.893,72.27199999999999 -53.153999999999996,72.813 -51.525,72.752 C-49.897,72.69 -48.338,72.11399999999999 -46.811,71.544M0 0 M-38.047,62.955 C-39.613,61.769 -42.146,63.125 -42.497,65.057 C-42.848,66.989 -41.502,68.919 -39.765,69.836 C-38.028,70.753 -35.988,70.86399999999999 -34.024,70.856M0 0 M-36.889,71.274 C-38.85,71.779 -40.169000000000004,74.034 -39.648,75.991 C-39.127,77.948 -36.863,79.248 -34.91,78.712M0 0 M-24.424,69.345 C-25.448,71.228 -25.213,73.72 -23.857,75.379 C-22.500999999999998,77.03800000000001 -20.105999999999998,77.765 -18.057,77.136M0 0 M-16.735,72.323 C-18.064999999999998,75.369 -17.146,78.99 -14.259,82.077M0 0 M-61.721,-12.399 C-64.143,-12.399 -66.112,-10.009 -66.196,-7.588 C-66.28,-5.167 -64.848,-2.895 -62.97,-1.365 C-61.092,0.16500000000000004 -58.8,1.0779999999999998 -56.547,1.968M0 0 M-56.616,-25.987 C-57.317,-27.173 -58.601,-27.995 -59.971,-28.135 C-61.340999999999994,-28.275000000000002 -62.763999999999996,-27.73 -63.69,-26.71 C-65.347,-24.885 -65.149,-21.879 -63.721,-19.87 C-62.293,-17.861 -59.914,-16.722 -57.518,-16.145M0 0 M-48.656,-54.801 C-47.263,-54.63 -46.031,-53.732 -45.214,-52.591 C-44.397,-51.45 -43.952,-50.083 -43.661,-48.71 C-42.854,-44.902 -43.16,-40.864000000000004 -44.535,-37.222M0 0 M-68.042,-45.911 C-68.879,-45.719 -69.454,-44.884 -69.568,-44.033 C-69.682,-43.182 -69.419,-42.324999999999996 -69.077,-41.538 C-67.67999999999999,-38.321999999999996 -64.849,-35.761 -61.509,-34.694M0 0 M-72.045,-78.087 C-73.051,-74.00800000000001 -73.41000000000001,-69.77199999999999 -73.105,-65.582 C-72.894,-62.681 -72.133,-59.443 -69.637,-57.948 C-67.77,-56.83 -65.186,-57.077999999999996 -63.567,-58.532M0 0 M-65.453,-57.25 C-65.001,-51.003 -62.289,-44.928 -57.889,-40.306M0 0 M-54.798,-54.296 C-52.439,-49.244 -51.744,-43.432 -52.845,-37.967M0 0 M-38.995,-26.181 C-37.939,-27.871000000000002 -35.376,-28.157 -33.698,-27.081 C-32.021,-26.005 -31.191999999999997,-23.931 -31.144,-21.939 C-31.096,-19.947 -31.717,-18.003 -32.394,-16.129M0 0 M-27.793,-14.324 C-25.423,-14.019 -23.518,-11.955 -22.939,-9.637 C-22.36,-7.3180000000000005 -22.930999999999997,-4.833 -24.022,-2.707 C-25.113,-0.581 -26.692999999999998,1.249 -28.258,3.055M0 0 M-39.944,-5.352 C-37.42,-6.960000000000001 -33.573,-5.746 -32.43,-2.981M0 0 M-23.438,6.12 C-21.491999999999997,4.23 -17.922,4.446 -16.219,6.558 C-14.516000000000002,8.669 -15.059999999999999,12.205 -17.319,13.707M0 0 M-40.256,3.827 C-40.826,2.87 -42.383,3.005 -43.131,3.83 C-43.879,4.655 -44.011,5.859 -44.011,6.973 C-44.011,10.227 -43.183,13.477 -41.626,16.334M0 0 M-32.409,15.544 C-32.484,13.931000000000001 -30.819000000000003,12.583 -29.207,12.683 C-27.595,12.783 -26.217,14.045 -25.616,15.544 C-25.015,17.043 -25.078,18.730999999999998 -25.389,20.316M0 0 M-34.431,31.439 C-34.766999999999996,30.322 -36.205,29.782 -37.293,30.204 C-38.381,30.626 -39.064,31.784 -39.171,32.946 C-39.278,34.108 -38.892999999999994,35.266 -38.355,36.302 C-36.983999999999995,38.945 -34.559,41.021 -31.737,41.97M0 0 M-35.826,40.125 C-37.159,40.657 -38.074000000000005,42.091 -37.996,43.524 C-37.918,44.957 -36.851000000000006,46.282 -35.468,46.665M0 0 M-32.872,51.225 C-33.842,52.721000000000004 -33.744,54.832 -32.638,56.231 C-31.531999999999996,57.63 -29.502,58.213 -27.822,57.615M0 0 M-50.464,-31.982 C-50.266,-33.048 -48.729000000000006,-33.364999999999995 -47.834,-32.754 C-46.939,-32.143 -46.576,-31.011000000000003 -46.36,-29.949 C-45.585,-26.141000000000002 -45.958,-22.105999999999998 -47.42,-18.505M0 0 M-48.715,-0.408 C-49.929,-3.018 -50.431000000000004,-5.952999999999999 -50.155,-8.818 C-50.061,-9.796999999999999 -49.834,-10.847 -49.094,-11.495 C-48.354,-12.142999999999999 -46.963,-12.077 -46.592,-11.166M0 0 M-67.334,-69.992 C-66.449,-71.61800000000001 -63.985,-72.09100000000001 -62.561,-70.908 C-61.137,-69.725 -61.15,-67.21600000000001 -62.586,-66.048M0 0 M8.246,-19.695 C5.659000000000001,-18.655 3.8840000000000003,-15.870000000000001 4.033,-13.086 C4.182,-10.302 6.245000000000001,-7.723 8.928,-6.965M0 0 M1.994,-0.948 C-0.40400000000000014,-0.965 -2.647,1.0459999999999998 -2.889,3.432 C-3.1319999999999997,5.818 -1.3400000000000003,8.239 1.013,8.705M0 0 M4.004,7.924 C0.7109999999999994,8.182 -1.985,11.57 -1.497,14.837M0 0 M60.248,0.813 C58.196999999999996,1.5099999999999998 56.481,3.135 55.674,5.145 C54.866,7.154999999999999 54.980999999999995,9.516 55.98,11.438M0 0 M63.358,5.728 C64.212,4.629 65.164,3.5780000000000003 66.346,2.842 C67.528,2.106 68.97099999999999,1.7089999999999999 70.332,2.001 C71.693,2.2929999999999997 72.92099999999999,3.364 73.166,4.734 C73.411,6.104 72.47099999999999,7.647 71.094,7.854M0 0 M62.501,19.309 C64.32,19.269000000000002 66.25500000000001,19.194000000000003 67.754,18.164 C69.253,17.134 69.976,14.773 68.707,13.47M0 0 M46.981,13.767 C44.131,14.852 42.069,17.751 41.981,20.8M0 0 M50.124,24.748 C51.606,23.628 54.003,24.592000000000002 54.667,26.327 C55.331,28.062 54.522,30.111 53.109,31.318 C51.696000000000005,32.525 49.806,33.021 47.957,33.208M0 0 M31.719,31.495 C28.946,32.754 26.717000000000002,35.164 25.678,38.027M0 0 M38.71,37.408 C40.489000000000004,36.985 42.499,38.001000000000005 43.212,39.685 C43.925000000000004,41.369 43.256,43.521 41.714,44.503M0 0 M37.153,43.509 C39.028,44.53 40.436,46.373 40.925,48.451 C41.413999999999994,50.529 40.977,52.808 39.754,54.558M0 0 M17.571,13.314 C18.508000000000003,14.607 20.49,14.992 21.843,14.144 C23.196,13.295 23.711,11.343 22.955,9.937M0 0 M18.682,-4.741 C20.02,-6.369999999999999 22.820999999999998,-6.193 24.275,-4.667 C25.729,-3.142 25.928,-0.714 25.19,1.26 C24.452,3.234 22.925,4.814 21.268,6.117M0 0 M33.997,2.54 C35.125,1.347 37.379,1.5810000000000002 38.239,2.979 C39.099,4.377 38.291000000000004,6.494 36.718,6.963M0 0 M33.024,22.074 C31.688000000000002,23.796000000000003 31.166999999999998,26.124000000000002 31.641,28.251 C32.114999999999995,30.378 33.576,32.265 35.517,33.257M0 0 M24.774,-19.101 C27.114,-18.64 29.155,-16.886 29.963,-14.642 C30.771,-12.398 30.316,-9.745 28.807,-7.898M0 0 M30.992,-11.541 C32.561,-11.518 34.094,-10.661 34.936,-9.337 C35.778,-8.012 35.903,-6.261 35.257,-4.831M0 0 M14.494,-35.7 C12.554,-34.213 11.498999999999999,-31.647000000000002 11.834,-29.225 C12.169,-26.803 13.878999999999998,-24.619 16.15,-23.714M0 0 M23.58,-33.43 C23.662999999999997,-35.145 25.544,-36.429 27.239,-36.158 C28.934,-35.887 30.255000000000003,-34.357 30.603,-32.676 C30.952,-30.995 30.457,-29.226 29.587,-27.746 C28.717,-26.266 27.495,-25.029000000000003 26.27,-23.827M0 0 M16.198,-45.793 C13.949,-44.995 13.027999999999999,-42.123 13.597,-39.805 C14.166,-37.487 15.815000000000001,-35.61 17.408,-33.833M0 0 M29.483,-54.419 C29.895,-56.099 31.939,-57.062999999999995 33.594,-56.559 C35.249,-56.055 36.376000000000005,-54.366 36.511,-52.642 C36.646,-50.918000000000006 35.915,-49.208000000000006 34.814,-47.874 C33.714,-46.54 32.267,-45.536 30.786,-44.643M0 0 M21.262,-60.976 C20.847,-62.004 19.271,-62.081 18.451,-61.334 C17.631,-60.587 17.424,-59.382000000000005 17.426,-58.273 C17.430999999999997,-55.585 18.411,-52.909 20.143,-50.854M0 0 M30.05,-67.559 C30.092000000000002,-69.116 32.216,-69.982 33.569,-69.21 C34.922000000000004,-68.43799999999999 35.412,-66.64800000000001 35.126,-65.117 C34.839999999999996,-63.586000000000006 33.945,-62.248 33.069,-60.96M0 0 M28.332,-82.22 C25.492,-82.282 23.099,-79.769 22.401,-77.015 C21.703,-74.262 22.328,-71.355 23.125,-68.629M0 0 M40.217,-85.25 C38.105,-84.973 36.19,-83.51299999999999 35.363,-81.55 C34.744,-80.079 34.771,-78.248 35.787,-77.018 C36.803,-75.788 38.917,-75.49900000000001 40,-76.671M0 0 M13.753,-12.692 C15.442,-14.679 18.797,-14.934000000000001 20.767,-13.226M0 0 M-39.164,77.126 C-41.023,77.233 -42.8,78.30000000000001 -43.766,79.891 C-44.732,81.482 -44.861,83.552 -44.099,85.25"></path>
                                                                        </g>
                                                                    </g>
                                                                    <g></g>
                                                                    <g
																transform="matrix(0.9,0,0,0.9,338.935,266.25)"
																opacity="1" style="user-select: none;">
                                                                        <g
																opacity="1" transform="matrix(1,0,0,1,0,0)">
                                                                            <path
																fill="rgb(180,167,108)" fill-opacity="1"
																d="M0 0 M-33.524,374.222 C-33.303000000000004,378.38 -32.482,383.27299999999997 -27.348,385.32 C-23.874,386.705 -19.586,386.247 -15.67,385.749 C12.183000000000002,382.206 40.035000000000004,378.664 67.888,375.121 C68.319,364.822 68.751,354.52099999999996 69.182,344.222 C69.315,341.036 69.281,337.505 66.268,335.126 C62.588,332.219 56.229,332.331 50.745,332.672 C26.343999999999998,334.18800000000005 1.6829999999999998,335.095 -22.619,337.23 C-36.195,338.423 -35.275999999999996,339.875 -34.846,349.368 C-34.473,357.62 -33.322,365.96999999999997 -33.524,374.222zM0 0 M67.413,385.398 C51.977,387.96200000000005 36.557,390.525 21.027,392.719 C13.425,393.793 5.842,394.94399999999996 -1.71,396.21 C-9.618,397.53499999999997 -17.357,399.441 -25.201,400.811 C-29.885,401.62899999999996 -28.519000000000002,406.781 -23.853,406.452 C-19.829,406.168 -15.711,406.39700000000005 -11.647,406.083 C-7.634,405.773 -3.636,405.292 0.356,404.851 C8.006,404.005 15.608,402.918 23.157,401.63 C38.585,398.998 53.986,396.192 69.211,392.919 C75.196,391.633 73.685,384.35600000000005 67.413,385.398z"></path>
                                                                        </g>
                                                                    </g>
                                                                    <g
																transform="matrix(0.9,0,0,0.9,376.285,680.7)"
																opacity="1" style="user-select: none;">
                                                                        <g
																opacity="1" transform="matrix(1,0,0,1,0,0)">
                                                                            <path
																stroke-linecap="round" stroke-linejoin="round"
																fill-opacity="0" stroke="rgb(86,90,92)"
																stroke-opacity="1" stroke-width="3"
																d="M0 0 M141.333,124.5 C141.333,124.5 141.333,296.5 141.333,296.5M0 0 M116,124.5 C116,124.5 116,296.5 116,296.5M0 0 M-115.964,124.5 C-115.964,124.5 -115.964,296.5 -115.964,296.5M0 0 M-141.333,124.5 C-141.333,124.5 -141.333,265.167 -141.333,265.167M0 0 M-1.055,124.5 C81.295,124.5 164,124.5 164,124.5 C164,124.5 164,124.5 164,124.5 C166.761,124.5 169,122.261 169,119.5 C169,119.5 169,89.5 169,89.5 C169,86.739 166.761,84.5 164,84.5 C164,84.5 -164,84.5 -164,84.5 C-166.761,84.5 -169,86.739 -169,89.5 C-169,89.5 -169,119.5 -169,119.5 C-169,122.261 -166.761,124.5 -164,124.5 C-164,124.5 -82.702,124.5 -1.055,124.5M0 0 M-73.346,17.676 C-70.758,54.328 -68.628,84.5 -68.628,84.5 M21.029,-116.5 C-10.721,-124.5 -63.767999999999994,-118.73700000000001 -78.073,-116.561 C-80.67099999999999,-116.16600000000001 -82.55099999999999,-113.881 -82.448,-111.255 C-82.448,-111.255 -77.349,-39.032 -73.346,17.676M0 0 M26.154,-62.245 C27.439,-86.449 28.362,-103.833 28.362,-103.833 M18.362,84.5 C18.362,84.5 23.209,-6.78 26.154,-62.245M0 0 M-73.346,17.676 C-70.758,54.328 -68.628,84.5 -68.628,84.5 M21.029,-116.5 C-10.721,-124.5 -63.767999999999994,-118.73700000000001 -78.073,-116.561 C-80.67099999999999,-116.16600000000001 -82.55099999999999,-113.881 -82.448,-111.255 C-82.448,-111.255 -77.349,-39.032 -73.346,17.676M0 0 M26.154,-62.245 C27.439,-86.449 28.362,-103.833 28.362,-103.833 M18.362,84.5 C18.362,84.5 23.209,-6.78 26.154,-62.245"></path>
                                                                            <g
																opacity="1" transform="matrix(1,0,0,1,0,0)"></g>
                                                                            <g
																opacity="1" transform="matrix(1,0,0,1,0,0)"></g>
                                                                        </g>
                                                                    </g>
                                                                    <g
																transform="matrix(0.9,0,0,0.9,108.085,611.4)"
																opacity="1" style="user-select: none;">
                                                                        <g
																opacity="1" transform="matrix(1,0,0,1,0,0)">
                                                                            <path
																stroke-linecap="round" stroke-linejoin="round"
																fill-opacity="0" stroke="rgb(86,90,92)"
																stroke-opacity="1" stroke-width="3"
																d="M0 0 M-101.348,-320.761 C-20.357,-320.809 41.472,-320.846 41.472,-320.846M0 0 M-71.054,-377.321 C7.338,-377.445 59.919,-377.529 59.919,-377.529 C61.925999999999995,-377.529 63.553,-375.902 63.553,-373.895 C63.553,-373.895 63.553,-224.507 63.553,-224.507M0 0 M13.554,-130.089 C-8.854999999999999,-71.46199999999999 -17.459,-7.609000000000002 -11.37,54.859M0 0 M63.553,-205.923 C63.553,-205.923 63.553,148.11 63.553,148.11M0 0 M14.886,-320.173 C14.886,-320.173 14.886,-160.689 14.886,-160.689M0 0 M-48.447,-320.224 C-48.447,-320.224 -48.447,-155.577 -48.447,-155.577M0 0 M29.679,96.907 C55.552,104.607 61.27,129.971 65.319,159.863 C69.36800000000001,189.755 62.982,219.922 58.632,249.772 C54.282,279.622 51.661,302.344 63.553,330.066M0 0 M-86.367,82.985 C-84.793,82.695 -83.338,82.375 -82.021,82.022 C-61.818,76.60300000000001 -41.021,90.593 -29.18,107.836 C-17.338,125.079 -11.296,145.67399999999998 -0.349,163.498 C13.543,186.117 35.489000000000004,204.747 41.42,230.62 C46.219,251.553 39.544,273.95000000000005 44.985,294.725 C48.85,309.48 58.429,321.934 66.626,334.797 C74.82300000000001,347.66 82.021,362.386 80.182,377.528M0 0 M-115.833,-149.517 C-102.609,-149.846 -89.776,-150.613 -79.103,-152.153 C-49.608999999999995,-156.41 -20.115000000000002,-155.667 9.379,-159.924 C15.268,-160.774 21.664,-161.537 26.837,-158.597 C36.118,-153.323 35.946,-140.118 34.561,-129.534 C28.377,-82.26999999999998 19.138,-41.77 16.85,5.842 C14.603000000000002,52.604 37.978,105.478 27.625,112.607 C18.52,118.876 -10.967000000000002,120.68 -23.35,117.334"></path>
                                                                            <g
																opacity="1" transform="matrix(1,0,0,1,0,0)"></g>
                                                                            <g
																opacity="1" transform="matrix(1,0,0,1,0,0)"></g>
                                                                            <g
																opacity="1" transform="matrix(1,0,0,1,0,0)"></g>
                                                                            <g
																opacity="1" transform="matrix(1,0,0,1,0,0)"></g>
                                                                            <g
																opacity="1" transform="matrix(1,0,0,1,0,0)"></g>
                                                                            <g
																opacity="1" transform="matrix(1,0,0,1,0,0)"></g>
                                                                            <g
																opacity="1" transform="matrix(1,0,0,1,0,0)"></g>
                                                                        </g>
                                                                    </g>
                                                                    <g
																transform="matrix(0,-0.5544,0.5544,0,421.8887,696.8055)"
																opacity="1" style="user-select: none; display: block;">
                                                                        <g
																opacity="1" transform="matrix(1,0,0,1,0,0)">
                                                                            <path
																stroke-linecap="round" stroke-linejoin="round"
																fill-opacity="0" style="display: block;"
																stroke="rgb(0,209,193)" stroke-opacity="1"
																stroke-width="8"
																d="M0 0 M412.131,-255.89 C404.739,-270.417 397.246,-285.14 397.246,-285.14M0 0 M480.522,-254.197 C488.126,-269.565 495.832,-285.14 495.832,-285.14M0 0 M446.301,-264.751 C446.329,-280.836 446.357,-297.137 446.357,-297.137"></path>
                                                                        </g>
                                                                    </g>
                                                                    <g
																transform="matrix(0.9,0,0,0.9,442.544,516.021)"
																opacity="1" style="user-select: none;">
                                                                        <g
																opacity="1" transform="matrix(1,0,0,1,0,0)">
                                                                            <path
																stroke-linecap="butt" stroke-linejoin="miter"
																fill-opacity="0" stroke-miterlimit="4"
																stroke="rgb(86,90,92)" stroke-opacity="1"
																stroke-width="3"
																d="M0 0 M-69.298,-51.417 C-77.798,-49.917 -86.798,-53.667 -97.048,-56.417 C-107.298,-59.167 -112.821,-53.52 -125.548,-50.667 C-135.797,-48.370000000000005 -142.215,-54.940000000000005 -145.098,-58.99 C-146.199,-60.537 -145.785,-62.564 -144.145,-63.523 C-140.716,-65.528 -135.082,-68.789 -133.381,-69.583 C-130.881,-70.75 -120.047,-81.584 -114.714,-81.917 C-111.428,-82.122 -98.159,-81.41300000000001 -87.278,-80.739M0 0 M-144.881,-58.583 C-144.881,-58.583 -153.215,-57.833999999999996 -156.214,-60.583 C-158.214,-62.416 -160.297,-68.106 -160.885,-71.673 C-161.119,-73.09 -160.873,-74.54400000000001 -160.158,-75.79 C-159.119,-77.599 -157.356,-80.211 -155.048,-81.917 C-151.215,-84.75 -126.881,-90.083 -126.881,-90.083 C-126.881,-90.083 -118.548,-89.75 -118.548,-89.75M0 0 M-150.919,-58.691 C-150.919,-58.691 -154.038,-50.504 -154.038,-50.504 C-155.586,-46.442 -154.79600000000002,-41.859 -151.978,-38.549 C-151.978,-38.549 -150.633,-36.969 -150.633,-36.969 C-147.679,-33.5 -143.556,-31.235 -139.043,-30.604 C-139.043,-30.604 -122.202,-28.25 -122.202,-28.25 C-117.563,-27.602 -112.84400000000001,-27.883000000000003 -108.316,-29.085 C-102.165,-30.718 -93.56,-32.878 -90.381,-33.083 C-85.214,-33.416 -81.881,-48.583 -101.214,-50.75M0 0 M-142.105,-30.705 C-144.82899999999998,-28.758 -147.798,-26.408 -148.143,-23.077 C-148.357,-21.006 -147.479,-18.989 -146.525,-17.138 C-145.34300000000002,-14.847000000000001 -144.012,-12.633 -142.543,-10.514 C-141.05700000000002,-8.370999999999999 -138.56799999999998,-7.1499999999999995 -135.969,-7.358 C-135.969,-7.358 -102.022,-10.078 -102.022,-10.078 C-100.583,-10.193 -99.169,-10.483 -97.801,-10.945 C-93.602,-12.362 -84.241,-15.589 -81.048,-17.25 C-76.881,-19.417 -80.047,-30.417 -92.714,-32.75M0 0 M-135.969,-7.358 C-135.969,-7.358 -141.063,-4.25 -141.048,1.583 C-141.041,4.27 -137.548,11.75 -133.548,11.917 C-131.353,12.009 -125.343,12 -120.366,11.973 C-115.436,11.947000000000001 -110.544,11.142 -105.863,9.593 C-105.863,9.593 -90.735,4.586 -90.735,4.586 C-88.718,3.918 -87.003,2.462 -86.214,0.489 C-85.381,-1.593 -85.381,-4.411999999999999 -88.714,-7.358M0 0 M-95.455,-17.965 C-94.607,-16.319 -93.226,-14.952 -91.571,-14.121M0 0 M-132.838,-69.189 C-130.57999999999998,-68.297 -128.558,-66.81700000000001 -127.024,-64.936M0 0 M-102.712,-37.917 C-102.714,-35.74 -101.8,-33.576 -100.238,-32.059M0 0 M-79.319,21.88 C-79.319,21.88 -45.215,23.584 -27.202,14.06 C-26.477,13.677 -25.596,13.79 -24.85,14.129 C-10.520000000000001,20.644 128.097,83.447 161.119,90.083M0 0 M-139.881,-80.083 C-139.881,-80.083 -129.881,-78.417 -126.214,-75.75M0 0 M-95.214,-89.083 C-95.214,-89.083 -86.385,-86.166 -76.706,-83.142 C-59.331,-78.892 -10.327,-47.778999999999996 0.119,-44.083 C21.786,-36.416 146.119,-23.083 161.119,-16.083"></path>
                                                                        </g>
                                                                    </g>
                                                                </g>
                                                            </svg>
													</div>
												</div>
											</span>
										</div>
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
function previewImages() {

  var preview = document.querySelector('#preview');
  preview.innerHTML="";
  if (this.files) {
	  console.log(this.files);
    [].forEach.call(this.files, readAndPreview);
  }



function readAndPreview(file) {

    // Make sure `file.name` matches our extensions criteria
    if (!/\.(jpe?g|png|gif)$/i.test(file.name)) {
      return alert(file.name + " is not an image");
    } // else...
    
    var reader = new FileReader();
//      alert(URL.createObjectURL(file));
    reader.addEventListener("load", function() {
      var image = new Image();
      image.height = 150;
      image.title  = file.name;
      image.src    = this.result;
      preview.appendChild(image);
//       var x = document.createElement("INPUT");
//       x.setAttribute("type", "file");
//       x.setAttribute("name", "123213"+image.title);
//       x.setAttribute("value", URL.createObjectURL(file));
//       x.setAttribute("style", "display:none");
//       preview.appendChild(x);
    }, false);
    
    reader.readAsDataURL(file);
    
  }

}

document.querySelector('#file-input').addEventListener("change", previewImages, false);

  </script>


<script>
	document.getElementById("keep").onclick = function() {
		document.getElementById("imgKeep").submit();
	}
</script>
