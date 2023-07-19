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
	<h1>${serverDirectoryTest }</h1><br>
	
	<table>
		<form:form  action="serverDirectoryTest2_procedure" method="post" modelAttribute="testBoardDTO" enctype="multipart/form-data">
			<tr>
				<td>
				<form:input path="no"/>
				</td>
			</tr>
			<tr>
				<td>
				<form:input path="content"/>
				<form:errors path="content" />
				</td>
			</tr>
			<tr>
				<td>
				<form:input type="file" path="upload_img1" />
				<form:errors path="upload_img1" />
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