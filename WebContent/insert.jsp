<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%@ page import="java.util.regex.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert</title>
<%
request.setCharacterEncoding("euc-kr");
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


try {

     String driverName = "oracle.jdbc.driver.OracleDriver"; //데이터베이스에 접속하기위한 드라이버를 로드합니다.
     String url = "jdbc:oracle:thin:@localhost:1521:XE";            //접속 URL정보와 포트번호(oracle포트), sid(oracle버전)
 
     Class.forName(driverName);
     Connection con = DriverManager.getConnection(url,"board","1234");    // getCo... : 계정정보 url, id, pw
     out.println("Oracle 데이터베이스 db에 성공적으로 접속했습니다");
     Statement stmt = con.createStatement();            // SQL 쿼리를 날리기위한 Statement 객체 생성
     String sql = "INSERT INTO BOARD "+
           "(IDX, TITLE, WRITER, REGDATE, COUNT, CONTENT) "+
           "VALUES (board_seq.nextval, '"+title+"', '"+writer+"' , sysdate, "+count+", '"+content+"')";

    stmt.executeUpdate(sql);       
    con.close();
    
} catch (Exception e) {
     out.println("Oracle 데이터베이스 db 접속에 문제가 있습니다. <hr>");
     out.println(e.getMessage());
     e.printStackTrace();
 
}finally{
	 
    out.print("<script>location.href='index.jsp';</script>");

}

%>

</head>
<body>

</body>
</html>