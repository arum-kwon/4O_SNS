<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<title>4O</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4, h5 {
	font-family: "Open Sans", sans-serif
}
div#CLeft {
	background-color: #f1f1f1;
      position: fixed;
      width: 200px;
      height: 100%;
      margin-left: -20px;
      margin-top:50px;


}
.cursor_over {cursor: pointer;}




</style>


<body class="w3-theme-l5"> <!-- 색상 -->

	<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

	<!-- 상단바 왼쪽 메뉴들===================================================================================== -->
	<!-- Navbar -->
	<div class="w3-top" name="navbar">
		<tiles:insertAttribute name="navbar" />
	</div>
	<!-- 모바일 화면 구현=====================================================================================  -->
	<!-- Navbar on small screens -->



	<!-- 왼쪽 메뉴바 + 메인 페이지 =================================================================================  -->

	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width: 1400px; margin-top: 80px">
		<!-- The Grid 전체 영역-->
		<div class="w3-row">  
			<!-- Left Column 왼쪽 메뉴바 영역-->
			<div class="w3-col m3 position-fixed" id="Cleft">
      			<tiles:insertAttribute name="menu" />
			<!-- End Left Column -->
			</div>

			<!-- Middle Column 메인 영역 -->
   			<div class="w3-col m9 ">
   			<div class="w3-container w3-card w3-white w3-round" style="margin:0px 20px">
     			<tiles:insertAttribute name="body" />
   			</div>
			<!-- End Middle Column 메인 영역 -->
			</div>
			
		<!-- End Grid -->
		</div>
	<!-- End Page Container -->
	</div>
	
	
	<!-- Footer =================================================================================  -->
	<br>
	<div>
		<tiles:insertAttribute name="footer" />
	</div>
	
	
	


	<script>
		// Accordion
		function myFunction(id) {
			var x = document.getElementById(id);
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
				x.previousElementSibling.className += " w3-theme-d1";
			} else {
				x.className = x.className.replace("w3-show", "");
				x.previousElementSibling.className = x.previousElementSibling.className
						.replace(" w3-theme-d1", "");
			}
		}

		// Used to toggle the menu on smaller screens when clicking on the menu button
		function openNav() {
			var x = document.getElementById("navDemo");
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
			} else {
				x.className = x.className.replace(" w3-show", "");
			}
		}
	</script>






</body>
</html>