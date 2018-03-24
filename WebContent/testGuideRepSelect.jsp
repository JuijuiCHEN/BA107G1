<%@page import="com.guideRep.model.GuideRepVO"%>
<%@ page contentType="text/html; charset=Big5"%>

<%
  GuideRepVO guideRepVO = (GuideRepVO) request.getAttribute("guideRepVO"); //GuideSelect.java(Concroller), 存入req的guideVO物件
  System.out.println(guideRepVO.toString());
%>

<html>
<head>
</head>
<body>
<h3>資料查詢:</h3>

 <table>
	<tr>
		<th>檢舉指南編號</th>
		<th>指南編號</th>
		<th>會員編號</th>
		<th>檢舉指南時間</th>
		<th>檢舉指南內容</th>
		<th>檢舉指南狀態</th>
	</tr>
	
	<tr>
		<td>${guideRepVO.getGuideRepId()}</td>
		<td>${guideRepVO.getGuideId()}</td>
		<td>${guideRepVO.getMemId()}</td>
		<td>${guideRepVO.getGuideRepDate()}</td>
		<td>${guideRepVO.getGuideRepContent()}</td>
		<td>${guideRepVO.getGuideRepStatus()}</td>

	</tr>

</table>
</body>
</html>