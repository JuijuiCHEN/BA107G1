<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.guideImg.model.*"%>

<%
	GuideImgVO guideImgVO = (GuideImgVO) request.getAttribute("guideImgVO");
%>


<html>

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>新增指南圖片 - addGuideImg.jsp</title>
</head>
<body bgcolor='white'>
	<h3>新增指南圖片:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<form method="post"
		action="<%=request.getContextPath()%>/guideImg.do"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td>指南編號:</td>
				<td><input type="text" name="guideId" size="45"
					value="<%=(guideImgVO == null) ? "G000001" : guideImgVO.getGuideId()%>" /></td>
			</tr>
		</table>
		<input accept="image/jpeg,image/gif,image/png" name="upload[]" type="file" multiple id="file-input"> 
		 <div id="preview"></div>
<!-- 		<input type="file" name="upfile"><br>  -->
		<input type="hidden" name="action" value="insert"><br> 
		<input type="submit" value="送出">
	</form>
</body>

<script>
function previewImages() {

  var preview = document.querySelector('#preview');
  preview.innerHTML="";
  if (this.files) {
	  console.log(this.files);
    [].forEach.call(this.files, readAndPreview);
  }



function readAndPreview(file) {

    // Make sure `file.name` matches our extensions criteria
    if (!/\.(jpe?g|png|gif)$/i.test(file.name)) {
      return alert(file.name + " is not an image");
    } // else...
    
    var reader = new FileReader();
//      alert(URL.createObjectURL(file));
    reader.addEventListener("load", function() {
      var image = new Image();
      image.height = 100;
      image.title  = file.name;
      image.src    = this.result;
      preview.appendChild(image);
//       var x = document.createElement("INPUT");
//       x.setAttribute("type", "file");
//       x.setAttribute("name", "123213"+image.title);
//       x.setAttribute("value", URL.createObjectURL(file));
//       x.setAttribute("style", "display:none");
//       preview.appendChild(x);
    }, false);
    
    reader.readAsDataURL(file);
    
  }

}

document.querySelector('#file-input').addEventListener("change", previewImages, false);

  </script>


</html>