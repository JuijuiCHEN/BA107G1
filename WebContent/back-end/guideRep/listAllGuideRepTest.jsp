<%@page import="com.guideRep.model.GuideRepVO"%>
<%@ page import="java.util.*"%>
<%@page import="com.guideRep.model.GuideRepService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>

<%  
	GuideRepService repSvc = new GuideRepService();
	List<GuideRepVO> repList = repSvc.getAllStatus1();
	pageContext.setAttribute("repList", repList);
%>

<html>
<head>


</head>
<body>
<table>
	<tr>
		<th>���|�s��</th>
		<th>���n�s��</th>
		<th>�|���s��</th>
		<th>���|���e</th>
		<th>���|�o�G�ɶ�</th>
		<th>���|���A</th>
		<th>�ק窱�A</th>
	</tr>
	
<c:forEach var="guideRepVO" items="${repList}">
	<tr>
		<td>${guideRepVO.getGuideRepId()}</td>
		<td>${guideRepVO.getGuideId()}</td>
		<td>${guideRepVO.getMemId()}</td>
		<td>${guideRepVO.getGuideRepContent()}</td>
		<td><fmt:formatDate value="${guideRepVO.getGuideRepDate()}" pattern="yyyy-MM-dd"/></td>
		<td>${(guideRepVO.guideRepStatus == 1)?"���f��":"�w�f��"}</td>
	</tr>
	<td>
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/guideRep.do" style="margin-bottom: 0px;">
			<input type="submit" value="�d�ݤ峹���e"> 
			<input type="hidden" name="guideId" value="${guideVO.guideId}">
			<input type="hidden" name="action" value="getOne">
		</FORM>
	</td>
	</c:forEach>	
 </table>
 	<input type="submit" id="updatecomit" value="�ק窱�A"> 
</body>
</html>

<script>
	document.getElementById("updatecomit").onclick = function() {
		document.getElementById("statusForm").submit();
	}
</script>