<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<html>
<head>
<style>
h2 {
	color: blue;
}
</style>
</head>

<body>
	<ul>
		<li>
			<FORM METHOD="post" ACTION="guide.do">
				<h2>�s�W���n:</h2>
				�|���s��: <input type="text" name="memId" value="M000001"><br>
				�a��: <input type="text" name="guideArea"><br>
				�a�}: <input type="text" name="guideMap"><br>
				���D:<input type="text" name="guideTitle"><br>
				���e: <input type="text" name="guideContent"><br> 
				<input type="hidden" name="action" value="insert"><br>
				<input type="submit" value="�e�X">
				<h4>(��Ʈ榡���� by Controller ).</h4>
			</FORM>
		</li>

		<li>
			<FORM METHOD="post" ACTION="guide.do">
				<h2>�R�����n:</h2>
				<br> ���n�s��: <input type="text" name="guideId"><br>
				<input type="hidden" name="action" value="delete"><br>
				<input type="submit" value="�e�X">
				<h4>(��Ʈ榡���� by Controller ).</h4>
			</FORM>
		</li>
		<br>
		<li>
			<FORM METHOD="post" ACTION="guide.do">
				<h2>�ק���n:</h2>
				<br> ���n�s��: <input type="text" name="guideId" value="G000011"><br>
				���D: <input type="text" name="guideTitle"><br> ���e: <input
					type="text" name="guideContent"><br> ���A: <input
					type="text" name="guideStatus"><br> <input
					type="hidden" name="action" value="update"><br> <input
					type="submit" value="�e�X">
				<h4>(��Ʈ榡���� by Controller ).</h4>
			</FORM>
		</li>
		<br>
		<li>
			<FORM METHOD="post" ACTION="guide.do">
				<h2>��J���n�s�� (�pG000001):</h2>
				<br> ���n�s��:<input type="text" name="guideId" value="G000001">
				<input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="�e�X">
				<h4>(��Ʈ榡���� by Controller ).</h4>
			</FORM>
		</li>
		<h1>���n�d��</h1>
		<br>
		<li>
			<FORM METHOD="post" ACTION="guideComm.do">
				<h2>�s�W���n�d��:</h2>
				<br> �|���s��: <input type="text" name="memId" value="M000001"><br>
				���n�s��: <input type="text" name="guideId" value="G000001"><br>
				���e: <input type="text" name="commContent"><br> <input
					type="hidden" name="action" value="insert"><br> <input
					type="submit" value="�e�X">
				<h4>(��Ʈ榡���� by Controller ).</h4>
			</FORM>
		</li>
		<br>
		<li>
			<FORM METHOD="post" ACTION="guideComm.do">
				<h2>�ק���n�d��:</h2>
				<br> �d���s��: <input type="text" name="commId" value="GC000018"><br>
				���e: <input type="text" name="commContent"><br> ���A: <input
					type="text" name="commStatus"><br> <input
					type="hidden" name="action" value="update"><br> <input
					type="submit" value="�e�X">
				<h4>(��Ʈ榡���� by Controller ).</h4>
			</FORM>
		</li>
		<br>
		<li>
			<FORM METHOD="post" ACTION="guideComm.do">
				<h2>�R�����n�d��:</h2>
				<br> �d���s��: <input type="text" name="commId" value="GC000018"><br>
				<input type="hidden" name="action" value="delete"><br>
				<input type="submit" value="�e�X">
				<h4>(��Ʈ榡���� by Controller ).</h4>
			</FORM>
		</li>
		<br>
		<li>
			<FORM METHOD="post" ACTION="guideComm.do">
				<h2>�d�߫��n�d��:</h2>
				<br> �d���s��: <input type="text" name="commId" value="GC000001"><br>
				<input type="hidden" name="action" value="getOne_For_Display"><br>
				<input type="submit" value="�e�X">
				<h4>(��Ʈ榡���� by Controller ).</h4>
			</FORM>
		</li>
		<h1>���n���|</h1>
		<br>
		<li>
			<FORM METHOD="post" ACTION="guideRep.do">
				<h2>�s�W���n���|:</h2>
				<br> ���n�s��: <input type="text" name="guideId" value="G000001"><br>
				�|���s��: <input type="text" name="memId" value="M000001"><br>
				���|���e: <input type="text" name="guideRepContent"><br> <input
					type="hidden" name="action" value="insert"><br> <input
					type="submit" value="�e�X">
				<h4>(��Ʈ榡���� by Controller ).</h4>
			</FORM>
		</li>
		<br>
		<li>
			<FORM METHOD="post" ACTION="guideRep.do">
				<h2>�ק���n���|:</h2>
				<br> ���|�s��: <input type="text" name="guideRepId"
					value="GR000011"><br> ���|���A: <input type="text"
					name="guideRepStatus"><br> <input type="hidden"
					name="action" value="update"><br> <input type="submit"
					value="�e�X">
				<h4>(��Ʈ榡���� by Controller ).</h4>
			</FORM>
		</li>
		<br>
		<li>
			<FORM METHOD="post" ACTION="guideRep.do">
				<h2>�R�����n���|:</h2>
				<br> ���|�s��: <input type="text" name="guideRepId"
					value="GR000011"><br> <input type="hidden"
					name="action" value="delete"><br> <input type="submit"
					value="�e�X">
				<h4>(��Ʈ榡���� by Controller ).</h4>
			</FORM>
		</li>
		<br>
		<li>
			<FORM METHOD="post" ACTION="guideRep.do">
				<h2>�d�߫��n���|:</h2>
				<br> ���|�s��: <input type="text" name="guideRepId"
					value="GR000001"><br> <input type="hidden"
					name="action" value="findByPrimaryKey"><br> <input
					type="submit" value="�e�X">
				<h4>(��Ʈ榡���� by Controller ).</h4>
			</FORM>
		</li>
		<br>
		<li>
			<h2>�s�W���n�Ϥ�:</h2> <br>
			<FORM METHOD="post" ACTION="guideImg.do"
				enctype="multipart/form-data">
				���n�s��: <input type="text" name="guideId" value="G000001"><br>
				<input type="file" name="upfile1"> <input type="file"
					name="upfile2"> <input type="hidden" name="action"
					value="insert"><br> <input type="submit" value="�e�X">
			</FORM>
		</li>
		<br>
		<li>
			<FORM METHOD="post" ACTION="guideImg.do">
				<h2>�R�����n�Ϥ�:</h2>
				<br> ���|�s��: <input type="text" name="guideImgId"
					value="GI000011"><br> <input type="hidden"
					name="action" value="delete"><br> <input type="submit"
					value="�e�X">
				<h4>(��Ʈ榡���� by Controller ).</h4>
			</FORM>
		</li>
		<br>
		<li>
			<h2>�d�߫��n�Ϥ�:</h2> <img
			src="<%=request.getContextPath()%>/guideImg.do?action=getOne_For_Display&guideImgId=GI000016">
		</li>
	</ul>
	
	

</body>
</html>