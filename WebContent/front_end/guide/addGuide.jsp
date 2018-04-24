<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.guide.model.*"%>

<%
	GuideVO guideVO = (GuideVO) request.getAttribute("guideVO");
%>

<html>

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>新增指南文章 - addGuide.jsp</title>
</head>

<body bgcolor='white'>
	<h3>新增指南文章:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<form method="post" action="<%=request.getContextPath()%>/guide/guide.do">

		<table>
			<tr>
				<td>會員編號:</td>
				<td><input type="text" name="memId" size="45"
					value="<%=(guideVO == null) ? "M000001" : guideVO.getMemId()%>" /></td>
			</tr>

			<tr>
				<td>標題:</td>
				<td><input type="text" name="guideTitle" size="45"
					value="<%=(guideVO == null) ? "桃園市大溪老街" : guideVO.getGuideTitle()%>" /></td>
			</tr>

			<tr>
				<td>內容:</td>
				<td><input type="text" name="guideContent" size="45"
					value="<%=(guideVO == null) ? "吃吃吃玩玩玩" : guideVO.getGuideContent()%>" /></td>
			</tr>

			<tr>
				<td>地區:</td>
				<td><input type="text" name="guideArea" size="45"
					value="<%=(guideVO == null) ? "桃園" : guideVO.getGuideArea()%>" /></td>
			</tr>

			<tr>
				<td>地址:</td>
				<td><input type="text" name="guideMap" size="45"
					value="<%=(guideVO == null) ? "桃園大溪qqqwwwweeeee" : guideVO.getGuideMap()%>" /></td>
			</tr>
			
			</table>
	
	
		<input type="hidden" name="action" value="insert">
		<input type="submit" value="送出新增">
		
	</form>
</body>


</html>