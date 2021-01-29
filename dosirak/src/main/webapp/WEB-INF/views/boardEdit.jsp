<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
	
	        
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
        <script src="//cdn.ckeditor.com/4.12.1/full/ckeditor.js"></script>
        <script type="text/javascript">

        
            $(document).ready(function(){
                
            	CKEDITOR.replace( 'content', {//해당 이름으로 된 textarea에 에디터를 적용
                    width:'100%',
                    height:'400px',
                    filebrowserImageUploadUrl: 'insertImage' //여기 경로로 파일을 전달하여 업로드 시킨다.
                });
                 
                 
                CKEDITOR.on('dialogDefinition', function( ev ){
                    var dialogName = ev.data.name;
                    var dialogDefinition = ev.data.definition;
                  
                    switch (dialogName) {
                        case 'image': //Image Properties dialog
                            //dialogDefinition.removeContents('info');
                            dialogDefinition.removeContents('Link');
                            dialogDefinition.removeContents('advanced');
                            break;
                    }
                });
            	
                 
                $("#list").click(function(){
                    location.href = "/board/list";
                });
                 
                $("#save").click(function(){
                     
                    //에디터 내용 가져옴
                    var content = CKEDITOR.instances.content.getData();
                     
                    //널 검사
                    if($("#subject").val().trim() == ""){
                        alert("제목을 입력하세요.");
                        $("#subject").focus();
                        return false;
                    }
                    

                   
                    //값 셋팅
                    var objParams = {
                            <c:if test="${boardView.id != null}"> //있으면 수정 없으면 등록
                            id          : $("#board_id").val(),
                            </c:if>
                            subject     : $("#subject").val(),
                            writer      : $("#writer").val(),
                            content     : content
                    };

                     
                    //ajax 호출
                  
                    $.ajax({
                        url         :   "save",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code == "OK") {
                                alert(retVal.message);
                                location.href = "list";  
                            } else {
                                alert(retVal.message);
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                     
                     
                });
                 
            });
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
          <li class="active"><a href="#header">도시락 프로젝트</a></li>
          <li class="active"><a href="#header">${user.user_name}님, 로그인 되셨습니다.</a></li>
  
  
         <li class="drop-down"><a href="#sikdan">식단 관리</a>
             <ul>
               <li><a href="/diet/">일간 식단</a></li>
               <li><a href="weakly.html">주간 식단</a></li>
               <li ><a href="/diet/monthly">월간 식단</a></li>
             </ul>
           </li>
           <li><a href="/board/list">게시판</a></li>
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
     
     
     <br><br>
    
     <div class="container text-center">
        <div class="col-xs-12">
        <input type="hidden" id="board_id" name="board_id" value="${boardView.id}" />
        <div align="center">
            <br>
            <br>
            <table class="table" width="1200px">
                <tr>
                    <td>
                        제목: <input type="text" id="subject" name="subject" style="width:600px;" placeholder="제목" value="${boardView.subject}"/>
                      		 <input type="hidden" class="form-control" id="writer" name="writer" value="${user.user_id}" readonly>
                        <!-- 비밀번호: <input type="password" id="password" name="password" style="width:170px;" maxlength="10" placeholder="패스워드"/> -->
                        <button id="save" name="save" class="btn" style="background-color:#36518f; color:#E4E8F0">저장</button>  
                    </td>
                </tr>
                <tr>
                    <td>
                        <textarea name="content" id="content" rows="10" cols="80">${boardView.content}</textarea>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <button id="list" name="list" class="btn" style="background-color:#36518f; color:#E4E8F0">게시판</button>  
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </div>
    
 
        
   <br><br>
    <footer class="py-3" style=" background-color:#263663; color:#C1C8D9">
     <div class="container">
       <p class="text-center" > &copy; 도시락 프로젝트 2020</p>
     </div>
   
   </footer>
 
 </body>
 
 </html>