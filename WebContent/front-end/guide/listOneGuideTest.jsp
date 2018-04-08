<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.guide.model.*"%>
<%@ page import="com.guideImg.model.GuideImgVO"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%	GuideVO guideVO = (GuideVO) request.getAttribute("guideVO");%> //GuideSelect.java(Concroller), �s�Jreq��guideVO����
<% 	System.out.println(guideVO.toString());%>
<% 	List<GuideImgVO> imgList = guideVO.getGuideImgList();%>


<jsp:useBean id="guideSvc" scope="page" class="com.guideImg.model.GuideImgService" />

<html>

<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

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





<title>���n��� - listOneGuide.jsp</title>

</head>

<table id="table-1">
	<tr><td>
		 <h3>���n�ԲӤ��e - listOneGuide.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/front-end/select_page.jsp">�^����</a></h4>
	</td></tr>
</table>

<body bgcolor='white'>


	<h3>���n���e:</h3>

	<table>
		<tr>
			<th>���n�s��</th>
			<th>�|���s��</th>
			<th>���n���D</th>
			<th>���n���e</th>
			<th>���n�a��</th>
			<th>���n�a�}</th>
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
			<td>${guideVO.getGuideArea()}</td>
			<td>${guideVO.getGuideMap()}</td>
			<td><fmt:formatDate value="${guideVO.getGuideCreateTime()}" pattern="yyyy-MM-dd"/></td>
			<td>${guideVO.getGuideReadSize()}</td>
			<td>${guideVO.getGuideCommSize()}</td>
			<td>${guideVO.getGuideVoteSize()}</td>
			<td>${(guideVO.guideStatus==2) ? "���`":"����"}</td>
		</tr>
	</table>

	<table>
		<h3>���n�峹�Ϥ�:</h3>
		<tr>
			<td>
				<%for (int i = 0; i < imgList.size(); i++) {%> 
					<img src="<%=request.getContextPath()%>/guideImg.do?action=getOne_For_Display&guideImgId=<%=imgList.get(i).getGuideImgId()%>" style="padding: 13px; width:15%; heigth:15%;"> 
				<%}%>
			</td>
		</tr>
		<tr>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/guide/guide.do" style="margin-bottom: 0px;">
					<input type="submit" value="�R��"> 
					<input type="hidden" name="guideId" value="${guideVO.guideId}">
					<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
					<input type="hidden" name="action" value="delete">
					<%
						System.out.println("�R��guideId====" + guideVO.getGuideId());
					%>
				</FORM>
			</td>
		</tr>
		<tr>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/guide/guide.do" style="margin-bottom: 0px;">
					<input type="submit" value="�ק�"> 
					<input type="hidden" name="guideId" value="${guideVO.guideId}">
					<input type="hidden" name="action" value="fromListOne">
			 		<%System.out.println("�ק�guideId====" + guideVO.getGuideId());%> </FORM>
 			</td>
		</tr>
		
		<tr>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/guideComm.do" style="margin-bottom: 0px;">
					<input type="submit" value="�d�ݤ峹�d��"> 
					<input type="hidden" name="guideId" value="${guideVO.guideId}">
					<input type="hidden" name="action" value="getAllFromGuideId">
			 		<%System.out.println("�d��guideId====" + guideVO.getGuideId());%> </FORM>
 			</td>
		</tr>
		
		
		
	</table>
	
	<br>�����������|:<br><b>
   <font color=blue>request.getServletPath():</font> <%=request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%=request.getRequestURI()%> </b>
	
</body>
</html>