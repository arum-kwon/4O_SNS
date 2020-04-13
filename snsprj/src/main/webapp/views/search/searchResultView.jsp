<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
div p {overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  height: 20px;
  }
</style>
</head>
<body class="w3-light-grey w3-content" style="max-width:1600px">
여기로 뿌려준다
<table border="1">
<tr>
	<th>#</th>
	<th>글내용</th>
	<th>좋아요</th>
	<th>작성일</th>
</tr>

<c:choose>
				<c:when test="${empty searchedPosts }">
					<tr>
						<td colspan="4">데이터가 없습니다.</td>
					</tr>
					</table>
				</c:when>
				<c:otherwise>
					<c:forEach var="post" items="${searchedPosts }">
						<tr>
							<td align="center">${post.board_no }</td>
							<td align="center">${post.board_content }</td>
							<td align="center">${post.board_like }</td>
							<td align="center">${post.board_wdate }</td>
						</tr>
						
					</c:forEach>
						</table>
						<div>
						<a href="#자바스크립트 링크 걸기">더 불러오기</a>
						</div>
				</c:otherwise>
			</c:choose>


<!-- 그리드에 마우스 올렸을때 이팩트 -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" >

  <!-- Header -->
  <header id="portfolio">
    <div class="w3-container">
    <h2><b>검색 결과</b></h2>
    <div class="w3-section w3-bottombar w3-padding-16">
      <span class="w3-margin-right">검색결과가 없습니다.</span> 
<!--     <button class="w3-button w3-black">ALL</button>
      <button class="w3-button w3-white"><i class="fa fa-diamond w3-margin-right"></i>Design</button>
      <button class="w3-button w3-white w3-hide-small"><i class="fa fa-photo w3-margin-right"></i>Photos</button>
      <button class="w3-button w3-white w3-hide-small"><i class="fa fa-map-pin w3-margin-right"></i>Art</button>   --> 
    </div>
    </div>
  </header>
  
  <!-- First Photo Grid-->
  <div class="w3-row-padding">
    <div class="w3-col s12 m4 l2 w3-container w3-margin-bottom" >
      <img src="../../common/image/logo.png" alt="게시글첨부이미지" style="width:100%" class="w3-hover-opacity">
      <div class="w3-container w3-white">
        <p><b>작성일, 작성자 올 자리</b></p>
        <p>내용이 올자리</p>
      </div>
    </div>
    <div class="w3-col s12 m4 l2 w3-container w3-margin-bottom">
      <img src="../../common/image/logo.png" alt="게시글첨부이미지" style="width:100%" class="w3-hover-opacity">
      <div class="w3-container w3-white">
        <p><b>작성일, 작성자 올 자리</b></p>
        <p>내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까??????</p>
      </div>
    </div>
    <div class="w3-col s12 m4 l2 w3-container w3-margin-bottom">
      <img src="../../common/image/logo.png" alt="게시글첨부이미지" style="width:100%" class="w3-hover-opacity">
      <div class="w3-container w3-white">
        <p><b>작성일, 작성자 올 자리</b></p>
        <p>내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올</p>
      </div>
    </div>
     <div class="w3-col s12 m4 l2 l1 w3-container w3-margin-bottom">
      <img src="../../common/image/logo.png" alt="게시글첨부이미지" style="width:100%" class="w3-hover-opacity">
      <div class="w3-container w3-white">
        <p><b>작성일, 작성자 올 자리</b></p>
        <p>내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올</p>
      </div>
    </div>
    <div class="w3-col s12 m4 l2 l1 w3-container w3-margin-bottom">
      <img src="../../common/image/logo.png" alt="게시글첨부이미지" style="width:100%" class="w3-hover-opacity">
      <div class="w3-container w3-white">
        <p><b>작성일, 작성자 올 자리</b></p>
        <p>내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올</p>
      </div>
    </div>
    <div class="w3-col s12 m4 l2 l1 w3-container w3-margin-bottom">
      <img src="../../common/image/logo.png" alt="게시글첨부이미지" style="width:100%" class="w3-hover-opacity">
      <div class="w3-container w3-white">
        <p><b>작성일, 작성자 올 자리</b></p>
        <p>내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올</p>
      </div>
    </div>
    
  </div>
  
  <!-- Second Photo Grid-->
  <div class="w3-row-padding">
    <div class="w3-col s12 m4 l2 w3-container w3-margin-bottom" >
      <img src="../../common/image/logo.png" alt="게시글첨부이미지" style="width:100%" class="w3-hover-opacity">
      <div class="w3-container w3-white">
        <p><b>작성일, 작성자 올 자리</b></p>
        <p>내용이 올자리</p>
      </div>
    </div>
    <div class="w3-col s12 m4 l2 w3-container w3-margin-bottom">
      <img src="../../common/image/logo.png" alt="게시글첨부이미지" style="width:100%" class="w3-hover-opacity">
      <div class="w3-container w3-white">
        <p><b>작성일, 작성자 올 자리</b></p>
        <p>내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까??????</p>
      </div>
    </div>
    <div class="w3-col s12 m4 l2 w3-container w3-margin-bottom">
      <img src="../../common/image/logo.png" alt="게시글첨부이미지" style="width:100%" class="w3-hover-opacity">
      <div class="w3-container w3-white">
        <p><b>작성일, 작성자 올 자리</b></p>
        <p>내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올</p>
      </div>
    </div>
     <div class="w3-col s12 m4 l2 l1 w3-container w3-margin-bottom">
      <img src="../../common/image/logo.png" alt="게시글첨부이미지" style="width:100%" class="w3-hover-opacity">
      <div class="w3-container w3-white">
        <p><b>작성일, 작성자 올 자리</b></p>
        <p>내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올</p>
      </div>
    </div>
    <div class="w3-col s12 m4 l2 l1 w3-container w3-margin-bottom">
      <img src="../../common/image/logo.png" alt="게시글첨부이미지" style="width:100%" class="w3-hover-opacity">
      <div class="w3-container w3-white">
        <p><b>작성일, 작성자 올 자리</b></p>
        <p>내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올</p>
      </div>
    </div>
    <div class="w3-col s12 m4 l2 l1 w3-container w3-margin-bottom">
      <img src="../../common/image/logo.png" alt="게시글첨부이미지" style="width:100%" class="w3-hover-opacity">
      <div class="w3-container w3-white">
        <p><b>작성일, 작성자 올 자리</b></p>
        <p>내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올까?????내용이 겁나 길면 도대체 어떻게 나올</p>
      </div>
    </div>
    
  </div>
</body>
</html>