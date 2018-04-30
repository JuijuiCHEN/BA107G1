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
<title>Anti-G�ȹC���n</title>
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
											<span>���ɪ��ȵ{�b���ӿ��� </span>
										</h2>
									</div>
									<div class="landing__step-content landing__wmpw-controls">
										<strong
											class="landing__step-number space-1 text-base text-branding text-light-gray">
											<span>�B�J3</span>
										</strong>
										<div class="h3 landing__step-content-title space-3">
											<span>�п�ܩҦb�a��</span>
										</div>
										<form role="form" action="<%=request.getContextPath() %>/front_end/guide/addGuideImg.jsp" class="earning-estimation-container" data-prevent-default="true" id="mapKeep">
 											<div class="form-group"> 
												<select id="mySelect" name="guideArea" class="form-control" style="width:250px;font-weight: normal">
													<option>�п��</option>
													<option>��</option>
													<option>�x�_</option>
													<option>�s�_</option>
													<option>�y��</option>
													<option>�s��</option>
													<option>���</option>
													<option>�]��</option>
													<option>�x��</option>
													<option>����</option>
													<option>�n��</option>
													<option>�Ÿq</option>
													<option>���L</option>
													<option>�x�n</option>
													<option>����</option>
													<option>�̪F</option>
													<option>�x�F</option>
													<option>�Ὤ</option>
													<option>���</option>
													<option>����</option>
													<option>�s��</option>
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
											<span>�е��ڭ̸ԲӪ��a��</span>
										</h2>
									</div>
										<strong class="landing__step-number space-1 text-base text-branding text-light-gray">
											<span>�B�J4</span>
										</strong>
										<div class="h3 landing__step-content-title space-3">
											<span>�зj�M�ԲӦa�}</span>
										</div>
										<div>
 										   <input type="text" class="form-control" id="pac-input" placeholder="�зj�M�a�}">
										</div>
										<br>
										<div id="map"></div>
									
									<br> <br>
									<div style="margin-top: 25%; margin-bottom: 28px;">
										<div class="wrap">
											<a class="button" id="keep" aria-busy="false" onclick="getOption()">�~��</a>
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
		var latLng = { //��l��m
			lat : 23.69781,
			lng : 120.96051499999999
		};
		var map = new google.maps.Map(document.getElementById('map'), {
			center : latLng,
			zoom : 8, //�a�ϰ_�l�����(�Ʀr�V�j�V��)
			mapTypeId : 'roadmap' //�a�Ϻ���:�_�l�a��,�q�{roadmap
		});
		
		// �I��a�Ϧa�з|��������I:
// 		map.addListener('click', function(e) { // e = this = �ϥΪ��I����ڭ̷|���쪺�Ѽ�
// 			placeMarkerAndPanTo(e.latLng, map); // �ϥΤ�kplaceMarkerAndPanTo(�qe.latLng = ��e�g�n��, map = ���w��map�ܼ�)  // e.latLng (.���P��get) 
// 		});
		
		var input = document.getElementById('pac-input'); // ����id:pac-input����(�N�OsearchBox), ��J input�ܼ�
		var searchBox = new google.maps.places.SearchBox(input); // new map, �ǤJinput(user�j�M���a��) = ��ܷj�M��X�{��map, ��JsearchBox�ܼƸ�
		
// 		map.controls[google.maps.ControlPosition.TOP_LEFT].push(input); //��searchBox���map�̪����W��

		// �NSearchBox���G���V��e�a�Ϫ��e��
		map.addListener('bounds_changed', function() {
			searchBox.setBounds(map.getBounds());
		});

		searchBox.addListener('places_changed', function() { // places_changed = ��user��ܬd�߮ɷ|Ĳ�o��function�A���ϥ�getPlaces����s��m
			var places = searchBox.getPlaces(); // .getPlaces() = ��^user��ܪ��d��;�p�G�|��������a��A�h��^null�A�H�Ω�places_changed�ƥ�

			if (places.length == 0) {
				return;
			}

			// �M��markers�¸��
			markers.forEach(function(marker) {
				marker.setMap(null);
			});
			markers = [];

			// �]�Ҧ����쪺���, ���C�Ӧa��A����ϼСA�W�٩M��m�C
			var bounds = new google.maps.LatLngBounds();
			// user�Ҭd�ߪ��a�I�]�j��ð���function
			places.forEach(function(place) {
				//�hgooglemap�W���o�Ӧa�Ϫ�formatted_address��Jadd
				document.getElementById("guideMap").value = place.formatted_address;
				// ��formatted_address�L�bf12��
				console.log(places);
				
				// ����Ӧa�I�g�n�ש�Jlatlng
				var lat = place.geometry.location.lat();
				var lng = place.geometry.location.lng();
				document.getElementById("guideLatLng").value = "{\"lng\":"+lng+",\"lat\":"+lat+"}";
				
				if (!place.geometry) {
					console.log("Returned place contains no geometry");
					return;
				}
				
				// �I�sfunction(�g�n��,map)
				placeMarkerAndPanTo(place.geometry.location, map)
				// ���C�Ӧa��Ыؤ@�ӼаO�C
				if (place.geometry.viewport) {
					// �u���a�z�s�X�~�㦳�����C
					bounds.union(place.geometry.viewport);
				} else {
					bounds.extend(place.geometry.location);
				}
			});
			map.fitBounds(bounds);
		});
	}

	function placeMarkerAndPanTo(latLng, map) {
		clearMarkers(); //���M���a�ϤW�Ҧ����аO
		var marker = new google.maps.Marker({
			position : latLng, // ���w��e�g�n�׵�position
			map : map
		//�n�b����map����? ��J�Ǫ�Ӫ�map
		});	
		markers.push(marker); //��marker�̭���Ӹ�Ʃ��markers[]��
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
		 alert ("�п�ܦa�ϡI");
			return (false);
	 }else{
		 return(true);
	 }
}
function checkMap(control) {
	if(document.getElementById('pac-input').value.trim()==""||document.getElementById('pac-input').value=='undefined'){
		 console.log('222');
		validatePrompt(control, "�|����J���n�a�}!");
		return (false);
	}
	return (true);
}
function validateForm(form) {
	if (!checkArea(form.guideArea)) return;
	if (!checkMap(document.getElementById("pac-input"))) return;
// 	alert ("��Ƴq�L���ҡI");
	document.getElementById("mapKeep").submit();	// Submit form
}
</script>