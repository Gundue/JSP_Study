<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
int saleno = Integer.parseInt(request.getParameter("saleno"));
String pcode = request.getParameter("pcode");
String sdata = request.getParameter("sdata");
String scode = request.getParameter("scode");
int amount = Integer.parseInt(request.getParameter("amount"));
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	Statement stmt = conn.createStatement();
	
	String query = "Insert INTO TBL_SALELIST_02 (saleno, pcode, saledate, scode, amount) VALUES (%d, '%s', '%s', '%s', %d)";
	
	//out.println(String.format(query, saleno, pcode, sdata, scode, amount));
	
	ResultSet rs = stmt.executeQuery(String.format(query, saleno, pcode, sdata, scode, amount));
	conn.commit();
	
	stmt.close();
	conn.close();
}
catch (Exception e) {
	e.printStackTrace();
}
response.sendRedirect("../index.jsp");
%>