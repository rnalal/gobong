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
</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" />
	<div class="container">

		<div class="card-wrap">
			<h2 style="font-size: 2em; margin-bottom: 3%; text-align: center;">따봉 누른 게시글</h2>
			<div class="card-wrap" id="board_wrap">

				<c:forEach items="${myLikeList }" var="like">
					<a href="${path }/board/boarddetail?no=${like.no }"><img
						id="board_img" src="${data_path }/upload/${like.img1 }"
						alt="boardPreview"></a>
				</c:forEach>
			</div>
			<nav class="level is-mobile">
				<div class="level-left">
					<a class="level-item" aria-label="reply"> <span
						class="icon is-small"> <i class="fas fa-reply"
							aria-hidden="true"></i>
					</span>
					</a> <a class="level-item" aria-label="retweet"> <span
						class="icon is-small"> <i class="fas fa-retweet"
							aria-hidden="true"></i>
					</span>
					</a> <a class="level-item" aria-label="like"> <span
						class="icon is-small"> <i class="fas fa-heart"
							aria-hidden="true"></i>
					</span>
					</a>
				</div>
			</nav>
			<!-- 0720 손승기 게시글이미지 영역 -->
		</div>
	</div>
	<!-- 프로필처럼 나오게 해주세요  -->


	<h2>${like.id }</h2>
	<h2></h2>
	<h2>${like.content }</h2>
	<h2>${like.hashtag }</h2>
	<h2>${like.up }</h2>
	<h2>${like.regdate }</h2>
	<h2></h2>
	<h2>${like.img2 }</h2>
	<h2>${like.img3 }</h2>
	<h2>${like.prv }</h2>
	<br>
	<br>

	<c:import url="/WEB-INF/views/footer.jsp" />
</body>
</html>