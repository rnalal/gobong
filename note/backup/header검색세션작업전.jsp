<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<c:set var="data_path1" value="${pageContext.request.contextPath }/resources" />
<!-- 김우주0719 -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	crossorigin="anonymous"></script>
<!-- //김우주0719 -->
<style>
li {
	line-height: 1.5;
}

span {
	float: right;
	color: gray;
}

span:hover {
	cursor: pointer;
}

.navbar { margin-top: 25px; font-size: 17px; font-weight: 600; }
</style>
<nav class="navbar" role="navigation" aria-label="main navigation">
	<div class="navbar-brand">
		<a class="navbar-item" href="${path1 }/"><img class="logo" src="${data_path1 }/img/logo.jpg" alt="Logo"></a>
	</div>
	<div id="navbarBasicExample" class="navbar-menu">
		<div class="navbar-start">
			<a class="navbar-item" href="${path1 }/board/boardlist">전체 게시글</a>
			<c:choose>
				<c:when test="${loginUser.userLogin == true }">
					<a class="navbar-item" href="${path1 }/board/friendboardlist">친구
						게시글</a>
					<a href="${path1 }/board/boardInsert" class="navbar-link">글쓰기</a>
				</c:when>
				<c:otherwise>
					<a class="navbar-item" onclick="goClick()">친구 게시글</a>
					<a class="navbar-link" onclick="goClick()">글쓰기</a>
				</c:otherwise>
			</c:choose>
			<div class="level-item" style="margin: 12px;">
			<!-- 0726김우주 id추가 -->
				<form action="${path1 }/user/searchUser" method="get" id="searchForm">
					<div class="field has-addons">
						<p class="control">
							<input id="searchText" name="id" class="input" type="text"
								onkeypress="if( event.keyCode == 13 ){gbSearch();return false}"
								placeholder="검색어를 입력해 주세요">
						</p>
						<p class="control">
							<button type="submit" class="button">Search</button>
							<!--  -->
						</p>
						<div id="hello"
							style="display: none; border: 1px #e1e1e1 solid; width: 284px; margin-top: 45px; padding: 5px 3px; border-top: white; position: fixed; background-color: #fff;">
							<div id="last" style="color: gray; text-align: center;">최근
								검색 기록</div>
							<ul id="searchList"
								style="list-style: none; margin-bottom: 0px; padding: 5px 3px;"></ul>
						</div>
					</div>
				</form>
			</div>
			<!-- 검색 -->
			<div class="navbar-end">
				<!-- 0718손승기 -->
				<!-- 로그인 전 -->
				<c:choose>
					<c:when test="${loginUser.userLogin == true }">
						<!-- 로그인 후 -->
						<div class="navbar-item has-dropdown is-hoverable">
							<a class="navbar-link">My Page</a>
							<div class="navbar-dropdown">
								<!-- 0724이재호 -->			
								<a class="navbar-item" href="${path1 }/user/myLikeList">😻♥</a>
								<a class="navbar-item" href="${path1 }/user/myReply ">내가 쓴 댓글</a>
								<!-- //0724 이재호 -->
								<!-- 0719 손승기 -->
								<a href="${path1 }/user/profile?id=${loginUser.id}"
									class="navbar-item"><img src="">프로필</a> <a
									href="${path1 }/user/logout" class="navbar-item">로그아웃</a>
								<!-- 0719 손승기 -->
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="navbar-item">
							<div class="buttons">
								<button type="button" class="button is-warning is-hovered"
									onclick="goClick()">
									<strong>Let's Gobong</strong>
								</button>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div><!-- navbar-end -->
		</div><!-- navbar-start -->
	</div><!-- navbarBasicExample -->
	<div id="bg" class="hidden"></div>
</nav>
<div id="popup" class="hidden">
	<h3>로그인 또는 회원가입 후 이용해 주세요!</h3>
	<div id="popup-text">
		<form action="${path1 }/user/loginPro" method="post" class="box">
			<div class="field">
				<label class="label" for="id">아이디</label>
				<div class="control">
					<input class="input" name="id" id="id" maxlength="15"
						placeholder="15글자 이내로 입력" />
				</div>
			</div>
			<div class="field">
				<label class="label" for="pw">비밀번호</label> <input class="input"
					type="password" name="pw" id="pw" maxlength="15"
					placeholder="********" required>
			</div>
			<div class="field">
				<input type="submit" value="로그인" class="button is-warning is-light" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<!-- 김우주0719 -->
				<!-- <a href="${path1 }/user/join" class="button is-success is-light" onclick="join()">회원가입</a> -->
				<input type="button" class="button is-success is-light" value="회원가입"
					onclick="joinbtn()" />
				<!-- 0723김우주 -->
				<script>
					function joinbtn() {
						const popupWidth = 700;
						const popupHeight = 628;
						const popupLeft = window.screen.width/2 - popupWidth/2;
						const popupTop = window.screen.height/2 - popupHeight/2;
						window.open('${path1 }/user/join', '회원가입',
								'width=700px,height=628px,scrollbars=no,location=no,left='+popupLeft+',top='+popupTop);
					}
				</script>
				<!-- //0723김우주 -->
				<!-- //김우주0719 -->
			</div>
		</form>
		<!-- 0718 손승기 -->
	</div>
	<button onclick="exit()" class="button">나가기</button>
</div>
<!-- 태정씨스크립트문 줄인것 -->
<script>
	function goClick() {
		$("#bg").removeClass("hidden");
		$("#popup").removeClass("hidden");
	}
	function exit() {
		$("#bg").addClass("hidden");
		$("#popup").addClass("hidden");
	}
</script>
<!--  -->
<script>
  const gbSearch = () => {
    
    if($searchText.value !== ''){
      let $newList = document.createElement('li');
      let $x = document.createElement('span');
      let $searchList = document.querySelector('#searchList');
      
      let $newSearch = document.createTextNode($searchText.value);
      let $xText = document.createTextNode('삭제');
      $newList.appendChild($newSearch);
      $x.appendChild($xText)
      $searchList.insertBefore($newList,$searchList.childNodes[0]);
      $searchList.insertBefore($x,$searchList.childNodes[0]);

      $searchText.value = '';

      let $span = document.querySelectorAll('span');
      let $items = document.querySelectorAll('li')
      $span[0].addEventListener('click',function(){
        this.parentNode.removeChild(this);
        $items[0].parentNode.removeChild($items[0]);
      })
    }
    
  }
  let $searchText = document.querySelector('#searchText');
  $searchText.addEventListener('click',function(){
    document.querySelector('#hello').style.display = 'block';
  })
 

	/* 0726김우주 */
	//검색폼(전송)
	//const searchForm = $("#searchForm");
	const searchForm = document.querySelector("#searchForm");
	//searchText 검색어 입력(input)
	//const searchText = $("#searchText");
	const searchText = document.querySelector("#searchText");
	//searchList 최근검색어 모여있는거
	//const searchList = $("#searchList");
	const searchList = document.querySelector("#searchList");
	// 검색어 키값
	const search_Key = "search_Keys";
	// 최근검색어 배열
	let searches = new Array();
	
	//검색기록 세션에 저장
	function save_Search(){
		typeof(Storage) !== sessionStorage.setItem(search_Key,JSON.stringify(searches)) && 'undefined';
	}
	
	// 폼 전송시 발생
	function transmit_form(e){
		e.preventDefault();//전송막는것 테스트때
		// input창 검색어 값
//		const newSearchesItem = searchText.val();
//		searchText.val("");
		const newSearchesItem = searchText.value;
		searchText.value = '';
		const newSearchesObj = {
				id : Date.now(),
				text : newSearchesItem
		};
		searches.push(newSearchesObj);
		save_Search();
	}
	
	// 다시받아서 뿌리기
	function recent_search(newrec){
		const {id,text} = newSearch;
		//태정씨 $newList 와 같은것
	  	const item = document.createElement('li');
		// 태정씨 $x 와 같은것
		const span = document.createElement('span');
		// 태정시 $xText와 같은것
	    const del_btn = document.createTextNode('삭제');
		item.id = id;
		span.innerText = text;
		
		item.appendChild(span);
		item.appendChild(del_btn);
		searchList.appendChild(item);
		
	  let $span = document.querySelectorAll('span');
	  let $items = document.querySelectorAll('li')
	  $span[0].addEventListener('click',function(){
	    this.parentNode.removeChild(this);
	    $items[0].parentNode.removeChild($items[0]);
	  })
	  
	
		
	}
	
	searchForm.addEventListener('submit',transmit_form);
	
	//저장된 세션값 갖고와서 세션값이 null이 아닐경우
	//그 리스트들 다시 뿌려주는거
	const saved_Search = JSON.parse(sessionStorage.getItem(search_Key));
	if(saved_Search!== null){ 
		searches = saved_Search;
	}



/* 0726김우주 */


</script>

<script>
$(window).scroll(function(){
	document.querySelector('#hello').style.display = 'none';
  });
</script>
<hr>