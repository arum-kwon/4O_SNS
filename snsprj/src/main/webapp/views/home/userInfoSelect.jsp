<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<script>
	function BoardView(board_no) {		
		$("#board_no").val(board_no);		
		
		$("#frm").attr("action", "${pageContext.request.contextPath}/BoardDetailServlet.do");
		$("#frm").submit();
	}
	$(document).ready(function() {
		var n = "${result}";

		if (n != "") {
			if (n > 0) {
				alert("업데이트가 되었습니다");
			} else {
				alert("업데이트가 실패하였습니다.");
			}
		}
	});
	function myHeaderImgUpt() {
		var HeaderCheck = $('input[name=header_img]:checked').val();
		//	alert(HeaderCheck);
		$("#headChange").attr("src", "${pageContext.request.contextPath}/common/header/" + HeaderCheck);
		$("#myModal2").close();
	}

	function myProImgUpt() {
		var imgCheck = $('input[name=profile_img]:checked').val();
		//	alert(imgCheck);
		$("#imgChange").attr("src", "${pageContext.request.contextPath}/common/image/" + imgCheck);
		$("#myModal").close();
	}

	function back() {
		histroy.go(-1);
	}
</script>
<style>
#title {
	background: #536872;
	color: white;
}
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}

.button1 {
  background-color: white; 
  color: black; 
  border: 2px solid #4CAF50;
}

.button1:hover {
  background-color: #4CAF50;
  color: white;
}

.button2 {
  background-color: white; 
  color: black; 
  border: 2px solid #008CBA;
}

.button2:hover {
  background-color: #008CBA;
  color: white;
}

.button3 {
  background-color: white; 
  color: black; 
  border: 2px solid #f44336;
}

.button3:hover {
  background-color: #f44336;
  color: white;
}

.button4 {
  background-color: white;
  color: black;
  border: 2px solid #e7e7e7;
}

.button4:hover {background-color: #e7e7e7;}

.button5 {
  background-color: white;
  color: black;
  border: 2px solid #555555;
}

.button5:hover {
  background-color: #555555;
  color: white;
}

#table {display: table; width: 100%;}
.row {display: table-row;}
.cell {display: table-cell; padding: 3px; border-bottom: 1px solid #DDD;}
.col1 { width: 25%;}
.col2 {width: 25%;}
.col3 {width: 25%;}
.col4 {width: 25%;}

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

<script>
	// Get the modal
	var modal = document.getElementById('id01');

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
</script>
</head>
<body>

	<form id="frm" name="frm" method="post">
		<input type="hidden" id="board_no" name="board_no">
		<div align="center">
			<div id="title">
				<h1>
					${ member.user_name }의 HOMEPAGE
				</h1>
			</div>
		</div>
		<div align="center">
			<div align="center">
				<img id="imgChange" src="${pageContext.request.contextPath}/common/img/pro/${ member.user_pro_img_name }" class="rounded-circle" alt="엑박" width="150" height="150">
			</div>
		</div>
		<div align="center">
			<div>
				<button id="btnSub" value="${sub}" onclick="clickSub('${member.user_id}')" class=""> </button>
			</div>
		</div>
			<div id="table">
			<div class="row">
				<span class="cell col1" style="background-color: lightgray"><b>아이디</b></span>
				<span class="cell col2" style="background-color: lightgray"><b>닉네임</b></span>
				<span class="cell col3" style="background-color: lightgray"><b>나이</b></span>
				<span class="cell col4" style="background-color: lightgray"><b>성별</b></span>
			</div>
			<div class="row">
				<span class="cell col1">${ member.user_id }</span>
				<span class="cell col2">${ member.user_name }</span>
				<span class="cell col3">${ member.user_birthage }</span>
				<span class="cell col4">
					<c:if test="${ member.user_gender == 'M' }">
						남
					</c:if>
					<c:if test="${ member.user_gender == 'W' }">
						여
					</c:if>
					<c:if test="${ member.user_gender == null }">
					</c:if>
				</span>
						
			</div>
			<div class="row">
				<span class="cell col1" style="background-color: lightgray"><b>가입일</b></span>
				<span class="cell col2" style="background-color: lightgray"><b>직업</b></span>
				<span class="cell col3" style="background-color: lightgray"><b>관심분야1</b></span>
				<span class="cell col4" style="background-color: lightgray"><b>관심분야2</b></span>
			</div>
			<div class="row">
				<span class="cell col1">${ member.user_jdate }</span>
				<span class="cell col2">${ member.user_job }</span>
				<span class="cell col3">
				<c:if test="${ member.interest_enter == null }">
				
				</c:if>
				<c:if test="${ member.interest_enter != null }">
						${ member.interest_enter }&nbsp;
				</c:if>
				<c:if test="${ member.interest_life == null }">
				
				</c:if>
				<c:if test="${ member.interest_life != null }">
						${ member.interest_life }&nbsp;
				</c:if>
				</span>
				<span class="cell col4">
				<c:if test="${ member.interest_hobby == null }">
				
				</c:if>
				<c:if test="${ member.interest_hobby != null }">
						${ member.interest_hobby }&nbsp;
				</c:if>
				<c:if test="${ member.interest_trends == null }">
				
				</c:if>
				<c:if test="${ member.interest_trends != null }">
						${ member.interest_trends }&nbsp;
				</c:if>
				</span>
			</div>
		</div>
		<div align="center">
			<div style="background-color: lightgray"><b>자기소개</b></div>
			<div>${ member.user_info }</div>
		</div>
		
		
		<c:forEach var="board" items="${ boardlist }">
			<div class="w3-col s12 m6 l3">
				<div class="w3-container w3-card w3-white w3-round w3-margin"><br>
					<!-- 프로필 부분 -->
					<img id="imgChange" src="${pageContext.request.contextPath}/common/img/pro/${ board.user_pro_img_name }" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
					<h4 class="user-name">${ board.user_name}</h4><br>	
					<hr class="w3-clear">
					<!-- 본문 부분 -->		  
				    <c:if test="${empty board.board_img}">
				      <p onclick="BoardView(${board.board_no})" class="cursor_over"> ${board.board_content}</p>
				    </c:if>
				    <c:if test="${not empty board.board_img}">
				      <p> <img src="${pageContext.request.contextPath}/common/img/upload/${board.board_img}" onclick="BoardView(${board.board_no})" style="width:100%" alt="Northern Lights" class="w3-margin-bottom cursor_over"> </p>
				    </c:if>
				    <!-- 좋아요 -->
			  	    <button onclick="clickLike(${board.board_no})" id="btn${board.board_no}" name="likeBtn" value="${board.blike}" type="button"> Like <span id="span${board.board_no}"> ${board.board_like}</span> </button> 
				    <span class="w3-right w3-opacity"> ${board.board_wdate} </span>	
				</div>
			</div>
		</c:forEach>
	</form>
	<!-- 값을 보내기 위한 부분 -->
	<form id="frm" name="frm">
		<input type="hidden" id="hid" value="">
	</form>	
	
	
<script type="text/javascript">
	//구독 버튼 버튼 색 입히기
	var on = "w3-button w3-theme-d5 w3-margin-bottom";
	var off = "w3-button w3-theme-d1 w3-margin-bottom";
	var subBtn = document.getElementById("btnSub");
	console.log(subBtn.value);
	
	if (subBtn.value == 0){
		subBtn.innerHTML = "구독하기";
		subBtn.className = off;
	}else{
		subBtn.innerHTML = "구독중  <i class=\"fa fa-check\"></i>";
		subBtn.className = on;
	}
	
	//구독 버튼 클릭
	function clickSub(id){
		btnValue = subBtn.value;
		console.log(btnValue);
		$.ajax({
			url: "${pageContext.request.contextPath}/ClickSubServlet.do",
			data: {"from_id": id, "subCheck": btnValue},
			success: function(date){
				if (btnValue == 0){
					subBtn.innerHTML = "구독중 <i class=\"fa fa-check\"></i>";
						subBtn.value = 1;
						subBtn.className = on;
				}else{
					subBtn.innerHTML = "구독하기"
						subBtn.value = 0;
						subBtn.className = off;
				} 
			},
			error: function(){
				alert("에러 발생. 관리자에게 문의주세요.");
			}
		})
	}
	
	//좋아요 버튼 색 입히기
	var onLike = "w3-button w3-red w3-hover-pale-red w3-margin-bottom";
	var offLike = "w3-button w3-blue-grey w3-margin-bottom";
	var btn = document.getElementsByName("likeBtn");
	for(var i=0 ; btn.length ; i++){
		var val = btn[i].value;
		if (val == 0){
			btn[i].className = offLike;
		}else{
			btn[i].className = onLike;
		}
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