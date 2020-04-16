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
<title>UserInfoSelect.jsp</title>
<script>
function BoardView(board_no){
	$("#id").val(board_no);
	
	$("#frm").attr("action","/snsprj/BoardView.do");
	$("#frm").submit();
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
	$("#imgChange").attr("src","/snsprj/common/image/" + imgCheck);
	$("#myModal").close();
}

function back(){
	histroy.go(-1);
}
</script>
<style>
#table1 { width: 304px;}
body,h1,h2,h3,h4,h5,h6  {
	/* background-color: white; */
	/* background-image: url('common/image/logo.png'); */
	font-family: "Raleway", sans-serif;
}
p{ text-align: center;}
hr{ color: black; border: solid 1px;}
#title { background: black; color: white;}
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
<body class="w3-blue-grey w3-content" style="max-width:1600px">
<form id="frm" name="frm" method="post">
<input type="hidden" id="id" name="bb1">
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-grey w3-animate-left" style="z-index:3;width:350px;" id="mySidebar"><br>
  <div class="w3-container">
    <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
      <i class="fa fa-remove"></i>
    </a>
    <div align="center">
    <img id="imgChange" src="${pageContext.request.contextPath}/common/img/pro/${ members[0].user_pro_img_name }" style="width:45%;" class="w3-round"><br><br>
    </div>    
    <table id="table1">
    	<tr>
    		<td><h5><b>닉네임</b></h5></td>
     		<td><h5>&nbsp;&nbsp;${ members[0].user_name }</h5></td>
        </tr>
        <tr>
    		<td><h5><b>나이</b></h5></td>
     		<td><h5>&nbsp;&nbsp;${ members[0].user_birthage }</h5></td>
        </tr>
        <tr>
    		<td><h5><b>성별</b></h5></td>
    		<c:choose>
    			<c:when test="${ members[0].user_gender == 'M'}">
     		<td><h5>&nbsp;&nbsp;남</h5></td> 
     			</c:when>
     			<c:otherwise>
     		<td><h5>&nbsp;&nbsp;여</h5></td>	
     			</c:otherwise>
     		</c:choose>
        </tr>
         <tr>
    		<td><h5><b>직업</b></h5></td>
     		<td><h5>&nbsp;&nbsp;${ members[0].user_job }</h5></td>
        </tr>
        <tr height="10px">
        <td colspan="2"><hr></td>
        </tr>
        <tr>
    		<td><h5><b>엔터테이먼트∙예술</b></h5></td>
     		<td><h5>&nbsp;&nbsp;${ members[0].interest_enter }</h5></td>
        </tr>
        <tr>
    		<td><h5><b>생활∙노하우∙쇼핑</b></h5></td>
     		<td><h5>&nbsp;&nbsp;${ members[0].interest_life }</h5></td>
        </tr>
        <tr>
    		<td><h5><b>취미∙여가∙여행</b></h5></td>
     		<td><h5>&nbsp;&nbsp;${ members[0].interest_hobby }</h5></td>
        </tr>
        <tr>
    		<td><h5><b>지식∙동향</b></h5></td>
     		<td><h5>&nbsp;&nbsp;${ members[0].interest_trends }</h5></td>
        </tr>
        <tr height="10px">
        <td colspan="2"><hr></td>
        </tr>
        <tr>
        <td align="center" colspan="2"><h5><b><인사말></b></h5></td>
        </tr>
        <tr>
        	<td colspan="2"><h5>${ members[0].user_info }</h5></td>
        </tr>        
    </table>
     <br><br>
     <!-- <button style="margin-left: 100px" type="button" onclick="location.href='userHomeUpdatePage.do'" class="btn btn-info btn-lg">기능 없음</button> -->
  </div>
  	<br><br><br>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:400px">

 <!-- Header -->
  <header id="portfolio">
    <a href="#"><img src="/w3images/avatar_g2.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <div class="w3-container" align="center">
    <div id="title">
    <hr><h1 ><b>타임라인</b></h1><hr>
    </div>
    <!--
    <div class="w3-section w3-bottombar w3-padding-16">
      <span class="w3-margin-right">Filter:</span> 
      <button class="w3-button w3-black">ALL</button>
      <button class="w3-button w3-white"><i class="fa fa-diamond w3-margin-right"></i>Design</button>
      <button class="w3-button w3-white w3-hide-small"><i class="fa fa-photo w3-margin-right"></i>Photos</button>
      <button class="w3-button w3-white w3-hide-small"><i class="fa fa-map-pin w3-margin-right"></i>Art</button>
    </div>
    -->
    </div>
  </header>
  
<!-- First Photo Grid-->
  <div class="w3-row-padding">  
	  <c:forEach var="member" items="${ members }"> 
		    <div class="w3-third w3-container w3-margin-bottom"  onclick="BoardView('${member.board_no}')">
		 	   <p><b>글 번호: ${ member.board_no } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   작성시간: ${ member.board_wdate }</b></p>
		    		<div style="border: 1px solid black; padding: 10px; height: 300px;; min-height: 100px; overflow: hidden;;">
						<p>${ member.board_content }</p>
		      		</div>
		      		<div class="w3-container">
		    			<p align="center">좋아요: ${ member.board_like }&nbsp;★</p>
		      		</div>
		    </div>
	   </c:forEach>       
  </div>

  <!-- Pagination -->
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
      <a href="#" class="w3-bar-item w3-black w3-button">1</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">3</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">4</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
    </div>
  </div>

  <div class="w3-black w3-center w3-padding-24"><a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-opacity">Team 4o</a></div><br>
</div>
<script>
// Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
</script>
</form>
</body>
</html>