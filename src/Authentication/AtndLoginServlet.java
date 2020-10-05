package Authentication;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Entity.AtndEntity;
import Authentication.AtndLoginService;

@SuppressWarnings("serial")
@WebServlet(name = "AtndLoginServlet", urlPatterns = 
			{"/AtndLoginServlet"})
public class AtndLoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) 
			throws ServletException, IOException {
		
		String username = request.getParameter("username");        
        String password = request.getParameter("password");
        System.out.println(username);
        System.out.println(password);
        AtndLoginService loginService = new AtndLoginService ();
        boolean result = loginService.authenticate(username, password);
        AtndEntity detail = loginService.getUserByUsername(username);
        System.out.println(result);
        if(result == true){
        	
        	HttpSession session = request.getSession();
			session.setAttribute("username", username);
			System.out.println(session.getAttribute("username"));
            request.getSession().setAttribute("detail", detail);            
            response.sendRedirect("attendance.jsp");
        }
        else{
            response.sendRedirect("atndlogin.jsp");
        }
	}
}
