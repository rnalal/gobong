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
  <title>main</title>
</head>
<body>
<c:import url="/WEB-INF/views/header.jsp" />
  <div class="container">
    <div class="card-wrap">
      <div class="card">
        <div class="card-content">
          <div class="media">
            <div class="media-left">
              <figure class="image is-48x48">
                <img src="${data_path }/img/logo.jpg" alt="logo">
              </figure>
            </div>
            <div class="media-content">
              <p class="title is-4">프로젝트 개요</p>
              <p class="subtitle is-6">@admin</p>
            </div>
          </div>
          <div class="content">
          	<strong>프로젝트 이름: </strong>Gobong
          	<hr>
          	<strong>프로젝트 기간: </strong>2023.07.10 ~ 07.25
          	<hr>
          	<strong>프로젝트 참여: </strong>김우주, 박지현, 손승기, 이재호, 전재영, 조태정
          	<hr>
          	<strong>데이터 처리 패턴: </strong>MVC2 (View -> Controller > Model > Controller > View)
    		<hr>
          	<strong>IDE: </strong>STS-3.9.18.RELEASE
			<hr>
          	<strong>JAVA ver: </strong>11.0.18
			<hr>
          	<strong>JAVA script ver: </strong>1.0
			<hr>
          	<strong>Dynamic Web Module: </strong>4.0
			<hr>
          	<strong>Server: </strong>Apache Tomcat v9.0
			<hr>
          	<strong>DBMS: </strong>Oracle 11 xe
			<hr>
          	<strong>External Library: </strong>json, cos, commons, spring security
			<hr>
          	<strong>JAVA Script Plugin: </strong>JQuery
			<hr>
          	<strong>CSS FrameWork: </strong>bulma.io v0.9.4
			<hr>
          	<strong>JAVA Script API: </strong>추가 예정
			<hr>
            <p style="color: blue;"> #고봉 #프로젝트 개요 </p>
            <time datetime="2023-7-24">11:09 AM - 24 July 2023</time>
          </div>
        </div>
      </div>
      <br>
 
      <br>
      <div class="card">
        <div class="card-content">
          <div class="media">
            <div class="media-left">
              <figure class="image is-48x48">
                <img src="${data_path }/img/logo.jpg" alt="logo">
              </figure>
	            </div>
	            <div class="media-content">
	              <p class="title is-4">프로젝트 설계</p>
	              <p class="subtitle is-6">@admin</p>
	            </div>
	          </div>
	         <h2 style="font-size:20px;">◆ 테이블설계도</h2>
	         <figure class="image is-4by3">
	         	<img class="obfit" src="${data_path }/img/Table1.png" alt="글사진">
			</figure>
	        <h2 style="font-size:20px;">◆ 논리적ERD</h2>
       		<figure class="image is-4by3">
				<img class="obfit" src="${data_path }/img/Lerd1.png" alt="글사진">
			</figure>
			<h2 style="font-size:20px;">◆ 물리적ERD</h2>
       		<figure class="image is-4by3">
				<img class="obfit" src="${data_path }/img/Perd1.png" alt="글사진">
			</figure>
			<h2 style="font-size:20px;">◆ 프로젝트구성도</h2>
       		<figure class="image is-4by3">
				<img class="obfit" src="${data_path }/img/pro.png" alt="글사진">
			</figure>
          	<hr>
            <p style="color: blue;"> #고봉 #설계 #논리적 #물리적 #클래스 #구성 </p>
            <time datetime="2023-7-24">11:09 AM - 24 July 2023</time>
          </div>
        </div>
      <br>
    </div> <!-- card-wrap -->
  </div> <!-- container -->
<c:import url="/WEB-INF/views/footer.jsp" />
</body>
</html>