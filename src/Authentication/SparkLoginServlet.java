package Authentication;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Authentication.SparkLoginService;
import Entity.SparkEntity;

@SuppressWarnings("serial")
@WebServlet(name = "SparkLoginServlet", urlPatterns = {"/SparkLoginServlet"})
public class SparkLoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        String spark_username = request.getParameter("spark_username");        
        String spark_password = request.getParameter("spark_password");
        SparkLoginService sparkloginService = new SparkLoginService();
        boolean result = sparkloginService.authenticate(spark_username, spark_password);
        SparkEntity spark = sparkloginService.getUserBygetspark_username(spark_username);
        if(result == true){
            request.getSession().setAttribute("spark", spark);            
            response.sendRedirect("sparkadmin.jsp");
        }
        else{
            response.sendRedirect("login.jsp");
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
    }// </editor-fold>
}
