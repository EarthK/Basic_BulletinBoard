<%@page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%> 
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.sql.*"%>
<%@ page import="com.board.beans.Board" %> 
<%@ page import="java.util.ArrayList" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
        
        ArrayList<Board> articleList = new ArrayList<Board>(); //�� �ڵ�� Board�� �迭�������� �����Ѱ��Դϴ�.



		while (rs.next()) {

			Board article = new Board(); //�����͵��� ������� Board��ü�� �޸𸮸� �Ҵ��ϴ� �ڵ��Դϴ�.

			article.setIdx(rs.getInt("idx")); // Integer.parseInt�� String���� int�������� ����ȯ

			article.setTitle(rs.getString("title"));

			article.setWriter(rs.getString("writer"));

			article.setRegdate(rs.getString("regdate"));

			article.setCount(rs.getInt("count"));

			articleList.add(article); // ���õ� ���� ����Ʈ�� �߰��մϴ�.

		}

		request.setAttribute("articleList", articleList); // ���õ� ����Ʈ�� �信 �������մϴ�.
		
		con.close();
		}
		catch (Exception e) {
	        out.println("Oracle Database Connection Something Problem. <hr>");
	        out.println(e.getMessage());
	        e.printStackTrace();
	    }	

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

<c:forEach items="${articleList}" var="article">

			<tr>

				<td>${article.idx}</td><!-- jstl�� ǥ������ ��ũ��Ʈ���� �Ӽ��� ���Ƽ� ��𿡾��� �켱�� -->

				<td><a href='content.jsp?idx=${article.idx}'>${article.title}</a></td>

				<td>${article.writer}</td>

				<td>${article.regdate}</td>

				<td>${article.count}</td>

			</tr>

		</c:forEach>

</table>
<center><a href="write.jsp">�۾���</a></center>

</body>
</html>