<%@page import="com.guideRep.model.GuideRepVO"%>
<%@ page contentType="text/html; charset=Big5"%>

<%
  GuideRepVO guideRepVO = (GuideRepVO) request.getAttribute("guideRepVO"); //GuideSelect.java(Concroller), �s�Jreq��guideVO����
  System.out.println(guideRepVO.toString());
%>

<html>
<head>
</head>
<body>
<h3>��Ƭd��:</h3>

 <table>
	<tr>
		<th>���|���n�s��</th>
		<th>���n�s��</th>
		<th>�|���s��</th>
		<th>���|���n�ɶ�</th>
		<th>���|���n���e</th>
		<th>���|���n���A</th>
	</tr>
	
	<tr>
		<td>${guideRepVO.getGuideRepId()}</td>
		<td>${guideRepVO.getGuideId()}</td>
		<td>${guideRepVO.getMemId()}</td>
		<td>${guideRepVO.getGuideRepDate()}</td>
		<td>${guideRepVO.getGuideRepContent()}</td>
		<td>${guideRepVO.getGuideRepStatus()}</td>

	</tr>

</table>
</body>
</html>