<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<h3>참가자목록조회</h3>
<table border ="1">
<tr>
	<td>채점번호</td>
	<td>참가번호</td>
	<td>참가자명</td>
	<td>생년월일</td>
	<td>점수</td>
	<td>평점</td>
	<td>멘토</td>
</tr>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM tbl_artist_2019SELECT " +
			    "POINT.SERIAL_NO,ARTIST.ARTIST_ID,ARTIST.ARTIST_NAME,ARTIST.ARTIST_BIRTH,POINT.POINT,MENTO.MENTO_NAME " +
			    "FROM TBL_MENTO_201905 MENTO, TBL_POINT_201905 POINT, TBL_ARTIST_201905 ARTIST " +
			    "WHERE MENTO.MENTO_ID = POINT.MENTO_ID AND POINT.ARTIST_ID = ARTIST.ARTIST_ID05 ");
		while (rs.next()) {
			String year = rs.getString(3).substring(0, 4);
			String month = rs.getString(3).substring(4, 6); 
			String day = rs.getString(3).substring(6, 8);
			
			String rate = null;
			int point = rs.getInt(5);
			if(point >= 90) {
				rate = "A";
			} else if (point >= 80) {
				rate = "B";
			}else if (point >= 70) {
				rate = "B";
			}
			else if (point >= 60) {
				rate = "B";
			} else {
				rate = "F";
			}
			
			
			%>
			
			<tr>
				<td><%= rs.getString(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				<td><%= String.format("%s년 %s월 %s일", year, month, day) %></td>
				<td><%= rs.getString(5)%></td>
				<td><%= rate %></td>
				<td><%= rs.getString(6) %></td>
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