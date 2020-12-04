<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
String shop_code = request.getParameter("shop_code");
String shop_name = request.getParameter("shop_name");

try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "sdh_8", "1234");

	Statement stmt = conn.createStatement();
	
	String query = "Insert INTO TBL_SHOP_01(SCODE, SNAME) VALUES('%s', '%s')";
	
	//out.println(String.format(query, pizza_code, pizza_name, cost));
	
	ResultSet rs = stmt.executeQuery(String.format(query, shop_code, shop_name));

	conn.commit();
	
	stmt.close();
	conn.close();
}
catch (Exception e) {
	e.printStackTrace();
}

response.sendRedirect("../index.jsp");

%>
   