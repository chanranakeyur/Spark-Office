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
String id = request.getParameter("u");
int emp_id = Integer.parseInt(id);
List<EmployeeEntity> employeeList = new ArrayList<EmployeeEntity>();
employeeList = comp.selectEmployee(emp_id);
request.setAttribute("employeeList", employeeList);
RequestDispatcher rd = request.getRequestDispatcher("updateemp.jsp");
rd.forward(request, response);
%>