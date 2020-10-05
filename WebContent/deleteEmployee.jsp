<%@page import="DAOImpl.CompanyDAOImpl"%>
<%@page import="Entity.EmployeeEntity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.RequestDispatcher" %>
<%@page import="javax.servlet.ServletException" %>
<%@page import="javax.servlet.http.HttpServlet" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpServletResponse" %>

<% 
CompanyDAOImpl comp = new CompanyDAOImpl();
EmployeeEntity employee = new EmployeeEntity();
String id = request.getParameter("u");
int emp_id = Integer.parseInt(id);
employee.setEmp_id(emp_id);
comp.deleteEmployee(employee);
response.sendRedirect("showallemp.jsp");
%>