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
				<h2>新增指南:</h2>
				會員編號: <input type="text" name="memId" value="M000001"><br>
				地區: <input type="text" name="guideArea"><br>
				地址: <input type="text" name="guideMap"><br>
				標題:<input type="text" name="guideTitle"><br>
				內容: <input type="text" name="guideContent"><br> 
				<input type="hidden" name="action" value="insert"><br>
				<input type="submit" value="送出">
				<h4>(資料格式驗證 by Controller ).</h4>
			</FORM>
		</li>

		<li>
			<FORM METHOD="post" ACTION="guide.do">
				<h2>刪除指南:</h2>
				<br> 指南編號: <input type="text" name="guideId"><br>
				<input type="hidden" name="action" value="delete"><br>
				<input type="submit" value="送出">
				<h4>(資料格式驗證 by Controller ).</h4>
			</FORM>
		</li>
		<br>
		<li>
			<FORM METHOD="post" ACTION="guide.do">
				<h2>修改指南:</h2>
				<br> 指南編號: <input type="text" name="guideId" value="G000011"><br>
				標題: <input type="text" name="guideTitle"><br> 內容: <input
					type="text" name="guideContent"><br> 狀態: <input
					type="text" name="guideStatus"><br> <input
					type="hidden" name="action" value="update"><br> <input
					type="submit" value="送出">
				<h4>(資料格式驗證 by Controller ).</h4>
			</FORM>
		</li>
		<br>
		<li>
			<FORM METHOD="post" ACTION="guide.do">
				<h2>輸入指南編號 (如G000001):</h2>
				<br> 指南編號:<input type="text" name="guideId" value="G000001">
				<input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
				<h4>(資料格式驗證 by Controller ).</h4>
			</FORM>
		</li>
		<h1>指南留言</h1>
		<br>
		<li>
			<FORM METHOD="post" ACTION="guideComm.do">
				<h2>新增指南留言:</h2>
				<br> 會員編號: <input type="text" name="memId" value="M000001"><br>
				指南編號: <input type="text" name="guideId" value="G000001"><br>
				內容: <input type="text" name="commContent"><br> <input
					type="hidden" name="action" value="insert"><br> <input
					type="submit" value="送出">
				<h4>(資料格式驗證 by Controller ).</h4>
			</FORM>
		</li>
		<br>
		<li>
			<FORM METHOD="post" ACTION="guideComm.do">
				<h2>修改指南留言:</h2>
				<br> 留言編號: <input type="text" name="commId" value="GC000018"><br>
				內容: <input type="text" name="commContent"><br> 狀態: <input
					type="text" name="commStatus"><br> <input
					type="hidden" name="action" value="update"><br> <input
					type="submit" value="送出">
				<h4>(資料格式驗證 by Controller ).</h4>
			</FORM>
		</li>
		<br>
		<li>
			<FORM METHOD="post" ACTION="guideComm.do">
				<h2>刪除指南留言:</h2>
				<br> 留言編號: <input type="text" name="commId" value="GC000018"><br>
				<input type="hidden" name="action" value="delete"><br>
				<input type="submit" value="送出">
				<h4>(資料格式驗證 by Controller ).</h4>
			</FORM>
		</li>
		<br>
		<li>
			<FORM METHOD="post" ACTION="guideComm.do">
				<h2>查詢指南留言:</h2>
				<br> 留言編號: <input type="text" name="commId" value="GC000001"><br>
				<input type="hidden" name="action" value="getOne_For_Display"><br>
				<input type="submit" value="送出">
				<h4>(資料格式驗證 by Controller ).</h4>
			</FORM>
		</li>
		<h1>指南檢舉</h1>
		<br>
		<li>
			<FORM METHOD="post" ACTION="guideRep.do">
				<h2>新增指南檢舉:</h2>
				<br> 指南編號: <input type="text" name="guideId" value="G000001"><br>
				會員編號: <input type="text" name="memId" value="M000001"><br>
				檢舉內容: <input type="text" name="guideRepContent"><br> <input
					type="hidden" name="action" value="insert"><br> <input
					type="submit" value="送出">
				<h4>(資料格式驗證 by Controller ).</h4>
			</FORM>
		</li>
		<br>
		<li>
			<FORM METHOD="post" ACTION="guideRep.do">
				<h2>修改指南檢舉:</h2>
				<br> 檢舉編號: <input type="text" name="guideRepId"
					value="GR000011"><br> 檢舉狀態: <input type="text"
					name="guideRepStatus"><br> <input type="hidden"
					name="action" value="update"><br> <input type="submit"
					value="送出">
				<h4>(資料格式驗證 by Controller ).</h4>
			</FORM>
		</li>
		<br>
		<li>
			<FORM METHOD="post" ACTION="guideRep.do">
				<h2>刪除指南檢舉:</h2>
				<br> 檢舉編號: <input type="text" name="guideRepId"
					value="GR000011"><br> <input type="hidden"
					name="action" value="delete"><br> <input type="submit"
					value="送出">
				<h4>(資料格式驗證 by Controller ).</h4>
			</FORM>
		</li>
		<br>
		<li>
			<FORM METHOD="post" ACTION="guideRep.do">
				<h2>查詢指南檢舉:</h2>
				<br> 檢舉編號: <input type="text" name="guideRepId"
					value="GR000001"><br> <input type="hidden"
					name="action" value="findByPrimaryKey"><br> <input
					type="submit" value="送出">
				<h4>(資料格式驗證 by Controller ).</h4>
			</FORM>
		</li>
		<br>
		<li>
			<h2>新增指南圖片:</h2> <br>
			<FORM METHOD="post" ACTION="guideImg.do"
				enctype="multipart/form-data">
				指南編號: <input type="text" name="guideId" value="G000001"><br>
				<input type="file" name="upfile1"> <input type="file"
					name="upfile2"> <input type="hidden" name="action"
					value="insert"><br> <input type="submit" value="送出">
			</FORM>
		</li>
		<br>
		<li>
			<FORM METHOD="post" ACTION="guideImg.do">
				<h2>刪除指南圖片:</h2>
				<br> 檢舉編號: <input type="text" name="guideImgId"
					value="GI000011"><br> <input type="hidden"
					name="action" value="delete"><br> <input type="submit"
					value="送出">
				<h4>(資料格式驗證 by Controller ).</h4>
			</FORM>
		</li>
		<br>
		<li>
			<h2>查詢指南圖片:</h2> <img
			src="<%=request.getContextPath()%>/guideImg.do?action=getOne_For_Display&guideImgId=GI000016">
		</li>
	</ul>
	
	

</body>
</html>