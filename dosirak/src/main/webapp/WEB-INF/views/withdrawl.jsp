<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 탈퇴</title>
</head>
<body>
	<form role="form" method="POST" autocomplete="off">
		<div class="input_area">
			<label for="user_id">아이디</label> <input type="text" id="user_id"
				name="user_id" placeholder="아이디" required="required"
				value="${user.user_id}" />
		</div>
		<div class="input_area">
			<label for="user_pw">비밀번호</label> <input type="password" id="user_pw"
				name="user_pw" required="required" />
		</div>
		<button type="submit" id="withdrawl_btn" name="withdrawl_btn">회원탈퇴</button>
		<p>
			<a href="/">처음으로</a>
		</p>
	</form>

	<c:if test="${usg == false}">
		<p>입력한 비밀번호가 잘못되었습니다.</p>
	</c:if>

</body>
</html>