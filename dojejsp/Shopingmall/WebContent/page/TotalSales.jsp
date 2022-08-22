<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<h3>통합 매출 내역 조회</h3>
<table border="1">
	<tr>
		<td>판매ID</td>
		<td>상품명</td>
		<td>구매 일자</td>
		<td>총 구매 내역</td>
		<td>구매 개수</td>
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
		"SALE.SALE_ID,PRODUCT.NAME, " +
		"SALE.PURCHASE_DATE, SALE.SALE_PRICE, SALE.AMOUNT " +
		"FROM " +
		"PRODUCT, SALE " +
		"WHERE " +
		"PRODUCT.PRODUCT_ID = SALE.PRODUCT_ID " +
		"ORDER BY " +
		"SALE.SALE_ID ASC ");
		while (rs.next()) {
%>
			<tr>
				<td><% out.println(rs.getInt(1)); %></td>
				<td><% out.println(rs.getString(2)); %></td>
				<td><% out.println(rs.getString(3)); %></td>
				<td><% out.println(rs.getInt(4)); %></td>
				<td><% out.println(rs.getInt(5)); %></td>
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