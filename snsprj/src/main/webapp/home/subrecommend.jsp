<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>subrecommend.jsp</title>
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
function userInfoSelect(){
	$("#frm").attr("action","/snsprj/UserInfoSelect.do");
	$("#frm").submit();
}
</script>

</head>
<body class="w3-content" style="max-width:1300px">
구독추천리스트 목록
<form id="frm" name="frm" method="post">
<div id="title" align="center">
      <hr><h1>구독추천리스트</h1><hr>
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
              				 <img src="/snsprj/common/image/${member.user_pro_img_name }" class="rounded-circle" alt="Cinque Terre" width="150" height="150"><br> 
              				 <button type="button" class="btn btn-info" onclick="userInfoSelect()">${ member.user_id }</button>
              				 <button type="button" class="btn btn-info" >${ member.user_birthage }</button>
              				 <hr>              				               				
							</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>			
      </div>
    </div> 
  </div>	
  <div class="w3-black w3-center w3-padding-24"><a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-opacity">Team 4o</a></div><br>
</div>
</tr>
</TABLE>
</body>
</html>