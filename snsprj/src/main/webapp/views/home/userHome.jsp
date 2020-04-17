<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>userHome.jsp</title>
<script>
<!-- 검색버튼 구현 연습 -->
	/* function searchdo(){
	var search1 = $("#search").val();
	location.href = "/snsprj/userHome.do?search="+search1;
	} */
	function BoardView(board_no, user_id) {
		$("#board_no").val(board_no);

		$("#frm").attr("action", "/snsprj/BoardView.do");
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
		$("#headChange").attr("src", "/snsprj/common/header/" + HeaderCheck);
		$("#myModal2").close();
	}

	function myProImgUpt() {
		var imgCheck = $('input[name=profile_img]:checked').val();
		//	alert(imgCheck);
		$("#imgChange").attr("src", "/snsprj/common/image/" + imgCheck);
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
					MY HOMEPAGE
				</h1>
			</div>
		</div>
		<div align="center">
			<div align="center"><img id="imgChange" src="${pageContext.request.contextPath}/common/img/pro/${ userinfo[0].user_pro_img_name }" class="rounded-circle" alt="엑박" width="150" height="150"></span>
		</div>
		<div align="center">
			<div><button type="button" class="w3-button w3-theme-d1 w3-margin-bottom" onclick="location.href='userHomeUpdatePage.do'">수정페이지</button></div>
		</div>
			<div id="table">
			<div class="row">
				<span class="cell col1" style="background-color: lightgray"><b>아이디</b></span>
				<span class="cell col2" style="background-color: lightgray"><b>닉네임</b></span>
				<span class="cell col3" style="background-color: lightgray"><b>나이</b></span>
				<span class="cell col4" style="background-color: lightgray"><b>성별</b></span>
			</div>
			<div class="row">
				<span class="cell col1">${ userinfo[0].user_id }</span>
				<span class="cell col2">${ userinfo[0].user_name }</span>
				<span class="cell col3">${ userinfo[0].user_birthage }</span>
				<span class="cell col4">
					<c:choose>
						<c:when test="${ userinfo[0].user_gender == 'M' }">
								<input type="radio" id="user_gender" name="user_gender" value="M" > 남자 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</c:when>
						<c:otherwise>
								여
						</c:otherwise>
					</c:choose></span>
			</div>
			<div class="row">
				<span class="cell col1" style="background-color: lightgray"><b>가입일</b></span>
				<span class="cell col2" style="background-color: lightgray"><b>직업</b></span>
				<span class="cell col3" style="background-color: lightgray"><b>관심분야1</b></span>
				<span class="cell col4" style="background-color: lightgray"><b>관심분야2</b></span>
			</div>
			<div class="row">
				<span class="cell col1">${ userinfo[0].user_jdate }</span>
				<span class="cell col2">${ userinfo[0].user_job }</span>
				<span class="cell col3">${ userinfo[0].interest_enter },
										${ userinfo[0].interest_life }</span>
				<span class="cell col4">${ userinfo[0].interest_hobby },
										${ userinfo[0].interest_trends }</span>
			</div>
		</div>
			<div align="center">
				<div style="background-color: lightgray"><b>자기소개</b></div>
				<div>${ userinfo[0].user_info }</div>
			</div>
		
		
		
		
		<c:forEach var="board" items="${ userinfo }">
		<div class="w3-col s12 m6 l3" onclick="BoardView('${board.board_no}')">
			<div class="w3-container w3-card w3-white w3-round w3-margin"><br>
			<!-- 프로필 부분 -->
				<img id="imgChange" src="${pageContext.request.contextPath}/common/img/pro/${ board.user_pro_img_name }" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
				<span class="w3-right w3-opacity"> ${ board.board_wdate } </span>
				<h4>${ board.user_name}</h4><br>	
				<hr class="w3-clear">
				<!-- 본문 부분 -->
				<p>${ board.board_content }</p>				
				<button onclick="likeBtn(${board.board_no})" type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i> Like ${ board.board_like }</button>							
			</div>
		</div>
		</c:forEach>
	</form>
	
</body>
</html>