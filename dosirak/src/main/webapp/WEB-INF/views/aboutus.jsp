<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>

  <title>도시락 프로젝트</title>

  <!-- Bootstrap core CSS -->
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
	
	        
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
        <script src="//cdn.ckeditor.com/4.12.1/full/ckeditor.js"></script>

</head>

<body>
<header> 
      <button type="button" class="nav-toggle"><i class="bx bx-menu"></i></button>
      <div id="sidebar-wrapper">
        <div class="sidebar-heading" style="background-color: #263663; padding: 0.875rem 1.25rem;
        font-size: 1.3rem; color:#C1C8D9; text-align: right;">도시락 프로젝트 </div>
      <nav class="nav-menu">
        <ul>
          <li class="active"><a href="/">도시락 프로젝트</a></li>
          <li class="active"><a href="#header">로그인 해주세요.</a></li>
  
  
         <li class="drop-down"><a href="#sikdan">식단 관리</a>
             <ul>
               <li><a href="daily.html">일간 식단</a></li>
               <li ><a href="monthly.html">월간 식단</a></li>
             </ul>
           </li>
           <li><a href="#forum">게시판</a></li>
           <li><a href="#aboutus">소개</a></li>
           <li><a href="#">로그인</a></li>
       
      </ul>
      </nav>
      </div>
          
      
      
      
      </header>
      
      <!--                          메뉴 바             -->
      <script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
      <script src="${path}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
      <script src="${path}/resourcesvendor/jquery.easing/jquery.easing.min.js"></script>
      


  <!-- Image Showcases -->
  <section class="showcase">
    <div class="container-fluid p-0">
      <div class="row no-gutters">

        <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url(img/about1.png);"></div>
        <div class="col-lg-6 order-lg-1 my-auto showcase-text">
          <h2 style="text-align: center;">하루동안 식사는 하셨나요? </h2>
          <p class="lead mb-0" style="text-align: center;">우리의 일상을 보다 건강하게<br> 
            유지하기 위해서 식사는 중요해요.</p>
        </div>
      </div>
      <div class="row no-gutters">
        <div class="col-lg-6 text-white showcase-img" style="background-image: url('img/about2.png');"></div>
        <div class="col-lg-6 my-auto showcase-text">
          <h2 style="text-align: center;">당신은 건강을 챙기고 계신가요?
            </h2>
          <p class="lead mb-0" style="text-align: center;">식단관리는 건강 관리에 
            가장 필요한 부분이에요.
            </p>
        </div>
      </div>
      <div class="row no-gutters">
        <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('img/about3.png');"></div>
        <div class="col-lg-6 order-lg-1 my-auto showcase-text">
          <h2 style="text-align: center;">그래서 우리는 준비했어요.</h2>
          <p class="lead mb-0" style="text-align: center;">바쁜 일상에서의 소중한 식사의 가치를<br>
            쉽고 간단하게 기록하기 위해<br><br>
            
            건강을 위해 노력하는 당신을 위해
            </p>
        </div>
      </div>
    </div>
  </section>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

 <footer class="py-3" style=" background-color:#263663; color:#C1C8D9">
     <div class="container">
       <p class="text-center" > &copy; 도시락 프로젝트 2020</p>
     </div>
   
   </footer>
</body>
</html>
