<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path1" value="${pageContext.request.contextPath }"/>
<c:set var="data_path" value="${pageContext.request.contextPath }/resources" />
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;400&family=Orbit&display=swap" rel="stylesheet">
<title>파일리더 테스트</title>
<link rel="stylesheet" href="${data_path }/css/main.css">
<style>
   .warap {
        width: 800px; 
        margin: 0 auto; 
   }
</style>
</head>
<body>
<c:import url="/WEB-INF/views/header.jsp" />
   <div class="warap">
      <h1 style="text-align: center; font-size: 30px;">글쓰기</h1>
      <br>
      <form:form class="box" action="boardInsertPro" modelAttribute="boardtest" method="post" enctype="multipart/form-data">
   <%--       <div class="field">
            <form:label path="no">번호</form:label>
            <form:input path="no" class="form-control" />
         </div> 
   --%>
         <div class="field">
            <form:label path="id">아이디</form:label>
            <form:input path="id" class="input" />
         </div>
         <br>
         <div class="field">
            <form:label path="content">내용</form:label>
            <br>
            <form:textarea path="content" class="input" style="width:800px; height:250px;" />
         </div>
         <br>
         <div class="field">
            <form:label path="hashtag">해시태그</form:label>
            <form:input path="hashtag" class="input" placeholder="#따봉 #쌍따봉 #고봉" />
         </div>
         <br>
         <div class="field">
            <form:label path="upload_img1">이미지1</form:label>
            <form:input type="file" path="upload_img1" class="file" accept="image/*" onchange="previewFile(this,'preview_img1')"/>
            <h5>파일미리보기</h5>
            <img src="" id="preview_img1">
         </div>
         <br>
         <div class="field">
            <form:label path="upload_img2">이미지2</form:label>
            <form:input type="file" path="upload_img2" class="file" accept="image/*" onchange="previewFile(this,'preview_img2')" />
            <h5>파일미리보기</h5>
            <img src="" id="preview_img2">
         </div>
         <br>
         <div class="field">
            <form:label path="upload_img3">이미지3</form:label>
            <form:input type="file" path="upload_img3" class="file" accept="image/*" onchange="previewFile(this,'preview_img3')" />
            <h5>파일미리보기</h5>
            <img src="" id="preview_img3">
         </div>
         <br>
         <div class="field">
            <div class="text-right">
               <form:button class="button is-info" >등록</form:button>&nbsp; &nbsp;
               <a href="javascript:history.go(-1)" class="button is-light">취소</a>
            </div>
         </div>
      </form:form>
   </div>
   <!-- 파일미리보기 스크립트 시작 -->
   <script>
   function previewFile(img,img_id){
	   if(img.files && img.files[0]){
		   const FILEREADER = new FileReader();
		   FILEREADER.onload = function(img_console){
			   $('#'+img_id).attr("src",img_console.target.result);
		   }
		   FILEREADER.readAsDataURL(img.files[0]);
	   }else{
		   $("#"+img_id).attr("src",);
	   }
   }
   </script>
   <!-- //파일미리보기 스크립트 종료-->
  <br>
  <footer class="footer">
    <div class="content has-text-centered">
      <p>
        <a href="test/home">테스트로 이동</a>
        <a href="http://opensource.org/licenses/mit-license.php">MIT</a>. The website content
        is licensed <a href="http://creativecommons.org/licenses/by-nc-sa/4.0/">CC BY NC SA 4.0</a>.
      </p>
    </div>
  </footer>
</body>
</html>