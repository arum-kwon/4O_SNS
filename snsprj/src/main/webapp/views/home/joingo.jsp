<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>login.jsp</title>
<script>
function joindo(){
	$("#frm").attr("action","/snsprj/join.do");
	$("#frm").submit();
}
</script>
</head>
<body>
경로확인
<form id="frm" name="frm" method="post">
<table>
<tr>
<td>id</td><td><input type="text" name="user_id" id="user_id"></td><br>
</tr>
<tr>
<td>닉네임</td><td><input type="text" name="user_name" id="user_name"></td><br>
</tr>
<tr>
<td>비번</td><td><input type="text" name="user_pw" id="user_pw"></td><br>
</tr>
<tr>
<td>사진</td><td><input type="text" name="pro_img_name" id="pro_img_name"></td><br>
</tr>
</table>
<button type="button" onclick="joindo()">가입하기</button>
<button type="reset">취소</button>
</form>
</body>
</html>