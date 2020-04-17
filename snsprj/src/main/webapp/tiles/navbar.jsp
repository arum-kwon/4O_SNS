<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

		<!-- 실시간 검색어 관련 스크립트 -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script>
		$(document).ready(
			function test() {
				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
					
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
			xhttp.open("GET", "${pageContext.request.contextPath}/hot.do", true);
			xhttp.send();
		});
		</script>

<div class="w3-bar w3-theme-d2 w3-left-align w3-large">
	<a 	href="javascript:void(0);" onclick="openNav()"
		class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2">
		<i class="fa fa-bars"></i> </a> 
		
	<a 	href="${pageContext.request.contextPath}/timeline.do" class="w3-bar-item w3-button w3-padding-large w3-theme-d5" style="backgorund-color: red"> 
		<img src="${pageContext.request.contextPath}/common/img/logo/40logo.png" class="w3-circle" style="height: 25px; width: 75px" alt="SNSLOGOIMAGE"> </a>
		
	<a 	href="${pageContext.request.contextPath}/timeline.do" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="TIMELINE">
		<i class="fa fa-globe"></i> </a>
		
	<a 	href="${pageContext.request.contextPath}/userHome.do" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
		title="MYPAGE"><i class="fa fa-user"></i> </a>
		
	
	
	<!-- 알림창 -->
	<div class="w3-dropdown-hover w3-hide-small">
		<button class="w3-button w3-padding-large" title="Notifications">
			<i class="fa fa-bell"></i><span class="w3-badge w3-right w3-small w3-green">3</span>
		</button>
		<div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width: 300px">
			<a href="#" class="w3-bar-item w3-button">구독자의 새로운 타임라인이 등록되었습니다.</a>
			<a href="#" class="w3-bar-item w3-button">"닉네임"이 당신을 구독하였습니다. </a>
		</div>
	</div>
	
	<!-- 실시간 검색어 뜨는 자리 -->
		
		<div id="slid_box" class="w3-bar-item w3-hide-small w3-hide-medium  w3-padding " style="width:150px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; "> 
		<span id="hotNo" >1</span> 
		<span> . </span> 
		<span id="keywordspan">키워드자리리리리</span>
		</div>

		
	
	<!-- 검색창 -->
	<div class="w3-bar-item w3-hide-small w3-hide-medium ">
	<form id="frmSearch" name="frmSearch" action="/snsprj/SerchResult.do" method="post">
		<input type="text" id="search" name="search">
		<input type="submit" value="검색">
	</form>
	</div>
</div>

<!-- 작은 화면 창 -->	
<div id="navDemo"
	class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
	<a href="${pageContext.request.contextPath}/timeline.do" class="w3-bar-item w3-button w3-padding-large">타임라인</a>
	<a href="${pageContext.request.contextPath}/userHome.do" class="w3-bar-item w3-button w3-padding-large">마이페이지</a>

</div>