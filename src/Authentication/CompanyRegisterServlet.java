
package Authentication;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Entity.CompanyEntity;
import Authentication.CompanyRegisterService;

@SuppressWarnings("serial")
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class CompanyRegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String comp_name = request.getParameter("comp_name");
        String comp_phone = request.getParameter("comp_phone");
        String comp_address = request.getParameter("comp_address");
        String comp_fax = request.getParameter("comp_fax");
        String comp_mail = request.getParameter("comp_mail");
        String comp_password = request.getParameter("comp_password");
        CompanyEntity comp = new CompanyEntity(comp_name,comp_phone,comp_address,comp_fax,comp_mail, comp_password);
                
        try {        
        	CompanyRegisterService registerService = new CompanyRegisterService();
            boolean result = registerService.register(comp);            
            out.println("<html>");
            out.println("<head>");            
            out.println("<title>Registration Successful</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<center>");
            if(result){
                response.sendRedirect("login.jsp");
            }else{
            	response.sendRedirect("register.jsp");
            }
            out.println("</center>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
