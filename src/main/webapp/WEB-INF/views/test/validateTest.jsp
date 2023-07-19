<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
	<table>
		<form:form modelAttribute="testUserDTO" action="validateTest_procedure" method="post">
			<tr>
				<td>
				<form:input path="id"/>
				<form:errors path="id" />
				</td>
			</tr>
			<tr>
				<td>
				<form:input path="pw"/>
				<form:errors path="pw" />
				</td>
			</tr>
			<tr>
				<td>
			<form:button> 전송 </form:button>
				</td>
			</tr>
		</form:form>
	</table>
</body>
</html>