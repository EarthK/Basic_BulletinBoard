<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

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
        String sql = "DELETE FROM board WHERE idx="+idx;
        stmt.executeQuery(sql);
       
		con.close();
	}
	catch (Exception e) {
		
    	out.println("Oracle Database Connection Something Problem.");
    	out.println(e.getMessage());
    	e.printStackTrace();
	}	
%>
<script>
	alert("게시글이 삭제되었습니다.");
	location.href="redirect.jsp";
</script>

</body>
</html>