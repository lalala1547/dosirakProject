<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���</title>
</head>
<body>
	<h2>ȸ�� ���</h2>
	<table border="1" width="700px">
		<tr>
			<th>���̵�</th>
			<th>��й�ȣ</th>
			<th>�г���</th>
			<th>����</th>
			<th>�̸���</th>
			<th>�ڵ�����ȣ</th>
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