<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- 최상위경로 -->
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="data_path" value="${pageContext.request.contextPath }/resources" />


<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	테스트페이지 입니다
</h1>

<P>  The time on the server is ${serverTime}. </P>
<br>
<h1>이미지 불러오기 테스트</h1>
<img src="${data_path }/img/logo.jpg" >
<img src="${data_path }/img/logo2.jpg" >
<br>
<h1>테스트</h1>
<a href="${path }/test/test?id=test1">아이디값 받아오기 (DB연동테스트)</a><br>
<a href="${path }/test/validateTest">발리데이트테스트</a><br>
<a href="${path }/test/serverDirectoryTest">서버리얼패스 테스트</a><br>
<a href="${path }/test/serverDirectoryTest2">서버리얼패스 사용해서 파일올리기 테스트</a><br>
<br>
<input type="button" value="버튼테스트" onclick="joinbtn()"/>
<script>
	function joinbtn(){
		alert('join회원가입 시작');
	}
	
</script>
<br>
<a href="${path }/test/sessionTest">세션테스트 - 로그인하고 진행하여야함</a><br>
<a href="${path }/test/fileReaderTest">파일업로드테스트 - 파일미리보기</a><br>

</body>
</html>
