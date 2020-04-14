<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script>
		function userInfoSelect() {
			$("#frm").attr("action", "/snsprj/UserInfoSelect.do");
			$("#frm").submit();
		}
	</script>
</head>
<body>
	<form id="frm" name="frm" method="post">
		<div id="title" align="center">
			<hr>
			<h1>내가 구독하는 사람 리스트</h1>
			<hr>
			<div style="height: auto;">
				<div>
					<div>
						<c:choose>
							<c:when test="${empty members }">
					데이터가 없습니다.					
				</c:when>
							<c:otherwise>
								<c:forEach var="member" items="${ members }">
									<div class="container" id="slist" align="center">
										<img src="/snsprj/common/image/${member.user_pro_img_name }"
											class="rounded-circle" alt="Cinque Terre" width="150"
											height="150"><br>
										<button type="button" class="btn btn-info"
											onclick="userInfoSelect()">${member.user_id }</button>
										<hr>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<div>
				<a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS"
					target="_blank" class="w3-hover-opacity">Team 4o</a>
			</div>
			<br>
		</div>
	</form>
</body>
</html>