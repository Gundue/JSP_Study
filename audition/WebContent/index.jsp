<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String section = request.getParameter("section") != null ? request.getParameter("section") : "" ; 
%>
</head>
<body>
	<%@include file="static/header.jsp" %>
	<%@include file="static/nav.jsp" %>
	
	<%
		switch(section) {
		case "audition_insert":
		%><%@include file="page/audition_insert.jsp" %><%
		break;
		case "audition_artist_select":
		%><%@include file="page/audition_artist_select.jsp" %><%
		break;
		case "audition_mento_select":
		%><%@include file="page/audition_mento_select.jsp" %><%
		break;
		case "audition_rank_select":
		%><%@include file="page/audition_rank_select.jsp" %><%
		break;
		default:
		%><%@include file="static/index.jsp" %><%
		}
	%>
</body>
</html>