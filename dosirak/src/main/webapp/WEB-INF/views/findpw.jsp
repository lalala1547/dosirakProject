<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>도시락 프로젝트</title>
 <link rel="stylesheet" href="css/loginbar.css">
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
			    <li class="active"><a href="#header">로그인 해주세요.</a></li>
			
			    
			    <li class="drop-down"><a href="#sikdan">식단 관리</a>
			      <ul>
			        <li><a href="/diet/">일간 식단</a></li>
			        <li><a href="weakly.html">주간 식단</a></li>
			        <li ><a href="monthlyEdit">월간 식단</a></li>
			      </ul>
			    </li>
			    <li><a href="/board/list">게시판</a></li>
			    <li><a href="#aboutus">소개</a></li>
			    <li><a href="/login">로그인</a></li>
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

	<div id="container" style="text-align: center;" >
	
			<section id="content" >
			<form role="form" method="POST">
				<h3>아이디와 이메일을 입력하세요.</h3>

				<div class="input_area">
					<label for="user_id">아이디</label> <input type="text" id="user_id"
						name="user_id" required="required" 
						style=" border: 0.0625em solid #C1C8D9;"/> 
						<label for="user_email"></label>
				</div>
				
				<div class="input_area"> <label for="user_email"> 이메일 </label>
					<input type="email" id="user_email" name="user_email"
						required="required" style=" border: 0.0625em solid #C1C8D9;"/>
				</div>
<br><br>
				<div>
					<button type="button" class="emailBtn" id="emailBtn"
						name="emailBtn" style="background-color:#36518f; color:#E4E8F0; border: none;">
						이메일 발송</button>
				</div>

				<c:if test="${usg == false}">
					<p style="color: #f00;">로그인에 실패했습니다.</p>
				</c:if>
				
				</form>
			</section>
			     </div>
			<script type="text/javascript">
				$(".emailBtn").click(function() {
			var query = {
				user_id : $("#user_id").val(),
				user_email : $("#user_email").val()
			};

			$.ajax({
				url : "/findpw",
				type : "post",
				data : query,
				success : function(data) {

					if (data == 1) {
						alert("임시 비밀번호 발급 완료")
						
					}
					else {
						alert("가입내역이 존재하지 않습니다.")
					}
			} // ajax 끝
		});
	});
				</script>
				 <footer class="py-3" style=" background-color:#263663; color:#C1C8D9">
     <div class="container">
       <p class="text-center" > &copy; 도시락 프로젝트 2020</p>
     </div>

   
   </footer>
</body>
</html>