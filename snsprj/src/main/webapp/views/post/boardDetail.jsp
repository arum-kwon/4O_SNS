<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<body>

<div class="w3-container w3-card w3-white w3-round w3-margin"><br>
  <!-- 프로필 부분 -->
  <img src="${pageContext.request.contextPath}/common/img/pro/${board.user_pro_img_name}" onclick="clickPro('${board.board.board_user_id}')" alt="Avatar" class="w3-left w3-circle w3-margin-right cursor_over" style="width:60px">
  <span class="w3-right w3-opacity"> ${board.board.board_wdate} </span>
  <h4  onclick="clickPro('${board.board.board_user_id}')" class="cursor_over">${board.user_name}</h4><br>
  <hr class="w3-clear">
  <!-- 본문 부분 -->		  
  <c:if test="${not empty board.board.board_img}">
  	<p><img src="${pageContext.request.contextPath}/common/img/upload/${board.board.board_img}" style="width:100%" alt="Northern Lights" class="w3-margin-bottom"></p>
  </c:if>
  <p onclick="clickBoard(${board.board.board_no})"> ${board.board.board_content} </p>
  <!-- 좋아요 -->
  <button onclick="likeBtn(${board.board.board_no})" id="btn${board.board.board_no}" name="likeBtn" value="${board.blike}" type="button"> Like <span id="span${board.board.board_no}"> ${board.board.board_like} </span></button> 

  <h6><b> 댓글 </b></h6>
  <form name="writeFrom" id="writeFrom">
	<textarea id ="content" name="content" placeholder="내 용" style="width:100%"></textarea>
	<div align ="center">
		<button type="button" onClick="checkedSubmit(${board.board.board_no})" class="w3-button w3-blue-grey w3-round w3-padding-small w3-margin-bottom">등 록</button>
		<button type="reset" class="w3-button w3-blue-grey w3-round w3-padding-small w3-margin-bottom">취 소</button>
	<input type="hidden" id="commentHid">
	</div>
  </form>
  <c:forEach items="${commentList}" var="map" varStatus="status">
	<hr>
    <!--댓글 프로필 부분 -->
    <img src="${pageContext.request.contextPath}/common/img/pro/${map.user_pro_img_name}" onclick="clickPro('${map.comment.user_id}')" alt="Avatar" class="w3-left w3-circle w3-margin-right cursor_over" style="width:60px">
    <span class="w3-right w3-opacity"> ${map.comment.wdate} </span>
    <h4 onclick="clickPro('${map.comment.user_id}')" class="cursor_over">${map.user_name}</h4>
    <!--댓글  본문 부분 -->		  
    <p > ${map.comment.comment_content}</p>
  </c:forEach>
</div>

<form id="frm" name="frm">
	<input type="hidden" id="hid">
</form>

<script>
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

function clickPro(id){
	hid.setAttribute('name', 'user_id');
	hid.setAttribute('value', id);
	
	frm.action = '${pageContext.request.contextPath}/UserInfoSelect.do';
	frm.submit();
}
function likeBtn(number){
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

function checkedSubmit(number) {
	commentHid.setAttribute('name', 'board_no');
	commentHid.setAttribute('value', number);
	
	writeFrom.action = '${pageContext.request.contextPath}/CommentInsertServlet.do';
	writeFrom.submit();
}

</script>


</body>
</html>