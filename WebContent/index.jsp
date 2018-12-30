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

	try {

        String driverName = "oracle.jdbc.driver.OracleDriver"; 
        String url = "jdbc:oracle:thin:@localhost:1521:XE";
        ResultSet rs = null;
 
        Class.forName(driverName);
        Connection con = DriverManager.getConnection(url,"board","1234");
        out.println("Oracle Database Connection Success.");

        Statement stmt = con.createStatement();        
        String sql = "SELECT * FROM board ORDER BY idx DESC";
        rs = stmt.executeQuery(sql);
%>
<h1>자유 게시판</h1>
<table>
        <tr>                                  <!-- table태그 내에서 행을 정의할때 쓰는 태그입니다. -->
            <th>번호</th>                     <!-- Table Header의 약자로 table태그 내에서 -->
            <th>제목</th>                     <!-- 강조하고싶은 컬럼을 나타낼때 쓰는 태그입니다. -->
            <th>작성자</th>
            <th>날짜</th>
            <th>조회수</th>
        </tr>

  	<%while(rs.next()){%>
 		<tr>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(5)%></td>
		</tr>
	<%}%>
</table>
<center><a href="write.jsp">글쓰기</a></center>

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