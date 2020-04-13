<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 내가 좋아하는 글 목록</h1>
<c:forEach items="${list}" var="map">
	NO : ${map.board.board_no} <br>
	ID : ${map.board.board_user_id} <br>
	CONTENT : ${map.board.board_content} <br>
	LIKE : ${map.board.board_like} <br>
	DATE : ${map.board.board_wdate} <br>
	IMG : ${map.board.board_img} <br>
	NAME : ${map.user_name} <br>
	PRO : ${map.user_pro_img_name} <br>
	<hr>
</c:forEach>
</body>
</html>