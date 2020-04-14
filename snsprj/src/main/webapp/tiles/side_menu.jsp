<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Profile -->
<div class="w3-card w3-round w3-white">
	<div class="w3-container">
	
		<p class="w3-center">
			<img src="../common/image/pro/${my_pro_img_name}" class="w3-circle" style="height: 106px; width: 106px" alt="Avatar">
		</p>
		<a href="/snsprj/userHome.do">
			<h4 class="w3-center">${my_id}</h4>
		</a>
		<hr>
		<p>
			<i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i>
		    <c:if test="${empty my_info}">
		    	자신을 소개해보세요.
		    </c:if>
			${my_info}
		</p>
		<p>
			<i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i>
		    <c:if test="${empty my_job}">
		    	직업을 입력해보세요.
		    </c:if>
			${my_job}
		</p>
		<p>
			<i
				class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i>
		    <c:if test="${empty my_birth}">
		    	생일을 입력해보세요.
		    </c:if>
			${my_birth}
		</p>
	</div>
</div>
<br>

<!-- Accordion -->
<div class="w3-card w3-round" id="profile">
	<div class="w3-white">
		<button onclick="move('timeLine')" class="w3-button w3-block w3-theme-l1 w3-left-align">
			<i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i> 타임라인
		</button>
		<button onclick="move('subFromMe')" class="w3-button w3-block w3-theme-l1 w3-left-align">
			<i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> 구독목록
		</button>				
		<button onclick="move('subToMe')" class="w3-button w3-block w3-theme-l1 w3-left-align">
			<i class="fa fa-users fa-fw w3-margin-right"></i> 나를 구독하는 사람
		</button>
		<button onclick="move('mss')" class="w3-button w3-block w3-theme-l1 w3-left-align">
			<i class="fa fa-users fa-fw w3-margin-right"></i> 메세지
		</button>
		<button onclick="move('write')" class="w3-button w3-block w3-theme-l1 w3-left-align">
			<i class="fa fa-users fa-fw w3-margin-right"></i> 타임라인 글쓰기
		</button>
		<button onclick="move('likeBoard')" class="w3-button w3-block w3-theme-l1 w3-left-align">
			<i class="fa fa-users fa-fw w3-margin-right"></i> 좋아하는 글
		</button>
		<button onclick="move('subRecomemd')" class="w3-button w3-block w3-theme-l1 w3-left-align">
			<i class="fa fa-users fa-fw w3-margin-right"></i> 구독 추천
		</button>
	</div>
</div>
<br>

<script type="text/javascript">
	function move(to){
		if(to == 'timeLine'){
			location.href="/snsprj/timeline.do";
		}
		if(to == 'subToMe'){
			location.href="/snsprj/SubToMe.do";
		}
		if(to == 'subFromMe'){
			location.href="/snsprj/subList.do";
		}
		if(to == 'mss'){
			location.href="#";
		}
		if(to == 'write'){
			location.href="/snsprj/insertBoard.do";
		}
		if(to == 'likeBoard'){
			location.href="/snsprj/LikeBoard.do";
		}
		if(to == 'subRecomemd'){
			location.href="#";
		}
	}

</script>