<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ page import="java.util.regex.Pattern"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�۾���</title>

<script>

function formCheck(self) {
	var length = self.length-1; //submit ����

	for(var i = 0; i < length; i++){
	    if(self[i].value == null || self[i].value == ""){
	        alert(self[i].name + "��/�� �Է����ּ���."); 
	        self[i].focus(); 
	        return false;
	    } 
	}//end for  
}
</script>

</head>
<body>
<form action="index.jsp" method="post" onsubmit="return formCheck(this);">
����: <input type="text" name="title"/></br>
�ۼ���: <input type="text" name="writer"/></br>
����: <textarea name="content" rows="8" cols="80"></textarea><br>
��¥: <input type="date" name="regdate"/></br>
<input type="submit"/>
</form>
</body>
</html>
