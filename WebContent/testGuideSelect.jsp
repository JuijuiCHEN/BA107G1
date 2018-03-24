<%@ page contentType="text/html; charset=Big5"%>
<%@page import="com.guide.model.GuideVO"%>
<%@page import="com.guideImg.model.GuideImgVO"%>
<%@ page import="java.util.*"%>
<%
  GuideVO guideVO = (GuideVO) request.getAttribute("guideVO"); //GuideSelect.java(Concroller), 存入req的guideVO物件
  System.out.println(guideVO.toString());
  List<GuideImgVO> imgList = guideVO.getGuideImgList();
%>
<html>
<head>
</head>
<body>
<h3>資料查詢:</h3>

 <table>
	<tr>
		<th>指南編號</th>
		<th>會員編號</th>
		<th>指南標題</th>
		<th>指南內容</th>
		<th>指南地區</th>
		<th>指南發佈時間</th>
		<th>訪問人數</th>
		<th>留言人數</th>
		<th>案讚人數</th>
		<th>指南狀態</th>
	</tr>
	
	<tr>
		<td>${guideVO.getGuideId()}</td>
		<td>${guideVO.getMemId()}</td>
		<td>${guideVO.getGuideTitle()}</td>
		<td>${guideVO.getGuideContent()}</td>
		<td>${guideVO.getGuideArea()}</td>
		<td>${guideVO.getGuideCreateTime()}</td>
		<td>${guideVO.getGuideReadSize()}</td>
		<td>${guideVO.getGuideCommSize()}</td>
		<td>${guideVO.getGuideVoteSize()}</td>
		<td>${guideVO.getGuideStatus()}</td>
	</tr>
	<tr>
		<%for(int i = 0 ; i < imgList.size(); i++){%>
			<img src="<%=request.getContextPath()%>/guideImg.do?action=findByPrimaryKey&guideImgId=<%= imgList.get(i).getGuideImgId()%>">
		<% }%>
	</tr>

</table>
</body>
</html>