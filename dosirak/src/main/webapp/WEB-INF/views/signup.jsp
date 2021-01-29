<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
      <script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
      <script src="${path}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
      <script src="${path}/resources/vendor/jquery.easing/jquery.easing.min.js"></script>
	
	        
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
        <script src="//cdn.ckeditor.com/4.12.1/full/ckeditor.js"></script>

<title>도시락 프로젝트</title>

<script type="text/javascript">

    console.log("log Test1");
 
    // 모든 공백 체크 정규식
    var empJ = /\s/g;
    //아이디 정규식
    var idJ = /^[a-z0-9]{4,12}$/;
    // 비밀번호 정규식
    var pwJ = /^[A-Za-z0-9]{4,12}$/; 
    // 이름 정규식
    var nameJ = /^[가-힣]{2,6}$/;
    // 이메일 검사 정규식
    var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    // 휴대폰 번호 정규식
    var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
    
    $(document).ready(function(){
       
       $("#user_id").blur(function() {
          if (idJ.test($(this).val()) && !(empJ.test($(this).val()))) {
                console.log(nameJ.test($(this).val()));
                $("#idCheckconfirm").text('');
                $("#idCheck").removeAttr("disabled");
          } else {
             $('#idCheckconfirm').text('아이디는 영어 소문자 + 숫자의 조합으로 4~12자리 입력해주세요.');
             $('#idCheckconfirm').css('color', 'red');
             $("#idCheck").attr("disabled", "disabled");
          }
       });

       // 비밀번호 확인
       $("#user_pw").blur(function() {
          if (pwJ.test($(this).val()) && !(empJ.test($(this).val()))) {
                console.log(nameJ.test($(this).val()));
                $("#pwCheckconfirm").text('');
          } else {
             $('#pwCheckconfirm').text('비밀번호는 영어 소/대문자 + 숫자의 조합으로 4~12자리 입력해주세요.');
             $('#pwCheckconfirm').css('color', 'red');
          }
       });


       $("input").keyup(function() {
          var user_pw = $("#user_pw").val();
          var user_pw_chk = $("#user_pw_chk").val();
          if (user_pw != "" || user_pw_chk != "") {
             if (user_pw == user_pw_chk) {
                $("#pwCheckconfirmtwo").text('');
             } else {
                $('#pwCheckconfirmtwo').text('비밀번호를 확인해주세요.');
                $('#pwCheckconfirmtwo').css('color', 'red');
             }
          }
       });

    
       // 이름 확인
       $("#user_name").blur(function() {
          if (nameJ.test($(this).val())) {
                console.log(nameJ.test($(this).val()));
                $("#nameCheckconfirm").text('');
          } else {
             $('#nameCheckconfirm').text('닉네임은 한글로 2~6자 입력해주세요.');
             $('#nameCheckconfirm').css('color', 'red');
          }
       });
    
       // 이메일 확인
       $("#user_email").blur(function() {
          if (mailJ.test($(this).val())) {
                console.log(nameJ.test($(this).val()));
                $("#emailCheckconfirm").text('');
          } else {
             $('#emailCheckconfirm').text('이메일 양식에 맞춰 입력해주세요.');
             $('#emailCheckconfirm').css('color', 'red');
          }
       });

       // 핸드폰 확인
       $("#user_phone").blur(function() {
          if (phoneJ.test($(this).val())) {
                console.log(nameJ.test($(this).val()));
                $("#phoneCheckconfirm").text('');
          } else {
             $('#phoneCheckconfirm').text('올바른 핸드폰 번호를 입력해주세요 (- 제외).');
             $('#phoneCheckconfirm').css('color', 'red');
          }
       });
    
       // 아이디 중복확인
       $("#idCheck").click(function() {
          
          console.log("idCheckTest");
          

          var query = {
             user_id : $("#user_id").val()
          };

          $.ajax({
             url : "/idCheck",
             type : "post",
             data : query,
             success : function(data) {

                if (data == 1) {
                   $('#idCheckconfirm').text("사용 불가한 아이디입니다.");
                   $('#idCheckconfirm').css('color','red');
                   $("#signup_btn").attr("disabled", "disabled");
                }
                
                else {
                   $('#idCheckconfirm').text("사용 가능한 아이디입니다.");
                   $('#idCheckconfirm').css('color','blue');
                   $("#signup_btn").removeAttr("disabled");
                }
             }
          }); // ajax 끝
       });

       // 이메일 인증번호 전송
       $("#emailBtn").click(function() {

          var query = {
             user_email : $("#user_email").val()
          };

          $.ajax({
             url : "/emailCheck",
             type : "post",
             data : query,
             success : function(data) {

                if (data == 1) {
                   alert("인증번호를 보냈습니다.")
                   $("#user_email_auth").show();
                }

                else {
                   
                }
             }
          });
       }); // ajax 끝

       // 이메일 인증 버튼
       $("#emailAuthBtn").click(function() {

          var query = {
             user_email_auth : $("#user_email_auth").val()
          };

          $.ajax({
             url : "/emailAuthCheck",
             type : "post",
             data : query,
             success : function(data) {

                if (data == 1) {
                   alert("인증번호가 일치합니다.")
                }

                else {
                   alert("인증번호가 일치하지 않습니다.")
                }
             }
          });
       });

       $("#checkEmail").click(function(){
          
          var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//이메일 정규식
           
          if(!emailRule.test($("#user_email").val())) {            
                      //경고
             $(".result .msg").text("이메일을 올바르게 입력하세요.");
             $(".result .msg").attr("style", "color:#f00");
             return;
          }
          
          var query = {user_email : $("#user_email").val()};
          $.ajax({
             url : "/checkEmail",
             type : "post",
             data : query,
             dataType : "json",
             success : function(data){
                
                if(data == 0){
                   $(".result .msg").text("사용 가능");
                   $(".result .msg").attr("style", "color:#00f");
                   
                }
                else{
                   $(".result .msg").text("사용 불가");
                   $(".result .msg").attr("style", "color:#f00");
                }
             },
             error:function(request,status,error){
                  alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                 }
          });
       });
       
       
    
    });
 
    // 아이디 확인
 

     // ajax 끝
    
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
		    <li><a href="/login">로그인</a></li>
		    <li><a href="/modify">회원정보 수정</a></li>
			<c:if test="${user.user_grade==1}">
				<li><a href="admin">관리자</a></li>
			</c:if>
		  </ul>
		</nav>
		</div>

</header>

    <div class="col-xs-12">
    	<br><br>
        <h5 style="text-align: center;">SignUp</h5>
        <br> <br> 
      <form role="form" method="POST" autocomplete="off" class="sendForm" style="text-align: center;">

         <div class="input_area">
            <label for="user_id">아이디</label> 
            <input class="id_input" type="text"
               id="user_id" name="user_id"  required="required" 
               style=" border: 0.0625em solid #C1C8D9;"/>
    
            <button type="button" class="idCheck" id="idCheck" name="idCheck"
            style="background-color:#36518f; color:#E4E8F0; border: none;">중복확인</button>
         </div>
         <br> 
         <div class="result" id="idCheckconfirm"></div>
         <br> 
         <div class="input_area">
            <label for="user_pw">비밀번호</label>
              <input class="pw_input"
               type="password" id="user_pw" name="user_pw" required="required" 
               style=" border: 0.0625em solid #C1C8D9;" />
         </div>
         <br> 
         <div class="result" id="pwCheckconfirm"></div>
<br> 
         <div class="input_area">
            <label for="user_pw">비밀번호 확인</label> 
             
            <input class="pw_input_chk"
               type="password" id="user_pw_chk" name="user_pw_chk"
               required="required"  style=" border: 0.0625em solid #C1C8D9;"/>
         </div>
         <br> 
         <div class="result" id="pwCheckconfirmtwo"></div>
         <br> 
         <div class="input_area">
            <label for="user_name">닉네임</label>
            
            <input type="text" id="user_name"
               name="user_name" required="required" 
               style=" border: 0.0625em solid #C1C8D9;"/>
         </div>
         <br> 
         <div class="result" id="nameCheckconfirm"></div>
         <br> 
         <div class="input_area">
            <label for="user_sex">성별</label> 
             
            <input type="text" id="user_sex"
               name="user_sex" placeholder="성별 (M/F로만 입력)" required="required" 
               style=" border: 0.0625em solid #C1C8D9;"/>
         </div>
         <br> 
         <div class="input_area">
            <label for="user_email">이메일</label> 
           
            <input type="email"
               id="user_email" name="user_email" 
               required="required" 
               style=" border: 0.0625em solid #C1C8D9;"/>
            
               <button type="button" class="checkEmail" id="checkEmail" name="checkEmail"
               style="background-color:#36518f; color:#E4E8F0; border: none;">이메일 확인</button>
               <br><br>
            <p class="result" style="text-align: center;">
               <span class="msg">이메일을 확인하세요.</span>
            </p>

            <button type="button" class="emailBtn" id="emailBtn" name="emailBtn"
            style="background-color:#36518f; color:#E4E8F0; border: none;">이메일
               발송</button>

            <input type="text" id="user_email_auth" name="user_email_auth"
               placeholder="인증번호를 입력하세요" style="display: none" required="required">

            <button type="button" class="emailAuthBtn" id="emailAuthBtn"
               name="emailAuthBtn" 
               style="background-color:#36518f; color:#E4E8F0; border: none;">이메일 인증</button>
         </div>
        
         <div class="result" id="emailCheckconfirm"></div>
         <br> 
         <div class="input_area">
            <label for="user_phone">연락처</label> <input type="text"
               id="user_phone" name="user_phone" 
               required="required" style=" border: 0.0625em solid #C1C8D9;"/>
         </div>
         
         <div class="result" id="phoneCheckconfirm"></div>
         <br><br>
         <button type="submit" id="signup_btn" name="signup_btn" 
         style="background-color:#36518f; color:#E4E8F0; border: none;">회원가입</button>

      </form>
 
</div>
<br> <br> 
<footer class="py-3" style=" background-color:#263663; color:#C1C8D9">
    <div class="container">
      <p class="text-center" > &copy; 도시락 프로젝트 2020</p>
    </div>
  </footer>
</body>
</html>