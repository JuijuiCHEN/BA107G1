<%@ page contentType="text/html; charset=Big5"%>
<%@page import="com.guide.model.GuideVO"%>
<%@page import="com.guideImg.model.GuideImgVO"%>
<%@ page import="java.util.*"%>
<%
  GuideVO guideVO = (GuideVO) request.getAttribute("guideVO"); //GuideSelect.java(Concroller), �s�Jreq��guideVO����
  System.out.println(guideVO.toString());
  List<GuideImgVO> imgList = guideVO.getGuideImgList();
%>
<html>
<head>
</head>
<body>
<h3>��Ƭd��:</h3>

 <table>
	<tr>
		<th>���n�s��</th>
		<th>�|���s��</th>
		<th>���n���D</th>
		<th>���n���e</th>
		<th>���n�a��</th>
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
		<td>${guideVO.getGuideCreateTime()}</td>
		<td>${guideVO.getGuideReadSize()}</td>
		<td>${guideVO.getGuideCommSize()}</td>
		<td>${guideVO.getGuideVoteSize()}</td>
		<td>${guideVO.getGuideStatus()}</td>
	</tr>
	<tr>
		<%for(int i = 0 ; i < imgList.size(); i++){%>
			<img src="<%=request.getContextPath()%>/guideImg.do?action=findByPrimaryKey&guideImgId=<%= imgList.get(i).getGuideImgId()%>">
		<% }%>
	</tr>

</table>
</body>
</html>