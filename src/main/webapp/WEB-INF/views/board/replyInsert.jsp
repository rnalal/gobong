<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<c:set var="data_path"
   value="${pageContext.request.contextPath }/resources" />
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;400&family=Orbit&display=swap"
   rel="stylesheet">
<title>댓글 작성</title>
	<link rel="stylesheet" href="${data_path }/css/main.css">
	<link rel="stylesheet" href="${data_path }/css/footer.css">
<style>
.warap {
   width: 800px;
   margin: 0 auto;
}
</style>
</head>
<body>
   <div class="warap">
      <h1 style="text-align: center; font-size: 30px;">댓글 작성</h1>
      <br>
      <form:form class="box" action="replyInsertPro"
         modelAttribute="replyDto" method="post"
         enctype="multipart/form-data">
         <div class="field">
         	<input type="hidden" name="no" value="${no }">
         	<!-- 0724김우주 여기있던 세줄 삭제 -->
            <form:input type="hidden" path="id" class="input" value="${loginUser.id }"/>
         </div>
         <br>
         <div class="field">
            <form:label path="comment1">내용</form:label>
            <br>
            <form:textarea path="comment1" class="input"
               style="width:800px; height:250px;" />
         </div>
         <br>
         <div class="field">
            <div class="text-right">
               <form:button class="button is-info">등록</form:button>
               &nbsp; &nbsp; <a href="javascript:history.go(-1)" class="button is-light">취소</a>
            </div>
         </div>
      </form:form>
   </div>
   <br>
</body>
</html>