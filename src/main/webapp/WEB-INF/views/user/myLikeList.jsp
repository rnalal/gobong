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
<title>내가 누른 좋아요</title>
<link rel="stylesheet" href="${data_path }/css/profile.css">
<link rel="stylesheet" href="${data_path }/css/main.css">
<link rel="stylesheet" href="${data_path }/css/footer.css">
</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" />
<div class="container">
		<div class="card-wrap">
			<h2 style="width:700px; text-align:center; margin-bottom:30px;"><input type="image" src="${data_path}/img/heart.png" style="width:70px;" /></h2>	
			<div class="columns is-gapless">
	     		<div class="column" style="background-color: #fcf9d8; " >
					<div class="board_wrap" id="board_wrap" >
						<c:forEach items="${myLikeList }" var="like">
							<div class="proimg" style="width:700px; margin-top:20px; margin-left:40px; ">
								<a href="${path }/board/boarddetail?no=${like.no }">
									<img id="board_img" src="${data_path }/upload/${like.img1 }" alt="boardPreview" style="margin-right:10px; margin-bottom:10px;">
								</a>
							</div>		
						</c:forEach>
					</div>
				</div>		
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
			<!-- 게시글이미지 영역 -->
		</div>
	</div>	


<%-- 	<h2>${like.id }</h2>
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
	<br> --%>

	<c:import url="/WEB-INF/views/footer.jsp" />
</body>
</html>