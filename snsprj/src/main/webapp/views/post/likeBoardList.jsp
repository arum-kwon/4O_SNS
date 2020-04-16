<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<body>
<c:forEach items="${list}" var="tl" varStatus="status">
<c:if test="${status.index%4 == 0}">
<div class="w3-row">
</c:if>

	<div class="w3-col s12 m6 l3">
	  	<div class="w3-container w3-card w3-white w3-round w3-margin"><br>
		  <!-- 프로필 부분 -->
		  <img src="/snsprj/common/img/pro/${tl.user_pro_img_name}" onclick="clickPro('${tl.board.board_user_id}')" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
		  <span class="w3-right w3-opacity"> ${tl.board.board_wdate} </span>
		  <h4>${tl.user_name}</h4><br>
		  <hr class="w3-clear">
		  <!-- 본문 부분 -->		  
		  <c:if test="${empty tl.board.board_img}">
		    <p onclick="clickBoard(${tl.board.board_no})"> ${tl.board.board_content} </p>
		  </c:if>
		  <c:if test="${not empty tl.board.board_img}">
		    <img src="/snsprj/common/img/upload/${tl.board.board_img}" onclick="clickBoard(${tl.board.board_no})" style="width:100%" alt="Northern Lights" class="w3-margin-bottom">
		  </c:if>
		  <!-- 좋아요 -->
		  <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i> Like ${tl.board.board_like}</button> 
		</div>
	</div>

<c:if test="${status.index%4 == 3}">
</div>
</c:if>
</c:forEach>


<form id="frm" name="frm">
<input type="hidden" id="hid">
</form>

<script>
function clickBoard(number){
	hid.setAttribute('name', 'board_no');
	hid.setAttribute('value', number);
	
	frm.action = '/snsprj/BoardDetailServlet.do';
	frm.submit();
}
function clickPro(id){
	hid.setAttribute('name', 'user_id');
	hid.setAttribute('value', id);
	
	frm.action = '/snsprj/UserInfoSelect.do';
	frm.submit();
}

</script>


</body>
</html>