<%@page import="com.mem.model.MemVO"%>
<%@page import="com.mem.model.MemService"%>
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
	MemService memSvc = new MemService();
%>
<%String memId = (String)session.getAttribute("memId"); %>


<!DOCTYPE html>
<html lang="">

<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<title>Anti-G旅遊指南</title>
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
<jsp:include page="/front_end/basic/nav.jsp" flush="true"/>
	<link href="<%=request.getContextPath()%>/front_end/guide/guideCss/style.css" media="all" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/front_end/guide/guideCss/style3.css" media="screen" rel="stylesheet" type="text/css">
<div class="guidebook-new-guest-page__recommendation-container" style="padding-top: 70px">
	<div class="guidebook-new-guest-page__image" style="background-image:url('<%=request.getContextPath()%>/guideImg.do?action=getOne_For_Display&guideImgId=<%= guideIndexVO.getGuideImgId()%>')"></div>
		<div class="panel">
			<div class="guidebook-new-guest-page__body">
				<div>
					<div>
						<h1 class="guidebook-new-guest-page__title">
							<span>${area}攻略大全</span>
						</h1>
						<h4 class="guidebook-new-guest-page__introduction">
							<span>由Anti-Gravity會員編寫推薦的獨家指南，所有好去處一覽無遺，來探索您在這座城市的新故事吧。</span>
						</h4>
						
					<h3 class="guidebook-new-guest-page__best-of-best">
							<span>景點文章列表</span>
						</h3>
					</div>
				</div>
	
	<!-- 文章列表 -->
	
				<div class="guidebook-place-card-collection">
				<%int count=0; %>
			<% for(int i = 0 ; i<areaGuideList.size();i++){ 
				GuideCommService gc =new GuideCommService();
				List<GuideCommVO> commList =  gc.getAllFromGuideId(areaGuideList.get(i).getGuideId());
				if(areaGuideList.get(i).getGuideStatus()==2){
					 
			%>
				<div class="guidebook-place-card"  style="margin-top:20px;" >
					<div class="guidebook-place-card-collection__item">
						<div class="guidebook-place-card-collection__scroll-anchor"></div>					
													
							<div class="guidebook-place-card__place-frame">
								<div>
									<p class="guidebook-place-card__number">#<%= count=count+1 %></p>
								</div>
								<h3 class="guidebook-place-card__title">
									<a id="aTitle" href="<%=request.getContextPath()%>/guide.do?action=updateRead&guideReadSize=<%=areaGuideList.get(i).getGuideReadSize()%>&guideId=<%=areaGuideList.get(i).getGuideId()%>"><%=areaGuideList.get(i).getGuideTitle()%></a>
								</h3>
								<input type="hidden" name="memId" value="<%=memId%>">
								<p style="font-weight: normal">撰寫時間: <fmt:formatDate value="<%=areaGuideList.get(i).getGuideCreateTime()%>" pattern="yyyy-MM-dd"/></p>
							</div>
							<div class="guidebook-place-recommendation__frame">
								<div>
									<p class="guidebook-place-recommendation__first-recommendation-title">
										<span><%=areaGuideList.get(i).getGuideVoteSize()%>人喜歡 &nbsp &nbsp</span>
										<span><%=areaGuideList.get(i).getGuideCommSize()%>人留言  &nbsp &nbsp</span>
										<span><%=areaGuideList.get(i).getGuideReadSize()%>人訪問過 &nbsp &nbsp</span>
									</p>
								</div>
								
								<% 	String commStr = "";
									String oneComm="";
									for(int j = 0 ; j<commList.size()/2;j++){
									MemVO memCommVO = memSvc.getOneMem(commList.get(j).getMemId());
									
									commStr = commList.get(j).getCommContent();
									oneComm = commStr.substring(0,commStr.length()/2);
								%>	
								<p class="guidebook-place-recommendation__description" style="font-size:12px;"><%=oneComm %>...
									<a href="<%=request.getContextPath()%>/guide.do?action=getOne&guideId=<%=areaGuideList.get(i).getGuideId()%>" data-prevent-default="true" class="guidebook-place-recommendation__link">&nbsp;
										<span>閱讀更多</span>
									</a>
								</p>
								<div style="margin-bottom:15px;">
									<div class="guidebook-place-recommendation__host-profile-image">
										<img src="<%=request.getContextPath()%>/guideImg.do?action=getOne_For_Display&guideImgId=<%=imgList.get(i).getGuideImgId()%>" alt="Leslie"
										    class="media-photo media-round" style="height:32px;width:32px">
									</div>
									<a href="/things-to-do/rooms/4365969" data-prevent-default="true" class="guidebook-place-recommendation__host-guidebook-link" style="font-size:14px;">
										<span>來自【<%=memCommVO.getMem_name()%>】的留言</span>
									</a>
								</div>
								
								<%} %>
							</div>
						</div>
					</div>
					<%} %>
			<% } %>	
			
<!-- 				<div class="pagination pagination-responsive"> -->
<!-- 						<ul class="list-unstyled"> -->
<!-- 							<li class="active"> -->
<!-- 								<a href="/things-to-do/san-francisco?page=1" data-prevent-default="true" aria-label="Seite 1, aktuelle Seite">1</a> -->
<!-- 							</li> -->
<!-- 							<li class=""> -->
<!-- 								<a href="/things-to-do/san-francisco?page=2" rel="next" data-prevent-default="true" aria-label="Seite 2">2</a> -->
<!-- 							</li> -->
<!-- 							<li class=""> -->
<!-- 								<a href="/things-to-do/san-francisco?page=3" rel="next" data-prevent-default="true" aria-label="Seite 3">3</a> -->
<!-- 							</li> -->
<!-- 							<li class="gap"> -->
<!-- 								<span class="gap">…</span> -->
<!-- 							</li> -->
<!-- 							<li class=""> -->
<!-- 								<a href="/things-to-do/san-francisco?page=10" rel="next" data-prevent-default="true" aria-label="Seite 10">10</a> -->
<!-- 							</li> -->
<!-- 							<li class="next next_page"> -->
<!-- 								<a href="/things-to-do/san-francisco?page=2" rel="next" data-prevent-default="true"> -->
<!-- 									<span class="screen-reader-only"> -->
<!-- 										<span>下一頁</span> -->
<!-- 									</span> -->
<!-- 									<i class="icon icon-caret-right"></i> -->
<!-- 								</a> -->
<!-- 							</li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
				</div>
			</div>
		</div>
	</div>
	
<div class="map-container guidebook-new-guest-page__map-container">
		<div class="guidebook-map" style="padding-top: 60px">
		  <div id="map"></div>
			<div class="guidebook-map__marker">
			
			</div>
		</div>
	</div>
</body>

</html>
<script src="<%=request.getContextPath()%>/front_end/guide/guideJs/markerclusterer.js">
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
            	<%count = 0;%>
            	<% for(int a = 0;a<areaGuideList.size();a++){
            	if(areaGuideList.get(a).getGuideStatus()==2){%>
            	'#<%=count=count+1%>'
           			<%if(a != areaGuideList.size()-1){%>
						,
   	 				<%}%>
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

            // 添加標記群集器以管理標記。
            var markerCluster = new MarkerClusterer(map, markers, {
                imagePath: "front_end/guide/images/m"
            });
        }
        
       
        var locations = [
        	 <% for(int a = 0;a<areaGuideList.size();a++){
        		 if(areaGuideList.get(a).getGuideStatus()==2){%>
        	 <%= areaGuideList.get(a).getGuideLatLng() %>
        	 <%if(a != areaGuideList.size()-1){%>
					,
        	 <%}%>
        	 <%}%>
        	 <%}%>
        	 
        ]
        
</script>	
<script>
	document.getElementById("aTitle").onclick = function() {
		document.getElementById("readForm").submit();
	}
</script>

