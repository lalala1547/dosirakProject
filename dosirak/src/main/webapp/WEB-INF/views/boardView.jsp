<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%
 response.setHeader("Cache-Control","no-cache");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader("Expires",0);
%>


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
    
                var status = false; //수정과 대댓글을 동시에 적용 못하도록


                //리스트를 누르면 리스트로 간다
                $("#list").click(function(){
                    location.href = "list";
                });
                
                //댓글 저장
                $("#reply_save").click(function(){
                    
                	// 로그인 이용 체크 
                	if($("#session_id").val() == "") {
                		alert("로그인 후 이용해주세요.");
                		return false;
                	}
                    //널 검사, 공백 제거 포함
 
                    if($("#reply_content").val().trim() == ""){
                        alert("내용을 입력하세요.");
                        $("#reply_content").focus();
                        return false;
                    }
                    
                    var reply_content = $("#reply_content").val().replace("\n", "<br>"); //개행처리
                    
                    //값 셋팅
                    var objParams = {
                            board_id        : $("#board_id").val(),
                            parent_id        : "0",    
                            depth            : "0",
                            reply_writer    : $("#reply_writer").val(),
                            reply_content    : reply_content
                    };
                    
                    var reply_id;
                    
                    //ajax 호출
                    $.ajax({
                        url         :    "reply/save",
                        dataType    :    "json",
                        contentType :    "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :    "post",
                        async       :     false, //동기: false, 비동기: ture
                        data        :    objParams,
                        success     :    function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                                return false;
                            }
                            else {
                                reply_id = retVal.reply_id;
                            }
                            
                        },
                        error        :    function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    
                    var reply_area = $("#reply_area");
                    
                    var reply = // reply_type = "main" -> 댓글 (depth 0), tr td 로 표 만들기
                        '<tr reply_type="main">'+
                        '    <td width="820px">'+
                        reply_content+
                        '    </td>'+
                        '    <td width="100px">'+
                        $("#reply_writer").val()+
                        '    </td>'+
                        '    <td align="center">'+
                        '       <button name="reply_reply" reply_id = "'+reply_id+'">댓글</button>'+
                        '       <button name="reply_modify" r_type = "main" parent_id = "0" reply_id = "'+reply_id+'">수정</button>      '+
                        '       <button name="reply_del" r_type = "main" reply_id = "'+reply_id+'">삭제</button>      '+
                        '    </td>'+
                        '</tr>';

              		// #reply_area 선언 해줬는데 왜 여기서 안 쓰고 있는거지?              
                     if($('#reply_area').contents().size()==0){ // size가 없으면 reply_area 마지막에 요소 추가 
                         $('#reply_area').append(reply);
                     }
                     else{
                         $('#reply_area tr:last').after(reply); // reply_area 에 존재하는 마지막 tr만을 선택한다. 선택하고... 그 뒤에 reply 를 추가한다. 
                     } // 댓글과 대댓글 차이인강?
 
                    //댓글 초기화
                    $("#reply_content").val("");
                    
                });
                
                //댓글 삭제
                
                
                $(document).on("click","button[name='reply_del']", function(){
                    
                    var check = false;
                    var reply_id = $(this).attr("reply_id");	
                    var r_type = $(this).attr("r_type");
                    var session_id = $("#session_id").val();
                    var txt_reply_writer = $(this).parent().prev().html().trim(); //댓글작성자 가져오기
                   
                    if(session_id != txt_reply_writer){
                        alert("작성자가 다릅니다.");                        
                        return false;
                    }
                    

                   if(confirm("삭제하시겠습니까?") == true){
                       alert("삭제되었습니다.");
                   }
                   else{    	   
                       return false;
                   }

                    
                    //패스워드와 아이디를 넘겨 삭제를 한다.
                    //값 셋팅
                    var objParams = {
                            reply_id        : reply_id,
                            r_type            : r_type
                    };
                    
                    //ajax 호출
                    $.ajax({
                        url         :    "reply/del",
                        dataType    :    "json",
                        contentType :    "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :    "post",
                        async       :     false, //동기: false, 비동기: ture
                        data        :    objParams,
                        success     :    function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                
                                check = true;
                                                                
                            }
                            
                        },
                        error        :    function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    
                    if(check){ // DB단에서 처리하면 안되나? 일단 되긴 했는데 남겨둠 
                        
                        if(r_type == "main"){//depth가 0이면 하위 댓글 다 지움
                            //삭제하면서 하위 댓글도 삭제
                            var prevTr = $(this).parent().parent().next(); //댓글의 다음
                            
                            while(prevTr.attr("reply_type")=="sub"){//댓글의 다음이 sub면 계속 넘어감
                                prevTr.remove();
                                prevTr = $(this).parent().parent().next();
                            }
                                                        
                            $(this).parent().parent().remove();    
                        }else{ //아니면 자기만 지움
                            $(this).parent().parent().remove();    
                        }
                        
                    }
                    
                });
                
                //댓글 수정 입력
                $(document).on("click","button[name='reply_modify']", function(){
                    
                    var check = false;
                    var reply_id = $(this).attr("reply_id");
                    var parent_id = $(this).attr("parent_id");
                    var r_type = $(this).attr("r_type");
                    var session_id = $("#session_id").val(); // 세션 내용 가져오기
                    var txt_reply_writer = $(this).parent().prev().html().trim(); //댓글작성자 가져오기
                    var txt_reply_content = $(this).parent().prev().prev().html().trim(); // 댓글 내용 가져오기

                    
                    if(session_id != txt_reply_writer){
                        alert("작성자가 다릅니다.");                        
                        return false;
                    }
                     
                    //패스워드와 아이디를 넘겨 패스워드 확인
                    //값 셋팅
                    var objParams = {
                            reply_id : reply_id
                    };
                     
                    //ajax 호출
                    $.ajax({
                        url         :   "reply/check",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                check = false;//패스워드가 맞으면 체크값을 true로 변경
                                alert(retVal.message);
                            }
                            else{
                                check = true;
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    
                    
                    
                    if(status){
                        alert("수정과 대댓글은 동시에 불가합니다.");
                        return false;
                    }

                    // 이것 중요. 
                    
                    if(check){
                        status = true; 
                        //자기 위에 댓글 수정창 입력하고 기존값을 채우고 자기 자신 삭제
						//댓글내용 가져오기

                        
                        console.log("aaaaaqaqaaaaa");
                        
                        if(r_type=="sub"){
                            txt_reply_content = txt_reply_content.replace("→ ","");//대댓글의 뎁스표시(화살표) 없애기
                        }
                        
                        
                        //입력받는 창 등록
                        var replyEditor = 
                           '<tr id="reply_add" class="reply_modify">'+
                           '   <td width="820px">'+
                           '       <textarea name="reply_modify_content_'+reply_id+'" id="reply_modify_content_'+reply_id+'" rows="3" cols="50">'+txt_reply_content+'</textarea>'+ //기존 내용 넣기
                           '   </td>'+
                           '   <td width="100px">'+
                           '       <input type="text" name="reply_modify_writer_'+reply_id+'" id="reply_modify_writer_'+reply_id+'" style="width:100%;" maxlength="10" placeholder="작성자" value="'+txt_reply_writer+'"/>'+ //기존 작성자 넣기
                           '   </td>'+
                           '   <td align="center">'+
                           '       <button name="reply_modify_save" r_type = "'+r_type+'" parent_id="'+parent_id+'" reply_id="'+reply_id+'">등록</button>'+
                           '       <button name="reply_modify_cancel" r_type = "'+r_type+'" r_content = "'+txt_reply_content+'" r_writer = "'+txt_reply_writer+'" parent_id="'+parent_id+'"  reply_id="'+reply_id+'">취소</button>'+
                           '   </td>'+
                           '</tr>';
                        var prevTr = $(this).parent().parent();
                           //자기 위에 붙이기
                        prevTr.after(replyEditor);
                        
                        //자기 자신 삭제
                        $(this).parent().parent().remove(); 
                    }
                     
                });
                
                //댓글 수정 취소
                $(document).on("click","button[name='reply_modify_cancel']", function(){
                    //원래 데이터를 가져온다.
                    var r_type = $(this).attr("r_type");
                    var r_content = $(this).attr("r_content");
                    var r_writer = $(this).attr("r_writer");
                    var reply_id = $(this).attr("reply_id");
                    var parent_id = $(this).attr("parent_id");
                    
                    var reply;
                    //자기 위에 기존 댓글 적고 
                    if(r_type=="main"){
                        reply = 
                            '<tr reply_type="main">'+
                            '   <td width="820px">'+
                            r_content+
                            '   </td>'+
                            '   <td width="100px">'+
                            r_writer+
                            '   </td>'+
                            '   <td align="center">'+
                            '       <button name="reply_reply" reply_id = "'+reply_id+'">댓글</button>'+
                            '       <button name="reply_modify" r_type = "main" parent_id="0" reply_id = "'+reply_id+'">수정</button>      '+
                            '       <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>      '+
                            '   </td>'+
                            '</tr>';
                    }
                    else{
                        reply = 
                            '<tr reply_type="sub">'+
                            '   <td width="820px"> → '+
                            r_content+
                            '   </td>'+
                            '   <td width="100px">'+
                            r_writer+
                            '   </td>'+
                            '   <td align="center">'+
                            '       <button name="reply_modify" r_type = "sub" parent_id="'+parent_id+'" reply_id = "'+reply_id+'">수정</button>'+
                            '       <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>'+
                            '   </td>'+
                            '</tr>';
                    }
                    
                    var prevTr = $(this).parent().parent();
                       //자기 위에 붙이기
                    prevTr.after(reply);
                       
                      //자기 자신 삭제
                    $(this).parent().parent().remove(); 
                      
                    status = false;
                    
                });
                
                  //댓글 수정 저장
                $(document).on("click","button[name='reply_modify_save']", function(){
                    
                    var reply_id = $(this).attr("reply_id");
                    
                    //널 체크
                    if($("#reply_modify_writer_"+reply_id).val().trim() == ""){
                        alert("이름을 입력하세요.");
                        $("#reply_modify_writer_"+reply_id).focus();
                        return false;
                    }
                     
                     
                    if($("#reply_modify_content_"+reply_id).val().trim() == ""){
                        alert("내용을 입력하세요.");
                        $("#reply_modify_content_"+reply_id).focus();
                        return false;
                    }
                    //DB에 업데이트 하고
                    //ajax 호출 (여기에 댓글을 저장하는 로직을 개발)
                    var reply_content = $("#reply_modify_content_"+reply_id).val().replace("\n", "<br>"); //개행처리
                    
                    var r_type = $(this).attr("r_type");
                    
                    var parent_id;
                    var depth;
                    if(r_type=="main"){
                        parent_id = "0";
                        depth = "0";
                    }else{
                        parent_id = $(this).attr("parent_id");
                        depth = "1";
                    }
                    
                    //값 셋팅
                    var objParams = {
                            board_id        : $("#board_id").val(),
                            reply_id        : reply_id,
                            parent_id       : parent_id, 
                            depth           : depth,
                            reply_writer    : $("#reply_modify_writer_"+reply_id).val(),
                            reply_content   : reply_content
                    };
 
                    $.ajax({
                        url         :   "reply/update",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                                return false;
                            }else{
                                reply_id = retVal.reply_id;
                                parent_id = retVal.parent_id;
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    
                    //수정된댓글 내용을 적고
                    if(r_type=="main"){
                        reply = 
                            '<tr reply_type="main">'+
                            '   <td width="820px">'+
                            $("#reply_modify_content_"+reply_id).val()+
                            '   </td>'+
                            '   <td width="100px">'+
                            $("#reply_modify_writer_"+reply_id).val()+
                            '   </td>'+
                            '   <td align="center">'+
                            '       <button name="reply_reply" reply_id = "'+reply_id+'">댓글</button>'+
                            '       <button name="reply_modify" r_type = "main" parent_id = "0" reply_id = "'+reply_id+'">수정</button>      '+
                            '       <button name="reply_del" r_type = "main" reply_id = "'+reply_id+'">삭제</button>      '+
                            '   </td>'+
                            '</tr>';
                    }
                    
                    else{
                        reply = 
                            '<tr reply_type="sub">'+
                            '   <td width="820px"> → '+
                            $("#reply_modify_content_"+reply_id).val()+
                            '   </td>'+
                            '   <td width="100px">'+
                            $("#reply_modify_writer_"+reply_id).val()+
                            '   </td>'+
                            '   <td align="center">'+
                            '       <button name="reply_modify" r_type = "sub" parent_id = "'+parent_id+'" reply_id = "'+reply_id+'">수정</button>'+
                            '       <button name="reply_del" r_type = "sub" reply_id = "'+reply_id+'">삭제</button>'+
                            '   </td>'+
                            '</tr>';
                    }
                    
                    var prevTr = $(this).parent().parent();
                    //자기 위에 붙이기
                    prevTr.after(reply);
                       
                    //자기 자신 삭제
                    $(this).parent().parent().remove(); 
                      
                    status = false;
                    
                });
                  
                //대댓글 입력창
                $(document).on("click","button[name='reply_reply']",function(){ //동적 이벤트
                    
                    if(status){
                        alert("수정과 대댓글은 동시에 불가합니다.");
                        return false;
                    }
                    
                    status = true;
                    
                    $("#reply_add").remove();
                    
                    var reply_id = $(this).attr("reply_id");
                    var last_check = false;//마지막 tr 체크
                    

                    
                    //입력받는 창 등록
                     var replyEditor = 
                        '<tr id="reply_add" class="reply_reply">'+
                        '    <td width="820px">'+
                        '        <textarea name="reply_reply_content" rows="3" cols="50"></textarea>'+
                        '    </td>'+
                        '    <td width="100px">'+
                        ' 		 <input id="reply_reply_writer" name="reply_reply_writer" style="width:100%;" maxlength="10"  value="${user.user_id}" readonly />' +
                        '    </td>'+
                        '    <td align="center">'+
                        '        <button name="reply_reply_save" parent_id="'+reply_id+'">등록</button>'+
                        '        <button name="reply_reply_cancel">취소</button>'+
                        '    </td>'+
                        '</tr>';
                        
                    var prevTr = $(this).parent().parent().next();
                    
                    //부모의 부모 다음이 sub이면 마지막 sub 뒤에 붙인다.
                    //마지막 리플 처리
                    if(prevTr.attr("reply_type") == undefined){
                        prevTr = $(this).parent().parent();
                    }else{
                        while(prevTr.attr("reply_type")=="sub"){//댓글의 다음이 sub면 계속 넘어감
                            prevTr = prevTr.next();
                        }
                        
                        if(prevTr.attr("reply_type") == undefined){//next뒤에 tr이 없다면 마지막이라는 표시를 해주자
                            last_check = true;
                        }else{
                            prevTr = prevTr.prev();
                        }
                        
                    }
                    
                    if(last_check){//마지막이라면 제일 마지막 tr 뒤에 댓글 입력을 붙인다.
                        $('#reply_area tr:last').after(replyEditor);    
                    }else{
                        prevTr.after(replyEditor);
                    }
                    
                });
                
                //대댓글 등록

                $(document).on("click","button[name='reply_reply_save']",function(){
                                       
                    var reply_reply_writer = $("#session_id").val();
                    var reply_reply_content = $("textarea[name='reply_reply_content']");
                    var reply_reply_content_val = reply_reply_content.val().replace("\n", "<br>"); //개행처리
                    

                	// 로그인 이용 체크 
                	if($("#session_id").val() == "") {
                		alert("로그인 후 이용해주세요.");
                		return false;
                	}
                    
                    
                    if(reply_reply_content.val().trim() == ""){
                        alert("내용을 입력하세요.");
                        reply_reply_content.focus();
                        return false;
                    }
                    
                    //값 셋팅
                    var objParams = {
                            board_id        : $("#board_id").val(),
                            parent_id        : $(this).attr("parent_id"),    
                            depth            : "1",
                            reply_writer    : reply_reply_writer,
                            reply_content    : reply_reply_content_val
                    };
                    
                    var reply_id;
                    var parent_id;
                    console.log(reply_reply_writer);
                    
                    //ajax 호출
                    $.ajax({
                        url         :    "reply/save",
                        dataType    :    "json",
                        contentType :    "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :    "post",
                        async       :     false, //동기: false, 비동기: ture
                        data        :    objParams,
                        success     :    function(retVal){
                        	
                            	if(retVal.code != "OK") {
                                alert(retVal.message);
                           		}
                            
	                            else {
	                                reply_id = retVal.reply_id;
	                                parent_id = retVal.parent_id;
	                            }
                            
                        },
                        error        :    function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    
                    var reply = 
                        '<tr reply_type="sub">'+
                        '    <td width="820px"> → '+
                        reply_reply_content_val+
                        '    </td>'+
                        '    <td width="100px">'+
                        reply_reply_writer +
                        '    </td>'+
                        '    <td align="center">'+
                        '       <button name="reply_modify" r_type = "sub" parent_id = "'+parent_id+'" reply_id = "'+reply_id+'">수정</button>'+
                        '       <button name="reply_del" r_type = "sub" reply_id = "'+reply_id+'">삭제</button>'+
                        '    </td>'+
                        '</tr>';
                        
                    var prevTr = $(this).parent().parent().prev();
                    
                    prevTr.after(reply);
                                        
                    $("#reply_add").remove();
                    
                    status = false;
                    
                });
                
                
                
               
                
                //대댓글 입력창 취소
                $(document).on("click","button[name='reply_reply_cancel']",function(){
                    $("#reply_add").remove();
                    
                    status = false;
                });
                
                //글수정
                $("#modify").click(function(){
                    
                    var session_id = $("#session_id").val();
                    var board_writer = $("#board_writer").val();
               
                   
                    if(session_id != board_writer){
                        alert("작성자가 다릅니다.");                        
                        return false;
                    }
                                        
                    //ajax로 패스워드 검수 후 수정 페이지로 포워딩
                    //값 셋팅
                    var objParams = {
                            id         : $("#board_id").val(),    
                    };
                                        
                    //ajax 호출
                    $.ajax({
                        url         :    "check",
                        dataType    :    "json",
                        contentType :    "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :    "post",
                        async       :     false, //동기: false, 비동기: ture
                        data        :    objParams,
                        success     :    
                        	
                        	function(retVal){
 
                            if (retVal.code != "OK") {
                                alert(retVal.message);
                            }
                            
                            else {
                                location.href = "edit?id="+$("#board_id").val();
                            }
                            
                        },
                        error        :    function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    
                });
                
                //글 삭제
                $("#delete").click(function(){
                    
                    var session_id = $("#session_id").val();
                    var board_writer = $("#board_writer").val();
               
                   
                    if(session_id != board_writer){
                        alert("작성자가 다릅니다.");                        
                        return false;
                    }
                    
                    //ajax로 패스워드 검수 후 수정 페이지로 포워딩
                    //값 셋팅
                    var objParams = {
                            id         : $("#board_id").val(),    
                    };
                                        
                    //ajax 호출
                    $.ajax({
                        url         :    "del",
                        dataType    :    "json",
                        contentType :    "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :    "post",
                        async       :     false, //동기: false, 비동기: ture
                        data        :    objParams,
                        success     :    function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                alert("삭제 되었습니다.");
                                location.href = "list";
                            }
                            
                        },
                        error        :    function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    
                });
                
            });
        </script>
    </head>
    <style>
        textarea{
              width:100%;
            }
        .reply_reply {
                border: 2px solid #FF50CF;
            }
        .reply_modify {
                border: 2px solid #FFBB00;
            }
    </style>
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
      
        <input type="hidden" id="board_id" name="board_id" value="${boardView.id}" />
        <input type="hidden" id="board_writer" name="board_writer" value="${boardView.writer}" />
        <input type="hidden" id="session_id" name="session_id" value="${user.user_id}" />
         <div class="container text-center">
        	<div class="col-xs-12">
             <div align="center">
            <br>
            <br>
               <table class="table table-bordered" width="1200px" >
                   <tr> 
                      <td colspan="2" align="right">
                           <button id="modify" name="modify" class="btn" style="background-color:#36518f; color:#E4E8F0">글 수정</button>
                           <button id="delete" name="delete" class="btn" style="background-color:#36518f; color:#E4E8F0">글 삭제</button>
                       </td>
                   </tr>
                   <tr>
                       <td width="900px">
                        제목: ${boardView.subject}
                    </td>
                    <td>
                        작성자: ${boardView.writer}
                    </td>
                   </tr>
                   <tr height="500px">
                       <td colspan="2" valign="top">
                           ${boardView.content}
                       </td>
                   </tr>
               </table>
               <table class="table table-bordered" width="1200px" id="reply_area">
                   <tr reply_type="all"  style="display:none"><!-- 뒤에 댓글 붙이기 쉽게 선언 -->
                       <td colspan="4"></td>
                   </tr>
                   <!-- 댓글이 들어갈 공간 -->
                   <c:forEach var="replyList" items="${replyList}" varStatus="status">
                    <tr reply_type="<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>"><!-- 댓글의 depth 표시 -->
                        <td width="800px">
                            <c:if test="${replyList.depth == '1'}"> → </c:if>${replyList.reply_content}
                        </td>
                        <td width="100px">
                            ${replyList.reply_writer}
                        </td>
                        <!-- 
                            <td width="100px">
                            <input type="password" id="reply_password_${replyList.reply_id}" style="width:100px;" maxlength="10" placeholder="패스워드"/>
                        </td>
                         -->
                        <td align="center">
                            <c:if test="${replyList.depth != '1'}">
                                <button class="btn" style="background-color:#36518f; color:#E4E8F0" name="reply_reply" parent_id = "${replyList.reply_id}" reply_id = "${replyList.reply_id}">댓글</button><!-- 첫 댓글에만 댓글이 추가 대댓글 불가 -->
                            </c:if>
                            <button class="btn" style="background-color:#36518f; color:#E4E8F0" name="reply_modify" parent_id = "${replyList.parent_id}" r_type = "<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>" reply_id = "${replyList.reply_id}">수정</button>
                            <button class="btn" style="background-color:#36518f; color:#E4E8F0" name="reply_del" r_type = "<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>" reply_id = "${replyList.reply_id}">삭제</button>
                        </td>
                    </tr>
                </c:forEach>
               </table>
               <table class="table table-bordered" width="1200px" bordercolor="#46AA46">
                   <tr>
                       <td width="500px">
                        이름 :<input id="reply_writer" name="reply_writer" style="width:170px;" maxlength="10"  value="${user.user_id}" readonly>
                        <button id="reply_save" name="reply_save" class="btn" style="background-color:#36518f; color:#E4E8F0">댓글 등록</button>
                    </td>
                   </tr>
                   <tr>
                       <td>
                           <textarea id="reply_content" name="reply_content" rows="4" cols="50" placeholder="댓글을 입력하세요."></textarea>
                       </td>
                   </tr>
               </table>
               <table class="table table-bordered" width="1200px">
                   <tr>
                       <td align="right">
                           <button id="list" name="list" class="btn" style="background-color:#36518f; color:#E4E8F0">게시판</button>
                       </td>
                   </tr>
               </table>
        </div>
        </div>
        </div>
        
        
        <footer class="py-3" style=" background-color:#263663; color:#C1C8D9">
 <div class="container">
   <p class="text-center" > &copy; 도시락 프로젝트 2020</p>
 </div>

</footer>

    </body>
</html>