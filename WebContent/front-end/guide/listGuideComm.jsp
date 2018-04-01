<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.guideComm.model.*" %>


<% List<GuideCommVO> list = (List<GuideCommVO>) request.getAttribute("list"); %>
<html>

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�d�ߤ@�g�Ҧ��d�� - listGuideComm.jsp</title>
<style>
  table#table-1 {
	width: 500px;
	background-color: #ff95ca;
	margin-top: 5px;

    border: 2px ridge Gray;
    height: 80px;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
  td h2{
  	color: black;
  }
  
</style>


<style>
  table {
	width: 100%;

	background-color: white;
  }
  table, th, td {
    border: 1px solid #ff95ca;
  }
</style>

</head>

<body bgcolor='white'>
	<h3>�d�ߤ@�g�Ҧ��d��:</h3>

<table id="table-1">
	<tr><td>
		 <h3>��@�|���Ҧ��峹�C�� - listGuideComm.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/front-end/select_page.jsp">�^����</a></h4>
	</td></tr>
</table>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�o�g�峹:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<table>
		<tr>
			<th>�d���s��</th>
			<th>���n�s��</th>
			<th>�|���s��</th>
			<th>�d�����e</th>
			<th>�d�����</th>
			<th>�d�����A</th>
		</tr>
		
	<c:forEach var="guideCommVO" items="${list}">
		<tr>
		<td>${guideCommVO.commId}</td>
		<td>${guideCommVO.guideId}</td>
		<td>${guideCommVO.memId}</td>
		<td>${guideCommVO.commContent}</td>
		<td>${guideCommVO.guideCommTime}</td>
		<td>${guideCommVO.commStatus}</td>
		</tr>
	
	</c:forEach>
	</table>
	</body>
	</html>





