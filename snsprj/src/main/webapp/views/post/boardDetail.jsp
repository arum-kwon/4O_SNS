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
<h1> 글 상세 페이지</h1>
	NO : ${board.board.board_no} <br>
	ID : ${board.board.board_user_id} <br>
	CONTENT : ${board.board.board_content} <br>
	LIKE : ${board.board.board_like} <br>
	DATE : ${board.board.board_wdate} <br>
	IMG : ${board.board.board_img} <br>
	NAME : ${board.user_name} <br>
	PRO : ${board.user_pro_img_name} <br>
	<hr>
	<h3> 댓글 릴스트 </h3>
	<hr>
<c:forEach items="${commentList}" var="map">
	BNO : ${map.comment.board_no} <br>
	CON : ${map.comment.comment_no} <br>
	CONTENT : ${map.comment.comment_content} <br>
	ID : ${map.comment.user_id} <br>
	DATE : ${map.comment.wdate} <br>
	NAME : ${map.user_name} <br>
	PRO : ${map.user_pro_img_name} <br>
	<hr>
</c:forEach>
</body>
</html>