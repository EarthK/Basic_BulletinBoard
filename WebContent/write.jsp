<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ page import="java.util.regex.Pattern"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�۾���</title>

<script>

function formCheck(self) {
	var title = self[0].value;        // ����ϱ� ������ ������ �����Ͽ� ����ְ�,
    var writer = self[1].value;
    var content = self[2].value;
	var regdate = self[3].value;
    
	var length = self.length-1; //submit ����
	
	if (title == null || title == ""){                                    // null���� ���� ��
        alert('������ �Է��ϼ���');                                   // ���â�� ����
        document.forms[0].title.focus();                           // �ش��±׿� ��Ŀ���� �ص�
        return false;                                                     // false�� �����մϴ�.
    }
 
    if (writer == null ||  writer  == ""){          
        alert('�ۼ��ڸ� �Է��ϼ���'); 
        document.forms[0].writer.focus();                      
        return false;               
    }else if(writer.match(/^(\w+)@(\w+)[.](\w+)$/ig) == null){
        alert('�̸��� �������� �Է��ϼ���'); 
        document.forms[0].writer.focus();                      
        return false; 
    }
 
    if (regdate == null || regdate == "" ){                            
 
        alert('��¥�� �Է��ϼ���');   
        document.forms[0].regdate.focus();                      
        return false;            
 
    }else if(regdate.match(/^\d\d\d\d\d\d+$/ig)   == null){
        alert('���� ����(6�ڸ�)���� �Է��ϼ���'); 
        document.forms[0].regdate.focus();                      
        return false; 
    }

/* 
	for(var i = 0; i < length; i++){
	    if(self[i].value == null || self[i].value == ""){
	        alert(self[i].name + "��/�� �Է����ּ���."); 
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
����: <input type="text" name="title"/></br>
�ۼ���: <input type="text" name="writer"/></br>
����: <textarea name="content" rows="8" cols="80"></textarea><br>
��¥: <input type="date" name="regdate"/></br>
<input type="submit"/>
</form>
</body>
</html>
