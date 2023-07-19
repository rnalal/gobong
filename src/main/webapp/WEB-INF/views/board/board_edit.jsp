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
<div class="container">
	<h2 style="text-align:center;">수정하기</h2>
	<div class="card-wrap" style="padding-top:40px;">
		<div class="card">
			<form:form action="boardEditPro?no=${boardDTO.no}" modelAttribute="boardDTO" method="post" enctype="multipart/form-data">
				<input type="hidden" id="no" name="no" value="${boardDTO.no }" />
				<div class="card-content">
		          	<div class="media">
		            	<div class="media-left">
		              		<figure class="image is-48x48">	
		              			<img src="${data_path }/img/${boardDTO.img }" alt="작성자사진">
		              		</figure>
		              	</div>
		              	<div class="media-content">
			              	<p class="title is-4">${boardDTO.name}</p>
			              	<p class="subtitle is-6">${boardDTO.id}</p>
		           		</div>
		           	</div>	
	           		<div class="content">		
						<div class="form-group">
							<form:label path="content" value="${boardDTO.content }">내용</form:label>
							<form:input path="content" class="form-control" />
						</div>
						<div class="form-group">
							<form:label path="hashtag" value="${boardDTO.hashtag }">해시태그</form:label>
							<form:input path="hashtag" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<img src="${data_path }/upload/${boardDTO.img1 }" alt="글사진1">
						<form:label path="upload_img1" value="${boardDTO.img1}"></form:label>
						<form:input type="file" path="upload_img1" class="form-control" accept="image/*" />
					</div>
					<div class="form-group">
						<img src="${data_path }/upload/${boardDTO.img2 }" alt="글사진2">
						<form:label path="upload_img2" value="${boardDTO.img2}"></form:label>
						<form:input type="file" path="upload_img2" class="form-control" accept="image/*" />
					</div>
					<div class="form-group">
						<img src="${data_path }/upload/${boardDTO.img3 }" alt="글사진3">
						<form:label path="upload_img3" value="${boardDTO.img3}"></form:label>
						<form:input type="file" path="upload_img3" class="form-control"
							accept="image/*" />
					</div>	
					<div class="form-group">
						<div class="text-right">
							<form:button>수정</form:button>
						</div>
					</div>
				</div>	
			</form:form>
		</div>
	</div>
</div>
<footer class="footer">
 <div class="content has-text-centered">
   <p>
     <strong>Bulma</strong> by <a href="https://jgthms.com">Jeremy Thomas</a>. The source code is licensed
     <a href="http://opensource.org/licenses/mit-license.php">MIT</a>. The website content
     is licensed <a href="http://creativecommons.org/licenses/by-nc-sa/4.0/">CC BY NC SA 4.0</a>.
   </p>
 </div>
</footer>
</body>
</html>

