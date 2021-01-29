<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

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
    <script type = "text/javascript">
    
    $(document).ready(function(){
       
       var dayCalory = $("#dayCalory");
       var compare = $("#compare");
       var compareVal = $("#compareVal");
       
       if (dayCalory > compare)
          {
           $("#compareVal").val("칼로리 기준을 초과했습니다!");
          }
       
       if (dayCalory < compare)
          {
           $("#compareVal").val("칼로리 기준 미달입니다!");
          }
       
       if (dayCalory == compare)
	      {
	       $("#compareVal").val("적정량으로 드셨어요!");
	      }

       

        $("#main").click(function(){
            
            location.href = "/";
         });
       

       // 합 구하기
       $("#sum").click(function(){
          
          var breakfast = $("#breakfast").val();
          var lunch = $("#lunch").val();
          var dinner = $("#dinner").val();
          
          if (breakfast == "") {
                  breakfast = "0";
                  $("#breakfast").val(0);
          }
          
          if (lunch == "") {
               lunch = "0";
               $("#lunch").val(0);
         }
          
          if (dinner == "") {
               dinner = "0";
               $("#dinner").val(0);
         }
          
          breakfast = parseInt(breakfast);
          lunch = parseInt(lunch);
          dinner = parseInt(dinner);
          var sumResult = breakfast + lunch + dinner;
          console.log(sumResult);
          
          $("#sumResult").val(sumResult);

       });
       

       
       $("#submit").click(function(){
          
          if($("#sumResult").val() == "") {
             alert("합산을 눌러주세요.");
             false;
          }

          var breakfast_food = $("#breakfast_food").val();
          var lunch_food = $("#lunch_food").val();
          var dinner_food = $("#dinner_food").val();
          
          
          if (breakfast_food == "") {
             breakfast_food = "아무것도 먹지 않았어요!";
            $("#breakfast_food").val("아무것도 먹지 않았어요!");
         }
          
          if (lunch_food == "") {
            lunch_food = "아무것도 먹지 않았어요!";
            $("#lunch_food").val("아무것도 먹지 않았어요!");
         }
         
          if (dinner_food == "") {
             dinner_food = "아무것도 먹지 않았어요!";
            $("#dinner_food").val("아무것도 먹지 않았어요!");
         }
          
          
          
          
          var breakfast = parseInt($("#breakfast").val());
          var lunch = parseInt($("#lunch").val());
          var dinner = parseInt($("#dinner").val());
          var sumResult = $("#sumResult").val();
          var userid = $("#session_id").val();
          
            var objParams = {
                  userid : userid,
                  breakfast : breakfast,
                  lunch : lunch,
                  dinner : dinner,
                  breakfast_food : breakfast_food,
                  lunch_food : lunch_food,
                  dinner_food : dinner_food,
                  day : sumResult
            };
            
            console.log(objParams);
            
            $.ajax({
                url         :   "dailySave",
                dataType    :   "json",
                type        :   "post",
                data        :   objParams,
                success     :   function(retVal) {

                    if(retVal.code == "OK") {
                        alert(retVal.message);
                        location.reload();
                        
                    } else {
                        alert(retVal.message);
                    }
                     
                },
                
                error :   function(request, status, error){
                    console.log("AJAX_ERROR");
                }
            });
          
          
       });
       
       $.datepicker.setDefaults({
           dateFormat: 'yy-mm-dd',
           prevText: '이전 달',
           nextText: '다음 달',   
           closeText: '닫기', 
           currentText: '오늘', 
           monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
           monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
           dayNames: ['일', '월', '화', '수', '목', '금', '토'],   
           dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],   
           dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],   
           showMonthAfterYear: true,
           yearSuffix: '년',   //
           showButtonPanel: true,   // 오늘로 가는 버튼과 달력 닫기 버튼 보기 옵션
//           buttonImageOnly: true,   // input 옆에 조그만한 아이콘으로 캘린더 선택가능하게 하기
//           buttonImage: "images/calendar.gif",   // 조그만한 아이콘 이미지
//           buttonText: "Select date"   // 조그만한 아이콘 툴팁
       });
       
       $(function(){
         $("#datepicker").datepicker();
       });

    });

    </script>
  
  </head>
  
  <title>도시락 프로젝트</title>
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
   
   
   <br><br>
     
 
 
   <jsp:useBean id="today" class="java.util.Date" />
       <fmt:formatDate var="now" value="${today}" pattern="yyyy-MM-dd" />
       <fmt:parseDate var="bdate" value="${board.bdate2}" pattern="yyyyMMdd" />
       <fmt:formatDate var="bdate" value="${bdate}" pattern="yyyyMMdd" />
   
       <input type="hidden" id="session_id" name="session_id" value="${user.user_id}" />
       <section id="daily">
        <div class="container text-center">
          <div class="col-xs-12">
          <h3>일간식단</h3>
          <br>
           
            <p>Date: <input type="text" id="datepicker"></p>
            <button type="button" class="btn" style="background-color:#36518f; color:#E4E8F0">이동</button>
            <button type="button" id = "main" name ="main" class="btn" style="background-color:#36518f; color:#E4E8F0">메인</button>
       </div>
    </div>
    </section>
    
    
    <br>
    <br>
    <br>
    
    <div class="text" style="text-align: center">
    
       ${user.user_id}님, 오늘은 얼마나 드셨나요? <br>
       목표 칼로리: ${user.user_calory}
       <br>
    <br>
       </div>
     <input type="hidden" id="compare" name="compare" value="${user.user_calory}" />   
    <div class="container text-center col-sm-6">
      <table class="table">
      	<thead style="background-color:#36518f; color:#E4E8F0">
            <tr>
                <td width="200px">
                    아침식사
                </td>
                <td width="200px">
                    점심식사
                </td>
                <td width="200px">
                    저녁식사
                </td>
                 <td width="100px">
                      총 식사량
                </td>
            </tr>
   			</thead>           
         <c:choose>
             <c:when test="${fn:length(userCalory) == 0}">
                <tbody>
      			  <tr>
                     <td colspan="4" align="center">
                         조회결과가 없습니다.
                     </td>
                 </tr>
       		   </tbody>
             </c:when>
             <c:otherwise>
                    <c:forEach var="userCalory" items="${userCalory}" varStatus="status">
                       <tbody>  
           				<tr>
                            <td align="center">음식 이름: ${userCalory.breakfast_food}<p>칼로리: ${userCalory.breakfast}Kcal</td>
                            <td align="center">음식 이름: ${userCalory.lunch_food}<p>칼로리: ${userCalory.lunch}Kcal</td>
                            <td align="center">음식 이름: ${userCalory.dinner_food}<p>칼로리: ${userCalory.dinner}Kcal</td>
                            <td align="center">${userCalory.day}Kcal</td>
                        </tr>
            			 </tbody>
                      </c:forEach>
               </c:otherwise> 
           </c:choose>
  
          </table>
       </div> 
    
 
    
    <br> <br><br>
    
    <section id="menu">
      <div class="col-sm-12">
        <div class="form-row justify-content-center">
         <div class="form-group col-md-3">
        <div class="input-group mb-3">
         <div class="input-group-prepend">
           <button class="btn btn-outline-secondary" type="button" id="button-addon1">아</button>
              <input type="text" style="text-align: center;" class="form-control" placeholder="아침 메뉴" id="breakfast_food" name="breakfast_food">
              <input type="text" style="text-align: center;" class="form-control" placeholder="아침 칼로리" id="breakfast" name="breakfast">
         </div>
       </div>
         
       <br>
       
     
   
       <div class="input-group mb-3">
         <div class="input-group-prepend">
           <button class="btn btn-outline-secondary" type="button" id="button-addon2">점</button>
              <input type="text" style="text-align: center;" class="form-control" placeholder="점심 메뉴" id="lunch_food" name="lunch_food">
              <input type="text" style="text-align: center;" class="form-control" placeholder="점심 칼로리" id="lunch" name="lunch">
         </div>
       </div>
       <br>
     
   
       <div class="input-group mb-3">
         <div class="input-group-prepend">
           <button class="btn btn-outline-secondary" type="button" id="button-addon3">저</button>
              <input type="text" style="text-align: center;" class="form-control" placeholder="저녁 메뉴" id="dinner_food" name="dinner_food">
              <input type="text" style="text-align: center;" class="form-control" placeholder="저녁 칼로리" id="dinner" name="dinner">
         </div>
       </div>
       <br>
   
       <div class="input-group mb-3">
         <div class="input-group-append">
           <button class="btn btn-outline-secondary" type="button" id="sum" name="sum">합산</button>
           <input type="text" id="sumResult" name="sumResult" style="width:400px; text-align: center;" readonly>
         </div>
       </div>
     </div>
     </div>
     </div>
     </section>
     
   
 
    <br>
    <br>
    <br>
 
 
 
  <section id="submit">
     <div class="text-center">
       <button type="button" class="btn" id="submit" style="background-color:#36518f; color:#E4E8F0">submit</button>
    </div>
    </section>
    <br><br>
    <footer class="py-3" style=" background-color:#263663; color:#C1C8D9">
     <div class="container">
       <p class="text-center" > &copy; 도시락 프로젝트 2020</p>
     </div>
   
   </footer>
 
 </body>
 
 </html>
