<%@page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%> 
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �Խ���</title>

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
<h1>�Խñ� ��ȸ</h1>
<table border="1">
        <tr>               
            <th>��ȣ</th>  
            <td>${idx}</td>
            <th>�ۼ���</th>
            <td>${writer}</td>
            <th>��¥</th>
            <td>${regdate}</td>
            <th>��ȸ��</th>
            <td>${count}</td>
        </tr>
		<tr>
			<th colspan="2">����</th>
			<td colspan="6">${title}</td>
		</tr>
		<tr>
			<th colspan="2">����</th>
			<td colspan="6">${content}</td>
		</tr>
</table>
<a href="delete.jsp?idx=${idx}">�����ϱ�</a>
</body>
</html>