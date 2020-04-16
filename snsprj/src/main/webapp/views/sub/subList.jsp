<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<style>
body,h1,h2,h3,h4,h5,h6  {
	/* background-color: white; */
	/* background-image: url('common/image/logo.png'); */
	font-family: "Raleway", sans-serif;
}
body{
	background-color: #536872;
}
hr{ color: black; border: solid 1px;}
#title { background: black; color: white;}
</style>
<script>
function userInfoSelect(id){
	$("#id").val(id); //jquery
	
	//document.getElementById.value = id; // javascript
	
	$("#frm").attr("action","/snsprj/UserInfoSelect.do");
	$("#frm").submit();
}
</script>
<title>sublist.jsp</title>
</head> 
<body class="w3-content" style="max-width:1300px">
<form id="frm" name="frm" method="post">
<input type="hidden" id="id" name="id" />
<div id="title" align="center">
      <hr><h1>내가 구독하는 사람 리스트</h1><hr>
 <div class="w3-center-align w3-blue-grey w3-container" style="height:auto;"> 
    <div class="w3-padding-64 w3-center"> 
      <div class="w3-center-align w3-padding-large">
        <c:choose>
				<c:when test="${empty members }">
					데이터가 없습니다.					
				</c:when>
				<c:otherwise>
					<c:forEach var="member" items="${ members }">																		
							<div class="container" id="slist" align="center">
              				 <img src="${pageContext.request.contextPath}/common/img/pro/${member.user_pro_img_name }" class="rounded-circle" alt="Cinque Terre" width="150" height="150"><br> 
              				 <button type="button" class="btn btn-info" onclick="userInfoSelect('${member.user_id }')">${member.user_id }</button>
              				 <button type="button" class="btn btn-info">${member.user_name }</button>
              				 <hr>              				               				
							</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>			
      </div>
    </div> 
  </div>	
  <div class="w3-black w3-center w3-padding-24">Team 4o</a></div><br>
</div>
</form>
</body>
</html>