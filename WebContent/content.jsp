<%@page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%> 
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>자유 게시판</title>

<style type="text/css">
table {border: 2px solid black}

h1{text-align: center}
table{
  text-align: center;
  margin: auto;
}
</style>

</head>
<body>
<%
	String idx = request.getParameter("idx");
	try {

        String driverName = "oracle.jdbc.driver.OracleDriver"; 
        String url = "jdbc:oracle:thin:@localhost:1521:XE";
        ResultSet rs = null;
 
        Class.forName(driverName);
        Connection con = DriverManager.getConnection(url,"board","1234");
        out.println("Oracle Database Connection Success.");

        Statement stmt = con.createStatement();        
        String sql = "SELECT * FROM board WHERE idx="+idx;
        rs = stmt.executeQuery(sql);
       	
        if(rs.next()){
        	request.setAttribute("idx", rs.getString("idx"));
        	request.setAttribute("writer", rs.getString("writer"));
        	request.setAttribute("regdate", rs.getString("regdate"));
        	request.setAttribute("count", rs.getString("count"));
        	request.setAttribute("title", rs.getString("title"));
        	request.setAttribute("content", rs.getString("content"));
        }
		con.close();
	}
	catch (Exception e) {
        out.println("Oracle Database Connection Something Problem. <hr>");
        out.println(e.getMessage());
        e.printStackTrace();
    }	
%>
<h1>게시글 조회</h1>
<table border="1">
        <tr>               
            <th>번호</th>  
            <td>${idx}</td>
            <th>작성자</th>
            <td>${writer}</td>
            <th>날짜</th>
            <td>${regdate}</td>
            <th>조회수</th>
            <td>${count}</td>
        </tr>
		<tr>
			<th colspan="2">제목</th>
			<td colspan="6">${title}</td>
		</tr>
		<tr>
			<th colspan="2">내용</th>
			<td colspan="6">${content}</td>
		</tr>
</table>
<a href="delete.jsp?idx=${idx}">삭제하기</a>
</body>
</html>