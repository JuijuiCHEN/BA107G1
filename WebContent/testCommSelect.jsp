<%@page import="com.guideComm.model.GuideCommVO"%>
<%@ page contentType="text/html; charset=Big5" pageEncoding="Big5"%>


<%
  GuideCommVO guideCommVO = (GuideCommVO) request.getAttribute("guideCommVO"); //GuideComm.java(Concroller),存入req的guideCommVO物件
  System.out.println(guideCommVO.toString());
%>

<html>
<head>
</head>
<body>
<h3>資料查詢:</h3>

 <table>
	<tr>
		<th>留言編號</th>
		<th>指南編號</th>
		<th>會員編號</th>
		<th>留言內容</th>
		<th>留言發佈時間</th>
		<th>留言狀態</th>
	</tr>
	
	<tr>
		<td>${guideCommVO.getCommId()}</td>
		<td>${guideCommVO.getGuideId()}</td>
		<td>${guideCommVO.getMemId()}</td>
		<td>${guideCommVO.getCommContent()}</td>
		<td>${guideCommVO.getGuideCommTime()}</td>
		<td>${guideCommVO.getCommStatus()}</td>
	</tr>

</table>
</body>
</html>