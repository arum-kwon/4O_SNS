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
<title>userHome.jsp</title>
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

function back(){
	histroy.go(-1);
}
</script>
<style>
hr { border: 5px solid lightpink;}
body {
	background-color: white;
	background-image: url('common/image/logo.png');
	font-weight: bold;
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
<hr>
<h1 align="center"><개인정보 홈></h1>
<hr>
	<div align="center">
		<form id="frm" name="frm" method="post">
			<table>

					<tr>
					<td>글번호</td>
					<td>글쓴이</td>
					<td>글내용</td>
					<td>좋아요</td>
					<td>작성시간</td>					
					</tr>
					<tr>
					<td>${ members[0].board_no }</td>
					<td>${ members[0].board_user_id }</td>
					<td>${ members[0].board_content }</td>
					<td>${ members[0].board_like }</td>
					<td>${ members[0].board_wdate }</td>					
					</tr>
					
				
						<th>
							엔터테이먼트, 예술							
						</th>
						<tr>
							<td>문학<input type="radio" name="interest_enter" value="문학">
							영화<input type="radio" name="interest_enter" value="영화">
							미술<input type="radio" name="interest_enter" value="미술">
							공연<input type="radio" name="interest_enter" value="공연">
							음악<input type="radio" name="interest_enter" value="음악">
							드라마<input type="radio" name="interest_enter" value="드라마">
							스타<input type="radio" name="interest_enter" value="스타">
							연예인<input type="radio" name="interest_enter" value="연예인">
							만화<input type="radio" name="interest_enter" value="만화">
							방송<input type="radio" name="interest_enter" value="방송"></td>							
						</tr>
						
						<!-- 헤더이미지 수정 시작 -->
						
						<%-- <tr>
						<td colspan="4"><img id="headChange" src="/snsprj/common/header/${ members[0].user_header_img }"
							width="900px" height="200px"></td>	
						<div>
						<tr>
							<td>
								<div class="container">
									<!-- Trigger the modal with a button -->
									<button type="button" class="btn btn-info btn-lg"
										data-toggle="modal" data-target="#myModal2">헤더이미지 수정</button>

									<!-- Modal -->
									<div class="modal fade" id="myModal2" role="dialog">
										<div class="modal-dialog">

											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
													<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
													<h4>헤더 사진 수정하기</h4>
												</div>
												<div class="modal-body">
													<c:choose>
														<c:when test="${ members[0].user_header_img == 'header_img_1.jpg' }">
															<input type="radio" id="header" name="header_img" value="header_img_1.jpg" checked>
														</c:when>
														<c:otherwise>
															<input type="radio" id="header" name="header_img" value="header_img_1.jpg">
														</c:otherwise>
													</c:choose>
													<img src="common/header/header_img_1.jpg" class="rounded-circle" alt="Cinque Terre" width="150" height="150">
													
													<c:choose>
														<c:when test="${ members[0].user_header_img == 'header_img_2.jpg' }">
															<input type="radio" id="header" name="header_img" value="header_img_2.jpg" checked>
														</c:when>
														<c:otherwise>
															<input type="radio" id="header" name="header_img" value="header_img_2.jpg">
														</c:otherwise>
													</c:choose>
													<img src="common/header/header_img_2.jpg" class="rounded-circle" alt="Cinque Terre" width="150" height="150">
												</div>
												
												<div class="modal-body">
													<c:if test="${ members[0].user_header_img == 'header_img_3.jpg' }">
														<input type="radio" id="header" name="header_img" value="header_img_3.jpg" checked>
													</c:if>
													<c:if test="${ members[0].user_header_img != 'header_img_3.jpg' }">
														<input type="radio" id="header" name="header_img" value="header_img_3.jpg">
													</c:if>
													
													<img src="common/header/header_img_3.jpg" class="rounded-circle" alt="Cinque Terre" width="150" height="150">
													<c:choose>
														<c:when test="${ members[0].user_header_img == 'header_img_4.jpg' }">
															<input type="radio" id="header" name="header_img" value="header_img_4.jpg" checked>
														</c:when>
														<c:otherwise>
															<input type="radio" id="header" name="header_img" value="header_img_4.jpg">
														</c:otherwise>
													</c:choose>										
													<img src="common/header/header_img_4.jpg" class="rounded-circle" alt="Cinque Terre" width="150" height="150">
												</div>
												<div class="modal-body">
													<c:choose>
														<c:when test="${ members[0].user_header_img == 'header_img_5.jpg' }">
															<input type="radio" id="header" name="header_img" value="header_img_5.jpg" checked>
														</c:when>
														<c:otherwise>
															<input type="radio" id="header" name="header_img" value="header_img_5.jpg">
														</c:otherwise>
													</c:choose>
													<img src="common/header/header_img_5.jpg" class="rounded-circle" alt="Cinque Terre" width="150" height="150">
													<c:choose>
														<c:when test="${ members[0].user_header_img == 'header_img_6.jpg' }">
															<input type="radio" id="header" name="header_img" value="header_img_6.jpg" checked>
														</c:when>
														<c:otherwise>
															<input type="radio" id="header" name="header_img" value="header_img_6.jpg">
														</c:otherwise>
													</c:choose>												
													<img src="common/header/header_img_6.jpg" class="rounded-circle" alt="Cinque Terre" width="150" height="150">
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal" onclick="myHeaderImgUpt();">수정하기</button>
														<button type="button" class="btn btn-default"
														data-dismiss="modal">취소</button>
												</div>
											</div>

										</div>
									</div>

								</div>
							</td>
						<tr>
					</div>						
					</tr> --%>
					
					<!-- 헤더이미지 수정 종료 -->
				</div>
				<div>
					<tr>
						<td>프로필 사진</td>
						<td>아이디(닉네임))</td>
						<td>나이</td>		
						<td>직업</td>				
					</tr>
				</div>
				<div>
					<tr>
						<td><img id="imgChange" src="/snsprj/common/image/${ members[0].user_pro_img_name }" width="150px" height="100px" /></td>
						<td>${ members[0].user_id }</td>
						<td>${ members[0].user_birthage }</td>				
						<td>${ members[0].user_job }</td>		
					</tr>
					<div>
						<tr>
							<td>
								<%-- <div class="container">
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

								</div> --%>
							</td>
						<tr>
					</div>
				</div>
				<div>
					<tr>
						<td colspan="4" align="center">자기소개</td> 
					</tr>
				</div>
				<div>
					<tr>
						<td colspan="4" align="center"><textarea name="user_info" rows="5" cols="120" readonly="readonly">${ members[0].user_info }</textarea></td> 						
					</tr>
				</div>
				<div>
					<tr>
						<td>취미1</td>
						<td>취미2</td>
						<td>취미3</td>
						<td>취미4</td>
					</tr>
				</div>
				<div>				

				</div>
				<tr> 					
					<td>
					<c:choose>
						<c:when test="${ members[0].interest_enter == '드라마' }">
							<input type="checkbox" name="interest_enter" value="드라마" checked>드라마							
						</c:when>
						<c:otherwise>
						<input type="checkbox" name="interest_enter" value="드라마">드라마
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${ members[0].interest_enter == '댄스' }">
							<input type="checkbox" name="interest_enter" value="댄스" checked>댄스
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="interest_enter" value="댄스">댄스
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${ members[0].interest_enter == '영화' }">
							<input type="checkbox" name="interest_enter" value="영화" checked>영화
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="interest_enter" value="영화">영화
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${ members[0].interest_enter == '예능' }">
							<input type="checkbox" name="interest_enter" value="예능" checked>예능
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="interest_enter" value="예능">예능
						</c:otherwise>
					</c:choose> 
					</td>
					<td>
					<c:choose>
						<c:when test="${ members[0].interest_life == '캠핑' }">
							<input type="checkbox" name="interest_life" value="캠핑" checked>캠핑
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="interest_life" value="캠핑">캠핑
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${ members[0].interest_life == '커피' }">
							<input type="checkbox" name="interest_life" value="커피" checked>커피
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="interest_life" value="커피">커피
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${ members[0].interest_life == '여유' }">
							<input type="checkbox" name="interest_life" value="여유" checked>여유
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="interest_life" value="여유">여유
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${ members[0].interest_life == '산책' }">
							<input type="checkbox" name="interest_life" value="산책" checked>산책
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="interest_life" value="산책">산책
						</c:otherwise>
					</c:choose> 
					</td>
					<td>
					<c:choose>
						<c:when test="${ members[0].interest_hobby == '야구' }">
							<input type="checkbox" name="interest_hobby" value="야구" checked>야구
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="interest_hobby" value="야구">야구
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${ members[0].interest_hobby == '축구' }">
							<input type="checkbox" name="interest_hobby" value="축구" checked>축구
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="interest_hobby" value="축구">축구
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${ members[0].interest_hobby == '농구' }">
							<input type="checkbox" name="interest_hobby" value="농구" checked>농구
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="interest_hobby" value="농구">농구
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${ members[0].interest_hobby == '당구' }">
							<input type="checkbox" name="interest_hobby" value="당구" checked>당구
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="interest_hobby" value="당구">당구
						</c:otherwise>
					</c:choose> 
					</td>
					<td>
					<c:choose>
						<c:when test="${ members[0].interest_trends == '패션' }">
							<input type="checkbox" name="interest_trends" value="패션" checked>패션
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="interest_trends" value="패션">패션
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${ members[0].interest_trends == '음악' }">
							<input type="checkbox" name="interest_trends" value="음악" checked>음악
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="interest_trends" value="음악">음악
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${ members[0].interest_trends == 'sns' }">
							<input type="checkbox" name="interest_trends" value="sns" checked>sns
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="interest_trends" value="sns">sns
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${ members[0].interest_trends == '힙합' }">
							<input type="checkbox" name="interest_trends" value="힙합" checked>힙합
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="interest_trends" value="힙합">힙합
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
			</table>	
			<br><br>
			<button type="button" location.href="#">홈</button>
			<button id="back" type="button" onclick="back()">이전</button>
			<button type="button" onclick="location.href='userHomeUpdatePage.do'">수정 페이지</button>
		</form>		
	</div>
</body>
</html>