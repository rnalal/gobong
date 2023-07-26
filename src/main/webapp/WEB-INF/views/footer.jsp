<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path2" value="${pageContext.request.contextPath }" />
<c:set var="data_path2"
	value="${pageContext.request.contextPath }/resources" />

<footer class="footer">
	<div style="height: 180px; width: 1000px; margin: 0 auto; background-color: #fff;">
		<div class="fix_area">
			<a href="#" class="cir_box totop atag"
				style="text-align: center; margin-top: -10px;">↑</a>
		</div>
		<nav class="level" id="level1"
			style="background-color: #ffdc7d; height: 50px;">
			<p class="level-item has-text-centered">
				<a class="link is-info atag" href="${path2 }/test/home">테스트 이동</a>
			</p>
			<p class="level-item has-text-centered">
				<a class="link is-info atag" href="#">개인정보 처리방침</a>
			</p>
			<p class="level-item has-text-centered">
				<a class="link is-info atag" href="#">저작권 정책</a>
			</p>
		</nav>
		<nav class="level" id="level2">
			<p class="level-item has-text-centered">Copyright (C) 2023 김우주,
				박지현, 손승기, 이재호, 전재영, 조태정.All rights reserved.</p>
		</nav>
	</div>
</footer>