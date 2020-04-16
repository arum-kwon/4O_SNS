<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<body>

<h1>나를 구독하는 사람들</h1>

<div class="w3-container w3-card w3-white w3-round w3-margin"><br>
<c:forEach items="${list}" var="user" >

  <!-- 프로필 부분 -->
  <img src="/snsprj/common/img/pro/${user.user_pro_img_name}" onclick="clickPro('${user.user_id}')" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
  <h4>${user.user_name}</h4><br>
  <hr class="w3-clear">
  
</c:forEach>
</div>

<form id="frm" name="frm">
<input type="hidden" id="hid">
</form>

<script>
function clickPro(id){
	hid.setAttribute('name', 'user_id');
	hid.setAttribute('value', id);
	
	frm.action = '/snsprj/UserInfoSelect.do';
	frm.submit();
}

</script>


</body>
</html>