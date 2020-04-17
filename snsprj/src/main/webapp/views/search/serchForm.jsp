<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function checkedSubmit() {
    var content = writeFrom.content.value;
    
    if(!content){
        alert(" 내용을 입력해주세요.")
    }else{
    	document.writeFrom.submit();
}
}
</script>
</head>
<body>
<form id="frm" name="frm" action="../../SerchResult.do" method="post">
<input type="text" id="search" name="search">
<input type="submit" value="검색">
<button type ="submit" onclick="checkedSubmit()">검색</button>
</form>
</body>
</html>