<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%
String artist_id = request.getParameter("artist_id");
String artist_name = request.getParameter("artist_name");
String artist_birth_year = request.getParameter("artist_birth_year");
String artist_birth_month = request.getParameter("artist_birth_month");
String artist_birth_day = request.getParameter("artist_birth_day");
String artist_gender = request.getParameter("artist_gender");
String telant = request.getParameter("telant");
String agency = request.getParameter("agency");


try {


	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	
	Statement stmt = con.createStatement();
	String query = "INSERT INTO TBL_ARTIST_201905(ARTIST_ID, ARTIST_NAME, ARTIST_BIRTH, ARTIST_GENDER, TALENT, AGENCY) " +
	"VALUES ('%s', '%s', '%s%s%s', '%s', '%s', '%s')";
	ResultSet rs = stmt.executeQuery(String.format(query, artist_id, artist_name, artist_birth_year, artist_birth_month,
			artist_birth_day, artist_gender, telant, agency));
	stmt.close();
	con.close();
} catch (Exception e) {
	e.printStackTrace();
}

response.sendRedirect("../index.jsp?section=artist_lookup");
%>