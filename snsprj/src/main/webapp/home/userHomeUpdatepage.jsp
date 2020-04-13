<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<title>userHomeUpdate.jsp</title>
<script>
$(document).ready(function(){
	var n = "${result}"; 
	
	if(n != ""){
		if(n>0){
			alert("업데이트가 되었습니다");	
		}else{
			alert("업데이트가 실패하였습니다.");
		}
	}
});
function myHeaderImgUpt(){
	var HeaderCheck = $('input[name=header_img]:checked').val();
//	alert(HeaderCheck);
	$("#headChange").attr("src","/snsprj/common/header/" + HeaderCheck);
	$("#myModal2").close();
} 
function myProImgUpt (){
	var imgCheck = $('input[name=profile_img]:checked').val();
//	alert(imgCheck);
	$("#imgChange").attr("src","/snsprj/common/image/" + imgCheck);
	$("#myModal").close();
}
function userInfoUpdate(){
	$("#frm").attr("action","/snsprj/UserHomeUpdate.do");
	$("#frm").submit();
}
function back(){
	histroy.go(-1);
}
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}
}
</script>
<style>
#table2,#table1 { display: inline-block; }
#div2 { display: inline-block;}
body {
	background-color: white;
	background-image: url('common/image/logo.png');	
}
</style>
</head>
<body>
<h1 align="center">개인정보 수정</h1>
	<form id="frm" name="frm" method="post">
<div id="div1" align="center">
	
	<table id="table1" border="1">
		<tr>
			<th>프로필사진</th>
			<td>
			<div class="container">
			<img id="imgChange" src="/snsprj/common/image/${ members[0].user_pro_img_name }" width="150px" height="100px" />
									<!-- Trigger the modal with a button -->
									<button type="button" class="btn btn-info btn-lg"
										data-toggle="modal" data-target="#myModal">프로필 수정</button>

									<!-- Modal -->
									<div class="modal fade" id="myModal" role="dialog">
										<div class="modal-dialog">
											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
													<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
													<h4>프로필 사진 수정하기</h4>
												</div>
												<div class="modal-body">
													<c:choose>
														<c:when test="${ members[0].user_pro_img_name == 'profile_img_1.jpg' }">
															<input type="radio" id="picture1" name="profile_img" value="profile_img_1.jpg" checked>
														</c:when>
														<c:otherwise>
															<input type="radio" id="picture1" name="profile_img" value="profile_img_1.jpg">
														</c:otherwise>
													</c:choose>
													<img src="common/image/profile_img_1.jpg" class="rounded-circle" alt="Cinque Terre" width="150" height="150">
													
													<c:choose>
														<c:when test="${ members[0].user_pro_img_name == 'profile_img_2.jpg' }">
															<input type="radio" id="picture2" name="profile_img" value="profile_img_2.jpg" checked>
														</c:when>
														<c:otherwise>
															<input type="radio" id="picture2" name="profile_img" value="profile_img_2.jpg">
														</c:otherwise>
													</c:choose>
													<img src="common/image/profile_img_2.jpg" class="rounded-circle" alt="Cinque Terre" width="150" height="150">
												</div>
												
												<div class="modal-body">
													<c:if test="${ members[0].user_pro_img_name == 'profile_img_3.jpg' }">
														<input type="radio" id="picture3" name="profile_img" value="profile_img_3.jpg" checked>
													</c:if>
													<c:if test="${ members[0].user_pro_img_name != 'profile_img_3.jpg' }">
														<input type="radio" id="picture3" name="profile_img" value="profile_img_3.jpg">
													</c:if>
													
													<img src="common/image/profile_img_3.jpg" class="rounded-circle" alt="Cinque Terre" width="150" height="150">
													<c:choose>
														<c:when test="${ members[0].user_pro_img_name == 'profile_img_4.jpg' }">
															<input type="radio" id="picture4" name="profile_img" value="profile_img_4.jpg" checked>
														</c:when>
														<c:otherwise>
															<input type="radio" id="picture4" name="profile_img" value="profile_img_4.jpg">
														</c:otherwise>
													</c:choose>										
													<img src="common/image/profile_img_4.jpg" class="rounded-circle" alt="Cinque Terre" width="150" height="150">
												</div>
												<div class="modal-body">
													<c:choose>
														<c:when test="${ members[0].user_pro_img_name == 'profile_img_5.jpg' }">
															<input type="radio" id="picture5" name="profile_img" value="profile_img_5.jpg" checked>
														</c:when>
														<c:otherwise>
															<input type="radio" id="picture5" name="profile_img" value="profile_img_5.jpg">
														</c:otherwise>
													</c:choose>
													<img src="common/image/profile_img_5.jpg" class="rounded-circle" alt="Cinque Terre" width="150" height="150">
													<c:choose>
														<c:when test="${ members[0].user_pro_img_name == 'profile_img_6.jpg' }">
															<input type="radio" id="picture6" name="profile_img" value="profile_img_6.jpg" checked>
														</c:when>
														<c:otherwise>
															<input type="radio" id="picture6" name="profile_img" value="profile_img_6.jpg">
														</c:otherwise>
													</c:choose>												
													<img src="common/image/profile_img_6.jpg" class="rounded-circle" alt="Cinque Terre" width="150" height="150">
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal" onclick="myProImgUpt();">수정하기</button>
														<button type="button" class="btn btn-default"
														data-dismiss="modal">취소</button>
												</div>
											</div>

										</div>
									</div>

								</div>
			</td>
		<tr>
		<tr>
			<th>ID</th>
			<td><input type="text" id="user_id" name="user_id" value="${ members[0].user_id }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" id="user_name" name="user_name" value="${ members[0].user_name }"></td>
		</tr>
		<tr>
			<th>직업</th>
			<td><input type="text" id="user_job" name="user_job" value="${ members[0].user_job }"></td>
		</tr>
		<tr>
			<th>자기소개</th>
			<td><textarea cols="50" rows="10" id="user_info" name="user_info">${ members[0].user_info }</textarea></td>
		</tr>
		</table>
		<div id="div2">
		<table id="table2" border="1">
		<tr align="center">
			<th colspan="10">취미 선택</th>
		</tr>
		<tr>
		<th>엔터테이먼트</th><th>생활</th><th>취미</th><th>동향</th>	
		</tr>
		<tr>
			<td><input type="radio" id="interest_enter" name="interest_enter">${ members[0].interest_enter }</td>
			<td><input type="radio">문학</td>
			<td><input type="radio">영화</td>
			<td><input type="radio">미술</td>
			<td><input type="radio">공연</td>
			<td><input type="radio">음악</td>
			<td><input type="radio">드라마</td>
			<td><input type="radio">연예인</td>
			<td><input type="radio">만화</td> 
		</tr>
		<tr>
			
			<td><input type="radio" id="interest_life" name="interest_life">${ members[0].interest_life }</td>
			<td><input type="radio">생각</td> 
			<td><input type="radio">결혼</td> 
			<td><input type="radio">반려동물</td> 
			<td><input type="radio">좋은글</td> 
			<td><input type="radio">패션</td> 
			<td><input type="radio">인테리어</td> 
			<td><input type="radio">요리</td> 
			<td><input type="radio">쇼핑</td> 
		</tr>
		<tr>
		
			<td><input type="radio" id="interest_hobby" name="interest_hobby">${ members[0].interest_hobby }</td>
			<td><input type="radio">게임</td> 
			<td><input type="radio">스포츠</td> 
			<td><input type="radio">사진</td> 
			<td><input type="radio">자동차</td> 
			<td><input type="radio">국내여행</td> 
			<td><input type="radio">세계여행</td> 
			<td><input type="radio">맛집</td>
			<td><input type="radio">명상</td>  
		</tr>
		<tr>
			
			<td><input type="radio" id="interest_trends" name="interest_trends">${ members[0].interest_trends }</td>
			<td><input type="radio">IT</td> 
			<td><input type="radio">사회</td> 
			<td><input type="radio">건강</td> 
			<td><input type="radio">경제</td> 
			<td><input type="radio">외국어</td> 
			<td><input type="radio">교육</td>
			<td><input type="radio">스포츠</td>
			<td><input type="radio">기계</td>
		</tr>		
	</table>
		<br>
	</div>
	<div>
		<button type="button" onclick="userInfoUpdate()">수정하기</button>
		<button type="reset">취소</button>
		<button id="back" type="button" onclick="location.href='/snsprj/userHome.do'">개인정보 홈</button>
		</div>
	</form>
</body>
</html>