<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardView.jsp</title>
</head>
<body>
<h1>게시글 상세보기</h1>
＃글번호: ${ boards.board_no }<br>
＃작성자: ${ boards.board_user_id }<br>
＃내용: ${ boards.board_content }<br>
＃좋아요: ${ boards.board_like }<br>
＃작성일: ${ boards.board_wdate }<br>
＃사진: ${ boards.board_img }<br>


</body>
</html>