<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type = "text/javascript">
   function formClose(n) {
      if(n != 0){
         opener.document.getElementById("User_id").value = '';
         opener.document.getElementById("User_id").focus();
      } else {
         opener.document.getElementById("User_name").focus();
      }
      window.close();
   }
</script>

</head>
<body>
<div align="center">
   <c:if test="${check == '0' }">
      <h3>${id } 는 사용가능한 아이디 입니다.</h3>
   </c:if>
   <c:if test = "${check =='1' }">
      <h3>${id } 는 이미 사용하고 있는 아이디 입니다.</h3>
   </c:if>
   
      
   <button type="button" onclick="formClose(${check})">확인</button>
   </div>
</body>
</html>