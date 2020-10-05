package Authentication;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Entity.EmployeeEntity;
import Authentication.ClientLoginService;

@SuppressWarnings("serial")
@WebServlet(name = "ClientLoginServlet", urlPatterns = {"/ClientLoginServlet"})
public class ClientLoginServlet extends HttpServlet {

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
        String emp_mail = request.getParameter("emp_mail");        
        String emp_password = request.getParameter("emp_password");
        ClientLoginService loginService = new ClientLoginService();
        boolean result = loginService.authenticate(emp_mail, emp_password);
        EmployeeEntity client = loginService.getUserByEmail(emp_mail);
        if(result == true){
        	HttpSession session = request.getSession();
			session.setAttribute("emp_mail", emp_mail);
            request.getSession().setAttribute("client", client);            
            response.sendRedirect("client_home.jsp");
        }
        else{
            response.sendRedirect("client_login.jsp");
        }
    }
}
