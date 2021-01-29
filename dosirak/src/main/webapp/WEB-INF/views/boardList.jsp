<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<html>
    <head>
        <title>게시판</title>
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
        <script type="text/javascript">
            $(document).ready(function(){
                 
                //--페이지 셋팅
                var totalPage = ${totalPage}; //전체 페이지
                var startPage = ${startPage}; //현재 페이지

                
                var pagination = "";
                 
                //--페이지네이션에 항상 10개가 보이도록 조절
                var forStart = 0;
                var forEnd = 0;
                 
                if((startPage-5) < 1){
                    forStart = 1;
                }
                
                else{
                    forStart = startPage-5;
                }
                 
                if(forStart == 1){
                     
                    if(totalPage>9){
                        forEnd = 10;
                    }
                    
                    else{
                        forEnd = totalPage;
                    }
                     
                }
                
                else{
                     
                    if((startPage+4) > totalPage){
                         
                        forEnd = totalPage;
                         
                        if(forEnd>9){
                            forStart = forEnd-9
                        }
                         
                    }
                    
                    else{
                        forEnd = startPage+4;
                    }
                }
                //--페이지네이션에 항상 10개가 보이도록 조절
                 
                //전체 페이지 수를 받아 돌린다.
                for(var i = forStart ; i<= forEnd ; i++){
                    if(startPage == i){
                        pagination += ' <button name="page_move" start_page="'+i+'" disabled>'+i+'</button>';
                    }
                    else{
                        pagination += ' <button name="page_move" start_page="'+i+'" style="cursor:pointer;" >'+i+'</button>';
                    }
                }
                 
                //하단 페이지 부분에 붙인다.
                $("#pagination").append(pagination);
                //--페이지 셋팅
                 
                 
                $("a[name='subject']").click(function(){
                     
                    location.href = "view?id="+$(this).attr("content_id");
                     
                });

                //세션 주고받아서 로그인 된 사람만 글 쓰게 하기
                
                 
                $("#write").click(function(){
                    location.href = "edit";
                });
                                 
                $(document).on("click","button[name='page_move']",function(){
                     
                    var visiblePages = 10;//리스트 보여줄 페이지
                     
                    $('#startPage').val($(this).attr("start_page"));//보고 싶은 페이지
                    $('#visiblePages').val(visiblePages);
                     
                    $("#frmSearch").submit();
                     
                });
                
            	$(document).on('click', '#btnSearch', function(e){
            		e.preventDefault();
            		var url = "${pageContext.request.contextPath}/board/getBoardList";
            		url = url + "?searchType=" + $('#searchType').val();
            		url = url + "&keyword=" + $('#keyword').val();
            		location.href = url;
            		console.log(url);
            	});	


                 
            });
        </script>
        <style>
            .mouseOverHighlight {
                   border-bottom: 1px solid blue;
                   cursor: pointer !important;
                   color: blue;
                   pointer-events: auto;
                }
        </style>
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
               <li><a href="/diet/">일간 식단</a></li>
               <li><a href="weakly.html">주간 식단</a></li>
               <li><a href="/diet/monthlyEdit">월간 식단</a></li>
             </ul>
           </li>
           <li><a href="#forum">게시판</a></li>
           <li><a href="#aboutus">소개</a></li>
           <li><a href="/logout">로그아웃</a></li>
       
      </ul>
      </nav>
      </div>
          
      
      
      
      </header>
      
      <!--                          메뉴 바             -->
      <script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
      <script src="${path}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
      <script src="${path}/resources/vendor/jquery.easing/jquery.easing.min.js"></script>
      <br><br>


    
        <form class="form-inline" id="frmSearch" action="list">
            <input type="hidden" id="startPage" name="startPage" value=""><!-- 페이징을 위한 hidden타입 추가 -->
            <input type="hidden" id="visiblePages" name="visiblePages" value=""><!-- 페이징을 위한 hidden타입 추가 -->
         
            <br><br>
    <div class="container">
        <br><br>
        <h3 style="text-align: center;">게시판</h3>
            <div class="text-right">
                    <button type="button" id="write" name="write" class="btn" style="background-color:#36518f; color:#E4E8F0">글 작성</button>
                    <button type="button" id="main" name="main" class="btn" style="background-color:#36518f; color:#E4E8F0">메인</button>
                </div>

                <br><br>
               
	              <table class="table table-bordered">
	                 <thead style="background-color:#36518f; color:#E4E8F0">
	                    <tr>
	                        <tr>
	                <th width="50px">
	                    No
	                </th>
	                <th width="850px">
	                    제목
	                </th>
	                <th width="100px">
	                    작성자
	                </th>
	                <th width="200px">
	                    작성일
	                </th>
	            </tr>
	        </thead>
	
	            <c:choose>
	                <c:when test="${fn:length(boardList) == 0}">
	                    <tbody>
	                    <tr>
	                        <td colspan="4" align="center">
	                            조회결과가 없습니다.
	                        </td>
	                    </tr>
	                </tbody>
	
	                </c:when>
	                <c:otherwise>
	                    <c:forEach var="boardList" items="${boardList}" varStatus="status">
	                        <tbody> 
	                    <tr>
	                            <td align="center">${boardList.id}</td>
	                            <td>
	                                <a name="subject" class="mouseOverHighlight" content_id="${boardList.id}">${boardList.subject}</a>
	                            </td>
	                            <td align="center">${boardList.writer}</td>
	                            <td align="center">${boardList.register_datetime}</td>
	                        </tr>
	                    </tbody>
	               
	                    </c:forEach>
	                </c:otherwise> 
	            </c:choose>
	      </table>
 
      </div>  
        <br>
</form>

        <div class="text-center" id="pagination"></div>

<br><br>
<footer class="py-3" style=" background-color:#263663; color:#C1C8D9">
 <div class="container">
   <p class="text-center" > &copy; 도시락 프로젝트 2020</p>
 </div>

</footer>

</body>
</html>
