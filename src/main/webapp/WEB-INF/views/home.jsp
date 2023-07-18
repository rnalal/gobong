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
<img src="${data_path }/img/logo.jpg" >
<img src="${data_path }/img/logo2.jpg" >
<a href="test?id=test1">아이디값 받아오기</a>
<br>
<a href="">메인페이지로</a>


</body>
</html>
