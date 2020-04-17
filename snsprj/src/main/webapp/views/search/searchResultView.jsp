<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<style>
div p {
	overflow: hidden;
	text-overflow: ellipsis;
	height: 160px;
}
h4 {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	height: 40px;
}
</style>

<body>
<c:choose>
<c:when test="${empty searchedPosts }">
	<!-- Header -->
	<header>
		<div class="w3-container">
			<h2  class="w3-margin-top w3-margin-left" ><b>검색 결과</b></h2>
			<div class="w3-margin-bottom w3-bottombar w3-padding-small"></div>
			<span class="w3-margin-left">검색결과가 없습니다.</span>
		</div>    					
	</header>
	
	<div class="w3-col s12 m6 l3">
	</div>
</c:when>

<c:otherwise>
	<header>
		<div class="w3-container">
			<h2  class="w3-margin-top w3-margin-left" ><b>검색 결과</b></h2>
			<div class="w3-margin-bottom w3-bottombar w3-padding-small"></div>
		</div>
	</header>

<c:forEach var="post" items="${searchedPosts }">
	<div class="w3-col s12 m6 l3">
		<div class="w3-container w3-card w3-white w3-round w3-margin"><br>
			<!-- 프로필 부분 -->
			<img src="${pageContext.request.contextPath}/common/img/pro/${post.user_pro_img_name}" onclick="clickPro('${post.user_id}')" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
			<h4>${post.user_name}</h4>
			<hr>
			<!-- 본문 부분 -->		  
			<c:if test="${empty post.board_img}">
				<p onclick="clickBoard(${post.board_no})"> ${post.board_content } </p>
			</c:if>
			<c:if test="${not empty post.board_img}">
				<p><img src="${pageContext.request.contextPath}/common/img/upload/${post.board_img}" onclick="clickBoard(${post.board_no})" style="width:100%" alt="Northern Lights" class="w3-margin-bottom"></p>
			</c:if>
			<!-- 좋아요 -->
			<button onclick="likeBtn(${post.board_no})" id="btn${post.board_no}" name="likeBtn" value="${post.bLike}" type="button"> Like <span id="span${post.board_no}"> ${post.board_like}</span> </button>
			<span class="w3-right w3-opacity"> ${post.board_wdate} </span>
		</div>
	</div>
</c:forEach>
</c:otherwise>
</c:choose>

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
	
	function clickBoard(number){
		hid.setAttribute('name', 'board_no');
		hid.setAttribute('value', number);
		
		frm.action = '${pageContext.request.contextPath}/BoardDetailServlet.do';
		frm.submit();
	}
	
	function clickPro(id){
		hid.setAttribute('name', 'id');
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
				console.log("실패");
			}
		});
	}
</script>

</body>
</html>