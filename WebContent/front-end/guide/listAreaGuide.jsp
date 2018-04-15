<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.guide.model.*"%>
<%@page import="com.guideComm.model.*" %>

<%
	List<GuideVO> areaGuideList = (List<GuideVO>)request.getAttribute("areaGuideList");
	String area = (String)request.getAttribute("area");
	AddToLet api = new AddToLet();
	String areaLet = api.googleApi(area);
	GuideDAO guideDAO = new GuideDAO();
	GuideIndexVO guideIndexVO = guideDAO.getGuideIndexVO(area);
%> 


<!DOCTYPE html>
<html lang="">

<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>Anti-G�ȹC���n</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="<%=request.getContextPath()%>/front-end/guide/guideCss/style.css" media="all" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/front-end/guide/guideCss/style3.css" media="screen" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>



<!--     <meta name="viewport" content="initial-scale=1.0, user-scalable=no"> -->
    <style>
        #map {
            height: 100%;
        }

        html,
        body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
    </style>



</head>

<body>
<div class="guidebook-new-guest-page__recommendation-container">
	<div class="guidebook-new-guest-page__image" style="background-image:url('<%=request.getContextPath()%>/guideImg.do?action=getOne_For_Display&guideImgId=<%= guideIndexVO.getGuideImgId()%>')"></div>
		<div class="panel">
			<div class="guidebook-new-guest-page__body">
				<div>
					<div>
						<h1 class="guidebook-new-guest-page__title">
							<span>${area}�𲤤j��</span>
						</h1>
						<h4 class="guidebook-new-guest-page__introduction">
							<span>��Anti-G�|���s�g���˪��W�a���n�A�Ҧ��n�h�B�@���L��A�Ӷ}�ұz�b�o�y�������s�G�Ƨa�C</span>
						</h4>
	<!-- 					<hr class="guidebook-new-guest-page__hr-tag"> -->
	<!-- 					<div class="guidebook-new-guest-page__carousel"> -->
	<!-- 						<div class="guidebook-nav-card-carousel"> -->
	<!-- 							<div class="guidebook-nav-card-carousel__right-icon"> -->
	<!-- 								<i class="icon icon-chevron-right icon-gray icon-size-2"></i> -->
	<!-- 							</div> -->
	<!-- 							<div class="guidebook-nav-card-carousel__scroll"> -->
	<!-- 								<div class="guidebook-nav-card-carousel__window"> -->
	<!-- 									<div class="guidebook-nav-card-carousel__window-item"> -->
	<!-- 										<div class="guidebook-nav-card-carousel__window-item"> -->
	<!-- 											<div class="guidebook-nav-card fixed-small" style="background-image:url(./img/food.jpg)"> -->
	<!-- 												<div style="position:absolute"> -->
	<!-- 													<div class="guidebook-nav-card__text-wrapper"> -->
	<!-- 														<a class="link-reset" href="/things-to-do/san-francisco/food-scene"> -->
	<!-- 															<h4 class="guidebook-nav-card__title">����</h4> -->
	<!-- 														</a> -->
	<!-- 													</div> -->
	<!-- 												</div> -->
	<!-- 												<a href="/things-to-do/san-francisco/food-scene" data-prevent-default="true" class="guidebook-nav-card__button-overlay col-sm-12"></a> -->
	<!-- 											</div> -->
	<!-- 										</div> -->
	<!-- 									</div> -->
	<!-- 									<div class="guidebook-nav-card-carousel__window-item"> -->
	<!-- 										<div class="guidebook-nav-card-carousel__window-item"> -->
	<!-- 											<div class="guidebook-nav-card fixed-small" style="background-image:url(./img/nightlife.jpg)"> -->
	<!-- 												<div style="position:absolute"> -->
	<!-- 													<div class="guidebook-nav-card__text-wrapper"> -->
	<!-- 														<a class="link-reset" href="/things-to-do/san-francisco/drinks-nightlife"> -->
	<!-- 															<h4 class="guidebook-nav-card__title">�s�a�P�]�ͬ�</h4> -->
	<!-- 														</a> -->
	<!-- 													</div> -->
	<!-- 												</div> -->
	<!-- 												<a href="/things-to-do/san-francisco/drinks-nightlife" data-prevent-default="true" class="guidebook-nav-card__button-overlay col-sm-12"></a> -->
	<!-- 											</div> -->
	<!-- 										</div> -->
	<!-- 									</div> -->
	<!-- 									<div class="guidebook-nav-card-carousel__window-item"> -->
	<!-- 										<div class="guidebook-nav-card-carousel__window-item"> -->
	<!-- 											<div class="guidebook-nav-card fixed-small" style="background-image:url(./img/sightseeing.jpg)"> -->
	<!-- 												<div style="position:absolute"> -->
	<!-- 													<div class="guidebook-nav-card__text-wrapper"> -->
	<!-- 														<a class="link-reset" href="/things-to-do/san-francisco/sightseeing"> -->
	<!-- 															<h4 class="guidebook-nav-card__title">���I</h4> -->
	<!-- 														</a> -->
	<!-- 													</div> -->
	<!-- 												</div> -->
	<!-- 												<a href="/things-to-do/san-francisco/sightseeing" data-prevent-default="true" class="guidebook-nav-card__button-overlay col-sm-12"></a> -->
	<!-- 											</div> -->
	<!-- 										</div> -->
	<!-- 									</div> -->
	<!-- 									<div class="guidebook-nav-card-carousel__window-item"> -->
	<!-- 										<div class="guidebook-nav-card-carousel__window-item"> -->
	<!-- 											<div class="guidebook-nav-card fixed-small" style="background-image:url(./img/parks.jpg)"> -->
	<!-- 												<div style="position:absolute"> -->
	<!-- 													<div class="guidebook-nav-card__text-wrapper"> -->
	<!-- 														<a class="link-reset" href="/things-to-do/san-francisco/parks-nature"> -->
	<!-- 															<h4 class="guidebook-nav-card__title">����P�۵M����</h4> -->
	<!-- 														</a> -->
	<!-- 													</div> -->
	<!-- 												</div> -->
	<!-- 												<a href="/things-to-do/san-francisco/parks-nature" data-prevent-default="true" class="guidebook-nav-card__button-overlay col-sm-12"></a> -->
	<!-- 											</div> -->
	<!-- 										</div> -->
	<!-- 									</div> -->
	<!-- 									<div class="guidebook-nav-card-carousel__window-item"> -->
	<!-- 										<div class="guidebook-nav-card-carousel__window-item"> -->
	<!-- 											<div class="guidebook-nav-card fixed-small" style="background-image:url(./img/culture.jpg)"> -->
	<!-- 												<div style="position:absolute"> -->
	<!-- 													<div class="guidebook-nav-card__text-wrapper"> -->
	<!-- 														<a class="link-reset" href="/things-to-do/san-francisco/arts-culture"> -->
	<!-- 															<h4 class="guidebook-nav-card__title">���N�P���</h4> -->
	<!-- 														</a> -->
	<!-- 													</div> -->
	<!-- 												</div> -->
	<!-- 												<a href="/things-to-do/san-francisco/arts-culture" data-prevent-default="true" class="guidebook-nav-card__button-overlay col-sm-12"></a> -->
	<!-- 											</div> -->
	<!-- 										</div> -->
	<!-- 									</div> -->
	<!-- 									<div class="guidebook-nav-card-carousel__window-item"> -->
	<!-- 										<div class="guidebook-nav-card-carousel__window-item"> -->
	<!-- 											<div class="guidebook-nav-card fixed-small" style="background-image:url(https://a0.muscache.com/airbnb/guidebook/v1_san_francisco_everything_else_carousel@2x.jpg)"> -->
	<!-- 												<div style="position:absolute"> -->
	<!-- 													<div class="guidebook-nav-card__text-wrapper"> -->
	<!-- 														<a class="link-reset" href="/things-to-do/san-francisco/everything-else"> -->
	<!-- 															<h4 class="guidebook-nav-card__title">��L</h4> -->
	<!-- 														</a> -->
	<!-- 													</div> -->
	<!-- 												</div> -->
	<!-- 												<a href="/things-to-do/san-francisco/everything-else" data-prevent-default="true" class="guidebook-nav-card__button-overlay col-sm-12"></a> -->
	<!-- 											</div> -->
	<!-- 										</div> -->
	<!-- 									</div> -->
	<!-- 								</div> -->
	<!-- 							</div> -->
	<!-- 						</div> -->
	<!-- 					</div> -->
	<!-- 					<hr class="guidebook-new-guest-page__cut-off"> -->
						
						
						
						<h3 class="guidebook-new-guest-page__best-of-best">
							<span>���˼��I</span>
						</h3>
					</div>
				</div>
	
	<!-- �峹�C�� -->
				<div class="guidebook-place-card-collection">
			<% for(int i = 0 ; i<areaGuideList.size();i++){ 
				GuideCommService gc =new GuideCommService();
				List<GuideCommVO> commList =  gc.getAllFromGuideId(areaGuideList.get(i).getGuideId());
			%>
				<div class="guidebook-place-card"  style="margin-top:20px;" >
					<div class="guidebook-place-card-collection__item">
						<div class="guidebook-place-card-collection__scroll-anchor"></div>					
													
							<div class="guidebook-place-card__place-frame">
								<div>
									<p class="guidebook-place-card__number">#<%= i+1 %></p>
								</div>
								<h3 class="guidebook-place-card__title">
									<a href="<%=request.getContextPath()%>/guide.do?action=getOne&guideId=<%=areaGuideList.get(i).getGuideId()%>"><%=areaGuideList.get(i).getGuideTitle()%></a>
								</h3>
								<p>���g�ɶ�: <fmt:formatDate value="<%=areaGuideList.get(i).getGuideCreateTime()%>" pattern="yyyy-MM-dd"/></p>
							</div>
							<div class="guidebook-place-recommendation__frame">
								<div>
									<p class="guidebook-place-recommendation__first-recommendation-title">
										<span><%=areaGuideList.get(i).getGuideVoteSize()%>�H���w &nbsp &nbsp</span>
										<span><%=areaGuideList.get(i).getGuideCommSize()%>�H�d��  &nbsp &nbsp</span>
										<span><%=areaGuideList.get(i).getGuideReadSize()%>�H�X�ݹL &nbsp &nbsp</span>
									</p>
								</div>
								<% for(int j = 0 ; j<commList.size()/2;j++){%>	
								<p class="guidebook-place-recommendation__description"><%= commList.get(j).getCommContent() %>
									<a href="#" data-prevent-default="true" class="guidebook-place-recommendation__link">&nbsp;
										<span>�\Ū��h</span>
									</a>
								</p>
								<div>
									<div class="guidebook-place-recommendation__host-profile-image">
										<img src="https://a0.muscache.com/im/pictures/user/50428979-3e0f-407b-a968-5a5ef695e9fc.jpg?aki_policy=profile_small" alt="Leslie"
										    class="media-photo media-round" style="height:32px;width:32px">
									</div>
									<a href="/things-to-do/rooms/4365969" data-prevent-default="true" class="guidebook-place-recommendation__host-guidebook-link">
										<span>�Ӧ�<%= commList.get(j).getMemId() %>���d��</span>
									</a>
								</div>
								<%} %>
							</div>
						</div>
					</div>
			<% } %>	
			
				<div class="pagination pagination-responsive">
						<ul class="list-unstyled">
							<li class="active">
								<a href="/things-to-do/san-francisco?page=1" data-prevent-default="true" aria-label="Seite 1, aktuelle Seite">1</a>
							</li>
							<li class="">
								<a href="/things-to-do/san-francisco?page=2" rel="next" data-prevent-default="true" aria-label="Seite 2">2</a>
							</li>
							<li class="">
								<a href="/things-to-do/san-francisco?page=3" rel="next" data-prevent-default="true" aria-label="Seite 3">3</a>
							</li>
							<li class="gap">
								<span class="gap">�K</span>
							</li>
							<li class="">
								<a href="/things-to-do/san-francisco?page=10" rel="next" data-prevent-default="true" aria-label="Seite 10">10</a>
							</li>
							<li class="next next_page">
								<a href="/things-to-do/san-francisco?page=2" rel="next" data-prevent-default="true">
									<span class="screen-reader-only">
										<span>�U�@��</span>
									</span>
									<i class="icon icon-caret-right"></i>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="map-container guidebook-new-guest-page__map-container">
		<div class="guidebook-map">
			
			
		  <div id="map"></div>
			<div class="guidebook-map__marker">
			
			</div>
		</div>
	</div>
</body>

</html>
<script src="<%=request.getContextPath()%>/front-end/guide/guideJs/markerclusterer.js">
    </script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?region=cn&language=zh-TW&key=AIzaSyBuS1-gsXN4HrHQaqjuaFaMxIqcayPPaoY&callback=initMap">
    </script>
	<script>
        function initMap() {

            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 11,
                center: <%= areaLet%>
            });

            // Create an array of alphabetical characters used to label the markers.
            var labels = [
            	<% for(int a = 0;a<areaGuideList.size();a++){%>
            	'#<%=a+1%>'
           			<%if(a != areaGuideList.size()-1){%>
						,
   	 				<%}%>
           		<%}%>
            ];

            // Add some markers to the map.
            // Note: The code uses the JavaScript Array.prototype.map() method to
            // create an array of markers based on a given "locations" array.
            // The map() method here has nothing to do with the Google Maps API.
            var markers = locations.map(function (location, i) {
                return new google.maps.Marker({
                    position: location,
                    label: labels[i % labels.length]
                });
            });

            // �K�[�аO�s�����H�޲z�аO�C
            var markerCluster = new MarkerClusterer(map, markers, {
                imagePath: "front-end/guide/images/m"
            });
        }
        
       
        var locations = [
        	 <% for(int a = 0;a<areaGuideList.size();a++){%>
        	 <%= areaGuideList.get(a).getGuideLatLng() %>
        	 <%if(a != areaGuideList.size()-1){%>
					,
        	 <%}%>
        	 <%}%>
        	 
        ]
        
    </script>	

