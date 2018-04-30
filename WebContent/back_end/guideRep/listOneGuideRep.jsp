<%@page import="com.guide.model.GuideVO"%>
<%@page import="com.guide.model.GuideService"%>
<%@page import="com.guideRep.model.GuideRepService"%>
<%@page import="com.guideRep.model.GuideRepVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.mem.model.*"%>
<%
GuideRepVO guideRepVO = (GuideRepVO) request.getAttribute("guideRepVO");
GuideService guideSvc = new GuideService();
GuideVO guideVO = guideSvc.getOneGuide(guideRepVO.getGuideId());
%>
<%
	MemService memSvc = new MemService();
	MemVO memVO = memSvc.getOneMemID(guideRepVO.getMemId());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>Anti-G��x</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/back_end/guideRep/css/base.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="icon" href="<%=request.getContextPath()%>/back_end/guideRep/img/LogoSmallback.png" />
<link
	href="https://getbootstrap.com/docs/4.0/examples/dashboard/dashboard.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<style type="text/css">
nav.col-md-2.d-none.d-md-block.bg-light.sidebar {
	padding-top: 5%;
}

main.col-md-9.ml-sm-auto.col-lg-10.pt-3.px-4 {
	padding-top: 5%;
}
</style>
<body>
	<div>
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
			<div class="btn-toolbar mb-2 mb-md-0"></div>
		</div>
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/guideRep.do" style="margin-bottom: 0px;">
			<table class="table table-hover table-striped table-bordered table-condensed ">
				<div class="main">
					<table class="table table-hover table-striped table-bordered table-condensed">
						<tr class="table-title">
							<td width="100"><div align="center">���|�ɶ�</div></td>
							<td width="120"><div align="center">�ȹC���n���|ID</div></td>
							<td width="120"><div align="center">�ȹC���nID</div></td>
							<td width="120"><div align="center">���|�HID</div></td>
							<td width="100"><div align="center">�ץ󪬺A</div></td>
						</tr>
						<tr class="table-content">
							<td><div align="center"><fmt:formatDate value="${guideRepVO.getGuideRepDate()}" pattern="yyyy-MM-dd HH:mm:ss"/></div></td>
							<td><div align="center"><%=guideRepVO.getGuideRepId()%></div></td>
							<td><div align="center"><%=guideRepVO.getGuideId()%>�i<%=guideVO.getGuideTitle()%>�j</div></td>
							<td><div align="center"><%=guideRepVO.getMemId()%> �i<%=memVO.getMem_name()%>�j
							</div></td>
							
							<td><div align="center">
							<c:if test="${guideRepVO.guideRepStatus==1}">
								���f��
								</c:if>
								<c:if test="${guideRepVO.guideRepStatus==2}">
								�L�����|
								</c:if>
								<c:if test="${guideRepVO.guideRepStatus==3}">
								�������|-���ä峹
							</c:if></div></td>
						</tr>
						
						<tr class="table-title">
							<td class="table-title" colspan="1" align="center">�ȹC���n���e</td>
							<td colspan="4" align="left"><%=guideVO.getGuideContent()%></td>
						</tr>
						<tr class="table-title">
							<td class="table-title" colspan="1" align="center">���|��]</td>
							<td colspan="4" align="center">
							<%=guideRepVO.getGuideRepContent()%>
							</td>
						</tr>
						
					</table>
					<c:if test="${guideRepVO.guideRepStatus==1}">
					<table class="table table-7 table-hover" width="100%">
						<tr class="table-title">
							<th align="center">

								<div class="radio">
									<label> <input type="radio" name="guideRepStatus" value="3">
										�������|-���ä峹
									</label>
								</div>
							</th>
							<th align="center">
								<div class="radio">
									<label> <input type="radio" name="guideRepStatus" value="2">
										�L�����|

									</label>
								</div>
							</th>
						</tr>
						<tr>
							<td colspan="2" align="center"><spanclass="input-group-btn">
								<span>
								<button id="submit" class="btn btn-primary" value="�T�{�e�X">�T�{�e�X</button>
								<input type="hidden" name="guideRepId" value="<%=guideRepVO.getGuideRepId()%>">
								<input type="hidden" name="guideId" value="<%=guideVO.getGuideId()%>">
								<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
								<input type="hidden" name="action" value="update"> 
								</span>
							</td>

						
						</tr>

					</table>
					</c:if>
				</div>
			

		</table>
		</FORM>
		
	</div>



	<!-- Icons -->
	<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
	<script>
	$(function(){
	$("#submit").on("click",function(){
	    var txt;
	    if (confirm("�аݽT��n�e�X�����ץ󪺼f�ֵ��G��?�e�X��N�L�k�ק�,�ЦA���T�{,����")) {
	    	
	    }else{
	    	return false;
	    }
	});
	})	
    </script>
</body>
</html>