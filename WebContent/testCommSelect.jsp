<%@page import="com.guideComm.model.GuideCommVO"%>
<%@ page contentType="text/html; charset=Big5" pageEncoding="Big5"%>


<%
  GuideCommVO guideCommVO = (GuideCommVO) request.getAttribute("guideCommVO"); //GuideComm.java(Concroller),�s�Jreq��guideCommVO����
  System.out.println(guideCommVO.toString());
%>

<html>
<head>
</head>
<body>
<h3>��Ƭd��:</h3>

 <table>
	<tr>
		<th>�d���s��</th>
		<th>���n�s��</th>
		<th>�|���s��</th>
		<th>�d�����e</th>
		<th>�d���o�G�ɶ�</th>
		<th>�d�����A</th>
	</tr>
	
	<tr>
		<td>${guideCommVO.getCommId()}</td>
		<td>${guideCommVO.getGuideId()}</td>
		<td>${guideCommVO.getMemId()}</td>
		<td>${guideCommVO.getCommContent()}</td>
		<td>${guideCommVO.getGuideCommTime()}</td>
		<td>${guideCommVO.getCommStatus()}</td>
	</tr>

</table>
</body>
</html>