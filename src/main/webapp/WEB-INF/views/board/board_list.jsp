<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- 최상위경로 -->
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="data_path" value="${pageContext.request.contextPath }/resources" />
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
	<title>글 목록 보기</title>
	<link rel="stylesheet" href="${data_path }/css/main.css">
	<link rel="stylesheet" href="${data_path }/css/footer.css">
<style>
.content .content1 {
	width: 750px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.card {
	margin-bottom: 40px;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" />
	<div class="container">
		<c:forEach items="${boardList}" var="boardDTO" varStatus="cnt">
			<div class="card-wrap">
				<div class="card">
					<div class="card-image">
						<figure class="image is-4by3">
							<a href="${path }/board/boarddetail?no=${boardDTO.no}">
								<img class="obfit" src="${data_path }/upload/${boardDTO.img1 }" alt="글사진">
							</a>
						</figure>
					</div>
					<div class="card-content">
						<div class="media" style="margin-bottom: 1px;">
							<div class="media-left">
								<figure class="image is-48x48">
									<a href="${path }/user/profile?id=${boardDTO.id}"><img src="${data_path }/upload/${boardDTO.img }" alt="작성자 사진"></a>
<%-- 								<img src="${data_path }${boardDTO.img }" alt="작성자사진"> 
											user1 테이블에서 사용자 이미지 가져오기

--%>
								</figure>
							</div>
							<div class="media-content">
								<p class="title is-4">${boardDTO.name}</p>
								<p class="subtitle is-6">${boardDTO.id}</p>
								<span style="margin-top: -80px;">
									<c:if test="${boardDTO.id==loginUser.id}">
								<!-- 0724박지현 -->
								<a href="${path }/board/boardEdit?no=${boardDTO.no}" class="button is-success is-light">수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<!-- 0724박지현 -->
                  						<a href="${path }/board/boardDel?no=${boardDTO.no}" class="button is-danger is-light">삭제</a>
									</c:if>
								</span>
							</div>
						</div>
						<div class="content">
						<!-- 0725김우주 -->
							<p class="content1" style="white-space: pre-wrap;">${boardDTO.content }</p>
							<!-- 0725김우주 -->
							<p style="color: blue;">${boardDTO.hashtag }</p>
							<time>${boardDTO.regdate }</time>
						</div>

						<!-- 김우주0719 -->
						<div class="field" style="padding-bottom:60px; margin-top: -15px;">
						<div style="padding-top:5px; margin-right: 10px; float: left;">
								<!-- 0723전재영 -->
								<!-- 0725김우주 -->
									<c:choose>
										<c:when test="${loginUser.userLogin == true }">
												<img src="${data_path}/img/reply.png" style="cursor : pointer" onclick="goReplyPage(${boardDTO.no})">
										</c:when>
										<c:otherwise>
												<input type="image" src="${data_path}/img/reply.png" onclick="goClick()"/>			
										</c:otherwise>
									</c:choose>	
									<strong> ${boardDTO.reply_cnt }</strong>
								<!-- 0725김우주 -->
								<!-- 0723전재영 -->
							<!-- 0720김우주 -->
							</div>
							<div style="float: left;">
									<c:choose>
										<c:when test="${loginUser.userLogin == true }">
												<input type="image" src="${data_path}/img/heart.png" onclick="like_check(${boardDTO.up },${boardDTO.no },'${loginUser.id }',${cnt.count })" />
										</c:when>
										<c:otherwise>
												<input type="image" src="${data_path}/img/heart.png" onclick="goClick()"/>			
										</c:otherwise>
									</c:choose>	
							    <strong class="reload_like${cnt.count }" >${boardDTO.up }</strong>
								<c:if test="${boardDTO.up > 0 }">
								<p id="like_result${cnt.count }" style="margin-left: -55px; margin-top: 3px;">이 글을 좋아하는 사람 </p>
									<script>
					          			$.ajax({
					          				type:"get",
					          				dataType : "json",
					          				url:"${path}/like/likeList.do",
											encType:"UTF-8",
					          				data: {no:${boardDTO.no}},
					          				success : function(likeList){
					          					for(var i=0 in likeList){
					                                $("#like_result${cnt.count }").append("<a id='like_a"+${cnt.count}+"_"+likeList[i].id+"'href='${path}/user/profile?id="+likeList[i].id+"'>"+likeList[i].id+'님'+"</a>"+"  ");
					                            }
					          				},
					          				error : function(){
					          					alert(${boardDTO.no}+"에러");
					          				}
					          			});
		          				</script>
								</c:if>
								<c:if test="${boardDTO.up == 0 }">
								<p id="like_result${cnt.count }" style="margin-left: -55px; margin-top: 3px;">  </p>
								</c:if>
							</div>
						</div>
						<!-- //김우주0721 -->
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- 0725김우주 -->
	<script>
	function goReplyPage(no){
		const popupWidth = 830;
		const popupHeight = 510;
		const popupLeft = window.screen.width/2 - popupWidth/2;
		const popupTop = window.screen.height/2 - popupHeight/2;
		window.open("${path }/board/replyInsert?no="+no, '댓글쓰기',
				'width=830px,height=520px,scrollbars=no,location=no,left='+popupLeft+',top='+popupTop);
	}
	</script>
	<!-- 0725김우주 -->
	<!-- 김우주0722 -->
	<script>
	          	function like_check(like,no,id,cnt){
	          		let chk_sw;
	          		$.ajax({
	          			type:"get",
	          			url:"${path}/like/likeCheck.do",
	          			dataType:"json",
	          			encType:"UTF-8",
	          			async:false,
	          			data:{no:no , id:id},
	          			success : function(likeCheck){
	          				chk_sw=likeCheck;
	          			},
	          			error : function(){
	          				alert("like_check 에러");
	          				
	          			}
	          		});

		          	if(chk_sw === 0){
 	 	          		$.ajax({
	 						type:"get",
							url:"${path}/like/upLike.do",
							dataType:"json",
							encType:"UTF-8",
							data: {no:no},
							//async: false
							complete:function(){
								if(like===0){
									$("#like_result"+cnt).append("이 글을 좋아하는 사람 <a href='${path}/user/profile?id="+id+"' id='like_a"+cnt+"_"+id+"'>"+id+"님 </a>"+"  ");
										
								}else{
								$("#like_result"+cnt).append("<a href='${path}/user/profile?id="+id+"' id='like_a"+cnt+"_"+id+"'>"+id+"님 </a>"+"  ");
								}
								$('.reload_like'+cnt).load(location.href+' .reload_like'+cnt);
							}
		          		}); 
 	 	          		alert("좋아요를 눌렀습니다");
		          	}else{
		          		if(confirm('좋아요를 취소하시겠습니까')){
		          			$.ajax({
		          				type:"get",
		          				url:"${path}/like/disLike.do",
		          				async:false,
		          				data:{no:no,id:id},
		          				complete:function(){
		          					if(like===0){
		          						$("#like_result"+cnt).text(" ");
		          					}
		          					$("#like_a"+cnt+"_"+id).remove();
		          					
		          					$('.reload_like'+cnt).load(location.href+' .reload_like'+cnt);
		          				}
		          			});
		          			alert('취소하였습니다.');
		          			//좋아요취소
		          		}
		          	}
	          	}
	          </script>
	     <!-- //김우주0722 -->
<c:import url="/WEB-INF/views/footer.jsp" />
</body>
</html>