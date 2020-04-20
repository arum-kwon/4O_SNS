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
<form id="frm" name="frm">
	<header>
		<div class="w3-container">
			<h2 class="w3-margin-top w3-margin-left">
				<b>구독추천리스트</b>
			</h2>
			<div class="w3-margin-bottom w3-bottombar w3-padding-small"></div>
		    <c:if test="${empty members}">
			  <span class="w3-margin-left">관심사를 설정하면 구독을 추천해드립니다</span>
			  <br><br>
			</c:if>
		</div>
	</header>
	
<c:if test="${not empty members}">
	<div class="w3-container w3-card w3-white w3-round w3-margin"><br>
<c:forEach items="${members}" var="user" >

  <!-- 프로필 부분 -->
  <img src="${pageContext.request.contextPath}/common/img/pro/${user.user_pro_img_name}" onclick="userInfoSelect('${user.user_id }')" alt="Avatar" class="w3-left w3-circle w3-margin-right cursor_over" style="width:60px">
  <h4 onclick="userInfoSelect('${user.user_id }')"  class="cursor_over">${user.user_name}</h4><br>
    <c:choose>
  	<c:when test="${ user.interest_enter == sessionuser.interest_enter }">
  		<button class="w3-button w3-theme-d2 w3-margin-bottom" style="border: 5px solid #ff7f00">${user.interest_enter}</button>
  	</c:when>
  	<c:otherwise>
  		<c:if test="${ user.interest_enter == null }">
  		
  		</c:if>
  		<c:if test="${ user.interest_enter != null }">
  		<button class="w3-button w3-theme-d2 w3-margin-bottom" >${user.interest_enter}</button>
  		</c:if>
  	</c:otherwise>
  </c:choose>
  
  <c:choose>
  	<c:when test="${ user.interest_life == sessionuser.interest_life }">  	
  		<button class="w3-button w3-theme-d2 w3-margin-bottom" style="border: 5px solid #ff7f00">${user.interest_life}</button>
  	</c:when>
  	<c:otherwise>
  		<c:if test="${ user.interest_life == null }">
  		
  		</c:if>
  		<c:if test="${ user.interest_life != null }">
  		<button class="w3-button w3-theme-d2 w3-margin-bottom" >${user.interest_life}</button>
  		</c:if>
  	</c:otherwise>
  </c:choose>
  <c:choose>
  	<c:when test="${ user.interest_hobby == sessionuser.interest_hobby }">  	
  		<button class="w3-button w3-theme-d2 w3-margin-bottom" style="border: 5px solid #ff7f00">${user.interest_hobby}</button>
  	</c:when>
  	<c:otherwise>
  		<c:if test="${ user.interest_hobby == null }">
  		
  		</c:if>
  		<c:if test="${ user.interest_hobby != null }">
  		<button class="w3-button w3-theme-d2 w3-margin-bottom" >${user.interest_hobby}</button>
  		</c:if>
  	</c:otherwise>
  </c:choose>
  <c:choose>
  	<c:when test="${ user.interest_trends == sessionuser.interest_trends }">  	
  		<button class="w3-button w3-theme-d2 w3-margin-bottom" style="border: 5px solid #ff7f00">${user.interest_trends}</button>
  	</c:when>
  	<c:otherwise>
  		<c:if test="${ user.interest_trends == null }">
  		
  		</c:if>
  		<c:if test="${ user.interest_trends != null }">
  		<button class="w3-button w3-theme-d2 w3-margin-bottom" >${user.interest_trends}</button>
  		</c:if>
  	</c:otherwise>
  </c:choose>
  <hr class="w3-clear">
  
</c:forEach>
</div>
</c:if>		


<input type="hidden" id="user_id" name="user_id" >
</form>




</body>
</html>