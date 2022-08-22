<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/css.css">
<%
	String section = request.getParameter("section") != null  ? request.getParameter("section") : "";
%>
</head>
<body>
	<%@include file="static/header.jsp" %>
	<%@include file="static/nav.jsp" %>
	
	<%
	switch(section) {
	case "Registration":
		%><%@include file="page/Registration.jsp" %><%
	break;
	case "TotalSales":
		%><%@include file="page/TotalSales.jsp" %><%
	break;
	case "Sales_by_product":
		%><%@include file="page/Sales_by_product.jsp" %><%
	break;
	case "Category_by_product":
		%><%@include file="page/Category_by_product.jsp" %><%
	break;
	default:
		%> <%@ include file="static/index.jsp" %> <%
	}
	%>
	
	<%@include file="static/footer.jsp" %>
</body>
</html>