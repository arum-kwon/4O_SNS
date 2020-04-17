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
<!-- https://forest71.tistory.com/22 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script>
<!-- 텍스트 입력에 따른 textarea 높이 자동조절 스크립트 -->
function resize(obj) {
  obj.style.height = "1px";
  obj.style.height = (12+obj.scrollHeight)+"px";
}

function checkedSubmit() {
    var content = writeFrom.content.value;
    
    if(!content){
        alert(" 내용을 입력해주세요.")
    }else{
    	document.writeFrom.submit();
}
}

function goBack(){
	window.history.back();
	}
	
</script>
</head>

<body>
	<form name="writeFrom" id="writeFrom" method="post" enctype="multipart/form-data" action="/snsprj/insertBoard.do">
		<div align ="center">
			<button type ="button" onclick="goBack()">취 소</button>
			<button type="button" id="btnSubmit" name="btnSubmit" onClick="checkedSubmit()">등 록</button>
		</div>
			<textarea id ="content" name="content" class="content" onkeydown="resize(this)" onkeyup="resize(this)" 
				style="width:100%" placeholder="내 용" ></textarea>
			
		 <input type="file" name="imageFile" id="imageFile" style="width:100%"">
	</form>
</body>
</html>