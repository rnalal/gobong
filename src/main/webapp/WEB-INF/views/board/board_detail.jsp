<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>글 상세 보기</title>
<link rel="stylesheet" href="${data_path }/css/main.css">
<link rel="stylesheet" href="${data_path }/css/footer.css">
<style>
/* 스타일부분 수정 */
.pj_wrap {
	width: 100%;
	height: 600px;
	margin: 1px auto;
	padding: 0;
	position: relative;
	overflow: hidden;
}

.img_wrap {
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
	display: flex;
}

.img {
	width: 100%;
	height: 100%;
	font-size: 30px;
	display: flex;
	justify-content: center;
	align-items: center;
	box-sizing: border-box;
}

.arrow {
	font-size: 60px;
	font-weight: 900;
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	cursor: pointer;
}

.left_arrow {
	left: 0;
}

.right_arrow {
	right: 0;
}

.imgsize {
	width: 100%;
}
</style>

</head>
<body>
	<c:import url="/WEB-INF/views/header.jsp" />
	<div class="container">
		<div class="card-wrap">
			<div class="card">		
					<div class="media" >
							<div class="media-left">
								<figure class="image is-48x48">
									<a href="${path }/user/profile?id=${boardDTO.id}"><img src="${data_path }/upload/${boardDTO.img }" alt="작성자사진"></a>
								</figure>
							</div>
							<div class="media-content">
								<p class="title is-4">${boardDTO.name}</p>
								<p class="subtitle is-6">${boardDTO.id}</p>
							</div>
					</div>			
				<div class="card-image">
					<!-- 이미지 슬라이드 -->
					<div class="pj_wrap">
						<div class="img_wrap">
							<figure class="image is-4by3 imgsize">
								<input type="hidden" name="no" value="${boardDTO.no }" />
								<c:set var="img_cnt" value="0" />
								<div class="img">
									<img src="${data_path }/upload/${boardDTO.img1 }"
										width="800px;" height="600px;" alt="글사진1" style="left: 0px">
								</div>
								<c:if test="${!empty boardDTO.img2 }">
									<div class="img">
										<c:set var="img_cnt" value="1" />
										<img src="${data_path }/upload/${boardDTO.img2 }"
											width="800px;" height="600px;" alt="글사진2" style="left: 800px">
									</div>
								</c:if>
								<c:if test="${!empty boardDTO.img3 }">
									<c:set var="img_cnt" value="2" />
									<div class="img">
										<img src="${data_path }/upload/${boardDTO.img3 }"
											width="800px;" height="600px;" alt="글사진3 "
											style="left: 1600px">
									</div>
								</c:if>
							</figure>
						</div>
						<c:if test="${!empty boardDTO.img2 }">
							<div class="arrow left_arrow">&lt;</div>
							<div class="arrow right_arrow">&gt;</div>
						</c:if>

					</div>
					<!-- // 이미지 슬라이드 -->
				</div>
				<div class="card-content">


					<div class="content">
						<p class="content1">${boardDTO.content }</p>
						<p>${boardDTO.hashtag }</p>
											</div>
					<div class="field" style="padding-bottom:60px; margin-top: -15px;">
					<div class="content1">					
		
					<div style="float: left;">
									<c:choose>
										<c:when test="${loginUser.userLogin == true }">
												<input type="image" src="${data_path}/img/heart.png" onclick="like_check(${boardDTO.up },${boardDTO.no },'${loginUser.id }')" />
										</c:when>
										<c:otherwise>
												<input type="image" src="${data_path}/img/heart.png" onclick="goClick()"/>			
										</c:otherwise>
									</c:choose>	
							    <strong class="reload_like$" >${boardDTO.up }</strong>
								<c:if test="${boardDTO.up > 0 }">
								<p id="like_result" style="margin-top: 3px;">이 글을 좋아하는 사람 </p>
									<script>
					          			$.ajax({
					          				type:"get",
					          				dataType : "json",
					          				url:"${path}/like/likeList.do",
											encType:"UTF-8",
					          				data: {no:${boardDTO.no}},
					          				success : function(likeList){
					          					for(var i=0 in likeList){
					                                $("#like_result").append("<a id='like_a"+"_"+likeList[i].id+"'href='${path}/user/profile?id="+likeList[i].id+"'>"+likeList[i].id+"님</a>"+"  ");
					                            }
					          				},
					          				error : function(){
					          					alert(${boardDTO.no}+"에러");
					          				}
					          			});
		          				</script>
								</c:if>
								<c:if test="${boardDTO.up == 0 }">
								<p id="like_result">  </p>
								</c:if>
							</div>
							</div>
																				
								<div class="card-body">
									<c:choose>
										<c:when test="${loginUser.userLogin == true }">	
										<textarea id="reply-content" class="form-control" rows="1"
											placeholder="댓글을 입력하세요"
											style="width: 100%; height: 135px; resize: none; font-size: 1.3em; border: 1px solid rgba(0, 0, 0, 0.1); padding: 10px"></textarea>								
										<input type="button" class="button is-warning is-light" 
											onclick="replyInsert(${boardDTO.no },'${loginUser.id }')" 
											style="float: right" value="댓글등록">		
										</c:when>
									</c:choose>																		
								</div>
					</div>
					<div style="align: center;">
						<c:if test="${boardDTO.id==loginUser.id}">
							<a href="${path }/board/boardEdit?no=${boardDTO.no}"
								class="button is-success is-light">수정</a>
							<a href="${path }/board/boardDel?no=${boardDTO.no}"
								class="button is-danger is-light">삭제</a>
						</c:if>
						
							<a href="${path }/board/boardlist" class="button is-link is-light">목록</a><br>
							<div class="content" style="float:right;">
								<time datetime="2016-1-1">${boardDTO.regdate }</time>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		function replyInsert(no,id){
				let replyContent = $("#reply-content").val();	
				if(replyContent.length>=167){
					alert("최대글자수를 초과합니다 (현재글자수 :"+replyContent.length+") 166자 이하여야 합니다");
				}else{
				 	$.ajax({
						type: "POST",
			          url: "${path}/board/replyInsert.do",
			          data: {no:no,id:id,comment1:replyContent},
			          encType: "UTF-8",
			          success: function(){
			          	alert("댓글을 등록했습니다");
			          	$("#reply-content").val("");
			          	$(".container1").load(location.href+' .container1');
			          },
			          error :function (result){
			          	alert("댓글쓰기 실패");
			          }
			      	});
				}
		
		  }
	</script>

	<div class="container1" style="padding-top: 40px;">
		<c:forEach items="${replyList}" var="replyDTO" varStatus="cnt">
			<div class="card-wrap">
				<div class="card">
					<div class="card-content">
						<div class="media">
							<div class="media-left">
								<figure class="image is-48x48">
									<a href="${path }/user/profile?id=${replyDTO.id}"><img src="${data_path }/upload/${replyDTO.img }" alt="작성자사진"></a>
								</figure>
							</div>
							<div class="media-content">
								<p class="title is-4" style="font-size: 20px;">${replyDTO.id}</p>
							</div>
						</div>
						<div class="content">
							<p class="content1">${replyDTO.comment1 }</p>
						</div>
						<div>
							<c:if
								test="${boardDTO.id==loginUser.id || replyDTO.id==loginUser.id}">
								<a
									href="${path }/board/replyDel?rno=${replyDTO.rno}&no=${boardDTO.no}"
									class="button is-danger is-light">댓글삭제</a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<!-- 이미지 슬라이드 -->
	<script>
      $(document).ready(function(){
          // 오른쪽 화살표를 클릭하면 img_wrap이 left기준으로
          // -800px 만큼 이동
          var num = 0;
          function img_move(){
              $(".img_wrap").stop().animate({
                  left: -num * 800
              });
          }
          $(".right_arrow").click(function(){
              num++;
              if(num > ${img_cnt}){
                  num = 0;
              }   
              img_move();
          }); 
          $(".left_arrow").click(function(){
              num--;
              if(num < 0){
                  num = ${img_cnt};
              }   
              img_move();
            });
          });//end
  </script>
	<!-- // 이미지 슬라이드 -->
	<script>
	          	function like_check(like,no,id){
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
								$("#like_result").append("<a href='${path}/user/profile?id="+id+"' id='like_a"+"_"+id+"'>"+id+"님 </a>"+"  ");
								$('.reload_like').load(location.href+' .reload_like');
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
		          					$("#like_a"+"_"+id).remove();
		          					$('.reload_like').load(location.href+' .reload_like');
		          				}
		          			});
		          			alert('취소하였습니다.');
		          			//좋아요취소
		          		}
		          	}
	          	}
	          </script>
	<c:import url="/WEB-INF/views/footer.jsp" />
</body>
</html>