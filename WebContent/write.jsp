<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ page import="java.util.regex.Pattern"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>글쓰기</title>

<script>

function formCheck(self) {
	var title = self[0].value;        // 사용하기 쉽도록 변수를 선언하여 담아주고,
    var writer = self[1].value;
    var content = self[2].value;
	var regdate = self[3].value;
    
	var length = self.length-1; //submit 제외
	
	if (title == null || title == ""){                                    // null인지 비교한 뒤
        alert('제목을 입력하세요');                                   // 경고창을 띄우고
        document.forms[0].title.focus();                           // 해당태그에 포커스를 준뒤
        return false;                                                     // false를 리턴합니다.
    }
 
    if (writer == null ||  writer  == ""){          
        alert('작성자를 입력하세요'); 
        document.forms[0].writer.focus();                      
        return false;               
    }else if(writer.match(/^(\w+)@(\w+)[.](\w+)$/ig) == null){
        alert('이메일 형식으로 입력하세요'); 
        document.forms[0].writer.focus();                      
        return false; 
    }
 
    if (regdate == null || regdate == "" ){                            
 
        alert('날짜를 입력하세요');   
        document.forms[0].regdate.focus();                      
        return false;            
 
    }else if(regdate.match(/^\d\d\d\d\d\d+$/ig)   == null){
        alert('숫자 형식(6자리)으로 입력하세요'); 
        document.forms[0].regdate.focus();                      
        return false; 
    }

/* 
	for(var i = 0; i < length; i++){
	    if(self[i].value == null || self[i].value == ""){
	        alert(self[i].name + "을/를 입력해주세요."); 
	        self[i].focus(); 
	        return false;
	    } 
	}//end for  
 */
 }
</script>

</head>
<body>
<form action="insert.jsp" method="post" onsubmit="return formCheck(this);">
제목: <input type="text" name="title"/></br>
작성자: <input type="text" name="writer"/></br>
내용: <textarea name="content" rows="8" cols="80"></textarea><br>
날짜: <input type="date" name="regdate"/></br>
<input type="submit"/>
</form>
</body>
</html>
