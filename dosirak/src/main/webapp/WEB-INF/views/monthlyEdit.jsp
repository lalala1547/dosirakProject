<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
    <head>
   
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
   
 

    <title>도시락 프로젝트</title>
</head>

<body>
  
    <!--                          메뉴                 -->
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
		        <li ><a href="/diet/monthlyEdit">월간 식단</a></li>
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


 <section id="monthly">
  <div class="container text-center col-sm-6">
    <h2>월간 식단</h2>
    <p>목표칼로리를 얼만큼 달성했는지 색상으로 알아보아요.</p>  
          
    <table class="table table-bordered text-center">
      <thead>
        <tr>
          <th>미흡</th>
          <th>적정</th>
          <th>과다</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td style="background-color: #eaf1f8"></td>
          <td style="background-color:#d5e3f6"></td>
          <td style="background-color: #c1c8d0"></td>
        </tr>
      </tbody>
    </table>
  </div>
  <br> <br>   
</section>

<section id="cal">
  <div id="calendar"></div>
  <link href='https://fullcalendar.io/releases/fullcalendar/3.9.0/fullcalendar.min.css' rel='stylesheet' />
<link href='https://fullcalendar.io/releases/fullcalendar/3.9.0/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/jquery.min.js'></script>
<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/fullcalendar.min.js'></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style type="text/css">
  body {
      margin: 40px 10px;
      padding: 0;
      font-size: 14px;
  }

  #calendar {
      max-width: 900px;
      margin: 0 auto;
  }
 
  .fc-day-number.fc-sat.fc-past { color:#0000FF; }
  .fc-day-number.fc-sun.fc-past { color:#FF0000; }
</style>
<link href="./fullcalendar-2.9.1/fullcalendar.css" rel="stylesheet"/>
<link href="./fullcalendar-2.9.1/fullcalendar.print.css" rel="stylesheet" media="print"/>
<script type="text/javascript" src="./fullcalendar-2.9.1/lib/moment.min.js"></script>
<script type="text/javascript" src="./fullcalendar-2.9.1/lib/jquery.min.js"></script>
<script type="text/javascript" src="./fullcalendar-2.9.1/fullcalendar.js" charset="euc-kr"></script>
<script type="text/javascript">
  jQuery(document).ready(function() {
      jQuery("#calendar").fullCalendar({
            defaultDate : "2020-12-07"
          , editable : true
          , events: [
            
              {
                  backgroundColor : "#BAD1E6"
                  , start : "2020-12-09"
                  , rendering : "background"
              }
              ,{
                backgroundColor : "#72A0E0;"
                  , start : "2020-12-10"
                  , rendering : "background"
              }
              ,{
                backgroundColor : "#2F4662"
                  , start : "2020-12-11"
                  , rendering : "background"
              }
          ]
      });
  });
</script>
</section>
 <br><br>
    <footer class="py-3" style=" background-color:#263663; color:#C1C8D9">
     <div class="container">
       <p class="text-center" > &copy; 도시락 프로젝트 2020</p>
     </div>
   
   </footer>
 
 </body>
 
 </html>
