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
<h1>���� �Խ���</h1>
<table>
        <tr>                                  <!-- table�±� ������ ���� �����Ҷ� ���� �±��Դϴ�. -->
            <th>��ȣ</th>                     <!-- Table Header�� ���ڷ� table�±� ������ -->
            <th>����</th>                     <!-- �����ϰ���� �÷��� ��Ÿ���� ���� �±��Դϴ�. -->
            <th>�ۼ���</th>
            <th>��¥</th>
            <th>��ȸ��</th>
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
<center><a href="write.jsp">�۾���</a></center>

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