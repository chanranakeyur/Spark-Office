<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    session.removeAttribute("emp_mail");
	session.invalidate();
	response.sendRedirect("client_index.jsp");
	%>