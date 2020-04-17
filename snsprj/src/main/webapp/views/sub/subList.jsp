<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<script>
	function userInfoSelect(id) {
		$("#id").val(id); //jquery

		//document.getElementById.value = id; // javascript

		$("#frm").attr("action", "/snsprj/UserInfoSelect.do");
		$("#frm").submit();
	}
</script>
<html>
<body>
	<header>
                   <div class="w3-container">
                      <h2  class="w3-margin-top w3-margin-left" ><b>구독자</b></h2>
                      <div class="w3-margin-bottom w3-bottombar w3-padding-small"></div>
                   </div>
                 </header>

	<form id="frm" name="frm" method="post">
	<input type="hidden" id="id" name="user_id" >
		<div class="w3-container w3-card w3-white w3-round w3-margin">
			<br>
			<c:forEach items="${members}" var="user"> 
				<!-- 프로필 부분 -->
				<img src="/snsprj/common/img/pro/${user.user_pro_img_name}" onclick="userInfoSelect('${user.user_id }')" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width: 60px">
				<h4>${user.user_name}</h4>
				<br>
				<hr class="w3-clear">
			</c:forEach>
		</div>
	</form>

</body>
</html>