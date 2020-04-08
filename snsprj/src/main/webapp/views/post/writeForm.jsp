<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 폼</title>
<style>
textarea.textarea { min-height: 50px; }
</style>
<!-- 텍스트 입력에 따른 textarea 높이 자동조절 스크립트 -->
<script>
function resize(obj) {
  obj.style.height = "1px";
  obj.style.height = (12+obj.scrollHeight)+"px";
}
</script>
</head>

<body>
	<form name="writeFrom" method="post" enctype="multipart/form-data" action="#">
		<div>
			<button type ="button" onclick="#.history(-1)">취 소</button>
			<span>글 쓰 기</span>
			<button type ="button" onclick="#">등 록</button>
		</div>
		<textarea id ="textarea" name="textarea" class="textarea" onkeydown="resize(this)" onkeyup="resize(this)" value="내용" style="width:100%" placeholder="내 용" ></textarea>
		 <input type="file" name="imageFile" style="width:100%">
	</form>
</body>
</html>