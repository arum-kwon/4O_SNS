<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script>
/* $(document).ready(function(){
	var n = "${result}"; 
	
	if(n != ""){
		if(n>0){
			alert("업데이트가 되었습니다");	
		}else{
			alert("업데이트가 실패하였습니다.");
		}
	}
}); */
function show(){
	$(".modal-dialog").css("display", "block")
}
function myHeaderImgUpt(){
	var HeaderCheck = $('input[name=header_img]:checked').val();
//	alert(HeaderCheck);
	$("#headChange").attr("src","/snsprj/common/header/" + HeaderCheck);
	$("#myModal2").close();
} 
function myProImgUpt (){
	var imgCheck = $('input[name=profile_img]:checked').val();
//	alert(imgCheck);
	$("#imgChange").attr("src","/snsprj/common/img/pro/" + imgCheck);
	$("#myModal").close();
}
function userInfoUpdate(){
	$("#frm").attr("action","/snsprj/UserHomeUpdate.do");
	$("#frm").submit();
}
function back(){
	histroy.go(-1);
}

</script>
<style>
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

table,th,tr,td { border: 1px solid gray; border-collapse: collapse;}
table, th{ width: 10cm}
hr {
	color: gray;
	border: ridge; 1px;
}
#title {
	background: #536872;
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
</head>
<form id="frm" name="frm" method="post">
	<div align="center">
			<div id="title">
				<h1>
					개인정보 홈
				</h1>
			</div>
		</div>
		<div align="center">
			<div align="center"><img id="imgChange" src="${pageContext.request.contextPath}/common/img/pro/${ userinfo.user_pro_img_name }" class="rounded-circle" alt="엑박" width="150" height="150"></span>
		</div>
		<div align="center">
			<!-- Trigger the modal with a button -->
			<div><button id="picchange" type="button" class="w3-button w3-theme-d1 w3-margin-bottom" data-toggle="modal" data-target="#myModal" onclick="show()">프로필 수정</button></div>
			<!-- Modal -->
									<div class="modal fade" id="myModal" role="dialog">
										<div class="modal-dialog" style="display: none;">
											<!-- Modal content-->
											<div id="picchangepage" class="modal-content" style="border: 1px solid black">
												<div class="modal-header">
													<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
													<h4><b>< 프로필 사진 수정하기 ></b></h4>
												</div>
												<div class="modal-body">
													<c:choose>
														<c:when test="${ userinfo.user_pro_img_name == 'profile_img_1.jpg' }">
															<input type="radio" id="picture1" name="profile_img" value="profile_img_1.jpg" checked>
														</c:when>
														<c:otherwise>
															<input type="radio" id="picture1" name="profile_img" value="profile_img_1.jpg">
														</c:otherwise>
													</c:choose>
													<img src="${pageContext.request.contextPath}/common/img/pro/profile_img_1.jpg" class="rounded-circle" alt="Cinque Terre" width="150" height="150">
													
													<c:choose>
														<c:when test="${ userinfo.user_pro_img_name == 'profile_img_2.jpg' }">
															<input type="radio" id="picture2" name="profile_img" value="profile_img_2.jpg" checked>
														</c:when>
														<c:otherwise>
															<input type="radio" id="picture2" name="profile_img" value="profile_img_2.jpg">
														</c:otherwise>
													</c:choose>
													<img src="${pageContext.request.contextPath}/common/img/pro/profile_img_2.jpg" class="rounded-circle" alt="Cinque Terre" width="150" height="150">
													
													<c:if test="${ userinfo.user_pro_img_name == 'profile_img_3.jpg' }">
														<input type="radio" id="picture3" name="profile_img" value="profile_img_3.jpg" checked>
													</c:if>
													<c:if test="${ userinfo.user_pro_img_name != 'profile_img_3.jpg' }">
														<input type="radio" id="picture3" name="profile_img" value="profile_img_3.jpg">
													</c:if>
													
													<img src="${pageContext.request.contextPath}/common/img/pro/profile_img_3.jpg" class="rounded-circle" alt="Cinque Terre" width="150" height="150">
												</div>
												<div class="modal-body">
													
													<c:choose>
														<c:when test="${ userinfo.user_pro_img_name == 'profile_img_4.jpg' }">
															<input type="radio" id="picture4" name="profile_img" value="profile_img_4.jpg" checked>
														</c:when>
														<c:otherwise>
															<input type="radio" id="picture4" name="profile_img" value="profile_img_4.jpg">
														</c:otherwise>
													</c:choose>										
													<img src="${pageContext.request.contextPath}/common/img/pro/profile_img_4.jpg" class="rounded-circle" alt="Cinque Terre" width="150" height="150">
													
													<c:choose>
														<c:when test="${ userinfo.user_pro_img_name == 'profile_img_5.jpg' }">
															<input type="radio" id="picture5" name="profile_img" value="profile_img_5.jpg" checked>
														</c:when>
														<c:otherwise>
															<input type="radio" id="picture5" name="profile_img" value="profile_img_5.jpg">
														</c:otherwise>
													</c:choose>
													<img src="${pageContext.request.contextPath}/common/img/pro/profile_img_5.jpg" class="rounded-circle" alt="Cinque Terre" width="150" height="150">
													<c:choose>
														<c:when test="${ userinfo.user_pro_img_name == 'profile_img_6.jpg' }">
															<input type="radio" id="picture6" name="profile_img" value="profile_img_6.jpg" checked>
														</c:when>
														<c:otherwise>
															<input type="radio" id="picture6" name="profile_img" value="profile_img_6.jpg">
														</c:otherwise>
													</c:choose>												
													<img src="${pageContext.request.contextPath}/common/img/pro/profile_img_6.jpg" class="rounded-circle" alt="Cinque Terre" width="150" height="150">
												</div>
												
												<div class="modal-footer"><br>
													<button type="button" class="w3-button w3-theme-d1 w3-margin-bottom" data-dismiss="modal" onclick="myProImgUpt();">수정하기</button>
													<button type="button" class="w3-button w3-theme-d1 w3-margin-bottom" data-dismiss="modal">취소</button>
												</div>
											</div>

										</div>
									</div>			
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
				<span class="cell col1">${ userinfo.user_id }</span>
				<span class="cell col2"><input type="text" id="user_name" name="user_name" value="${ userinfo.user_name }"></span>
				<span class="cell col3">${ userinfo.user_birthage }</span>
				<span class="cell col4">
					<c:choose>
						<c:when test="${ userinfo.user_gender == 'M' }">
								<input type="radio" id="user_gender" name="user_gender" value="M" checked> 남자 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</c:when>
						<c:otherwise>
								<input type="radio" id="user_gender" name="user_gender" value="M"> 남자 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</c:otherwise>
					</c:choose> 
						
					<c:choose>
						<c:when test="${ userinfo.user_gender == 'W' }">
								<input type="radio" id="user_gender" name="user_gender" value="W" checked> 여자 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</c:when>
						<c:otherwise>
								<input type="radio" id="user_gender" name="user_gender" value="W"> 여자 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</c:otherwise>
					</c:choose>
			</div>
			<div class="row">
				<span class="cell col1" style="background-color: lightgray"><b>가입일</b></span>
				<span class="cell col2" style="background-color: lightgray"><b>직업</b></span>
				<span class="cell col2" style="background-color: lightgray"></span>
				<span class="cell col2" style="background-color: lightgray"></span>
			
			</div>
			<div class="row">
				<span class="cell col1">${ userinfo.user_jdate }</span>
				<span class="cell col2"><input type="text" id="user_job" name="user_job" value="${ userinfo.user_job }"></span>
				<span class="cell col3"></span>
				<span class="cell col4"></span>
			</div>
		</div>
		<div align="center">
				<div style="background-color: lightgray"><b>자기소개</b></div>
				<div><textarea cols="30" rows="10" id="user_info" name="user_info">${ userinfo.user_info }</textarea></div>
			</div>
			<div id="title" align="center">
				<h1>
					관심분야
				</h1>
			</div>
		
		<table id="table2" align="center" >
		<tr>
			<th colspan="10" style="background-color: lightgray">취미 선택</th>
		</tr>
		<tr style="background-color: lightyellow">
		<th>엔터</th><th>생활</th><th>취미</th><th>동향</th>	
		</tr>
		<tr>
		<td>
		<c:choose>
			<c:when test="${ userinfo.interest_enter == '문학' }">
				<input type="radio" id="interest_enter" name="interest_enter" value="문학" checked>문학
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_enter" name="interest_enter" value="문학">문학
			</c:otherwise>
		</c:choose>
		</td>		
		<td>
		<c:choose>
			<c:when test="${ userinfo.interest_life == '생각' }">
				<input type="radio" id="interest_life" name="interest_life" value="생각" checked>생각		
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_life" name="interest_life" value="생각">생각
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ userinfo.interest_hobby == '게임' }">
				<input type="radio" id="interest_hobby" name="interest_hobby" value="게임" checked>게임
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_hobby" name="interest_hobby" value="게임">게임		
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ userinfo.interest_trends == 'IT' }">
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
			<c:when test="${ userinfo.interest_enter == '영화' }">
				<input type="radio" id="interest_enter" name="interest_enter" value="영화" checked><label for="interest_enter">영화</label>
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_enter" name="interest_enter" value="영화"><label for="interest_enter">영화</label>
			</c:otherwise>
		</c:choose>
		</td>		
		<td>
		<c:choose>
			<c:when test="${ userinfo.interest_life == '결혼' }">
				<input type="radio" id="interest_life" name="interest_life" value="결혼" checked>결혼		
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_life" name="interest_life" value="결혼">결혼
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ userinfo.interest_hobby == '스포츠' }">
				<input type="radio" id="interest_hobby" name="interest_hobby" value="스포츠" checked>스포츠
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_hobby" name="interest_hobby" value="스포츠">스포츠		
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ userinfo.interest_trends == '사회' }">
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
			<c:when test="${ userinfo.interest_enter == '미술' }">
				<input type="radio" id="interest_enter" name="interest_enter" value=미술 checked>미술
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_enter" name="interest_enter" value="미술">미술
			</c:otherwise>
		</c:choose>
		</td>		
		<td>
		<c:choose>
			<c:when test="${ userinfo.interest_life == '반려동물' }">
				<input type="radio" id="interest_life" name="interest_life" value="반려동물" checked>반려동물		
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_life" name="interest_life" value="반려동물">반려동물
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ userinfo.interest_hobby == '사진' }">
				<input type="radio" id="interest_hobby" name="interest_hobby" value="사진" checked>사진
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_hobby" name="interest_hobby" value="사진">사진		
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ userinfo.interest_trends == '건강' }">
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
			<c:when test="${ userinfo.interest_enter == '공연' }">
				<input type="radio" id="interest_enter" name="interest_enter" value="공연" checked>공연
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_enter" name="interest_enter" value="공연">공연
			</c:otherwise>
		</c:choose>
		</td>		
		<td>
		<c:choose>
			<c:when test="${ userinfo.interest_life == '좋은글' }">
				<input type="radio" id="interest_life" name="interest_life" value="좋은글" checked>좋은글		
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_life" name="interest_life" value="좋은글">좋은글
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ userinfo.interest_hobby == '자동차' }">
				<input type="radio" id="interest_hobby" name="interest_hobby" value="자동차" checked>자동차
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_hobby" name="interest_hobby" value="자동차">자동차		
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ userinfo.interest_trends == '경제' }">
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
			<c:when test="${ userinfo.interest_enter == '음악' }">
				<input type="radio" id="interest_enter" name="interest_enter" value="음악" checked>음악
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_enter" name="interest_enter" value="음악">음악
			</c:otherwise>
		</c:choose>
		</td>		
		<td>
		<c:choose>
			<c:when test="${ userinfo.interest_life == '패션' }">
				<input type="radio" id="interest_life" name="interest_life" value="패션" checked>패션		
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_life" name="interest_life" value="패션">패션
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ userinfo.interest_hobby == '국내여행' }">
				<input type="radio" id="interest_hobby" name="interest_hobby" value="국내여행" checked>국내여행
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_hobby" name="interest_hobby" value="국내여행">국내여행		
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ userinfo.interest_trends == '외국어' }">
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
			<c:when test="${ userinfo.interest_enter == '드라마' }">
				<input type="radio" id="interest_enter" name="interest_enter" value="드라마" checked>드라마
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_enter" name="interest_enter" value="드라마">드라마
			</c:otherwise>
		</c:choose>
		</td>		
		<td>
		<c:choose>
			<c:when test="${ userinfo.interest_life == '인테리어' }">
				<input type="radio" id="interest_life" name="interest_life" value="인테리어" checked>인테리어		
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_life" name="interest_life" value="인테리어">인테리어
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ userinfo.interest_hobby == '세계여행' }">
				<input type="radio" id="interest_hobby" name="interest_hobby" value="세계여행" checked>세계여행
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_hobby" name="interest_hobby" value="세계여행">세계여행		
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ userinfo.interest_trends == '교육' }">
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
			<c:when test="${ userinfo.interest_enter == '연예인' }">
				<input type="radio" id="interest_enter" name="interest_enter" value="연예인" checked>연예인
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_enter" name="interest_enter" value="연예인">연예인
			</c:otherwise>
		</c:choose>
		</td>		
		<td>
		<c:choose>
			<c:when test="${ userinfo.interest_life == '요리' }">
				<input type="radio" id="interest_life" name="interest_life" value="요리" checked>요리		
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_life" name="interest_life" value="요리">요리
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ userinfo.interest_hobby == '맛집' }">
				<input type="radio" id="interest_hobby" name="interest_hobby" value="맛집" checked>맛집
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_hobby" name="interest_hobby" value="맛집">맛집		
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ userinfo.interest_trends == '스포츠' }">
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
			<c:when test="${ userinfo.interest_enter == '만화' }">
				<input type="radio" id="interest_enter" name="interest_enter" value="만화" checked>만화
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_enter" name="interest_enter" value="만화">만화
			</c:otherwise>
		</c:choose>
		</td>		
		<td>
		<c:choose>
			<c:when test="${ userinfo.interest_life == '쇼핑' }">
				<input type="radio" id="interest_life" name="interest_life" value="쇼핑" checked>쇼핑		
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_life" name="interest_life" value="쇼핑">쇼핑
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ userinfo.interest_hobby == '명상' }">
				<input type="radio" id="interest_hobby" name="interest_hobby" value="명상" checked>명상
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_hobby" name="interest_hobby" value="명상">명상		
			</c:otherwise>
		</c:choose>
		</td>
		<td> 
		<c:choose>
			<c:when test="${ userinfo.interest_trends == '기계' }">
				<input type="radio" id="interest_trends" name="interest_trends" value="기계" checked>기계
			</c:when>
			<c:otherwise>
				<input type="radio" id="interest_trends" name="interest_trends" value="기계">기계
			</c:otherwise>
		</c:choose>
		</td>
		</tr>
		<tr class="onlytr">
		<td colspan="4" align="center" style="color: red;"><b>타인과 취미가 3개 이상 겹치면</b><br> <b>추천구독리스트가 뜹니다.</b></td>
		</tr>
	</table>
		<br>
	<div align="center">
		<button class="w3-button w3-theme-d1 w3-margin-bottom" type="button" onclick="userInfoUpdate()">수정하기</button>
		<button class="w3-button w3-theme-d1 w3-margin-bottom" type="reset">취소</button>
		<button class="w3-button w3-theme-d1 w3-margin-bottom" id="back" type="button" onclick="location.href='/snsprj/userHome.do'">개인정보 홈</button>
	</div>
	</form>
</body>
</html>