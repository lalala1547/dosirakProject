<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
		
		
      <script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
      <script src="${path}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
      <script src="${path}/resources/vendor/jquery.easing/jquery.easing.min.js"></script>
	
	        
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
        <script src="//cdn.ckeditor.com/4.12.1/full/ckeditor.js"></script>
        <script type="text/javascript">

 
 </script>
</head>

   
    <body>

    <header>
    
	  <button type="button" class="nav-toggle"><i class="bx bx-menu"></i></button>
      <div id="sidebar-wrapper">
        <div class="sidebar-heading" style="background-color: #263663; padding: 0.875rem 1.25rem;
        font-size: 1.3rem; color:#C1C8D9; text-align: right;">도시락 프로젝트 </div>
		<nav class="nav-menu">
		  <ul>
		    <li class="active"><a href="#header">로그인해주세요.</a></li>
		
		    
		    <li class="drop-down"><a href="#sikdan">식단 관리</a>
		      <ul>
		        <li><a href="/diet/">일간 식단</a></li>
		        <li><a href="weakly.html">주간 식단</a></li>
		        <li ><a href="/diet/monthlyEdit">월간 식단</a></li>
		      </ul>
		    </li>
		    <li><a href="/board/list">게시판</a></li>
		    <li><a href="#aboutus">소개</a></li>
		    <li><a href="login">로그인</a></li>
		    <li><a href="modify">회원정보 수정</a></li>
			<c:if test="${user.user_grade==1}">
				<li><a href="admin">관리자</a></li>
			</c:if>
		  </ul>
		</nav>
		</div>

</header>


<br><br><br><br><br>
        <div id="container">
            <div class="col-xs-8 text-center">
               <section id="content">
                  <form role="form" method="post" autocomplete="off">
                     <div class="input_area" >
                        <label for="user_id">아이디</label> 
                        <input type="text" id="user_id"
                           name="user_id" required="required" 
                           style=" border: 0.0625em solid #C1C8D9"/> 
                     </div>
      
                     <div class="input_area">
                        <label for="user_pw">패스워드</label> 
                        <input type="password"
                           id="user_pw" name="user_pw" required="required"
                           style=" border: 0.0625em solid #C1C8D9"/>
                     </div>
                     <br><br>
                     <button id="signin_btn" type="submit" name="signin_btn"
                     class="btn" style="background-color:#36518f; color:#E4E8F0">
                     로그인</button>         
           
                  </form>
               </section>
            </div>
        </div>
            
      
      
             <br><br><br><br>
             <section id="find">
             <div class="text-center">
              <h6>아직 가입하지 않으셨다면 <a href ="signup">회원가입</a>을 누르세요</h6> 
                <h6>아이디를 잊어버리셨다면 <a href ="findid">아이디 찾기</a>를 누르세요</h6> 
                <h6> 비밀번호를 잊어버리셨다면 <a href ="findpw">비밀번호 찾기</a>를 누르세요</h6>
              </div>
              <c:if test="${usg == false}">
                <h6> <p style="color: #f00;">로그인에 실패했습니다.</p></h6>
             </c:if>
           </section>
         
         <footer class="py-3" style=" background-color:#263663; color:#C1C8D9">
              <div class="container">
                <p class="text-center" > &copy; 도시락 프로젝트 2020</p>
              </div>
            </footer>
      </body> 
       </html>
