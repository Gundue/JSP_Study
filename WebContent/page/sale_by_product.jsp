<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>상품별 판매액</h3>
<table border ="1">
<tr>
	<td>상품코드</td>
	<td>상품명</td>
	<td>상품별 판매액</td>
</tr>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost/xe", "system", "1234");
		if (conn != null) {
			out.println("Database Connected!");
		}
		else {
			out.println("Database Connect Fail!");
		}
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT " +
			    "PRODUCT.PCODE, PRODUCT.NAME, TO_CHAR(SUM(PRODUCT.COST * SALELIST.AMOUNT), '999,999,999') " +
			    "FROM " +
			        "TBL_PRODUCT_02 PRODUCT, TBL_SALELIST_02 SALELIST " +
			    "WHERE " +
			        "PRODUCT.PCODE = SALELIST.PCODE " +
			    "GROUP BY " +
			        "PRODUCT.PCODE, PRODUCT.NAME");
		while (rs.next()) {
%>
			<tr>
				<td><% out.println(rs.getString(1)); %></td>
				<td><% out.println(rs.getString(2)); %></td>
				<td><% out.println(rs.getString(3)); %></td>
			</tr>
<% 
		}
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>
</table>