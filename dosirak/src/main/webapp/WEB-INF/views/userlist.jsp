<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 목록</title>
</head>
<body>
	<h2>회원 목록</h2>
	<table border="1" width="700px">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>닉네임</th>
			<th>성별</th>
			<th>이메일</th>
			<th>핸드폰번호</th>
		</tr>
		<c:forEach var="row" items="${list }">
			<tr>
				<td><a href="${path}/userspecificlist?user_id=${row.user_id }">${row.user_id}</a></td>
				<td>${row.user_pw}</td>
				<td>${row.user_name}</td>
				<td>${row.user_sex}</td>
				<td>${row.user_email}</td>
				<td>${row.user_phone}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>