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
		<th>���n�s��</th>
		<th>�|���s��</th>
		<th>���n���D</th>
		<th>���n���e</th>
		<th>���n�o�G�ɶ�</th>
		<th>�X�ݤH��</th>
		<th>�d���H��</th>
		<th>���g�H��</th>
		<th>���n���A</th>
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