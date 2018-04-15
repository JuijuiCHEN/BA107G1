<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>


<!DOCTYPE html>
<html>
<head>
<script src="jquery-3.3.1.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
	font-size: 14px;
}

.wrap {
	top: 50%;
	margin-top: -20%;
	text-align: center;
}

a {
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
<style type="text/css">
@import
	url("https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css")
	;

label {
	position: relative;
	cursor: pointer;
	color: #666;
	font-weight: normal;
}

input[type="checkbox"], input[type="radio"] {
	position: absolute;
	right: 9000px;
}

/*Radio box*/
input[type="radio"]+.label-text:before {
	content: "\f10c";
	font-family: "FontAwesome";
	speak: none;
	font-style: normal;
	font-weight: normal;
	font-variant: normal;
	text-transform: none;
	line-height: 1;
	-webkit-font-smoothing: antialiased;
	width: 1em;
	display: inline-block;
	margin-right: 5px;
}

input[type="radio"]:checked+.label-text:before {
	content: "\f192";
	color: blue;
	animation: effect 250ms ease-in;
}

input[type="radio"]:disabled+.label-text {
	color: #aaa;
}

input[type="radio"]:disabled+.label-text:before {
	content: "\f111";
	color: #ccc;
}

.repcss {
	padding-left: 58px;
	font-size: 15px;
}
#guideCommit{
margin-left:23px;
}
#repContent{
display: none;
}

</style>


<meta charset="utf-8">

<link
	href="<%=request.getContextPath()%>/front-end/guide/guideCss/update1.css"
	media="all" rel="stylesheet" type="text/css">
<link
	href="<%=request.getContextPath()%>/front-end/guide/guideCss/style2.css"
	media="all" rel="stylesheet" type="text/css">

<link
	href="<%=request.getContextPath()%>/front-end/guide/guideCss/addGuide2.css"
	media="screen" rel="stylesheet" type="text/css">



<title>Anti-G�ȹC���n</title>

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
						<div class="left-backdrop"></div>
						<div
							class="right-backdrop hide-sm bg-white right-backdrop--with-bg"></div>
						<div class="list-your-space__content" style="padding-top:0px;">
							<div class="centered-content clearfix">
								<form method="post"
									action="<%=request.getContextPath()%>/guide/guideRep.do"
									id="GuideRepForm">
									<div
										class="main-panel-container no-padding-h bg-white main-panel-outer-half clearfix"
										tabindex="-1">
										<div
											class="main-panel main-panel-padding main-panel-progress pull-right main-panel-inner-half space-sm-8">
											<div>
												<div>
													<div class="row">

														<div class="container">
															<div class="col-sm-12">
																<div style="margin-bottom: 8px;">
																	<h2 style="margin-bottom:30px">�п�ܸӤ峹���e���̤��A��</h2>
																</div>
																<div class="form-check">
																	<label> <input type="radio" name="radio" onclick="inputClose()" value="�o�h���n�]�t�ɤO�B�ⱡ�B�P�P�Ψ�L�㦳�_�ǩʪ����e�C" checked> 
																		<span class="label-text">���e���A��</span><br>
																		<div class="repcss">�o�h���n�]�t�ɤO�B�ⱡ�B�P�P�Ψ�L�㦳�_�ǩʪ����e�C</div>
																	</label>
																</div>
																<div class="form-check">
																	<label> <input type="radio" name="radio" onclick="inputClose()" value="�o�h���n�]�t�갲��T�C">
																		<span class="label-text">�갲���e</span> <br>
																		<div class="repcss">�o�h���n�]�t�갲��T�C</div>
																	</label>
																</div>
																<div class="form-check">
																	<label><input type="radio" name="radio" onclick="inputClose()" value="�o�h���n���e�t���c�N���˩M�H���������e">
																		<span class="label-text">����۶B���e�Τ��먥��</span> <br>
																		<div class="repcss">�o�h���n���e�t���c�N���˩M�H���������e�C</div> </label>
																</div>

																<div class="form-check">
																	<label> <input type="radio" name="radio" id="otherBtn" onclick="change()">
																		<span class="label-text">��L</span> <br>
																		<div class="col-xs-4">
																			<input id="repContent" class="form-control" type="text" style="margin-left: 44px;margin-bottom:20px;" placeholder="�п�J���|���e">
																		</div>
																	</label>
																</div>
															</div>
														</div>
													</div>
								</form>
							</div>

						</div>

						<div style="margin-top: 20%; margin-right: 25%;">
							<div class="wrap">
								<a class="button" id="guideCommit" aria-busy="false">�e�X�s��</a>
							</div>
						</div>
					</div>
				</div>

			</div>

			<div class="waypoint-container">
				<span style="font-size: 0px;"></span>
			</div>
		</div>
		<div class="help-panel-container">
			<div class="hide-sm help-panel panel" style="margin:0px 30px 0">
				<div class="panel-body">
					<div class="help-panel__bulb-img space-2"></div>
					<div class="help-panel__text">
						<div>
							<p>
								<span>�ڭ̥u�|�N�z������a�}���ɵ��w�T�{�w�q���ЫȡC</span>
							</p>
							<div class="tip-address-img"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="show-sm help-panel__floating-container">
				<span class="tooltip-popup__transition-container">
				<button class="help-panel--collapsed help-panel__bulb-img-bubble" aria-label="�F�ѸԱ�">
				<div class="help-panel__bulb-img img-center"></div>
				</button>
				</span>
			</div>
		</div>
	</div>
	</main>
</body>
</html>

<script>
var repContent = true;

function change(){
	if(repContent){
		$("#repContent").show();
		repContent =false;
	}else{
		$("#repContent").hide();
		repContent =true;
	}
}

function inputClose(){
	if(!repContent){
		$("#repContent").hide();
		repContent = true;
	}
}
</script>