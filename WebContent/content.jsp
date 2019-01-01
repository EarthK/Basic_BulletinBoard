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
        rs.next();
%>
<h1>게시글 조회</h1>
<table>
        <tr>               
            <th>번호</th>  
            <td><%=idx%></td>
            <th>제목</th>
            <td><%=rs.getString("title")%></td>  
            <th>작성자</th>
            <td><%=rs.getString("writer")%></td>
            <th>날짜</th>
            <td><%=rs.getString("regdate")%></td>
            <th>조회수</th>
            <td><%=rs.getString("count")%></td>
        </tr>
		<tr>
			<th colspan="2">제목</th>
			<td colspan="6"><%=rs.getString("title") %></td>
		</tr>
		<tr>
			<th colspan="8">내용</th>
		</tr>
		<tr>
			<td><%=rs.getString("content") %></td>
		</tr>
</table>

<%
	con.close();
	}
	catch (Exception e) {
        out.println("Oracle Database Connection Something Problem. <hr>");
        out.println(e.getMessage());
        e.printStackTrace();
    }	
%>
</body>
</html>