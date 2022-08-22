<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3>오디션 등록</h3>

<form action="action/insert_artist.jsp" name="action_form">
	<table border="1">
		<tr>
			<td>참가번호</td>
			<td><input type="text" name="artist_id">*참가번호는 (A000) 4자리입니다</td>
		</tr>
		<tr>
			<td>참가자명</td>
			<td><input type="text" name="artist_name"></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>
				<input type="number" name="artist_birth_year"> 년
				<input type="number" name="artist_birth_month"> 월
				<input type="number" name="artist_birth_day"> 일
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<input type="radio" name="artist_gender" value="M"> 남성
				<input type="radio" name="artist_gender" value="F"> 여성
			</td>
		</tr>
		<tr>
			<td>특기</td>
			<td>
				<select name="telant">
					<option value="0">특기선택</option>
					<option value="1">댄스</option>
					<option value="2">보컬</option>
					<option value="3">랩</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>소속사</td>
			<td><input type="text" name="agency"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="오디션 등록" onclick="submit_form()">
				<input type="button" value="다시쓰기" onclick="reset_form()">
			</td>
		</tr>
	
	</table>
</form>

<script>
function submit_form() {
	if (document.action_form.artist_id.value === "") {
		alert("참가번호가 입력되지 않았습니다!");
		document.action_form.artist_id.focus();
		return;
	}
	if (document.action_form.artist_name.value === "") {
		alert("참가자명이 입력되지 않았습니다!");
		document.action_form.artist_name.focus();
		return;
	}
	if (document.action_form.artist_birth_year.value === "" || 
			document.action_form.artist_birth_month.value === "" ||
			document.action_form.artist_birth_day.value === "" ) {
		alert("생년월일이 입력되지 않았습니다!");
		document.action_form.artist_birth_year.focus();
		return;
	}
	if (document.action_form.artist_gender.value === "") {
		alert("성별이 입력되지 않았습니다!");
		return;
	}
	if (document.action_form.telant.selectedIndex === 0) {
		alert("특기가 입력되지 않았습니다!");
		return;
	}
	if (document.action_form.agency.value === "") {
		alert("소속사가 입력되지 않았습니다!");
		document.action_form.agency.focus();
		return;
	}
	
	alert("참가신청이 정상적으로 등록되었습니다!");
	document.action_form.submit();
}

function reset_form() {
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	document.action_form.reset();
	document.action_form.artist_id.focus();
}
</script>