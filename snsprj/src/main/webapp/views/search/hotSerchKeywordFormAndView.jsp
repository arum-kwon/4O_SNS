<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hot Serched Keyword Form And View.jsp</title>
<style>
.hot {
	height: 30px;
	overflow: hidden;
	margin: 0;
	padding: 0;
	list-style: none;
}

.hot li {
	height: 30px;
	padding: 5px;
	margin: 0px 5px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	//윈도우 창이 열리면 아작스를 통해서 서블릿을 거쳐 데이터를 가져올것이다.
	function hotKeywordLoad() {
		$.ajax({
			type : "get",
			cache : false,
			url : "../../hot.do",
			dataType : 'json',
			success : function(data) {
				console.log(data);
				alert( "success" );

				// DB 처리 성공 시 수행 내용 작성
				//var tag = "<c:choose><c:when test="${empty hotlist }"><li><b>검색을해보세요<b></li></ul></c:when><c:otherwise><c:forEach var="hotkey" items="${hotlist}"><li><a href="#">${hotkey.keyword }</li></c:forEach></ul></c:otherwise></c:choose>"
				//$("#hotDiv").append(tag);
			},

			error : function() {
				alert('연결실패 ㅠㅠ');

				return false;
			}
		});
		$('#hot li:first').fadeOut(function() {
			$(this).appendTo($('#hot')).fadeIn(100); // li 첫번째 요소를 fadeOut 처리뒤에 li 요소 마지막으로 붙이고 fadeIn
		});

	}

	//윈도우창이 다 열리면 hotKeywordLoad이 진행된다.
	//window.addEventListener("load", hotKeywordLoad);	

	//setInterval(function hotKeywordLoad(){}, 3000);
</script>

</head>
<body>
	<div id="hotDiv" class="hotDiv">
		<ul id="hot" class="hot">
	</div>


	<hr>

	<button onclick="hotKeywordLoad()">클릭...</button>
	예상도..

	<div>
		<ul id="hot" class="hot">
			<li><a href="#">인기검색어 값뿌려주는곳</li>
			<li><a href="#">인기검색어 값뿌려주는곳</li>
			<li><a href="#">인기검색어 값뿌려주는곳</li>
			<li><a href="#">인기검색어 값뿌려주는곳</li>
		</ul>
	</div>
</body>
</html>