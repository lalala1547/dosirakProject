<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>도시락 프로젝트</title>
     <link rel="stylesheet" href="${path}/resources/css/loginbar.css">
    <link rel="stylesheet" href="/https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link href="${path}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${path}/resources/vendor/boxicons/css/boxicons.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${path}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${path}/resources/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="${path}/resources/js/main.js"></script>
</head>
<body>
    <header>
    
	<button type="button" class="nav-toggle"><i class="bx bx-menu"></i></button>
      <div id="sidebar-wrapper">
        <div class="sidebar-heading" style="background-color: #263663; padding: 0.875rem 1.25rem;
        font-size: 1.3rem; color:#C1C8D9; text-align: right;">도시락 프로젝트 </div>
     	 <nav class="nav-menu">
			  <ul>
			    <li class="active"><a href="#header">${user.user_name}님, 로그인 되셨습니다.</a></li>
			
			    
			    <li class="drop-down"><a href="#sikdan">식단 관리</a>
			      <ul>
			        <li><a href="/diet/">일간 식단</a></li>
			        <li><a href="weakly.html">주간 식단</a></li>
			        <li ><a href="monthlyEdit">월간 식단</a></li>
			      </ul>
			    </li>
			    <li><a href="/board/list">게시판</a></li>
			    <li><a href="#aboutus">소개</a></li>
			    <li><a href="/logout">로그아웃</a></li>
			    <li><a href="/modify">회원정보 수정</a></li>
				<c:if test="${user.user_grade==1}">
					<li><a href="admin">관리자</a></li>
				</c:if>
			  </ul>
			</nav>
			</div>
			
	
	</header>
      
      <!--                          메뉴 바             -->
      <script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
      <script src="${path}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
      <script src="${path}/resourcesvendor/jquery.easing/jquery.easing.min.js"></script>
      <br><br>
	<div class="text-center">
	<h3>회원정보 수정</h3>
	<br><br>
<form role="form" method="POST" autocomplete="off">
		<div class="input_area">
				<label for="user_id">아이디</label> <input type="text" id="user_id"
					name="user_id" placeholder="아이디" required="required" value="${user.user_id}"
					style=" border: 0.0625em solid #C1C8D9;"/>
			</div>
			<div class="input_area">
				<label for="user_pw">비밀번호</label> <input type="text"
					id="user_pw" name="user_pw" style=" border: 0.0625em solid #C1C8D9;"
					required="required" />
			</div>
			<div class="input_area">
				<label for="user_name">닉네임</label> <input type="text" id="user_name"
					name="user_name" style=" border: 0.0625em solid #C1C8D9;" required="required" />
			</div>
			<div class="input_area">
				<label for="user_email">이메일</label> <input type="email"
					id="user_email" name="user_email" placeholder="example@email.com" 
					style=" border: 0.0625em solid #C1C8D9;"
					required="required" />
			</div>
			<div class="input_area">
				<label for="user_phone">연락처</label> <input type="text"
					id="user_phone" name="user_phone" style=" border: 0.0625em solid #C1C8D9;"
					required="required" />
			</div>
			<div class="input_area">
				<label for="user_calory">칼로리</label> <input type="text"
					id="user_calory" name="user_calory" style=" border: 0.0625em solid #C1C8D9;"
					required="required" />
			</div>
<br><br>
			<button type="submit" id="modify_btn" name="modify_btn"
			style="background-color:#36518f; color:#E4E8F0; border: none;">회원정보 수정</button>
			<br><br>
			<p><a href="/">처음으로</a></p>
			<br><br>
		</form>
	</div>
		<footer class="py-3" style=" background-color:#263663; color:#C1C8D9">
     <div class="container">
       <p class="text-center" > &copy; 도시락 프로젝트 2020</p>
     </div>
   
   </footer>
</body>
</html>