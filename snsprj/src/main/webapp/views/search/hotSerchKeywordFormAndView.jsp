<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.sns.search.dao.SearchDAO"%>
<%@page import="co.sns.common.SerKeyListDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 검색어</title>
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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	
</script>


</head>
<body>

<button type="button" onclick="findhotkey()" id="ajaxbtn"
		name="ajaxbtn">아작스 호출 클릭</button>
	<button type="button" onclick="test()" id="testbtn" name="testbtn"> 테스트버튼 나중에 지울꺼임</button>

<script>
		function findhotkey() {
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					var obj = JSON.parse(this.responseText);
					var text = "";
					for (i = 0; i < obj.keywordList.length; i++) {
						text = obj.keywordList[i].keyword
						document.getElementById("hotKeyowrd" + i).innerHTML = text;
					}
					console.log("여기로 넘어옸나?" + obj.keywordList);
					document.getElementById("hotKeyowrd"+ i).innerHTML = text;
					if (text == "") {
						document.getElementById("hotKeyowrd").innerHTML = "서버오류";
					}
				}
			};
			xhttp.open("GET", "../../hot.do", true);
			xhttp.send();
		}
	</script>
	<script>
	$(document).ready(
		function test() {
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					console.log("펑션이 실행됨")
					var obj = JSON.parse(this.responseText);

					var temp = "";
					var keywordArray = new Array();
					var index = 0;
					var slid = document.getElementById("keywordspan");

					for (i = 0; i < obj.keywordList.length; i++) {
						temp = obj.keywordList[i].keyword;
						//json에서 값을 가져옴. 그 값을 배열에 넣을꺼임.
						console.log(temp);
						keywordArray.push(temp);

					}
					function looptest() {
						document.getElementById("keywordspan").innerHTML = keywordArray[index];
						document.getElementById("hotNo").innerHTML = index+1
						
						index++;
						if (index >= keywordArray.length) {
							index = 0;
						}
					}
					setInterval(looptest, 3000);
				}
				
				
			};
			xhttp.open("GET", "../../hot.do", true);
			xhttp.send();
		});
		
	</script>
	
	<div id="hotDiv" class="hotDiv" name="hotDiv">
		<span id="hotKeyowrd0">여기에 키 붙일꺼임 </span><br> 
		<span id="hotKeyowrd1">여기에 키 붙일꺼임 </span><br>
		<span id="hotKeyowrd2">여기에 키 붙일꺼임 </span><br>
		<span id="hotKeyowrd3">여기에 키 붙일꺼임 </span><br>
		<span id="hotKeyowrd4">여기에 키 붙일꺼임 </span><br>
	</div>
	
	<div id="slid_box"
		style="position: relative; width: 100px; margin: auto; background-color: gold; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
		<span id="hotNo">1</span> 
		<span> . </span> 
		<span id="keywordspan">키워드자리리리리</span>
	</div>
	


	<hr>
	<button type="button" onclick="location.href='../../hot.do' ">서블릿
		실행 버튼</button>

	<h3>이렇게 되길 바래,,,</h3>
	${ hotKeywordsList}
	<div>
		<ul id="t" class="t">
			<c:forEach items="${ hotKeywordsList}" var="keywordList">
				<li>인기검색어 : ${keywordList.keyword }</li>
			</c:forEach>


		</ul>
	</div>
</body>
</html>