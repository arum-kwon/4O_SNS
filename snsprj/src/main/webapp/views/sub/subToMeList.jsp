<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<body>
<!-- 페이지 상단  -->
<header>
  <div class="w3-container">
     <h2  class="w3-margin-top w3-margin-left" ><b>나를 구독하는 사람들</b></h2>
     <div class="w3-margin-bottom w3-bottombar w3-padding-small"></div>
     <c:if test="${empty list}">
	  	  <span class="w3-margin-left">글을 써서 구독자를 모아보세요</span>
		  <br><br>
	 </c:if>
  </div>
</header>

<!-- 리스트 부분 -->
<c:if test="${not empty list}">
<div class="w3-container w3-card w3-white w3-round w3-margin">
<c:forEach items="${list}" var="user" >
  <!-- 프로필 부분 -->
  <img src="${pageContext.request.contextPath}/common/img/pro/${user.user_pro_img_name}" onclick="clickPro('${user.user_id}')" alt="Avatar" class="w3-left w3-circle w3-margin-right cursor_over" style="width:60px">
  <h4 class="cursor_over">${user.user_name}</h4><br>
  <hr class="w3-clear">
</c:forEach>
</div>
</c:if>

<form id="frm" name="frm">
<input type="hidden" id="hid">
</form>



<script>
//프로필 클릭
function clickPro(id){
	hid.setAttribute('name', 'id');
	hid.setAttribute('value', id);
	
	frm.action = '${pageContext.request.contextPath}/UserInfoSelect.do';
	frm.submit();
}
</script>


</body>
</html>