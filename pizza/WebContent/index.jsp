<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="static/header.jsp" %>
	<%@include file="static/nav.jsp" %>
	
	<%
	String section = request.getParameter("section") != null  ? request.getParameter("section") : "";
	
	switch(section) {
	case "pizza_insert":
	%><%@include file="page/pizza_insert.jsp" %><%
	break;
	case "pizza_sale_select":
		%><%@include file="page/pizza_sale_select.jsp" %><%
		break;
	case "pizza_shop_select":
		%><%@include file="page/pizza_shop_select.jsp" %><%
		break;
	case "pizza_pizza_select":
		%><%@include file="page/pizza_pizza_select.jsp" %><%
		break;
	default:
		%><%@include file="static/index.jsp" %><%
	}
	%>
	<%@include file="static/footer.jsp" %>
</body>
</html>