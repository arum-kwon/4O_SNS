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
#div1 {
	width: 100px;
	height: 100px
}

#table1 {
	width: 304px;
}

body, h1, h2, h3, h4, h5, h6 {
	/* background-color: white; */
	/* background-image: url('common/image/logo.png'); */
	font-family: "Raleway", sans-serif;
}

p {
	text-align: center;
}

hr {
	color: black;
	border: solid 1px;
}

#title {
	background: black;
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

	<!-- Sidebar/menu -->
	<form id="frm" name="frm" method="post">
		<input type="hidden" id="board_no" name="board_no">
		<div align="center">
			<div id="title">
				<h1>
					<b>개인정보 홈</b>
				</h1>
			</div>
		</div>
		<div align="center">
			<img id="imgChange" src="${pageContext.request.contextPath}/common/img/pro/${ userinfo[0].user_pro_img_name }" class="rounded-circle" alt="엑박" width="150" height="150">
			
		</div><br>
		<div align="center">
		<button class="button button2" type="button" onclick="location.href='userHomeUpdatePage.do'">수정 페이지</button>		
		</div><br>
		<table align="center">
			<tr>
				<th>닉네임</th> <td>${ userinfo[0].user_name }</td>
			</tr> 
			<tr>
				<th>나이</th> <td>${ userinfo[0].user_birthage }</td>
			</tr>
			<tr>
				<th>성별</th> 
					<td>
						<c:choose>
							<c:when test="${ userinfo[0].user_gender == 'M'}"> 
							남
							</c:when>
							<c:otherwise>
							여
							</c:otherwise>
						</c:choose>
					</td>
			</tr>
			<tr>
				<th>직업</th> <td>${ userinfo[0].user_job }</td>
			</tr>
			<tr>
				<th>엔터테이먼트</th> <td>${ userinfo[0].interest_enter }</td>
			</tr>
			<tr>
				<th>생활</th> <td>${ userinfo[0].interest_life }</td>
			</tr>
			<tr>
				<th>취미</th> <td> ${ userinfo[0].interest_hobby }</td>
			</tr>
			<tr>
				<th>동향</th> <td>${ userinfo[0].interest_trends }</td>
			</tr>
			<tr>
				<th>자기소개</th> <td>${ userinfo[0].user_info }</td>
			</tr>				
		</table>
		<div align="center">
			<div id="title">
				<h1>
					<b>타임라인</b>
				</h1>
			</div>
		</div>

		<%-- 기존 타임라인  시작
		<div class="w9-row-padding">
			<c:forEach var="board" items="${ userinfo }">
				<div class="w3-third w3-container w3-margin-bottom"
					onclick="BoardView('${board.board_no}')">
					<p>
						<b>글 번호: ${ board.board_no }
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							작성시간: ${ board.board_wdate }</b>
					</p>
					<div
						style="border: 1px solid black; padding: 10px; height: 300px;; min-height: 100px; overflow: hidden;">
						<p>${ board.board_content }</p>
					</div>
					<div class="w3-container">
						<p align="center">좋아요: ${ board.board_like }&nbsp;★</p>
					</div>
				</div>
			</c:forEach>
		</div> 
		기존타임라인 끝
		--%>
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
				<button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i> Like ${ board.board_like }</button>				
			</div>
		</div>
		</c:forEach>
	</form>
</body>
</html>