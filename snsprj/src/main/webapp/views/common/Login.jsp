<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>

<form action="/snsprj/Login.do" method="post">
	<label for="uname"><b>4O ID</b></label> 
	<input type="text" placeholder="4O 아이디를 입력해주세요" name="uname" required>
	<label for="psw"><b>4O Password</b></label> 
	<input type="password" placeholder="4O 비밀번호를 입력해주세요" name="psw" required>
	
	<button type="submit" >4O 들어가기</button>
</form>

</body>
</html>