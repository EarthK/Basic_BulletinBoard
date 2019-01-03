<%@page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<h1>자유 게시판</h1>
<table>
        <tr>                                  <!-- table태그 내에서 행을 정의할때 쓰는 태그입니다. -->
            <th>번호</th>                     <!-- Table Header의 약자로 table태그 내에서 -->
            <th>제목</th>                     <!-- 강조하고싶은 컬럼을 나타낼때 쓰는 태그입니다. -->
            <th>작성자</th>
            <th>날짜</th>
            <th>조회수</th>
        </tr>

<c:forEach items="${articleList}" var="article">

			<tr>

				<td>${article.idx}</td><!-- jstl의 표현식은 스크립트릿과 속성이 같아서 어디에쓰나 우선됨 -->

				<td><a href='content.jsp?idx=${article.idx}'>${article.title}</a></td>

				<td>${article.writer}</td>

				<td>${article.regdate}</td>

				<td>${article.count}</td>

			</tr>

		</c:forEach>

</table>
<center><a href="write.jsp">글쓰기</a></center>

</body>
</html>