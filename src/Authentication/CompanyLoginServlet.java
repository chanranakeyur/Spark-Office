package Authentication;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Entity.CompanyEntity;
import Authentication.CompanyLoginService;

@SuppressWarnings("serial")
@WebServlet(name = "CompanyLoginServlet", urlPatterns = {"/CompanyLoginServlet"})
public class CompanyLoginServlet extends HttpServlet {
	
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
		
        String comp_mail = request.getParameter("comp_mail");        
        String comp_password = request.getParameter("comp_password");
        CompanyLoginService loginService = new CompanyLoginService();
        boolean result = loginService.authenticate(comp_mail, comp_password);
        CompanyEntity comp = loginService.getUserBygetComp_mail(comp_mail);
        if(result == true){
        	HttpSession session = request.getSession();
			session.setAttribute("comp_mail", comp_mail);
            request.getSession().setAttribute("comp", comp);            
            response.sendRedirect("index.jsp");
        }
        else{
            response.sendRedirect("login.jsp");
        }
    }
}