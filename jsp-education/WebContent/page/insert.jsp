<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3>INSERT</h3>

<script>
	function reset_form() {
		document.input_form.reset();
	}
</script>
<form action="action/insert_data.jsp" method="post" name="input_form">
	<table border="1">
		<tr>
			<td>피자코드</td>
			<td><input type="text" name="pizza_name"></td>
		</tr>
		<tr>
			<td>피자이름</td>
			<td><input type="text" name="pizza_code"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="등록하기">
				<input type="button" value="다시쓰기" onclick="reset_form()">
			</td>
		</tr>
	</table>
</form>