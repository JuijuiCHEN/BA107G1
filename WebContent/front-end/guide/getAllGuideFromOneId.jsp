<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.guide.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
List<GuideVO> list = (List<GuideVO>)request.getAttribute("guideVOList");
%>
<jsp:useBean id="guideSvc" scope="page" class="com.guideImg.model.GuideImgService" />

<html>
<head>
<title>單一會員所有文章列表 - getAllGuideFromOneId.jsp</title>

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

<style>
#overflowTest {
    background: white;
    color: black;
    padding: 15px;
    width: 200px;
    height: 50px;
    overflow: scroll;
    border: 1px solid #ff95ca;
}
</style>


</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>單一會員所有文章列表 - getAllGuideFromOneId.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/front-end/select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>



<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

	<table>
		<tr>
			<th>會員編號</th>
			<th>指南編號</th>
			<th>指南標題</th>
			<th>指南內容</th>
			<th>指南地區</th>
			<th>指南地址</th>
			<th>指南發佈時間</th>
			<th>訪問人數</th>
			<th>留言人數</th>
			<th>案讚人數</th>
			<th>指南狀態</th>
		</tr>

	<c:forEach var="guideVO" items="${list}">
		
		<tr>
			<td>${guideVO.getGuideId()}</td>
			<td>${guideVO.getMemId()}</td>
			<td>${guideVO.getGuideTitle()}</td>
			<td><div id="overflowTest">${guideVO.getGuideContent()}</div></td>
			<td>${guideVO.getGuideArea()}</td>
			<td>${guideVO.getGuideMap()}</td>
			<td><fmt:formatDate value="${guideVO.getGuideCreateTime()}" pattern="yyyy-MM-dd"/></td>
			<td>${guideVO.getGuideReadSize()}</td>
			<td>${guideVO.getGuideCommSize()}</td>
			<td>${guideVO.getGuideVoteSize()}</td>
			<td>${(guideVO.guideStatus==2) ? "正常":"隱藏"}</td>
					
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/guide/guide.do" style="margin-bottom: 0px;">
					<input type="submit" value="刪除"> 
					<input type="hidden" name="guideId" value="${guideVO.guideId}">
					<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
					<input type="hidden" name="action" value="delete">
				</FORM>
			</td>
			
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/guide/guide.do" style="margin-bottom: 0px;">
					<input type="submit" value="查看文章內容"> 
					<input type="hidden" name="guideId" value="${guideVO.guideId}">
					<input type="hidden" name="action" value="getOne">
 			</td>
 			
		</tr>
	</c:forEach>
</table>
<br>本網頁的路徑:<br><b>
   <font color=blue>request.getServletPath():</font> <%=request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%=request.getRequestURI()%> </b>



</body>
</html>
