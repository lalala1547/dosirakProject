<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 강제 탈퇴</title>
</head>
<body>
<form action ="admin_member_forced_eviction" method="POST">
<br>
-회원 아이디- <input type = "text" name="user_id" placeholder="  탈퇴시킬 회원의 아이디를 입력하세요. "><br><br>
<button type = "submit" name = "submit"> 회원 강제 탈퇴</button>
</form>
</body>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
<script>
$(function(){
    var responseMessage = "<c:out value="${message}" />";
    if (responseMessage != ""){
        alert(responseMessage)
    }
})
</script>
</html>