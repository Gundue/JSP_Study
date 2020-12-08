<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>INSERT</h3>

<%
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection
	("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	
	Statement stmt = conn.createStatement();
%>
<script>
function submit_form(){
	if(document.input_form.sale_date.value === "") {
		alert("판매 일자를 입력해야 합니다");
		document.input_form.sale_date.focus();
		return;
	}
	if(document.input_form.sale_amount.value === "") {
		alert("판매 개수를 입력해야 합니다");
		document.input_form.sale_amount.focus();
		return;
	}
	alert("정상적으로 처리되었습니다");
	document.input_form.submit();
}
function reset_form() {
	document.input_form.reset();
}
</script>
<form action="action/insert_data.jsp" method="post" name="input_form">
	<table border="1">
		<tr>
			<td>판매한 상품</td>
			<td>
				<select name="product_id">
					<%
						Statement stmt_shop = conn.createStatement();
						ResultSet rs_shop = stmt.executeQuery("SELECT PRODUCT_ID, NAME FROM PRODUCT");
						while (rs_shop.next()) {
					%>
						<option value="<%=rs_shop.getInt(1) %>"><%= rs_shop.getString(2) %></option>
					<%
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>수량</td>
			<td><input type="number" name="amount"></td>
		</tr>
		<tr>
			<td>판매날짜</td>
			<td><input type="date" name="purchase_date"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="등록하기" onclick="submit_form()">
				<input type="button" value="다시쓰기" onclick="reset_form()">
			</td>
		</tr>
	</table>
</form>
<% 
		
		stmt_shop.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>