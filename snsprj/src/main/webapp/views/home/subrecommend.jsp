<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<script>
	function userInfoSelect(id) {				
		$("#user_id").val(id); //jquery

		//document.getElementById.value = id; // javascript

		$("#frm").attr("action", "/snsprj/UserInfoSelect.do");
		$("#frm").submit();
	}
</script>
<html>
<style>
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}

.button1 {
  background-color: white; 
  color: black; 
  border: 2px solid #4CAF50;
}

.button2 {
  background-color: white; 
  color: black; 
  border: 2px solid #008CBA;
}

.button3 {
  background-color: white; 
  color: black; 
  border: 2px solid #f44336;
}

.button4 {
  background-color: white;
  color: black;
  border: 2px solid #e7e7e7;
}

.button5 {
  background-color: white;
  color: black;
  border: 2px solid #555555;
}
</style>
<body>
<form id="frm" name="frm" method="post">
	<header>
		<div class="w3-container">
			<h2 class="w3-margin-top w3-margin-left">
				<b>구독추천리스트</b>
			</h2>
			<div class="w3-margin-bottom w3-bottombar w3-padding-small"></div>
		</div>
	</header>

	<div class="w3-container w3-card w3-white w3-round w3-margin"><br>
<c:forEach items="${members}" var="user" >

  <!-- 프로필 부분 -->
  <img src="/snsprj/common/img/pro/${user.user_pro_img_name}" onclick="userInfoSelect('${user.user_id }')" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
  <h4>${user.user_name}</h4><br>
  <c:choose>
  	<c:when test="${ user.interest_enter == sessionuser.interest_enter }">  	
  		<button class="button button3">${user.interest_enter}</button>
  	</c:when>
  	<c:otherwise>
  		<button class="button button5">${user.interest_enter}</button>
  	</c:otherwise>
  </c:choose>
  <c:choose>
  	<c:when test="${ user.interest_life == sessionuser.interest_life }">  	
  		<button class="button button3">${user.interest_life}</button>
  	</c:when>
  	<c:otherwise>
  		<button class="button button5">${user.interest_life}</button>
  	</c:otherwise>
  </c:choose>
  <c:choose>
  	<c:when test="${ user.interest_hobby == sessionuser.interest_hobby }">  	
  		<button class="button button3">${user.interest_hobby}</button>
  	</c:when>
  	<c:otherwise>
  		<button class="button button5">${user.interest_hobby}</button>
  	</c:otherwise>
  </c:choose>
  <c:choose>
  	<c:when test="${ user.interest_trends == sessionuser.interest_trends }">  	
  		<button class="button button3">${user.interest_trends}</button>
  	</c:when>
  	<c:otherwise>
  		<button class="button button5">${user.interest_trends}</button>
  	</c:otherwise>
  </c:choose>
  <hr class="w3-clear">
  
</c:forEach>
</div>
			


<input type="hidden" id="user_id" name="user_id" >
</form>




</body>
</html>