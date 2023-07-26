<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path1" value="${pageContext.request.contextPath }" />
<c:set var="data_path1" value="${pageContext.request.contextPath }/resources"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;400&family=Orbit&display=swap" rel="stylesheet">
  <title>회원가입</title>
	<link rel="stylesheet" href="${data_path }/css/main.css">
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous" ></script>
	<!-- 0723김우주 -->
	<style>
	.er {display:none}
	</style>
	<!-- 0723김우주 -->
</head>
<body>
<!-- 0723김우주 -->
<script>
	$(function(){
		let id_errors = document.getElementById('id.errors');
		let name_errors = document.getElementById('name.errors'),
 			pw_errors = document.getElementById('pw.errors'),
 			email_errors = document.getElementById('email.errors');
			//tel_errors = document.getElementById('tel.errors').innerText;
 		if(id_errors!=null){
			$("#id").attr("placeholder",id_errors.innerText);
			if($("#id").val()!=null){
				$("#id").val("");
			}
		}
		if(name_errors!=null){
			$("#name").attr("placeholder",name_errors.innerText);
			if($("#name").val()!=null){
				$("#name").val("");
			}
		}
 		if(pw_errors!=null){
			$("#pw").attr("placeholder",pw_errors.innerText);
		}
		if(email_errors!=null){
			$("#email").attr("placeholder",email_errors.innerText);
			if($("#email").val()!=null){
				$("#email").val("");
			}
		}

	});
</script>
<!-- 0723김우주 -->
<div class="container" >
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					<form:form action="${path1 }/user/join_procedure" method="post" modelAttribute="joinUserDto" class="box" >
					<%-- <form:hidden path="userIdExist" /> --%>
						<div class="field">
							<form:label path="id" class="label">아이디</form:label>
							<!-- 0723김우주 -->
							<div class="input-group">
								<input name="id" id="id" class="input"/>
								<div class="input-group-append">
									<button type="button" id="idChkBtn" class="button is-warning is-light" onclick="duplicationCheckId()">중복확인</button>
								</div>
								<form:errors path="id" class="er"/>
							</div>
							<!-- //0723김우주 -->
							
						</div>
						<div class="field">
							<form:label path="name" class="label">이름</form:label>
							<form:input path="name" class="input" placeholder="한글 2-6 글자"/>
							<form:errors path="name" class="er" />
						</div>
						<div class="field">
							<form:label path="pw" class="label">비밀번호</form:label>
							<form:password path="pw" class="input" />
							<form:errors path="pw" class="er" />
						</div>
						<div class="field">
							<form:label path="pw2" class="label">비밀번호 확인</form:label>
							<form:password path="pw2" class="input"/>
							<form:errors path="pw2" class="er"/>
						</div>
						<div class="field">
							<form:label path="email" class="label">이메일</form:label>
							<form:input path="email" class="input"/>
							<form:errors path="email" class="er"/>
						</div>
						<div class="field">
							<form:label path="tel" class="label">전화번호</form:label>
							<form:input path="tel" class="input"/>
							<form:errors path="tel" class="er"/>
						</div>
						<div class="field">
							<div class="text-right">
								<form:button class="button is-primary is-light">회원가입</form:button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
	<!-- 0723김우주 -->
	<script>
	function duplicationCheckId(){
		if($("#id").val().length>3){
			let idCheck = 1;
			$.ajax({
				encType:"UTF-8",
				dataType:"json",
				url:"${path1}/user/duplicationCheckId.do",
				data:{id:$("#id").val()},
				async:false,
				success: function(result){
					idCheck = result;
				},
				error : function(){
					alert("중복체크 에러")
				}
			});
			if(idCheck>0){
				alert("이미 있는 아이디 입니다");
			}else{
				if(confirm('사용가능한 아이디입니다 사용하시겠습니까')){
					//예
					/* 0724김우주 */
					$("#id").attr("readonly",true);
					$("#idChkBtn").attr("style","display:none;");
					$("#id").attr("style","background-color:#f5f5f5;");
					/* 0724김우주 */
				}else{
					//아니오
				}
			}
		}else if($("#id").val().length>0){
			alert('아이디는 4~20글자 사이로 입력해주셔야 합니다');
		}else{
			alert('아이디를 입력해주시기 바랍니다');
		}
	}
	
	</script>
	<!-- 0723김우주 -->

</div>
</body>
</html>