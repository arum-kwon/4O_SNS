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
  </div>
</header>

<!-- 리스트 부분 -->
<div class="w3-container w3-card w3-white w3-round w3-margin"><br>
<c:forEach items="${list}" var="user" >
  <!-- 프로필 부분 -->
  <img src="${pageContext.request.contextPath}/common/img/pro/${user.user_pro_img_name}" onclick="clickPro('${user.user_id}')" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
  <h4>${user.user_name}</h4><br>
  <hr class="w3-clear">
</c:forEach>
</div>

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