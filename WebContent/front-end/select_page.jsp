<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Anti Guide: Home</title>

<style>
  table#table-1 {
	width: 500px;
	background-color: #ff95ca;
	margin-top: 5px;
	margin-bottom: 10px;
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
</head>

<body bgcolor='white'>

<table id="table-1">
  <tr><td><h2>Anti Guide: Home</h2><h4>( MVC )</h4></td></tr>
</table>

<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
<h3>�|���d�ߩҦ����v�峹:</h3>
	<ul>
		<li>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/guide/guide.do">
				<b>��J�|���s�� (�p: M000001):</b>
				<input type="text" name="memId" value="M000007">
				<input type="hidden" name="action" value=getAll_From_MemId>
				<input type="submit" value="�e�X">
			</FORM>
		</li>
	</ul>
	
<br>	
<h3>�d�߳�@���n���e:</h3>
	<ul>
		<li>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/guide/guide.do">
				<b>��J���n�s�� (�p: G000001):</b>
				<input type="text" name="guideId" value="G000077">
				<input type="hidden" name="action" value="getOne">
				<input type="submit" value="�e�X">
			</FORM>
		</li>
	</ul>
	
<br>
<h3>���n�޲z</h3>
	<ul>
		<li><a href='guide/addGuide.jsp'>Add</a> a new Guide.</li>
	</ul>

</body>


</html>