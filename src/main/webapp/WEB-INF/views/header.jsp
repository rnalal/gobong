<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path1" value="${pageContext.request.contextPath }"/>
<c:set var="data_path1" value="${pageContext.request.contextPath }/resources"/>
    <nav class="navbar" role="navigation" aria-label="main navigation">
      <div class="navbar-brand">
        <a class="navbar-item" href="${path1 }/"><img class="logo" src="${data_path1 }/img/logo.jpg" alt="Logo"></a>
      </div>
      <div id="navbarBasicExample" class="navbar-menu">
        <div class="navbar-start">
          <a class="navbar-item" href="fd_content">친구 게시글</a>
          <a class="navbar-item" href="${path1 }/boardlist">전체 게시글</a>
          <a class="navbar-item" href="all_content">글쓰기</a>
<!--      글쓰기 화면에서 공개 여부 설정할 거면 삭제해도 되는 부분
		  <div class="navbar-item has-dropdown is-hoverable">
            <a class="navbar-link">글쓰기</a>
            <div class="navbar-dropdown">
              <a class="navbar-item" href="all_add">전체 공개</a>
              <a class="navbar-item" href="fd_add">친구 공개</a>
              <hr class="navbar-divider">
              <a class="navbar-item" href="me_add">나만 보기</a>
            </div>
          </div> 
-->
          <div class="level-item" style="margin: 15px;">
            <div class="field has-addons">
              <p class="control">
                <input class="input" type="text" placeholder="검색어를 입력해 주세요">
              </p>
              <p class="control">
                <button class="button">
                  Search
                </button>
              </p>
            </div>
          </div>
        </div>
      </div>
	  <div class="navbar-end">
		<div class="navbar-item"><!-- 일단 기본 -->
		  <div class="buttons">
		    <a class="button is-warning is-hovered" id="go">
		      <strong>Let's Gobong !</strong>
		    </a></div>
		</div>
		<c:if test=""><!-- 로그인 전 -->
			<div class="navbar-item">
			  <div class="buttons">
			    <a class="button is-warning is-hovered" id="go">
			      <strong>Let's Gobong !</strong>
			    </a></div>
			</div>
		</c:if>
		<c:if test=""><!-- 로그인 후 -->
	        <div class="navbar-item has-dropdown is-hoverable">
	          <a class="navbar-link">My Page</a>
	          <div class="navbar-dropdown">
	            <a class="navbar-item" href="like_list">좋아요 ♥</a>
	            <a class="navbar-item" href="user_mod">정보수정</a>
	            <a class="navbar-item" href="logout">로그아웃</a>
	          </div>
	         </div>    
      	 </c:if>
	   </div> <!-- navbar-end -->
      <div id="bg" class="hidden"></div>
    </nav>
    <div id="popup" class="hidden">
      <h3>로그인 또는 회원가입 후 이용해 주세요!</h3>
      <div id="popup-text">
        <form action="#" method="post" class="box">
          <div class="field">
            <label class="label" for="id">아이디</label>
            <div class="control">
              <input class="input" type="text" name="id" id="id" maxlength="15" placeholder="15글자 이내로 입력" required autofocus>
            </div>
          </div>
          <div class="field">
            <label class="label" for="pw">비밀번호</label>
            <input class="input" type="password" name="pw" id="pw" maxlength="15" placeholder="********" required>
          </div>
          <div class="field">
          <input type="submit" value="로그인" class="button is-warning is-light"/>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="join.html" class="button is-success is-light">회원가입</a>	 
          </div>	
        </form>
      </div>
      <button id="exit" class="button">나가기</button>
    </div>
    <script>
        const go = document.querySelector("#go");
        const bg = document.querySelector("#bg");
        const popup = document.querySelector("#popup");
        const exit = document.querySelector("#exit");

        go.addEventListener("click",function(){
            bg.classList.remove("hidden");
            popup.classList.remove("hidden");
        });
        exit.addEventListener("click",function(){
            bg.classList.add("hidden");
            popup.classList.add("hidden");
        });
    </script>