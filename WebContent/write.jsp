<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ page import="java.util.regex.Pattern"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>글쓰기</title>

<script>

function formCheck(self) {
	var length = self.length-1; //submit 제외

	for(var i = 0; i < length; i++){
	    if(self[i].value == null || self[i].value == ""){
	        alert(self[i].name + "을/를 입력해주세요."); 
	        self[i].focus(); 
	        return false;
	    } 
	}//end for  
}
</script>

</head>
<body>
<form action="index.jsp" method="post" onsubmit="return formCheck(this);">
제목: <input type="text" name="title"/></br>
작성자: <input type="text" name="writer"/></br>
내용: <textarea name="content" rows="8" cols="80"></textarea><br>
날짜: <input type="date" name="regdate"/></br>
<input type="submit"/>
</form>
</body>
</html>
