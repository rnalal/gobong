<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- 최상위경로 -->
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="data_path" value="${pageContext.request.contextPath }/resources" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;400&family=Orbit&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${data_path }/css/main.css">
<link rel="stylesheet" href="${data_path }/css/footer.css">
    <title>검색 결과</title>
<style>
.card {
	margin-bottom: 40px;
}
</style>
</head>
<body>
<c:import url="../header.jsp" />
<!-- 0724 박지현 -->
<div class="container">
<div class="card-wrap">
  <article class="media">
    <div class="media-left">
        <figure class="image is-128x128">
        <c:if test="${empty search[0].img }">
        <img id="profile_img" src="${data_path }/img/unknown.png" alt="profileImage" style="">
        </c:if>
        <c:if test="${!empty search[0].img }">
        <a href='${path }/user/profile?id=${search[0].id }'><img id="profile_img" src="${data_path }/upload/${search[0].img }" alt="profileImage" ></a>
        </c:if>
      </figure>
    </div>
    <div class="media-content">
      <div class="content">
        <p><strong>${search[0].name }</strong> <small>@${search[0].id }</small></p>
        <c:if test="${!empty search[0].name }">
          <pre style="background-color: white;">
여기에 자기소개 넣으면 좋을것같아요(user1 테이블에 자기소개컬럼추가하기?(나중에))
밑에는 자신이 작성한 게시글들 이미지 나오게하고(약간 인스타처럼 한 행에 3개or4개)
이미지 클릭하면 게시글 상세보기로 들어가게 하면 좋을듯.
          </pre>
        </c:if>
        <c:if test="${empty search[0].name }">
	        <pre style="background-color: white;">
검색과 일치하는 사용자가 없습니다
	          </pre>
        </c:if>
      </div>
      <div>
     	  <c:if test="${loginUser.id == userProfile[0].id }">
	      	<a href="${path }/user/mypage" class="button">정보 수정</a>
	      </c:if>
      </div>
    </div>
  </article>
    <div class="card-wrap" id="board_wrap" style="margin-top:20px;">
      <c:forEach var="board" items="${userProfile}">
      	<div class="card">
  			<div class="card-image">
    			<figure class="image is-4by3">
         			<a href="${path }/board/boarddetail?no=${board.no}"><img id="board_img" src="${data_path }/upload/${board.img1 }" alt="boardPreview"></a>
         		</figure>
         	</div>
         		<div class="card-content">
    				<div class="media">
     		 			<div class="media-left">
        					<figure class="image is-48x48">
        						<a href="${path }/board/boarddetail?no=${board.no}"><img id="user_img" src="${data_path }/upload/${userProfile[0].img }" alt="작성자사진"></a>
        					</figure>
        				</div>
        				<div class="media-content">
        					<p class="title is-4">${board.name}</p>
							<p class="subtitle is-6">${board.id}</p>
      					</div>
      				</div>     				
      			</div>
    		</div>
      </c:forEach>
	</div>
</div>
</div>
<c:import url="../footer.jsp" />
<!-- 0724 박지현 -->
</body>
</html>