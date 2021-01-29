<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>도시락 프로젝트</title>
 <link rel="stylesheet" href="css/loginbar.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
   <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="vendor/boxicons/css/boxicons.min.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</head>
<body>
 <header> 
      <button type="button" class="nav-toggle"><i class="bx bx-menu"></i></button>
      <div id="sidebar-wrapper">
        <div class="sidebar-heading" style="background-color: #263663; padding: 0.875rem 1.25rem;
        font-size: 1.3rem; color:#C1C8D9; text-align: right;">도시락 프로젝트 </div>
      <nav class="nav-menu">
        <ul>
          <li class="active"><a href="#header">도시락 프로젝트</a></li>
          <li class="active"><a href="#header">${user.user_name}님, 로그인 되셨습니다.</a></li>
  
  
         <li class="drop-down"><a href="#sikdan">식단 관리</a>
             <ul>
               <li><a href="daily.html">일간 식단</a></li>
               <li ><a href="monthly.html">월간 식단</a></li>
             </ul>
           </li>
           <li><a href="#forum">게시판</a></li>
           <li><a href="#aboutus">소개</a></li>
           <li><a href="#">로그아웃</a></li>
       
      </ul>
      </nav>
      </div>
          
      
      
      
      </header>
      
      <!--                          메뉴 바             -->
      <script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
      <script src="${path}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
      <script src="${path}/resourcesvendor/jquery.easing/jquery.easing.min.js"></script>
      <br><br>
     
   <div id="root" class="text-center">
     
            <h3>Dosirak Admin</h3>
         </div>
     
<br><br>

      <section id="container">
         <div id="container_box" class="text-center">List</div>
         <ul>
         <li style="list-style: none;"><a href="userlist">회원 목록</a>
         <li style="list-style: none;"><a href="admin_member_forced_eviction_view">회원 강제 탈퇴</a></li>
         </ul>
      </section>

   </div>
   <footer class="py-3" style=" background-color:#263663; color:#C1C8D9">
     <div class="container">
       <p class="text-center" > &copy; 도시락 프로젝트 2020</p>
     </div>
   
   </footer>
</body>
</html>