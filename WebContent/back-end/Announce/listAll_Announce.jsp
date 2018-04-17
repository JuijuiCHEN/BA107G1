<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="Big5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Anti-G後台</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/base.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="icon" href="img/LogoSmallback.png" />
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
	<nav class="navbar navbar-inverse navbar-fixed-top navbar-custom">

	<div class="container-fluid">
		<div class="navbar-header ">
			<img class="navbar-brand navbar-brand-custom"
				src="img/LogoSmall2.png" id="nav-logo"> <a
				class="navbar-brand " href="#">Anti-Gravity</a>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="login.html"><span
					class="glyphicon glyphicon-log-in"></span> 登出帳號</a></li>
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
									aria-controls="ddd"> 體驗檢舉管理 </a>
							</h6>
						</div>
						<div id="ddd" class="panel-collapse collapse" role="tabpanel" aria-labelledby="panel2">
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
								<a href="#eee" data-parent="#accordion2" data-toggle="collapse" role="button" class="collapsed" aria-expanded="false" aria-controls="ddd"> 信件管理 </a>
							</h6>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="panel2">
							<h6 class="panel-title px-3 mt-4 mb-1 text-muted">
								<a href="#fff" data-parent="#accordion2" data-toggle="collapse" role="button" class="collapsed" aria-expanded="false" aria-controls="ddd"> 公告欄管理 </a>
							</h6>
						</div>
					</div>
				</div>
				</nav>
				<main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
					<h4 class="h4">公告欄管理</h4>
					<div align="right">
							<button type="button" class="">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
							</button>
						</a>
					</div>
				</div>
				<tr></tr>
				<div></div>
				<div>

					<table
						class="table table-hover table-striped table-bordered table-condensed ">
						<thead>
							<tr>
								<th width="40"><div align="center">公告日期</div></th>
								<th width="100"><div align="center">公告ID</div></th>
								<th width="100"><div align="center">公告標題</div></th>
								<th width="100"><div align="center">公告內容</div></th>
								<th width="100"><div align="center">公告圖片</div></th>
								<th width="80"><div align="center">操作</div></th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td><div align="center">2018-04-12</div></td>
								<td><div align="center">AN000001</div></td>
								<td><div align="center">公告標題</div></td>
								<td><div align="center">公告內容</div></td>
								<td><div align="center">公告圖片</div></td>
								<td><div align="center">
										<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/announce/announce.do" style="margin-bottom: 0px;">
											<input type="submit" value="編輯"> 
											<input type="hidden" name="announce_id" value="${expCommRepVO.e_comm_rep_id}"> 
											<input type="hidden" name="requestURL" value="/front_end/Announce/listAll_Announce.jsp"> 
											<input type="hidden" name="action" value="getOne_For_Edit">
										</FORM>
									</div>
									<div align="center">
										<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/announce/announce.do" style="margin-bottom: 0px;">
											<input type="submit" value="刪除"> 
											<input type="hidden" name="announce_id" value="${expCommRepVO.e_comm_rep_id}"> 
											<input type="hidden" name="requestURL" value="/front_end/Announce/listAll_Announce.jsp"> 
											<input type="hidden" name="action" value="getOne_For_Edit">
										</FORM>
									</div>
								</td>
							</tr>

						</tbody>
					</table>

				</div>
				</main>



			</div>
		</div>
	</div>









</body>
<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>



</html>