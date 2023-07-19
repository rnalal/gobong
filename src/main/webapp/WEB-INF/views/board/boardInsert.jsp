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
<title>Document</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${data_path }/css/main.css">
</head>
<body>
<c:import url="/WEB-INF/views/header.jsp" />
	<h2>글 쓰기 페이지</h2>
	<form:form action="boardInsertPro" modelAttribute="boardInsert"
		method="post" enctype="multipart/form-data">
<%-- 		<div class="form-group">
			<form:label path="no">번호</form:label>
			<form:input path="no" class="form-control" />
		</div> --%>
		<div class="form-group">
			<form:label path="id">아이디</form:label>
			<form:input path="id" class="form-control" />
		</div>
		<div class="form-group">
			<form:label path="content">내용</form:label>
			<form:input path="content" class="form-control" />
		</div>
		<div class="form-group">
			<form:label path="hashtag">해시태그</form:label>
			<form:input path="hashtag" />
		</div>

		<div class="form-group">
			<form:label path="upload_img1">이미지1</form:label>
			<form:input type="file" path="upload_img1" class="form-control"
				accept="image/*" />
		</div>
		<div class="form-group">
			<form:label path="upload_img2">이미지2</form:label>
			<form:input type="file" path="upload_img2" class="form-control"
				accept="image/*" />
		</div>
		<div class="form-group">
			<form:label path="upload_img3">이미지3</form:label>
			<form:input type="file" path="upload_img3" class="form-control"
				accept="image/*" />
		</div>

		<div class="form-group">
			<div class="text-right">
				<form:button>글 쓰기</form:button>
			</div>
		</div>
	</form:form>


</body>
</html>

