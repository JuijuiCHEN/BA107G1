<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<% request.setCharacterEncoding("UTF-8");%>
<% String guideTitle = new String(request.getParameter("guideTitle").getBytes("ISO-8859-1"), "UTF-8");%>
<% String guideContent = new String(request.getParameter("guideContent").getBytes("ISO-8859-1"), "UTF-8");%>
<%String memId = (String)session.getAttribute("memId"); %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Anti-G旅遊指南</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
#map {
	width: 500px;
	height: 400px;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

.controls {
	margin-top: 10px;
	border: 1px solid transparent;
	border-radius: 2px 0 0 2px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	height: 32px;
	outline: none;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
}

 #pac-input { 
 	background-color: #fff; 
 	font-family: Roboto; 
 	font-size: 14px; 
 	font-weight: 300; 
 	padding: 0 11px 0 13px; 
 	text-overflow: ellipsis; 
 	width: 300px; 
 	border-radius:4px;
 } 

#pac-input:focus {
	border-color: #4d90fe;
}

.pac-container {
	font-family: Roboto;
}

#type-selector {
	color: #fff;
	background-color: #4d90fe;
	padding: 5px 11px 0px 11px;
}

#type-selector label {
	font-family: Roboto;
	font-size: 13px;
	font-weight: 300;
}

#target {
	width: 345px;
}
</style>

<style>
body {
	font-family: Arial, sans-serif; 
 	font-weight: bold; 
	font-size: 14px; 
 }

.wrap {
	top: 50%;
	margin-top: -30%;
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
</head>

<body>
 <jsp:include page="/front_end/basic/nav.jsp" flush="true"/>
<link href="<%=request.getContextPath()%>/front_end/guide/guideCss/addGuide1.css" media="all" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/front_end/guide/guideCss/addGuide2.css" media="screen" rel="stylesheet" type="text/css">
   <div id="lys-redesign-div" style="padding-top:100px">
	<div data-hypernova-key="list_your_spacebundlejs" data-hypernova-id="2a3b37d8-d154-4f9c-b90a-5f03110dcc60">
		<div data-reactroot>
			<div>
				<div class="bg-white">
					<div>
					<div class="landing-width bg-white  row-condensed list-your-space__landing-content">
						<span>
							<div class="col-md-6 landing__left-col fast-animation">
								<div class="landing__left-col-content" style="float:none;" >
									<div class="space-5">
										<h2 class="landing__title-title">
											<span>分享的旅程在哪個縣市 </span>
										</h2>
									</div>
									<div class="landing__step-content landing__wmpw-controls">
										<strong
											class="landing__step-number space-1 text-base text-branding text-light-gray">
											<span>步驟3</span>
										</strong>
										<div class="h3 landing__step-content-title space-3">
											<span>請選擇所在地區</span>
										</div>
										<form role="form" action="<%=request.getContextPath() %>/front_end/guide/addGuideImg.jsp" class="earning-estimation-container" data-prevent-default="true" id="mapKeep">
 											<div class="form-group"> 
												<select id="mySelect" name="guideArea" class="form-control" style="width:250px;font-weight: normal">
													<option>請選擇</option>
													<option>基隆</option>
													<option>台北</option>
													<option>新北</option>
													<option>宜蘭</option>
													<option>新竹</option>
													<option>桃園</option>
													<option>苗栗</option>
													<option>台中</option>
													<option>彰化</option>
													<option>南投</option>
													<option>嘉義</option>
													<option>雲林</option>
													<option>台南</option>
													<option>高雄</option>
													<option>屏東</option>
													<option>台東</option>
													<option>花蓮</option>
													<option>澎湖</option>
													<option>金門</option>
													<option>連江</option>
												</select>
												<input type="hidden" name="guideTitle" value="<%=guideTitle%>">
												<input type="hidden" name="guideContent" value="<%=guideContent%>">
												<input type="hidden" name="memId" value="<%=memId%>">
												<input type="hidden" name="guideMap" id="guideMap">
												<input type="hidden" name="guideLatLng" id="guideLatLng">
 											</div> 
										</form>
									</div>
								</div>
							</div>
							</span> 
					
						<span>
							<div class="col-md-6">
								<div class="landing__left-col-content">
									<div class="space-5">
										<h2 class="landing__title-title">
											<span>請給我們詳細的地標</span>
										</h2>
									</div>
										<strong class="landing__step-number space-1 text-base text-branding text-light-gray">
											<span>步驟4</span>
										</strong>
										<div class="h3 landing__step-content-title space-3">
											<span>請搜尋詳細地址</span>
										</div>
										<div>
 										   <input type="text" class="form-control" id="pac-input" placeholder="請搜尋地址">
										</div>
										<br>
										<div id="map"></div>
									
									<br> <br>
									<div style="margin-top: 25%; margin-bottom: 28px;">
										<div class="wrap">
											<a class="button" id="keep" aria-busy="false" onclick="getOption()">繼續</a>
										</div>

									</div>
								</div>
							</div>
						</span>
					
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>

</html>

<script type="text/javascript">
	function getOption() {
		var x = document.getElementById("mySelect")
		alert(x.options[x.selectedIndex].text)
	}
</script>


<script>
	var markers = [];

	function clearMarkers() {
		setMapOnAll(null);
	}

	function setMapOnAll(map) {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(map);
		}
	}

	function initAutocomplete(areaLatLng) {
		var latLng = { //初始位置
			lat : 23.69781,
			lng : 120.96051499999999
		};
		var map = new google.maps.Map(document.getElementById('map'), {
			center : latLng,
			zoom : 8, //地圖起始遠近度(數字越大越近)
			mapTypeId : 'roadmap' //地圖種類:起始地圖,默認roadmap
		});
		
		// 點選地圖地標會有紅色標點:
// 		map.addListener('click', function(e) { // e = this = 使用者點擊後我們會拿到的參數
// 			placeMarkerAndPanTo(e.latLng, map); // 使用方法placeMarkerAndPanTo(從e.latLng = 當前經緯度, map = 指定給map變數)  // e.latLng (.等同於get) 
// 		});
		
		var input = document.getElementById('pac-input'); // 拿到id:pac-input物件(就是searchBox), 放入 input變數
		var searchBox = new google.maps.places.SearchBox(input); // new map, 傳入input(user搜尋的地區) = 顯示搜尋後出現的map, 放入searchBox變數裡
		
// 		map.controls[google.maps.ControlPosition.TOP_LEFT].push(input); //把searchBox放到map裡的左上角

		// 將SearchBox結果偏向當前地圖的畫面
		map.addListener('bounds_changed', function() {
			searchBox.setBounds(map.getBounds());
		});

		searchBox.addListener('places_changed', function() { // places_changed = 當user選擇查詢時會觸發此function，應使用getPlaces獲取新位置
			var places = searchBox.getPlaces(); // .getPlaces() = 返回user選擇的查詢;如果尚未找到任何地方，則返回null，以用於places_changed事件

			if (places.length == 0) {
				return;
			}

			// 清除markers舊資料
			markers.forEach(function(marker) {
				marker.setMap(null);
			});
			markers = [];

			// 跑所有拿到的資料, 對於每個地方，獲取圖標，名稱和位置。
			var bounds = new google.maps.LatLngBounds();
			// user所查詢的地點跑迴圈並執行function
			places.forEach(function(place) {
				//去googlemap上取得該地區的formatted_address放入add
				document.getElementById("guideMap").value = place.formatted_address;
				// 把formatted_address印在f12裡
				console.log(places);
				
				// 拿到該地點經緯度放入latlng
				var lat = place.geometry.location.lat();
				var lng = place.geometry.location.lng();
				document.getElementById("guideLatLng").value = "{\"lng\":"+lng+",\"lat\":"+lat+"}";
				
				if (!place.geometry) {
					console.log("Returned place contains no geometry");
					return;
				}
				
				// 呼叫function(經緯度,map)
				placeMarkerAndPanTo(place.geometry.location, map)
				// 為每個地方創建一個標記。
				if (place.geometry.viewport) {
					// 只有地理編碼才具有視窗。
					bounds.union(place.geometry.viewport);
				} else {
					bounds.extend(place.geometry.location);
				}
			});
			map.fitBounds(bounds);
		});
	}

	function placeMarkerAndPanTo(latLng, map) {
		clearMarkers(); //先清除地圖上所有的標記
		var marker = new google.maps.Marker({
			position : latLng, // 指定當前經緯度給position
			map : map
		//要在哪個map做事? 放入傳近來的map
		});	
		markers.push(marker); //把marker裡面兩個資料放到markers[]裡
	}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBuS1-gsXN4HrHQaqjuaFaMxIqcayPPaoY&libraries=places&callback=initAutocomplete" async defer></script>
<script>
document.getElementById("keep").onclick =function() {validateForm(document.getElementById("mapKeep"))};

function validatePrompt(control, promptStr) {
	alert(promptStr);
	control.focus();
	return;
}
function checkArea(control) {

	 if(control.selectedIndex=='0'){
		 alert ("請選擇地區！");
			return (false);
	 }else{
		 return(true);
	 }
}
function checkMap(control) {
	if(document.getElementById('pac-input').value.trim()==""||document.getElementById('pac-input').value=='undefined'){
		 console.log('222');
		validatePrompt(control, "尚未輸入指南地址!");
		return (false);
	}
	return (true);
}
function validateForm(form) {
	if (!checkArea(form.guideArea)) return;
	if (!checkMap(document.getElementById("pac-input"))) return;
// 	alert ("資料通過驗證！");
	document.getElementById("mapKeep").submit();	// Submit form
}
</script>