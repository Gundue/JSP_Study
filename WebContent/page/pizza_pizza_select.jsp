<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<h3>지점별매출현황</h3>
<table border ="1">
<tr>
	<td>피자코드</td>
	<td>피자 명</td>
	<td>총매출액</td>
</tr>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery("SELECT " +
			    "PIZZA.PCODE, PIZZA.PNAME, " +
			    "SUM(PIZZA.COST * SALELIST.AMOUNT) TOTAL " +
			"FROM " +
			    "TBL_SALELIST_01 SALELIST, TBL_PIZZA_01 PIZZA " +
			"WHERE " +
			    "PIZZA.PCODE = SALELIST.PCODE " +
			"GROUP BY " +
			    "PIZZA.PCODE, PIZZA.PNAME " +
			"ORDER BY " +
			    "PIZZA.PCODE ASC");
		while (rs.next()) {
%>
			<tr>
				<td><% out.println(rs.getString(1)); %></td>
				<td><% out.println(rs.getString(2)); %></td>
				<td><% out.println(rs.getInt(3)); %></td>
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