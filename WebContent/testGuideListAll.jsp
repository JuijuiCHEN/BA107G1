<%@page import="java.util.List"%>
<%@page import="com.guide.model.GuideDAO"%>
<%@page import="com.guide.model.GuideVO"%>
<%@ page contentType="text/html; charset=Big5" pageEncoding="Big5"%>

<%
//       GuideDAO dao = new GuideDAO();
//       List<GuideVO> list = dao.getAll();
//       pageContext.setAttribute("list",list);
%>

// <jsp:useBean id="list" scope="session" type="java.util.List<GuideVO>" />

<html>
<head>
</head>
<body>

<table>
	<tr>
		<th>指南編號</th>
		<th>會員編號</th>
		<th>指南標題</th>
		<th>指南內容</th>
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
		<td>${guideVO.getGuideCreateTime()}</td>
		<td>${guideVO.getGuideReadSize()}</td>
		<td>${guideVO.getGuideCommSize()}</td>
		<td>${guideVO.getGuideVoteSize()}</td>
		<td>${guideVO.getGuideStatus()}</td>
	</tr>
	
	
</table>
</body>
</html>