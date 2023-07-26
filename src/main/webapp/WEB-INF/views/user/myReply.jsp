<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- 최상위경로 -->
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="data_path"
	value="${pageContext.request.contextPath }/resources" />
<!DOCTYPE html>
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
<title>좋아요 목록 보기</title>
<link rel="stylesheet" href="${data_path }/css/profile.css">
<link rel="stylesheet" href="${data_path }/css/main.css">
<link rel="stylesheet" href="${data_path }/css/footer.css">
<style>
.card {
	width: 800px;
	margin: 0 auto;
	margin-bottom: 10px
}

.comment1 {
	white-space: pre-wrap;
	background-color:white;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" />
	<!-- 내 리플을 갖고오고 그 리플을 눌렀을때 리플에 대한 글을 불러오기 -->
	<!-- 0726김우주 -->
	<div class="container">
		<c:forEach items="${myReply }" var="mr">
			<div class="card">
				<div class="card-content">
					<div class="content">
						<pre class="comment1">${mr.comment1 }</pre>
					</div>
				</div>
				<footer class="card-footer">
					<a href="${path }/board/boarddetail?no=${mr.no}"	class="card-footer-item">해당 글 가기</a>
				</footer>


			</div>
		</c:forEach>
	</div>



	<!-- 0726김우주 -->

	<!-- 0725이재호 -->
	<%-- 	<c:forEach	items="${myReply }" var="mr">
		<h2>번호:${mr.no }</h2>
		<h2>아이디:${mr.id }</h2>
		<h2>댓글내용:${mr.content }</h2>
		<h2>해시태그:${mr.hashtag }</h2>
		<h2>좋아요 수:${mr.up }</h2>
		<h2>등록일:${mr.regdate }</h2>
		<h2>이미지1:${mr.img1 }</h2>
		<h2>이미지2:${mr.img2 }</h2>
		<h2>이미지3:${mr.img3 }</h2>
		<h2>공개여부:${mr.prv }</h2><br><br>
	</c:forEach> --%>
	<!-- 0725이재호 -->
	<c:import url="/WEB-INF/views/footer.jsp" />
</body>
</html>