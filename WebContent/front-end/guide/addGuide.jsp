<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.guide.model.*"%>

<%
	GuideVO guideVO = (GuideVO) request.getAttribute("guideVO");
%>

<html>

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�s�W���n�峹 - addGuide.jsp</title>
</head>

<body bgcolor='white'>
	<h3>�s�W���n�峹:</h3>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<form method="post" action="<%=request.getContextPath()%>/guide/guide.do">

		<table>
			<tr>
				<td>�|���s��:</td>
				<td><input type="text" name="memId" size="45"
					value="<%=(guideVO == null) ? "M000001" : guideVO.getMemId()%>" /></td>
			</tr>

			<tr>
				<td>���D:</td>
				<td><input type="text" name="guideTitle" size="45"
					value="<%=(guideVO == null) ? "��饫�j�˦ѵ�" : guideVO.getGuideTitle()%>" /></td>
			</tr>

			<tr>
				<td>���e:</td>
				<td><input type="text" name="guideContent" size="45"
					value="<%=(guideVO == null) ? "�Y�Y�Y������" : guideVO.getGuideContent()%>" /></td>
			</tr>

			<tr>
				<td>�a��:</td>
				<td><input type="text" name="guideArea" size="45"
					value="<%=(guideVO == null) ? "���" : guideVO.getGuideArea()%>" /></td>
			</tr>

			<tr>
				<td>�a�}:</td>
				<td><input type="text" name="guideMap" size="45"
					value="<%=(guideVO == null) ? "���j��qqqwwwweeeee" : guideVO.getGuideMap()%>" /></td>
			</tr>
			
			</table>
	
	
		<input type="hidden" name="action" value="insert">
		<input type="submit" value="�e�X�s�W">
		
	</form>
</body>


</html>