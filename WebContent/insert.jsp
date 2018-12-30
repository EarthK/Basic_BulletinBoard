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

if(title == "" ||title == null) out.println("title�� null�Դϴ�.");
 
if(writer == "" ||writer == null)
    out.println("writer�� null�Դϴ�.");   
else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))
    out.println("�̸��� ������ �ƴմϴ�.");
 
if(regdate == "" ||regdate == null)
    out.println("regdate�� null�Դϴ�.");
else if(!Pattern.matches("^[0-9]*$", regdate))
    out.println("���������� �ƴմϴ�.");
 
if(content == "" ||content == null) out.println("content�� null�Դϴ�.");


try {

     String driverName = "oracle.jdbc.driver.OracleDriver"; //�����ͺ��̽��� �����ϱ����� ����̹��� �ε��մϴ�.
     String url = "jdbc:oracle:thin:@localhost:1521:XE";            //���� URL������ ��Ʈ��ȣ(oracle��Ʈ), sid(oracle����)
 
     Class.forName(driverName);
     Connection con = DriverManager.getConnection(url,"board","1234");    // getCo... : �������� url, id, pw
     out.println("Oracle �����ͺ��̽� db�� ���������� �����߽��ϴ�");
     Statement stmt = con.createStatement();            // SQL ������ ���������� Statement ��ü ����
     String sql = "INSERT INTO BOARD "+
           "(IDX, TITLE, WRITER, REGDATE, COUNT, CONTENT) "+
           "VALUES (board_seq.nextval, '"+title+"', '"+writer+"' , sysdate, "+count+", '"+content+"')";

    stmt.executeUpdate(sql);       
    con.close();
    
} catch (Exception e) {
     out.println("Oracle �����ͺ��̽� db ���ӿ� ������ �ֽ��ϴ�. <hr>");
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