<%@page import="com.guideRep.model.GuideRepVO"%>
<%@ page import="java.util.*"%>
<%@page import="com.guideRep.model.GuideRepService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%  
	GuideRepService repSvc = new GuideRepService();
	List<GuideRepVO> guideRepList = repSvc.getAllStatus(3);
	pageContext.setAttribute("guideRepList", guideRepList);
%>

<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<title>Anti-G後台</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" mhref="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/base.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="icon" href="img/LogoSmallback.png" />
<link href="https://getbootstrap.com/docs/4.0/examples/dashboard/dashboard.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
nav.col-md-2.d-none.d-md-block.bg-light.sidebar {
	padding-top: 5%;
}

main.col-md-9.ml-sm-auto.col-lg-10.pt-3.px-4 {
	padding-top: 5%;
}
</style>
</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top navbar-custom">

	<div class="container-fluid">
		<div class="navbar-header ">
			<img class="navbar-brand navbar-brand-custom" src="img/LogoSmall2.png" id="nav-logo"> 
				<a class="navbar-brand " href="#">Anti-Gravity</a>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="login.html">
			<span class="glyphicon glyphicon-log-in"></span> 登出帳號</a></li>
		</ul>
	</div>
	</nav>
	
	<div class="container-fluid">
		<div class="row">
			<div>
				<nav class="col-md-2 d-none d-md-block bg-light sidebar">
				<div class="sidebar-sticky">
					<div class="panel-group" id="accordion2" role="tablist"
						aria-multiselectable="true"></div>

					<!-- 區塊1 -->
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="panel2">
							<h6 class="panel-title px-3 mt-4 mb-1 text-muted">
								<a href="#aaa" data-parent="#accordion2" data-toggle="collapse"
									role="button" class="collapsed" aria-expanded="false"
									aria-controls="aaa"> 員工管理 </a>
							</h6>
						</div>
						<div id="aaa" class="panel-collapse collapse" role="tabpanel"
							aria-labelledby="panel2">
							<div class="panel-body">
								<a href="#" class="nav-link"><span data-feather="users"></span></span>帳戶管理</a>
							</div>
							<div class="panel-body">
								<a href="#" class="nav-link"><span data-feather="award"></span>帳戶管理</a>
							</div>
						</div>
					</div>
					<!-- 區塊2 -->
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="panel2">
							<h6 class="panel-title px-3 mt-4 mb-1 text-muted">
								<a href="#bbb" data-parent="#accordion2" data-toggle="collapse"
									role="button" class="collapsed" aria-expanded="false"
									aria-controls="bbb"> 帳號管理 </a>
							</h6>
						</div>
						<div id="bbb" class="panel-collapse collapse" role="tabpanel"
							aria-labelledby="panel2">
							<div class="panel-body">
								<a href="#" class="nav-link"><span data-feather="file-text"></span>業者申請核准</a>
							</div>
							<div class="panel-body">
								<a href="#" class="nav-link"><span data-feather="award"></span>權限管理</a>
							</div>
						</div>

					</div>
					<!-- 區塊3 -->



					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="panel2">
							<h6 class="panel-title px-3 mt-4 mb-1 text-muted">
								<a href="#ccc" data-parent="#accordion2" data-toggle="collapse"
									role="button" class="collapsed" aria-expanded="false"
									aria-controls="ccc"> 訂單管理 </a>
							</h6>
						</div>
						<div id="ccc" class="panel-collapse collapse" role="tabpanel"
							aria-labelledby="panel2">
							<div class="panel-body">
								<a href="#" class="nav-link"><span data-feather="file-text"></span>體驗訂單管理</a>
							</div>
							<div class="panel-body">
								<a href="#" class="nav-link"><span data-feather="award"></span>房間訂單管理</a>
							</div>
						</div>

					</div>



					<!-- 區塊4 -->
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="panel2">
							<h6 class="panel-title px-3 mt-4 mb-1 text-muted">
								<a href="#ddd" data-parent="#accordion2" data-toggle="collapse"
									role="button" class="collapsed" aria-expanded="false"
									aria-controls="ddd"> 檢舉案件管理 </a>
							</h6>
						</div>
						<div id="ddd" class="panel-collapse collapse" role="tabpanel"
							aria-labelledby="panel2">
							<div class="panel-body">
								<a href="#" class="nav-link"><span data-feather="file-text"></span>體驗檢舉</a>
							</div>
							<div class="panel-body">
								<a href="#" class="nav-link"><span data-feather="award"></span>指南檢舉</a>
							</div>
							<div class="panel-body">
								<a href="#" class="nav-link"><span data-feather="award"></span>體驗評語檢舉</a>
							</div>
							<div class="panel-body">
								<a href="#" class="nav-link"><span data-feather="award"></span>指南留言檢舉</a>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="panel2">
							<h6 class="panel-title px-3 mt-4 mb-1 text-muted">
								<a href="#eee" data-parent="#accordion2" data-toggle="collapse"
									role="button" class="collapsed" aria-expanded="false"
									aria-controls="ddd"> 信件管理 </a>
							</h6>
						</div>
					</div>
						<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="panel2">
							<h6 class="panel-title px-3 mt-4 mb-1 text-muted">
								<a href="#fff" data-parent="#accordion2" data-toggle="collapse"
									role="button" class="collapsed" aria-expanded="false"
									aria-controls="ddd"> 公告欄管理 </a>	
							</h6>
						</div>
					</div>
				</div>
				</nav>
				<main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
					<h4 class="h4">旅遊指南檢舉案件管理</h4>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/guideRep/listAllGuideRep.jsp" style="margin-bottom: 0px;">
					
					<div align="right">
						<select name="Sorting" onChange="location = this.options[this.selectedIndex].value;">
							<option>請選擇案件狀態查詢</option>
							<option value="<%=request.getContextPath()%>/back-end/guideRep/listAllGuideRep1.jsp">未審核</option>
							<option value="<%=request.getContextPath()%>/back-end/guideRep/listAllGuideRep2.jsp">無效檢舉</option>
							<option value="<%=request.getContextPath()%>/back-end/guideRep/listAllGuideRep3.jsp">有效檢舉</option>
						</select>
					</div>
					</FORM>
					<br>	
				</div>
				<tr></tr>
				<div ></div>
				<div>
								<table class="table table-hover table-striped table-bordered table-condensed ">
									<thead>
										<tr>
											<th width="80"><div align="center">檢舉時間</div></th>
											<th width="110"><div align="center">檢舉ID</div></th>
											<th width="110"><div align="center">被檢舉指南ID</div></th>
											<th width="110"><div align="center">檢舉人ID</div></th>
											<th width="110"><div align="center">案件狀態</div></th>
											<th width="80"><div align="center">編輯</div></th>
										</tr>
									</thead>
									
									<%@ include file="pages/page1.file"%>		
									<tbody>
										<c:forEach var="guideRepVO" items="${guideRepList}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
											<tr>
											<td height="30"><div align="center"><fmt:formatDate value="${guideRepVO.getGuideRepDate()}" pattern="yyyy-MM-dd"/></div></td>
												<td high="30"><div align="center">${guideRepVO.guideRepId}</div></td>
												<td high="30"><div align="center">${guideRepVO.guideId}</div></td>
												<td high="30"><div align="center">
												<c:forEach var="memVO" items="${memSvc.all}">
													<c:if test="${guideRepVO.memId==memVO.mem_id}">
	                   		 							${memVO.mem_id}  -【${memVO.mem_name}】
                    								</c:if>
												</c:forEach></div></td>
												
												<td high="20"><div align="center">
												<c:if test="${guideRepVO.guideRepStatus==1}">
												未審核
												</c:if>
												<c:if test="${guideRepVO.guideRepStatus==2}">
												無效檢舉
												</c:if>
												<c:if test="${guideRepVO.guideRepStatus==3}">
												有效檢舉-文章已隱藏
												</c:if>
												
												</div>
												</td>
												<td>
												<div align="center">
													<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/guideRep.do" style="margin-bottom: 0px;">
														<input type="submit" class="btn btn-primary" value="查看內容">
														<input type="hidden" name="guideRepId"value="${guideRepVO.guideRepId}">
														<input type="hidden" name="requestURL"value="/back-end/guideRep/listAllGuideRep3.jsp">
														<input type="hidden" name="whichPage" value="<%=whichPage%>">
														<input type="hidden" name="action" value="findByPrimaryKey">
													</FORM>
												</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<%@ include file="pages/page2.file"%>
							
								<%if (request.getAttribute("guideRepVO") != null) { %>
									<jsp:include page="/back-end/guideRep/listOneGuideRep.jsp"/>
								<%}%>
							</div>
							
							</main>
							
							<!--tab4:指南評語檢舉-->
							
						</div>
					</div>
				</div>
				</main>
			</div>

			</main>
		</div>
<!-- 	</div> -->



	<!-- Icons -->
	<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
	<script>
		
	</script>
</body>
</html>
