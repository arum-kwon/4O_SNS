<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	background-image: url(../../image/LOGO.png);
	
	background-position : center;
	background-size : auto;
}

/* Full-width input fields */
input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button#check {

	width : 20%;
}

/* Set a style for all buttons */
button {
	background-color: purple;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
	position: relative;
}

img.avatar {
	width: 40%;
	
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}

Nmodal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
	position: absolute;
	right: 25px;
	top: 0;
	color: #000;
	font-size: 35px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}

/* Add Zoom Animation */
.animate {
	-webkit-animation: animatezoom 0.6s;
	animation: animatezoom 0.6s
}

@
-webkit-keyframes animatezoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes animatezoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>

</head>
<body>
	
	<h2 align="center"></h2>
	<div align="center"><br><br><br><br><br><br><br><br><br><br>
	<button onclick="document.getElementById('id01').style.display='block'"
		style="width: 400px;" type="submit" class="btn btn-success">로그인</button>
	</div>
	<div align="center">
	<button onclick="document.getElementById('id02').style.display='block'"
		style="width: 400px;"  type="button" class="btn btn-warning">회원가입</button>
	</div>

	<div id="id01" class="modal">

		<form class="modal-content animate" action="/snsprj/Login.do"
			method="post">
			<div class="imgcontainer">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="close" title="Close Modal">&times;</span> <img
					src="../image/LOGO.png" width="300px" height="300px">
			</div>

			<div class="container">
				<label for="uname"><b>4O Username</b></label> <input type="text"
					placeholder="4O 아이디를 입력해주세요" name="uname" required> <label
					for="psw"><b>4O Password</b></label> <input type="password"
					placeholder="4O 비밀번호를 입력해주세요" name="psw" required>

				<button type="submit" onclick="goHome.do" class="btn btn-success">4O 들어가기</button>
				
			</div>

			<div class="container" >
				<button type="button"
					onclick="document.getElementById('id01').style.display='none'"
					class="btn btn-warning">회원가입 안했다!!</button>
			</div>
		</form>
	</div>
	
	<div id="id02" class="modal">

		<form class="modal-content animate" action="/snsprj/Login.do"
			method="post">
			
			<div class="container" ><span onclick="document.getElementById('id02').style.display='none'"
					class="close" title="Close Modal">&times;</span><br>
				<label for="profile"><b>4O 프로필 사진</b></label>
				<div align="center">
				 
				 <img src="../image/profile_img_9.jpg" width="110px" height="110px">
				 <input	type="radio" name="User_pro_img_name" value="profile_img_1.jpg" checked> 
				 
				 <img src="../image/profile_img_2.png" width="120px" height="110px">
				 <input	type="radio" name="User_pro_img_name" value="profile_img_4.jpg"> 
				 
				 <img src="../image/profile_img_3.gif" width="110px" height="110px">
				 <input	type="radio" name="User_pro_img_name" value="profile_img_1.jpg"> 
				 
				 <img src="../image/profile_img_4.jpg" width="120px" height="110px">
				 <input type="radio" name="User_pro_img_name" value="profile_img_4.jpg"> 
				 
				 <img src="../image/profile_img_5.png" width="110px" height="110px">
				 <input	type="radio" name="User_pro_img_name" value="profile_img_1.jpg">
				 
				 <img src="../image/profile_img_6.jpg" width="110px" height="110px">
				 <input	type="radio" name="User_pro_img_name" value="profile_img_1.jpg">
				 
				</div>

				<label for="Nick"><b>4O 닉네임</b></label> 
				<input type="text" placeholder="4O에서 사용하실 닉네임을 입력해주세요" name="User_id" id="User_id" required>	
				<button type="button" class="btn btn-info" id="check">중복체크</button>	<br>			
				<label for="uname"><b>4O Username</b></label> 
				<input type="text" placeholder="4O 아이디를 입력해주세요" name="User_name" id="User_name" required> 
				<label for="psw"><b>4O Password</b></label> 
				<input type="password" placeholder="4O 비밀번호를 입력해주세요" name="User_pw" id="User_pw" required>								
				
				<button type="submit" class="btn btn-success" onclick="/Login.do">회원가입 완료</button>
				
			</div>

			<div class="container">
				<button type="button"
					onclick="document.getElementById('id02').style.display='none'"
					class="btn btn-warning" >에휴 안할란다</button>
			</div>
		</form>
	</div>

	<script>
// Get the modal
var modal = document.getElementById('id01');
var Nmodal = document.getElementById('id02');
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == Nmodal) {
        Nmodal.style.display = "none";
    }
}

window.onclick = function(event) {
    if (event.target == modal1) {
        modal1.style.display = "none";
    }
}
</script>

</body>
</html>
