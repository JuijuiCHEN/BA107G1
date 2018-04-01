<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.guide.model.*"%>

<%
	GuideVO guideVO = (GuideVO) request.getAttribute("guideVO"); //EmpServlet.java (Concroller) �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
	System.out.println(guideVO.toString());
	
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>���n��ƭק� - update_emp_input.jsp</title>

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

<style>
  table {
	width: 100%;
	heigth: 10px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #ff95ca;
  }
  th, td {
	padding: 5px;
	text-align: center;
</style>

<title>���n��� - updateFront.jsp</title>

</head>

<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>��@�|���Ҧ��峹�C�� - updateFront.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/front-end/select_page.jsp">�^����</a></h4>
	</td></tr>
</table>

	<h3>��ƭק�:</h3>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post"
		ACTION="<%=request.getContextPath()%>/guide/guide.do">
		<table>
			<tr>
				<td>���n�s��: </td>
				<td>
				<%=guideVO.getGuideId()%>
				</td>
			</tr>
			<tr>
				<td>���D:</td>
				<td><input type="text" name="guideTitle" size="45" value="<%=guideVO.getGuideTitle()%>" /></td>
			</tr>	
			<tr>
				<td>���e:</td>
				<td><input type="text" name="guideContent" size="45" value="<%=guideVO.getGuideContent()%>" /></td>
			</tr>	
		</table>
		<br>
		
		 <input type="hidden" name="action" value="updateFront">
		 <input type="hidden" name="guideId" value="<%=guideVO.getGuideId()%>">
		 
		<input type="submit" value="�e�X�ק�">
	</FORM>
	</body>
</html>