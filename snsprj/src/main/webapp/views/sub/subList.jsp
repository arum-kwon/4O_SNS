<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script>
	function userInfoSelect(id) {
		$("#id").val(id); //jquery

		//document.getElementById.value = id; // javascript

		$("#frm").attr("action", "${pageContext.request.contextPath}/UserInfoSelect.do");
		$("#frm").submit();
	}
</script>
<body>
<header>
	<div class="w3-container">
	   <h2  class="w3-margin-top w3-margin-left" ><b>구독자</b></h2>
	   <div class="w3-margin-bottom w3-bottombar w3-padding-small"></div>
	   <c:if test="${empty members}">
	  	  <span class="w3-margin-left">마음에 드는 사람을 찾아 구독해보세요</span>
		  <br><br>
	   </c:if>
	</div>
</header>

	<form id="frm" name="frm">
	<input type="hidden" id="id" name="user_id" >
	<c:if test="${not empty members}">
		<div class="w3-container w3-card w3-white w3-round w3-margin">
			<br>
			<c:forEach items="${members}" var="user"> 
				<!-- 프로필 부분 -->
				<img src="${pageContext.request.contextPath}/common/img/pro/${user.user_pro_img_name}" onclick="userInfoSelect('${user.user_id }')" alt="Avatar" class="w3-left w3-circle w3-margin-right cursor_over" style="width: 60px">
				<h4 onclick="userInfoSelect('${user.user_id }')" class="cursor_over">${user.user_name}</h4>
				<br>
				<hr class="w3-clear">
			</c:forEach>
		</div>
	</c:if>
	</form>

</body>
</html>