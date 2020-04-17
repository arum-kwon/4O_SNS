<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<!-- 헤더 -->
<body>
<header>
  <div class="w3-container">
	<h2 class="w3-margin-top  w3-margin-left" ><b>타임라인</b>  </h2>
    <div class="w3-section w3-bottombar w3-padding-16">
    </div>
  </div>
</header>

<!-- 정렬 선택 버튼-->
<div class="w3-container">
  <button id="orderLike" onclick="clikeOrder('liked')" class="w3-button w3-blue-grey w3-margin-bottom"> 추천순으로 보기 </button> &nbsp;&nbsp; 
  <button id="orderLatest" onclick="clikeOrder('latest')" class="w3-button w3-blue-grey w3-margin-bottom"> 시간순으로 보기 </button> 
</div>


<!-- 본문 내용 -->
<c:forEach items="${list}" var="tl" varStatus="status">
<c:if test="${status.index%4 == 0}">
<div class="w3-row">
</c:if>
	<div class="w3-col s12 m6 l3">
	  	<div class="w3-container w3-card w3-white w3-round w3-margin"><br>
		  <!-- 프로필 부분 -->
		  <img src="${pageContext.request.contextPath}/common/img/pro/${tl.user_pro_img_name}" onclick="clickPro('${tl.board.board_user_id}')" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
		  <span class="w3-right w3-opacity"> ${tl.board.board_wdate} </span>
		  <h4>${tl.user_name}</h4><br>
		  <hr class="w3-clear">
		  <!-- 본문 부분 -->		  
		  <c:if test="${empty tl.board.board_img}">
		    <p onclick="clickBoard(${tl.board.board_no})"> ${tl.board.board_content}</p>
		  </c:if>
		  <c:if test="${not empty tl.board.board_img}">
		    <p> <img src="${pageContext.request.contextPath}/common/img/upload/${tl.board.board_img}" onclick="clickBoard(${tl.board.board_no})" style="width:100%" alt="Northern Lights" class="w3-margin-bottom"> </p>
		  </c:if>
		  <!-- 좋아요 -->
	  	  <button onclick="likeBtn(${tl.board.board_no})" id="btn${tl.board.board_no}" name="likeBtn" value="${tl.blike}" type="button"> Like <span id="span${tl.board.board_no}"> ${tl.board.board_like}</span> </button> 
		</div>
	</div>

<c:if test="${status.index%4 == 3}">
</div>
</c:if>
</c:forEach>

<!-- 값을 보내기 위한 부분 -->
<form id="frm" name="frm">
<input type="hidden" id="hid" value="${param.order}">
</form>

<script>
	//정렬하기 
	if(hid.value == 'liked'){
		orderLike.innerHTML = "좋아요순으로 보기 <i class=\"fa fa-check\"></i>";
	}else{
		orderLatest.innerHTML = "최신순으로 보기 <i class=\"fa fa-check\"></i>";
	}
	
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
	
	//정렬 버튼 클릭
	function clikeOrder(order){
		hid.setAttribute('name', 'order');
		hid.setAttribute('value', order);
		
		frm.action = '${pageContext.request.contextPath}/timeline.do';
		frm.submit();
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

</script>


</body>
</html>