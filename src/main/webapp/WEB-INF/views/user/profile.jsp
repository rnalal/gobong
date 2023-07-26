<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- 최상위경로 -->
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="data_path" value="${pageContext.request.contextPath }/resources" />
<c:set var="id" value="${loginUser.id }" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;400&family=Orbit&display=swap" rel="stylesheet">
    <title>Document</title>
	<link rel="stylesheet" href="${data_path }/css/profile.css">
	<link rel="stylesheet" href="${data_path }/css/main.css">
	<link rel="stylesheet" href="${data_path }/css/footer.css">
</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" />
<div class="container">
	<div class="card-wrap">
	  <article class="media">
	    <div class="media-left">
	      <figure class="image is-128x128">
	        <img id="profile_img" src="${data_path }/upload/${search[0].img }" alt="profileImage" style="border-radius:50%;">
	      </figure>
	    </div>
	    <div class="media-content">
	      <div class="content">
	        <p id="my_introduce">
	          <strong>${search[0].name }</strong> <small>@${search[0].id }</small><br> <!-- <small>31m</small> -->
	          자기소개자기소개자기소개자기소개자기소개자기소개자기소개자기소개자기소개자기소개자기소개자기소개자기소개자기소개자기소개자기소개자기소개자기소개자기소개자기소개자기소개자기소개자기소개자기소개자기소개자기소개
	        </p>
	        
	      </div>
	      <!-- 0721 손승기 -->
	      <div>
	      <c:if test="${loginUser.id == search[0].id }">
	      	<a href="${path }/user/mypage" class="button">정보 수정</a>
	      </c:if>
	      <!-- href="${path }/follows/followingList?id=${userProfile[0].id}" -->
	      <!-- href="${path }/follows/followerList?id=${userProfile[0].id}" -->
	      	<a class="followCtn" onclick="followingList()"><strong>팔로잉</strong>&nbsp;<strong>${followingCnt }</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      	<a class="followCtn" onclick="followerList()"><strong>팔로워</strong>&nbsp;<strong>${followerCnt }</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      	<c:if test="${loginUser.userLogin == true && loginUser.id != search[0].id }">
	      		<c:if test="${fn:contains(followerList ,id) == false }">
	      			<a href="${path }/follows/doFollow?followingId=${search[0].id}&name=${search[0].name}" class="doFollow"><strong>팔로우 하기 | </strong></a>
	      		</c:if>
	      		<c:if test="${fn:contains(followerList, id)}">
	      			<a href="${path }/follows/unFollow?followingId=${search[0].id}&name=${search[0].name}" class="doFollow"><strong>팔로우 취소 | </strong></a>
	      		</c:if>
	      	</c:if>
	      </div>
	      <!-- 0721 손승기 -->
	    </div>
	  </article>
	      <!-- 0720 손승기 게시글이미지 영역 -->
		<div class="card-wrap" id="board_wrap">
			<c:forEach var="board" items="${userProfile}">
				<a href="${path }/board/boarddetail?no=${board.no}"><img id="board_img" src="${data_path }/upload/${board.img1 }" alt="boardPreview"></a>
			</c:forEach>		
		</div>
		<!-- 0720 손승기 게시글이미지 영역 -->
	      <nav class="level is-mobile">
	        <div class="level-left">
	          <a class="level-item" aria-label="reply">
	            <span class="icon is-small">
	              <i class="fas fa-reply" aria-hidden="true"></i>
	            </span>
	          </a>
	          <a class="level-item" aria-label="retweet">
	            <span class="icon is-small">
	              <i class="fas fa-retweet" aria-hidden="true"></i>
	            </span>
	          </a>
	          <a class="level-item" aria-label="like">
	            <span class="icon is-small">
	              <i class="fas fa-heart" aria-hidden="true"></i>
	            </span>
	          </a>
	        </div>
	      </nav>
	</div>
	
	
	
</div>

	<div id="followingListPopup" style="display:none;">
		<strong>${search[0].name }님의 팔로잉 목록</strong>
			<div id="follow-text">
				<c:forEach var="following" items="${followingList }">
				<a href="${path }/user/profile?id=${following.following_id}"><h3>${following.following_id }</h3></a>
				</c:forEach>
			</div>
		<!-- <button onclick="listExit()" class="button">나가기</button> -->
	</div>
	
	<div id="followerListPopup" style="display:none;">
		<strong>${search[0].name }님의 팔로워 목록</strong>
			<div id="follow-text">
				<c:forEach var="follower" items="${followerList }">
				<a href="${path }/user/profile?id=${follower.id}"><h3>${follower.id }</h3></a>
				</c:forEach>
			</div>
		<!-- <button onclick="listExit()" class="button">나가기</button> -->
	</div>
<c:import url="/WEB-INF/views/footer.jsp" />

<script>
	function followingList() {
		$("#followingListPopup").css("display", "block");
		if($("#followingListPopup").css("display") == "block") {	//팔로잉 목록창 열려있을때 팔로우 목록창을 누르면 
			$("#followerListPopup").css("display", "none");			//팔로잉 목록창은 꺼지고 팔로우 목록창이 열림
		}
	}
	function followerList() {
		$("#followerListPopup").css("display", "block");
		console.log($("#followerListPopup").css("display"));
		if($("#followerListPopup").css("display") == "block") {
			$("#followingListPopup").css("display", "none");
		}
	}
	/* function listExit() {
		$("#followingListPopup").css("display", "none");
		$("#followerListPopup").css("display", "none");
	} */
	
	$(document).mouseup(function(e){		// 팔로잉, 팔로우 목록창이 열려있을때 외부영역을 아무곳이나 클릭하면 목록창이 닫힘
	    if($("#followerListPopup").has(e.target).length === 0 || $("#followingListPopup").has(e.target).length === 0) {
			$("#followerListPopup").hide();
			$("#followingListPopup").hide();
	    }
	});

</script>
	
</body>
</html>