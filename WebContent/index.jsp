<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String section = request.getParameter("section") != null ? request.getParameter("section") : "";
%>
</head>
<body>
	<%@ include file="static/header.jsp" %>
	<%@ include file="static/nav.jsp" %>
	
	<%
		switch(section) {
		case "sale_registration":
		%><%@include file="page/sale_registration.jsp" %> <%
		break;
		case "sale_status":
			%><%@include file="page/sale_status.jsp" %> <%
			break;
		case "sale_by_store":
			%><%@include file="page/sale_by_store.jsp" %> <%
			break;
		case "sale_by_product":
			%><%@include file="page/sale_by_product.jsp" %> <%
			break;
		}
	%>
	<%@ include file="static/footer.jsp" %>
</body>
</html>