<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script type = "text/javascript">
    
    $(document).ready(function(){
    	
        $("#main").click(function(){
            
            location.href = "/dosirak";
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
                    } else {
                        alert(retVal.message);
                    }
                     
                },
                
                error :   function(request, status, error){
                    console.log("AJAX_ERROR");
                }
            });
    		
    		
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
        yearSuffix: '년',	//
        showButtonPanel: true,	// 오늘로 가는 버튼과 달력 닫기 버튼 보기 옵션
//        buttonImageOnly: true,	// input 옆에 조그만한 아이콘으로 캘린더 선택가능하게 하기
//        buttonImage: "images/calendar.gif",	// 조그만한 아이콘 이미지
//        buttonText: "Select date"	// 조그만한 아이콘 툴팁
    });
    
    $(function(){
      $("#datepicker").datepicker();
    });
    
    
    
    


    </script>
  </head>
  
  <title>Document</title>

  <body>
      <input type="hidden" id="session_id" name="session_id" value="${user.user_id}" />
  	  <input id="searchInput">
	  <section id="daily">
	   <div class="container">
	    <div class="row">
	        <div class="col-xs-3">
	        <p>Date: <input type="text" id="datepicker"></p>
	      </div>
	        <div class="col-xs-5">
	          <button type="button" class="btn btn-primary text-nowrap">이동</button>
	          <button type="button" id = "main" name ="main" class="btn btn-primary text-nowrap">메인</button>
	        </div>
	    </div>
	</div>
	</section>
	
	<br>
	<br>
	<br>
		${daily.userid}
	<br>
	<br>
	<br>
	<br>
	
	<br>
	<section id="menu">
	  <div class="container">
	  <div class="input-group mb-3">
	    <div class="input-group-prepend">
	      <button class="btn btn-outline-secondary" type="button" id="button-addon1">아침</button>
   	      <input type="text" class="form-control" placeholder="아침 메뉴" id="breakfast_food" name="breakfast_food"/>
   	      <input type="text" class="form-control" placeholder="아침 칼로리" id="breakfast" name="breakfast"/>
	    </div>
	  </div>
	  <br>
  
	  <div class="input-group mb-3">
	    <div class="input-group-append">
	      <button class="btn btn-outline-secondary" type="button" id="button-addon2">점심</button>
   	      <input type="text" class="form-control" placeholder="점심 메뉴" id="lunch_food" name="lunch_food"/>
   	      <input type="text" class="form-control" placeholder="점심 칼로리" id="lunch" name="lunch"/>
	    </div>
	  </div>
	  <br>
  
	  <div class="input-group mb-3">
	    <div class="input-group-prepend" id="button-addon3">
	      <button class="btn btn-outline-secondary" type="button">저녁</button>
   	      <input type="text" class="form-control" placeholder="저녁 메뉴" id="dinner_food" name="dinner_food"/>
   	      <input type="text" class="form-control" placeholder="저녁 칼로리" id="dinner" name="dinner"/>
   	      
	    </div>
	  </div>
	  <br>
	  <div class="input-group">

	    <div class="input-group mb-3">
	    <div class="input-group-append" id="button-addon4">
	      <button class="btn btn-outline-secondary" type="button" id="sum" name="sum">합산</button>
	      <input type="text" id="sumResult" name="sumResult" readonly/>
	    </div>
	  </div>
	</div>
	</div>
	</section>
	
	
	<br>
	<br>
	<br>

	<section id="submit">
	  <button type="button" class="btn btn-secondary btn-lg btn-block">submit</button>
	</section>
  
   
  </body>
  </html>