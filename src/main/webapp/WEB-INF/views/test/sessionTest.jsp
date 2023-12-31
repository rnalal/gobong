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
  <title>글 목록 보기</title>
	<link rel="stylesheet" href="${data_path }/css/main.css">
  <style>
  	.content .content1 { width: 750px;  white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
  	.card {margin-bottom:40px;}
  </style>	
</head>
<body>
<c:import url="/WEB-INF/views/header.jsp" />
	<h1> 쿠키값 테스트 </h1>
	<pre>
	현재 로그인시 쿠키로 받아와지는지 세션으로 받아와지는지
	명확하지가 않은거같아 테스트를 진행하게 되었습니다
	</pre>
	<h2>쿠키목록</h2>
	<c:forEach items="${cookieName }" var="cookieName">
		<h4>쿠키이름 : ${cookieName }</h4>
	</c:forEach>
	<c:forEach items="${cookieValue }" var="cookieValue">
		<h4>쿠키값 : ${cookieValue }</h4>
	</c:forEach>
	
	<h2>로그인한 세션아이디</h2>
	<h3>${sessionValue }</h3>
</body>
</html>