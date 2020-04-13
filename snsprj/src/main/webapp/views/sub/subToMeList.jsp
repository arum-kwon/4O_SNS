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

<h1>나를 구독하는 사람들</h1>
<c:forEach items="${list}" var="user">
  ID : ${user.user_id} <br>
  NAME : ${user.user_name} <br>
  PRO : ${user.user_pro_img_name} <br>
  <hr>
</c:forEach>


</body>
</html>