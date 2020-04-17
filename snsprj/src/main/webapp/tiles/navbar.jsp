<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 실시간 검색어 관련 스크립트 -->
<script>
$(function(){
	var keywordArray = new Array();
	var index = 0;
	
	test(); //최초 한번 실행
	setInterval(looptest, 2000); //2초마다 검색 결과를 바꿔줌
	setInterval(test, 360000); //1시간마다 데이터를 받아옴
	
	function test() {
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
			
				var obj = JSON.parse(this.responseText);
	
				var temp = "";
				var slid = document.getElementById("keywordspan");
	
				for (i = 0; i < obj.keywordList.length; i++) {
					temp = obj.keywordList[i].keyword;
					//json에서 값을 가져옴. 그 값을 배열에 넣을꺼임.
					
					keywordArray.push(temp);
	
				}
				console.log("???");
			}
		
		
		};
		xhttp.open("GET", "${pageContext.request.contextPath}/hot.do", true);
		xhttp.send();
	}

	function looptest() {
		document.getElementById("keywordspan").innerHTML = keywordArray[index];
		document.getElementById("hotNo").innerHTML = index+1;
		
		index++;
		if (index >= keywordArray.length) {
			index = 0;
		}
	}
});


</script>
		
<div class="w3-bar w3-theme-d2 w3-left-align w3-large w3-mobile ">
	<a 	href="javascript:void(0);" onclick="openNav()"
		class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2">
		<i class="fa fa-bars"></i> </a> 
		
	<a href="${pageContext.request.contextPath}/timeline.do" class="w3-bar-item w3-button w3-padding-large w3-theme-d5 "> 
		<img src="${pageContext.request.contextPath}/common/img/logo/40logo.png"  class="w3-circle" style="height: 25px; width: 75px" alt="SNSLOGOIMAGE"> </a>
		
		
	<a 	href="${pageContext.request.contextPath}/timeline.do" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="TIMELINE">
		<i class="fa fa-globe"></i> </a>
		
	<a 	href="${pageContext.request.contextPath}/userHome.do" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
		title="MYPAGE"><i class="fa fa-user"></i> </a>
		
		
	
	<!-- 검색창 -->
	<form id="frmSearch" name="frmSearch" action="/snsprj/SerchResult.do" method="post">
		<div class="w3-bar-item w3-right m12 s12 ">
		
		<input type="text" id="search" name="search" class="w3-small">
		<input type="submit"  value="검색" class="w3-small">
		</div>
	</form>
	
	<!-- 실시간 검색어 뜨는 자리 -->	
		<div id="slid_box" class="w3-bar-item  w3-right m12 s12" style="width:150px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; "> 
		<span id="hotNo" class="w3-small" ></span> 
		<span> . </span> 
		<span id="keywordspan" class="w3-small">실시간 검색어</span>
		</div>
	
</div>

<!-- 작은 화면 창 -->	
<div id="navDemo"
	class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
	<a href="${pageContext.request.contextPath}/timeline.do" class="w3-bar-item w3-button w3-padding-large">타임라인</a>
	<a href="${pageContext.request.contextPath}/userHome.do" class="w3-bar-item w3-button w3-padding-large">마이페이지</a>

</div>