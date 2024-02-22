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
<title>글 수정</title>
	<link rel="stylesheet" href="${data_path }/css/main.css">
	<link rel="stylesheet" href="${data_path }/css/footer.css">
<style>
 .title {color:black}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/header.jsp" />
<div class="container">
	<h2 style="text-align:center;">수정하기</h2>
	<div class="card-wrap" style="padding-top:40px;">
		<div class="card">
			<form:form action="${path1 }/board/boardEditPro" method="post" modelAttribute="boardDTO"  enctype="multipart/form-data">
				<input type="hidden" id="no" name="no" value="${boardDTO.no }" />
				<div class="card-content">
		          	<div class="media">
		            	<div class="media-left">
		              		<figure class="image is-48x48">	
		              			<img src="${data_path }/upload/${boardDTO.img }" alt="작성자사진">
		              		</figure>
		              	</div>
		              	<div class="media-content">
			              	<p class="title is-4">${boardDTO.name}</p>
			              	<p class="subtitle is-6">${boardDTO.id}</p>
		           		</div>
		           	</div>	
	           		<div class="content">
						<div class="field">
							<form:label path="content" value="${boardDTO.content }">내용</form:label>
							<form:textarea path="content" class="input"
					style="width:800px; height:250px;resize:none" />
						</div>
						<div class="field">
							<form:label path="hashtag" value="${boardDTO.hashtag }">해시태그</form:label>
							<form:input path="hashtag" class="input" placeholder="#따봉 #쌍따봉 #고봉" />
						</div>
					</div>
					<div class="field">
						<img src="${data_path }/upload/${boardDTO.img1 }" alt="글사진1">
						<input type="hidden" name="img1" value="${boardDTO.img1}">
						<form:label path="upload_img1" value="${boardDTO.img1}"></form:label>
						<form:input type="file" path="upload_img1" class="file" accept="image/*" />
					</div>
					<div class="field">
						<img src="${data_path }/upload/${boardDTO.img2 }" alt="글사진2">
						<input type="hidden" name="img2" value="${boardDTO.img2}">
						<form:label path="upload_img2" value="${boardDTO.img2}"></form:label>
						<form:input type="file" path="upload_img2" class="file" accept="image/*" />
					</div>
					<div class="field">
						<img src="${data_path }/upload/${boardDTO.img3 }" alt="글사진3">
						<input type="hidden" name="img3" value="${boardDTO.img3}">
						<form:label path="upload_img3" value="${boardDTO.img3}"></form:label>
						<form:input type="file" path="upload_img3" class="file"
							accept="image/*" />
					</div>	
					<div class="field">
						<div class="text-right">
							<form:button class="button is-primary">수정</form:button>
						</div>
					</div>
				</div>	
			</form:form>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/views/footer.jsp" />
</body>
</html>

