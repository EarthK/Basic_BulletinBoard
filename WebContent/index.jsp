<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ page import="java.util.regex.Pattern"%>
<%request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>자유 게시판</title>

<style type="text/css">
table {border: 2px solid black}

/*h1{text-align: center}*/
table{text-align: center;}
</style>

</head>
<body>
<%
	int idx = 1;
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String regdate = request.getParameter("regdate");
	int count = 10000;
	String content = request.getParameter("content");
	
	if(title == "" ||title == null) out.println("title이 null입니다.");
	 
	if(writer == "" ||writer == null)
	    out.println("writer가 null입니다.");   
	else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))
	    out.println("이메일 형식이 아닙니다.");
	 
	if(regdate == "" ||regdate == null)
	    out.println("regdate가 null입니다.");
	else if(!Pattern.matches("^[0-9]*$", regdate))
	    out.println("숫자형식이 아닙니다.");
	 
	if(content == "" ||content == null) out.println("content가 null입니다.");

%>
<h1>자유 게시판</h1>
<table>
	<tr>
		<td><%=idx %></td>
		<td><%=title %></td>
		<td><%=writer %></td>
		<td><%=regdate %></td>
		<td><%=count %></td>
	</tr>
</table>
<a href="write.jsp">글쓰기</a>
</body>
</html>