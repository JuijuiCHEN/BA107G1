 	<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
 	<link href="<%=request.getContextPath()%>/front_end/css/nav.css" rel="stylesheet">
<%-- <%@ page import="java.util.* , com.expOrderDetail.model.*"%> --%>

 <nav class="navbar navbar-inverse navbar-fixed-top navbar-custom">
        <div class="container-fluid">
            <div class="navbar-header ">
                <img class="navbar-brand navbar-brand-custom" src="<%=request.getContextPath()%>/front_end/pages/images/LogoSmall2.png" id="nav-logo">
                <a class="navbar-brand " href="<%=request.getContextPath()%>/front_end/Exp_select_page.jsp">Anti-Gravity</a>
                <form class="navbar-form navbar-left navbar-form-custom" action="/action_page.php">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="搜尋民宿、體驗、或地區">
                    </div>
                    <button type="submit" class="btn btn-default">Go!</button>
                </form>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Hi! Amos</a></li>
                
                 <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">體驗<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                       <li><a href="<%=request.getContextPath()%>/front_end/exp/listAllExp.jsp">精彩體驗</a></li>
                        <li><a href="<%=request.getContextPath()%>/front_end/exp/addExp.jsp">舉辦體驗</a></li>
                    </ul>
                </li>
                
                
                <li><a href="<%=request.getContextPath()%>/front_end/expOrderDetail/cartlist.jsp">預定<span class="badge">${cart.size()}</span></a></li>
                <li><a href="#">訊息</a></li>
                <li><a href="#">社群</a></li>
                <!-- 下拉選單 -->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">個人設定<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">帳號設定</a></li>
                        <li><a href="#">身分切換</a></li>
                        <li><a href="#">客服支援</a></li>
                        <li><a href="#">登出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>