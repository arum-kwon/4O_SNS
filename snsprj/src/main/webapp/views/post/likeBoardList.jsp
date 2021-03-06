<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style>
div p {
	overflow: hidden;
	text-overflow: ellipsis;
	height: 160px;
}
h4.user-name {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	height: 40px;
}
</style>

<body>
<!-- 페이지 상단  -->
<header>
  <div class="w3-container">
    <h2  class="w3-margin-top w3-margin-left" ><b>좋아하는 글</b></h2>
    <div class="w3-margin-bottom w3-bottombar w3-padding-small"></div>
	<c:if test="${empty list}">
		<span class="w3-margin-left">좋아요를 누른 글을 여기서 모아볼 수 있습니다</span>
		<br><br>
	</c:if>
  </div>
</header>

<!-- 리스트  -->
<c:forEach items="${list}" var="tl" varStatus="status">
	<div class="w3-col s12 m6 l3">
	  	<div class="w3-container w3-card w3-white w3-round w3-margin"><br>
		  <!-- 프로필 부분 -->
		  <img src="${pageContext.request.contextPath}/common/img/pro/${tl.user_pro_img_name}" onclick="clickPro('${tl.board.board_user_id}')" alt="Avatar" class="w3-left w3-circle w3-margin-right cursor_over" style="width:60px">
		  <h4 onclick="clickPro('${tl.board.board_user_id}')" class="user-name cursor_over">${tl.user_name}</h4>
		  <hr>
		  <!-- 본문 부분 -->		  
		  <c:if test="${empty tl.board.board_img}">
		    <p onclick="clickBoard(${tl.board.board_no})" class="cursor_over"> ${tl.board.board_content} </p>
		  </c:if>
		  <c:if test="${not empty tl.board.board_img}">
		    <p><img src="${pageContext.request.contextPath}/common/img/upload/${tl.board.board_img}" onclick="clickBoard(${tl.board.board_no})" style="width:100%" alt="Northern Lights" class="w3-margin-bottom cursor_over"> </p>
		  </c:if>
		  <!-- 좋아요 -->
	  	  <button onclick="clickLike(${tl.board.board_no})" id="btn${tl.board.board_no}" name="likeBtn" value="1" type="button"> Like <span id="span${tl.board.board_no}">${tl.board.board_like}</span> </button> 
		  <span class="w3-right w3-opacity"> ${tl.board.board_wdate} </span>
		</div>
	</div>

</c:forEach>


<form id="frm" name="frm">
<input type="hidden" id="hid">
</form>


<script>
//좋아요 버튼 색 입히기
var onLike = "w3-button w3-red w3-hover-pale-red w3-margin-bottom";
var offLike = "w3-button w3-blue-grey w3-margin-bottom";
var btn = document.getElementsByName("likeBtn");
for(var i=0 ; btn.length ; i++){
	if (btn[i].value == 0){
		btn[i].className = offLike;
	}else{
		btn[i].className = onLike;
	}
}

//게시글을 클릭
function clickBoard(number){
	hid.setAttribute('name', 'board_no');
	hid.setAttribute('value', number);
	
	frm.action = '${pageContext.request.contextPath}/BoardDetailServlet.do';
	frm.submit();
}

//프로필 클릭
function clickPro(id){
	hid.setAttribute('name', 'user_id');
	hid.setAttribute('value', id);
	
	frm.action = '${pageContext.request.contextPath}/UserInfoSelect.do';
	frm.submit();
}

//좋아요 버튼 클릭
function clickLike(number){
	var btn = document.getElementById("btn" + number);
	var btnValue = btn.value;
	var span = document.getElementById("span" + number);
	var val = span.innerHTML;
	
	$.ajax({
		url: "${pageContext.request.contextPath}/ClickLikeServlet.do",
		data: {"board_no": number, "bLike": btnValue},
		success: function(date){
			if (btnValue == 0){
				btn.className = onLike;
				btn.value = 1;
				span.innerHTML = parseInt(span.innerHTML) + 1;
			}else{
				btn.className = offLike;
				btn.value = 0;
				span.innerHTML = parseInt(span.innerHTML) - 1;
			} 
		},
		error: function(){
			alert("에러 발생. 관리자에게 문의주세요.");
		}
	})
}

</script>


</body>
</html>