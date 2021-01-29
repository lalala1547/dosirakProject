<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

    }


    </script>
  </head>
  
  <title>Document</title>

  <body>
  
  
       <div align="center">
          <table width="1200px">
			<c:forEach var="Food" items="${Food}" varStatus ="status">
                <tr>
                     <th width="50px">
                         아침 칼로리
                     </th>
                     <th width="850px">
                         아침 음식
                     </th>
                     <th width="100px">
                         점심 칼로리
                     </th>
                     <th width="200px">
                         점심 음식
                     </th>
                 </tr>
	             <tr>
                     <th width="50px">
                         ${Food.breakfast}
                     </th>
                     <th width="850px">
                         ${Food.breakfast_food}
                     </th>
                     <th width="100px">
                          ${Food.lunch}
                     </th>
                     <th width="200px">
                          ${Food.lunch_food}
                     </th>
	             </tr>
             </c:forEach>
            </table>
           </div>
  </body>
  </html>