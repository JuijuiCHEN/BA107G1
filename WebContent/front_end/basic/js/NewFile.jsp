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
                        <input type="text" class="form-control" placeholder="�j�M���J�B����B�Φa��">
                    </div>
                    <button type="submit" class="btn btn-default">Go!</button>
                </form>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Hi! Amos</a></li>
                
                 <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">����<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                       <li><a href="<%=request.getContextPath()%>/front_end/exp/listAllExp.jsp">��m����</a></li>
                        <li><a href="<%=request.getContextPath()%>/front_end/exp/addExp.jsp">�|������</a></li>
                    </ul>
                </li>
                
                
                <li><a href="<%=request.getContextPath()%>/front_end/expOrderDetail/cartlist.jsp">�w�w<span class="badge">${cart.size()}</span></a></li>
                <li><a href="#">�T��</a></li>
                <li><a href="#">���s</a></li>
                <!-- �U�Կ�� -->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">�ӤH�]�w<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">�b���]�w</a></li>
                        <li><a href="#">��������</a></li>
                        <li><a href="#">�ȪA�䴩</a></li>
                        <li><a href="#">�n�X</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>