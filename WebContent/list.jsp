<%@page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%> 
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