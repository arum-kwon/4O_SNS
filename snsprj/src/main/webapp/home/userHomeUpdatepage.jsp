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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
#table2,#table1 { display: inline-block;}

#div2 { display: inline-block;}
body{
	background-color: #536872;
}
hr{ color: black; border: solid 1px;}
#title { background: black; color: white;}
</style>
</head>
<body class="w3-content" style="max-width:1300px">
<form id="frm" name="frm" method="post">
	<div id="title" align="center">
		<h1>개인정보 수정</h1>
		<div id="div1" class="w3-center-align w3-blue-grey w3-container" style="height:auto;"><br>
		<div class="w3-padding-64 w3-center">
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
		<div id="div2" align="center">
		<table id="table2" border="1" >
		<tr align="center">
			<th colspan="10">취미 선택</th>
		</tr>
		<tr>
		<th>엔터테이먼트</th><th>생활</th><th>취미</th><th>동향</th>	
		</tr>
		<tr>
		<td>
		<c:choose>
			<c:when test="${ members[0].interest_enter == '문학' }">
				<input type="radio" id="interest_enter" name="interest_enter" value="문학" checked>문학
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_enter" name="interest_enter" value="문학">문학
			</c:otherwise>
		</c:choose>
		</td>		
		<td>
		<c:choose>
			<c:when test="${ members[0].interest_life == '생각' }">
				<input type="radio" id="interest_life" name="interest_life" value="생각" checked>생각		
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_life" name="interest_life" value="생각">생각
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ members[0].interest_hobby == '게임' }">
				<input type="radio" id="interest_hobby" name="interest_hobby" value="게임" checked>게임
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_hobby" name="interest_hobby" value="게임">게임		
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ members[0].interest_trends == 'IT' }">
				<input type="radio" id="interest_trends" name="interest_trends" value="IT" checked>IT
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_trends" name="interest_trends" value="IT">IT
			</c:otherwise>
		</c:choose>
		</td>		
		</tr>
		<tr>
		<td>
		<c:choose>
			<c:when test="${ members[0].interest_enter == '영화' }">
				<input type="radio" id="interest_enter" name="interest_enter" value="영화" checked>영화
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_enter" name="interest_enter" value="영화">영화
			</c:otherwise>
		</c:choose>
		</td>		
		<td>
		<c:choose>
			<c:when test="${ members[0].interest_life == '결혼' }">
				<input type="radio" id="interest_life" name="interest_life" value="결혼" checked>결혼		
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_life" name="interest_life" value="결혼">결혼
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ members[0].interest_hobby == '스포츠' }">
				<input type="radio" id="interest_hobby" name="interest_hobby" value="스포츠" checked>스포츠
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_hobby" name="interest_hobby" value="스포츠">스포츠		
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ members[0].interest_trends == '사회' }">
				<input type="radio" id="interest_trends" name="interest_trends" value="사회" checked>사회
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_trends" name="interest_trends" value="사회">사회
			</c:otherwise>
		</c:choose>
		</td>		
		</tr>
		<tr>
		<td>
		<c:choose>
			<c:when test="${ members[0].interest_enter == '미술' }">
				<input type="radio" id="interest_enter" name="interest_enter" value=미술 checked>미술
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_enter" name="interest_enter" value="미술">미술
			</c:otherwise>
		</c:choose>
		</td>		
		<td>
		<c:choose>
			<c:when test="${ members[0].interest_life == '반려동물' }">
				<input type="radio" id="interest_life" name="interest_life" value="반려동물" checked>반려동물		
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_life" name="interest_life" value="반려동물">반려동물
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ members[0].interest_hobby == '사진' }">
				<input type="radio" id="interest_hobby" name="interest_hobby" value="사진" checked>사진
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_hobby" name="interest_hobby" value="사진">사진		
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ members[0].interest_trends == '건강' }">
				<input type="radio" id="interest_trends" name="interest_trends" value="건강" checked>건강
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_trends" name="interest_trends" value="건강">건강
			</c:otherwise>
		</c:choose>
		</td>		
		</tr>
		<tr>
		<td>
		<c:choose>
			<c:when test="${ members[0].interest_enter == '공연' }">
				<input type="radio" id="interest_enter" name="interest_enter" value="공연" checked>공연
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_enter" name="interest_enter" value="공연">공연
			</c:otherwise>
		</c:choose>
		</td>		
		<td>
		<c:choose>
			<c:when test="${ members[0].interest_life == '좋은글' }">
				<input type="radio" id="interest_life" name="interest_life" value="좋은글" checked>좋은글		
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_life" name="interest_life" value="좋은글">좋은글
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ members[0].interest_hobby == '자동차' }">
				<input type="radio" id="interest_hobby" name="interest_hobby" value="자동차" checked>자동차
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_hobby" name="interest_hobby" value="자동차">자동차		
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ members[0].interest_trends == '경제' }">
				<input type="radio" id="interest_trends" name="interest_trends" value="경제" checked>경제
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_trends" name="interest_trends" value="경제">경제
			</c:otherwise>
		</c:choose>
		</td>		
		</tr>
		<tr>
		<td>
		<c:choose>
			<c:when test="${ members[0].interest_enter == '음악' }">
				<input type="radio" id="interest_enter" name="interest_enter" value="음악" checked>음악
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_enter" name="interest_enter" value="음악">음악
			</c:otherwise>
		</c:choose>
		</td>		
		<td>
		<c:choose>
			<c:when test="${ members[0].interest_life == '패션' }">
				<input type="radio" id="interest_life" name="interest_life" value="패션" checked>패션		
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_life" name="interest_life" value="패션">패션
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ members[0].interest_hobby == '국내여행' }">
				<input type="radio" id="interest_hobby" name="interest_hobby" value="국내여행" checked>국내여행
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_hobby" name="interest_hobby" value="국내여행">국내여행		
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ members[0].interest_trends == '외국어' }">
				<input type="radio" id="interest_trends" name="interest_trends" value="외국어" checked>외국어
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_trends" name="interest_trends" value="외국어">외국어
			</c:otherwise>
		</c:choose>
		</td>		
		</tr>
		<tr>
		<td>
		<c:choose>
			<c:when test="${ members[0].interest_enter == '드라마' }">
				<input type="radio" id="interest_enter" name="interest_enter" value="드라마" checked>드라마
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_enter" name="interest_enter" value="드라마">드라마
			</c:otherwise>
		</c:choose>
		</td>		
		<td>
		<c:choose>
			<c:when test="${ members[0].interest_life == '인테리어' }">
				<input type="radio" id="interest_life" name="interest_life" value="인테리어" checked>인테리어		
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_life" name="interest_life" value="인테리어">인테리어
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ members[0].interest_hobby == '세계여행' }">
				<input type="radio" id="interest_hobby" name="interest_hobby" value="세계여행" checked>세계여행
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_hobby" name="interest_hobby" value="세계여행">세계여행		
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ members[0].interest_trends == '교육' }">
				<input type="radio" id="interest_trends" name="interest_trends" value="교육" checked>교육
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_trends" name="interest_trends" value="교육">교육
			</c:otherwise>
		</c:choose>
		</td>		
		</tr>
		<tr>
		<td>
		<c:choose>
			<c:when test="${ members[0].interest_enter == '연예인' }">
				<input type="radio" id="interest_enter" name="interest_enter" value="연예인" checked>연예인
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_enter" name="interest_enter" value="연예인">연예인
			</c:otherwise>
		</c:choose>
		</td>		
		<td>
		<c:choose>
			<c:when test="${ members[0].interest_life == '요리' }">
				<input type="radio" id="interest_life" name="interest_life" value="요리" checked>요리		
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_life" name="interest_life" value="요리">요리
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ members[0].interest_hobby == '맛집' }">
				<input type="radio" id="interest_hobby" name="interest_hobby" value="맛집" checked>맛집
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_hobby" name="interest_hobby" value="맛집">맛집		
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ members[0].interest_trends == '스포츠' }">
				<input type="radio" id="interest_trends" name="interest_trends" value="IT" checked>IT
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_trends" name="interest_trends" value="IT">IT
			</c:otherwise>
		</c:choose>
		</td>		
		</tr>
		<tr>
		<td>
		<c:choose>
			<c:when test="${ members[0].interest_enter == '만화' }">
				<input type="radio" id="interest_enter" name="interest_enter" value="만화" checked>만화
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_enter" name="interest_enter" value="만화">만화
			</c:otherwise>
		</c:choose>
		</td>		
		<td>
		<c:choose>
			<c:when test="${ members[0].interest_life == '쇼핑' }">
				<input type="radio" id="interest_life" name="interest_life" value="쇼핑" checked>쇼핑		
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_life" name="interest_life" value="쇼핑">쇼핑
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ members[0].interest_hobby == '명상' }">
				<input type="radio" id="interest_hobby" name="interest_hobby" value="명상" checked>명상
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_hobby" name="interest_hobby" value="명상">명상		
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ members[0].interest_trends == '기계' }">
				<input type="radio" id="interest_trends" name="interest_trends" value="기계" checked>기계
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_trends" name="interest_trends" value="기계">기계
			</c:otherwise>
		</c:choose>
		</td>		
		</tr>
	</table>
		<br>
	</div>
	<div>
		<button type="button" onclick="userInfoUpdate()">수정하기</button>
		<button type="reset">취소</button>
		<button id="back" type="button" onclick="location.href='/snsprj/userHome.do'">개인정보 홈</button>
		</div><br> 
		</div>
		</div>
		<div class="w3-black w3-center w3-padding-24"><a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-opacity">Team 4o</a></div>
	</div>
	</form>
</body>
</html>