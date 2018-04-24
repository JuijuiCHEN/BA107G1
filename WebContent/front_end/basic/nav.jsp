<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>

<html>
<%
	MemVO memVO = (MemVO) request.getAttribute("memVO");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Anti-G</title>
<meta name="applicable-device" content="pc,mobile">
<link
	href="http://www.dmaku.com/demo/moban/2018040899102515/css/bootstrap.css"
	rel="stylesheet">
<link
	href="http://www.dmaku.com/demo/moban/2018040899102515/css/bxslider.css"
	rel="stylesheet">
<script
	src="http://www.dmaku.com/demo/moban/2018040899102515/js/bxslider.min.js"></script>
<script
	src="http://www.dmaku.com/demo/moban/2018040899102515/js/common.js"></script>
<script
	src="http://www.dmaku.com/demo/moban/2018040899102515/js/bootstrap.js"></script>
<link rel="icon"
	href="https://lh3.googleusercontent.com/_8JZPKPKuVb51P1bzsm6xBuN_6E71ZJOIzKj0SGHIomzgB-TtC6kExqQL54JBkEmNW9VaRXrpZEJv-qdV-lULRAG42M7q6OdvdFAZQiadohFAF3tltrmzy22XRojtcueIT-Xa5QuFg8632eawtZmyv304k0kJDuYtf_Rl6fJ46-crhe_DUAhVOCrLl_eA3pGbAjlQnpaIpTADlfA1LgzOWeBwMGKEn2dj2KFF7UCY9ealySm_3bZZf4AiWIfzDVwhrVlhQ78y4a_JKkSCahlQnvHqu0pkhMcdY5nAtzVUiizZwJPWI7UIa_et7xM6q-G8Q49Xqh4nIhxPgd_eyaciOKa7dvXaNXrw4XN4PIW2b-gE71qb3vBF6bJVOK1knfAzi7dUjqx99PM6IIcLgxCR8iwufaEr4CzgWCUYCdDKSWDYYmlAqv-hQmZtNJ_GaA4-2-fkm6Fnyfy9IpD3vQ3yFdIayXF2ZkU50KfqZT41bVEkyx527ND3MoE1iwIZQQzEvCRk2L1xcU7RjFoiS7Sw5od4A_AfN7Hm4UlclI3o4AHAKEZxq7bUwhAD0u2BUUnVeH_ee9lUH0hbpK2PAEJqGTRn8N5u2RoZn4tvnc=w163-h230-no" />
<link href="<%=request.getContextPath()%>/front_end/basic/css/nav.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/front_end/basic/css/loginCss/styles.css"
	rel="stylesheet">
<script
	src="<%=request.getContextPath()%>/front_end/basic/js/jquery.twzipcode.min.js"></script>
<link rel="icon"
	href="https://lh3.googleusercontent.com/_8JZPKPKuVb51P1bzsm6xBuN_6E71ZJOIzKj0SGHIomzgB-TtC6kExqQL54JBkEmNW9VaRXrpZEJv-qdV-lULRAG42M7q6OdvdFAZQiadohFAF3tltrmzy22XRojtcueIT-Xa5QuFg8632eawtZmyv304k0kJDuYtf_Rl6fJ46-crhe_DUAhVOCrLl_eA3pGbAjlQnpaIpTADlfA1LgzOWeBwMGKEn2dj2KFF7UCY9ealySm_3bZZf4AiWIfzDVwhrVlhQ78y4a_JKkSCahlQnvHqu0pkhMcdY5nAtzVUiizZwJPWI7UIa_et7xM6q-G8Q49Xqh4nIhxPgd_eyaciOKa7dvXaNXrw4XN4PIW2b-gE71qb3vBF6bJVOK1knfAzi7dUjqx99PM6IIcLgxCR8iwufaEr4CzgWCUYCdDKSWDYYmlAqv-hQmZtNJ_GaA4-2-fkm6Fnyfy9IpD3vQ3yFdIayXF2ZkU50KfqZT41bVEkyx527ND3MoE1iwIZQQzEvCRk2L1xcU7RjFoiS7Sw5od4A_AfN7Hm4UlclI3o4AHAKEZxq7bUwhAD0u2BUUnVeH_ee9lUH0hbpK2PAEJqGTRn8N5u2RoZn4tvnc=w163-h230-no" />

</head>



<body >
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a href="<%=request.getContextPath()%>/front_end/index.jsp"> <img
				class="logo navbar-form navbar-left navbar-form-custom"
				src="<%=request.getContextPath()%>/front_end/basic/images/b.png" id="nav-logo"></a>
			<form class="navbar-form navbar-left navbar-form-custom"
				action="/action_page.php">
				<div class="form-group">
					<input type="text" class="form-control  search-box"
						placeholder="搜尋體驗、指南、或地區">
				</div>
			</form>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-nav-c ">
				<li class="dropdown"><a href="javascript:;">體驗</a> <a
					href="javascript:;" id="app_menudown" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"><span
						class="glyphicon glyphicon-menu-down btn-xs"></span></a>
					<ul class="dropdown-menu nav_small" role="menu">
						<li><a
							href="<%=request.getContextPath()%>/front_end/exp/listAllExp.jsp">精彩體驗</a>
						<li><a
							href="<%=request.getContextPath()%>/front_end/exp/listExpForOwner.jsp">我的體驗</a>
					</ul></li>
				<li><a
					href="<%=request.getContextPath()%>/front_end/expOrderDetail/cartlist.jsp">預定<span
						class="badge">${cart.size()}</span></a></li>
				<li><a href="javascript:;">訊息</a></li>
				<li><a href="javascript:;">社群</a></li>

				<c:if test="${not empty memVO}">

					<li class="dropdown"><a href="javascript:;"> <img
							style="width: 30px; height: 30px; border-radius: 30px;"
							src="<%=request.getContextPath()%>/util/ImgServlet.do?tableName=MEM&colName=MEM_ID&queryId=${memVO.mem_id}&queryImg=MEM_file"
							alt=""> ${memVO.mem_name}

					</a> <a href="javascript:;" id="app_menudown" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"><span
							class="glyphicon glyphicon-menu-down btn-xs"></span></a>
						<ul class="dropdown-menu nav_small" role="menu">
							<li>
								<FORM METHOD="post"
									ACTION="<%=request.getContextPath()%>/mem/mem.do"
									style="margin-bottom: 0px;">
									<input type="submit" class="btn btn-primary" value="修改會員資料">
									<input type="hidden" name="mem_id" value="${memVO.mem_id}">
									<input type="hidden" name="requestURL"
										value="<%=request.getServletPath()%>">
									<!--送出本網頁的路徑給Controller-->
									<input type="hidden" name="action" value="user_update">
								</FORM>
							<li><a href="javascript:;">申請成為業者</a></li>
							<li><a href="javascript:;">客服支援</a></li>
							<li class="nav-item"><a href="#logout-btn" type="button"
								id="logout-btn"> 登出</a></li>
						</ul></li>
				</c:if>


				<c:if test="${empty memVO}">
					<li class="dropdown"><a href="#loginModal" data-toggle="modal">登入</a>
					</li>
				</c:if>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
	</nav>
	<!-- 觸發modal -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="login" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header"
					style="background-color: #2A3A66; border-bottom: #2A3A66;">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body"
					style="background-color: #2A3A66; height: 800px;">
					<form id="loginForm">

						<div class="login-wrap">
							<div class="login-html">
								<!--    登入註冊燈箱 -->
								<input id="tab-1" type="radio" name="tab" class="sign-in"
									checked> <label for="tab-1" class="tab">登入</label> <input
									id="tab-2" type="radio" name="tab" class="sign-up"> <label
									for="tab-2" class="tab">註冊</label>
								<div class="login-form">
									<div class="sign-in-htm">
										<div class="group">
											<!-- 登入 -->
											<label for="account" class="label">帳號</label> <input
												name="mem_acc" id="account" type="text"
												class="input form-control" placeholder="請輸入帳號">
										</div>
										<div class="group">
											<label for="password" class="label">密碼</label> <input
												id="password" type="password" class="input form-control"
												data-type="password" name="mem_pw" placeholder="請輸入密碼">
										</div>
										<div class="group">
											<input id="check" type="checkbox" class="check" checked>
											<label for="check"><span class="icon"></span>記住帳號</label>
										</div>
										<div class="group">
											<input id="login-btn" type="button" class="button" value="登入">
										</div>
										<div class="hr"></div>
										<div class="foot-lnk">
											<a href="#forgot">忘記密碼?</a>
										</div>
									</div>
					</form>
					<!--註冊頁面 -->
					<div class="sign-up-htm">
						<form METHOD="post"
							ACTION="<%=request.getContextPath()%>/mem/mem.do" name="form2"
							class="form-signin  custom-form">


							<div class="group">
								<label for="mem_acc" class="label">帳號</label> <input type="TEXT"
									id="acc" name="mem_acc"
									value="<%=(memVO == null) ? "" : memVO.getMem_acc()%>"
									class="input form-control" placeholder="請輸入帳號" required
									autofocus>
							</div>

							<div class="group">
								<label for="mem_pw" class="label">密碼</label> <input
									type="password" id="pw" name="mem_pw"
									value="<%=(memVO == null) ? "" : memVO.getMem_pw()%>"
									id="inputPassword" class="input form-control"
									placeholder="請輸入密碼" required>
							</div>

							<div class="group">
								<label for="mem_name" class="label">姓名</label> <input
									type="text" name="mem_name" id="mem_name"
									value="<%=(memVO == null) ? "" : memVO.getMem_name()%>"
									class="input form-control" placeholder="請輸入名字" required>
							</div>
							<div class="group">
								<label for="mem_addr" class="label">地址</label> <input
									type="text" name="mem_addr" id="mem_addr"
									value="<%=(memVO == null) ? "" : memVO.getMem_addr()%>"
									class="input form-control" placeholder="請輸入地址" required>
							</div>
							<div class="group">
								<label for="mem_tel" class="label">電話</label> <input type="text"
									name="mem_tel" id="mem_tel"
									value="<%=(memVO == null) ? "" : memVO.getMem_tel()%>"
									class="input form-control" placeholder="請輸入電話" required>
							</div>
							<div class="group">
								<font color="white">請選擇性別</font> <input type="radio" id="sex"
									name="mem_sex" value="男" required><font color="white">男</font>
								<input type="radio" name="mem_sex" value="女" required><font
									color="white">女</font>
							</div>



							<div class="group">

								<label for="mem_email" class="label">Email</label> <input
									type="text" name="mem_email" id="mem_email"
									value="<%=(memVO == null) ? "" : memVO.getMem_email()%>"
									class="input form-control" placeholder="Email address" required
									autofocus>
							</div>
							<div style="display: none">
								<input type="text" name="mem_exp_owner" class="form-control"
									value="關閉" name="emp_exp_owner"> <input type="text"
									name="mem_introduction" class="form-control" value=""
									name="mem_introduction"> <input type="text"
									name="mem_status" class="form-control" value="一般會員"
									name="mem_status">
							</div>


							<div class="checkbox mb-3">

								<input type="checkbox" value="remember-me" required> <a
									href="#"> <font color="red">同意會員申請條款</font>
								</a>
							</div>
							<input type="hidden" name="action" value="insert">
							<button class="btn btn-lg btn-primary btn-block" type="submit">申請會員</button>


						</form>


					</div>
				</div>
			</div>
		</div>
	</div>

	</form>
	</div>
	<button id="magicmem" onclick="magicmem()"
		class="btn btn-xs btn-primary" type="button">註冊東巴</button>
	<button class="btn btn-danger" type="button" id="magic"
		onclick="magic()">小傑登入</button>
	<button class="btn btn-danger" type="button" id="magic2"
		onclick="magic2()">東巴登入</button>
	</div>
	</div>
	</div>
	<!-- Kyle -->
	<!-- ============================================================================ -->
	<div class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true" id="search-hide">
		<div class="modal-dialog modal-lg" id="modal-custom">
			<div class="modal-content modal-content-custom">

				<div class="modal-header modal-header-custom">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h3 class="modal-title text-muted" id="myModalLabel"
						style="text-align: center;">請輸入關鍵字</h3>
				</div>

				<div class="modal-body modal-body-custom">
					<!-- =================================================================================== -->
					<form id="search-form" method="post"
						action="<%=request.getContextPath()%>/search/SearchServlet.do">
						<div class="form-group">
							<input type="text" class="form-control" name="search"
								placeholder="輸入點什麼吧..." id="search">
							<div class="search-select">
								<label for="result-type">搜尋類別:</label> <select size="1"
									name="result-type" class="form-control search-select"
									id="result-type">
									<option value="all">全部</option>
									<option value="exp">體驗</option>
									<option value="guide">指南</option>
								</select>
							</div>

							<div class="search-select">
								<label for="order-by">排序方式:</label> <select size="1"
									name="order-by" class="form-control search-select"
									id="order-by">
									<option value="rate">依評分</option>
									<option value="price">依價格</option>
									<option value="people">依已加入人數</option>
								</select> <select size="1" name="order-by-sec"
									class="form-control search-select" id="order-by-sec">
									<option value="h-l">由高到低</option>
									<option value="l-h">由低到高</option>
								</select>
							</div>

							<div class="search-select">
								<label>地區(非必選):</label>
								<div id="twzipcode"></div>
							</div>

						</div>
					</form>
					<!-- =================================================================================== -->
				</div>
				<div class="modal-footer modal-footer-custom">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-primary" id="search-commit"
						form="search-form">出發囉!</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ============================================================================ -->



</body>
<script>
	$('#twzipcode').twzipcode(
			{
				'zipcodeIntoDistrict' : true,
				'css' : [ 'search-select location-search',
						'search-select location-search' ]
			});

	$(function() {
		$(".search-box").on("click", function() {
			$("#search-hide").modal({
				show : true
			});
		})
	})
</script>

<script language="javascript">
	/*小傑神奇小按鈕*/
	function magic() {
		document.getElementById("account").value = "a948787";
		document.getElementById("password").value = "12345";
	}
</script>
<script language="javascript">
	/*東巴神奇小按鈕*/
	function magic2() {
		document.getElementById("account").value = "z87123";
		document.getElementById("password").value = "12345";
	}
</script>
<script language="javascript">
	/*註冊東巴*/
	function magicmem() {
		document.getElementById("acc").value = "z87123";
		document.getElementById("pw").value = "12345";
		document.getElementById("mem_name").value = "東巴";
		document.getElementById("mem_addr").value = "獵人村流星街123號";
		document.getElementById("mem_tel").value = "0969694222";
		document.getElementById("sex").value = "男";
		document.getElementById("mem_email").value = "don8@gmail.com";
	}
</script>


<script>
	/* 登入觸發 */
	$('#login-btn').click(function() {
		$.ajax({
			url : '/BA107G1/LoginServlet',
			type : 'POST',
			data : $('#loginForm').serialize(),
			dataType : 'json',
			success : function(msg) {
				console.log(msg);
				switch (msg.status[0]) {
				case 1:
					alert("成功登入");
					$('#loginModal').modal('hide')
					window.location.reload();
					break;
				case 2:
					alert("密碼錯誤");
					break;
				case 3:
					alert("無此帳號");
					break;
				}
			}
		})
	});
	/* 登出觸發 */
	$('#logout-btn').click(function() {
		$.get("/BA107G1/LoginServlet", {
			type : "logout"
		}).done(function(data) {
			var result = JSON.parse(data);
			console.log(result);
			console.log(result.status);

			if (result.status[0] === 'done') {
				window.location.reload();
			}
		});
	});
</script>
</html>