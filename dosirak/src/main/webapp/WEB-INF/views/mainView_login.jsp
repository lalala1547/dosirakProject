<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href=resources/css/landing-page.min.css>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="resources/vendor/boxicons/css/boxicons.min.css">
   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
     <script type="text/javascript">
	
     $(document).ready(function(){
    	 
	    $("a[name='subject']").click(function(){
	        
	        location.href = "view?id="+$(this).attr("content_id");
	         
	    });
     });
	
	</script>

    <title>도시락 프로젝트</title>
</head>

<body>
    <!--                          메뉴                 -->
    <header>
    
	<button type="button" class="nav-toggle"><i class="bx bx-menu"></i></button>
		<nav class="nav-menu">
		  <ul>
		    <li class="active"><a href="#header">${user.user_name}님, 로그인 되셨습니다.</a></li>
		
		    
		    <li class="drop-down"><a href="#sikdan">식단 관리</a>
		      <ul>
		        <li><a href="diet/">일간 식단</a></li>
		        <li><a href="weakly.html">주간 식단</a></li>
		        <li ><a href="diet/monthlyEdit">월간 식단</a></li>
		      </ul>
		    </li>
		    <li><a href="board/list">게시판</a></li>
		    <li><a href="#aboutus">소개</a></li>
		    <li><a href="logout">로그아웃</a></li>
		    <li><a href="modify">회원정보 수정</a></li>
			<c:if test="${user.user_grade==1}">
				<li><a href="admin">관리자</a></li>
			</c:if>
		  </ul>
		</nav>

</header>

<!--                          메뉴- asset:토글 바(추후 수정)               -->
<script src="resources/vendor/jquery/jquery.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="resources/vendor/jquery.easing/jquery.easing.min.js"></script>
<script src="resources/js/main.js"></script>


    <!--                          메인 - 슬라이드                      -->
    <div class="main" id="Main">

      <div class="col-xs-12">
       
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                  <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img class="d-block w-100" src="resources/img/main2.png" alt="First slide">
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100" src="resources/img/main3.png" alt="Second slide">
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100" src="resources/img/main4.png" alt="Third slide">
                  </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a>
              </div>
        </div>
        </div>

  

<!----              푸터                  -->

   <footer class="py-3 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; 도시락 프로젝트 2020</p>
    </div>
 
  </footer>
</body>

</html>