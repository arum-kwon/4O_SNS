<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>타임라인</h1>
				
<c:forEach items="${list}" var="tl">
번호 : ${tl.board.board_no} <br>
이름  : ${tl.user_name} <br>
프로필 이미지 : ${tl.user_pro_img_name} <br>
아이디 : ${tl.board.board_user_id} <br>
<a href="/snsprj/BoardDetailServlet.do?board_no=${tl.board.board_no}">
내용 : ${tl.board.board_content} <br>
</a>
첨부사진 : ${tl.board.board_img} <br>
글쓴날짜 : ${tl.board.board_wdate} <br>
좋아요 : ${tl.board.board_like} <br>
  <hr>
</c:forEach>


</body>
</html>