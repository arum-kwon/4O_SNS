<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="w3-bar w3-theme-d2 w3-left-align w3-large">
	<a 	href="javascript:void(0);" onclick="openNav()"
		class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2">
		<i class="fa fa-bars"></i> </a> 
		
	<a 	href="#" class="w3-bar-item w3-button w3-padding-large w3-theme-d5" style="backgorund-color: red"> 
		<img src="../common/image/LOGO.png" class="w3-circle" style="height: 25px; width: 25px" alt="profileImg"> </a>
		
	<a 	href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="News">
		<i class="fa fa-globe"></i> </a>
		
	<a 	href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
		title="Account Settings"><i class="fa fa-user"></i> </a>
		
	<a 	href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
		title="Messages"><i class="fa fa-envelope"></i> </a>
	
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
	
	
	<form id="frmSearch" name="frmSearch" action="/snsprj/SerchResult.do" method="post">
		<input type="text" id="search" name="search">
		<input type="submit" value="검색">
	</form>
</div>

<!-- 작은 화면 창 -->	
<div id="navDemo"
	class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
	<a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>
	<a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>
	<a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>
	<a href="#" class="w3-bar-item w3-button w3-padding-large">My
		Profile</a>
</div>