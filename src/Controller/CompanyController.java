package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import DAOImpl.CompanyDAOImpl;
import Entity.CompanyEntity;
import Entity.AtndEntity;
import Entity.DeptEntity;
import Entity.EmployeeEntity;
import Entity.NoticeEntity;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class CompanyController extends HttpServlet {

		EmployeeEntity employee = new EmployeeEntity();
        DeptEntity dept=new DeptEntity();
        CompanyEntity comp=new CompanyEntity();
        CompanyDAOImpl companyDaoImpl = new CompanyDAOImpl();
        AtndEntity atnd=new AtndEntity();
        NoticeEntity notice = new NoticeEntity();
        
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	String comp_id_s = request.getParameter("comp_id");
    	int comp_id=0;
    	if(comp_id_s!=null)
    	{
    		comp_id = Integer.parseInt(comp_id_s);
    	}
    	String dept_id_s = request.getParameter("dept_id");
    	int dept_id=0;
    	if(dept_id_s!=null)
    	{
    		dept_id =Integer.parseInt(dept_id_s);
    	}
    	String emp_id_s = request.getParameter("emp_id");
    	int emp_id=0;
    	if(emp_id_s!=null)
    	{
    		emp_id =Integer.parseInt(emp_id_s);
    	}
    	String notice_id_s = request.getParameter("notice_id");
    	int notice_id=0;
    	if(notice_id_s!=null)
    	{
    		notice_id =Integer.parseInt(notice_id_s);
    	}
        if(request.getParameter("addEmployee")!=null){
        		
            	String emp_firstName =request.getParameter("emp_firstName");
            	String emp_middleName = request.getParameter("emp_middleName");
            	String emp_lastName = request.getParameter("emp_lastName");
            	String emp_position = request.getParameter("emp_position");
            	String emp_mail = request.getParameter("emp_mail");
            	String emp_dob = request.getParameter("emp_dob");
            	String emp_gender = request.getParameter("emp_gender");
            	String emp_city = request.getParameter("emp_city");
            	String emp_phone = request.getParameter("emp_phone");
            	String emp_userId = request.getParameter("emp_userId");
            	String emp_password = request.getParameter("emp_password");
                
            	employee.setComp_id(comp_id);
            	employee.setDept_id(dept_id);
            	employee.setEmp_firstName(emp_firstName);
            	employee.setEmp_middleName(emp_middleName);
            	employee.setEmp_lastName(emp_lastName);
            	employee.setEmp_position(emp_position);
            	employee.setEmp_mail(emp_mail);
            	employee.setEmp_dob(emp_dob);
            	employee.setEmp_gender(emp_gender);
            	employee.setEmp_city(emp_city);
            	employee.setEmp_phone(emp_phone);
            	employee.setEmp_userId(emp_userId);
            	employee.setEmp_password(emp_password);
            
            	companyDaoImpl.saveEmployee(employee);
            	RequestDispatcher rd = request.getRequestDispatcher("showallemp.jsp");
            	rd.forward(request, response);
        	}
        	
        	if(request.getParameter("deptadd")!=null){
        		
        		String dept_name = request.getParameter("dept_name");
        		
            	dept.setDept_name(dept_name);
            	dept.setComp_id(comp_id);
            	companyDaoImpl.saveDept(dept);
            	RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            	rd.forward(request, response);
        	}
        	
        	if(request.getParameter("saveNotice")!=null){
            	String notice_title = request.getParameter("notice_title");
            	String notice_des = request.getParameter("notice_des");
            	
            	notice.setComp_id(comp_id);
            	notice.setDept_id(dept_id);
            	Date notice_date=new Date();
            	notice.setNotice_date(notice_date);
            	notice.setNotice_title(notice_title);
            	notice.setNotice_des(notice_des);
            	
            	companyDaoImpl.saveNotice(notice);
            	RequestDispatcher rd = request.getRequestDispatcher("addnotice.jsp");
            	rd.forward(request, response);
        	}
        	
        	if(request.getParameter("saveAtnd")!=null){
        		
            	
        		String username = request.getParameter("username");
        		String password = request.getParameter("password");
        		
            	atnd.setUsername(username);
            	atnd.setPassword(password);
            	atnd.setComp_id(comp_id);
            	
            	companyDaoImpl.saveAtnd(atnd);
            	RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            	rd.forward(request, response);
        	}
        	
        	if(request.getParameter("showAllDept")!=null){
        		
                List<DeptEntity> deptList = new ArrayList<DeptEntity>();
                deptList = companyDaoImpl.showAllDept(comp_id);
                request.setAttribute("deptList", deptList);
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
        	
        	if(request.getParameter("showAllAtnd")!=null){
        		
                List<AtndEntity> atndList = new ArrayList<AtndEntity>();
                atndList = companyDaoImpl.showAllAtnd(comp_id);
                request.setAttribute("atndList", atndList);
                RequestDispatcher rd = request.getRequestDispatcher("atndshowall.jsp");
                rd.forward(request, response);
            }
        	
        	if(request.getParameter("showtodayAtnd")!=null){
        		
                List<AtndEntity> atndList = new ArrayList<AtndEntity>();
                atndList = companyDaoImpl.showtodayAtnd(comp_id);
                request.setAttribute("atndList", atndList);
                RequestDispatcher rd = request.getRequestDispatcher("atndshowtoday.jsp");
                rd.forward(request, response);
            }
        	
        	if(request.getParameter("showAllComp")!=null){
                List<CompanyEntity> compList = new ArrayList<CompanyEntity>();
                compList = companyDaoImpl.showAllComp();
                request.setAttribute("compList", compList);
                RequestDispatcher rd = request.getRequestDispatcher("sparkadmin.jsp");
                rd.forward(request, response);
            }
        
            if(request.getParameter("selectEmployee")!=null){
            	
                List<EmployeeEntity> employeeList = new ArrayList<EmployeeEntity>();
                employeeList = companyDaoImpl.selectEmployee(emp_id);
                request.setAttribute("employeeList", employeeList);
                RequestDispatcher rd = request.getRequestDispatcher("updateemp.jsp");
                rd.forward(request, response);
            }
            
            if(request.getParameter("selectDept")!=null){
            	
                List<DeptEntity> deptList = new ArrayList<DeptEntity>();
                deptList = companyDaoImpl.selectDept(dept_id);
                request.setAttribute("deptList", deptList);
                RequestDispatcher rd = request.getRequestDispatcher("updatedept.jsp");
                rd.forward(request, response);
            }
            
            if(request.getParameter("showAllEmployee")!=null){
            	
                List<EmployeeEntity> employeeList = new ArrayList<EmployeeEntity>();
                employeeList = companyDaoImpl.showAllEmployee(comp_id);
                request.setAttribute("employeeList", employeeList);
                RequestDispatcher rd = request.getRequestDispatcher("showallemp.jsp");
                rd.forward(request, response);
            }
            
            if(request.getParameter("updateEmployee")!=null){
            	
        		String emp_firstName =request.getParameter("emp_firstName");
            	String emp_middleName = request.getParameter("emp_middleName");
            	String emp_lastName = request.getParameter("emp_lastName");
            	String emp_position = request.getParameter("emp_position");
            	String emp_mail = request.getParameter("emp_mail");
            	String emp_dob = request.getParameter("emp_dob");
            	String emp_gender = request.getParameter("emp_gender");
            	String emp_city = request.getParameter("emp_city");
            	String emp_phone = request.getParameter("emp_phone");
            	String emp_userId = request.getParameter("emp_userId");
            	String emp_password = request.getParameter("emp_password");
                
            	companyDaoImpl.updateEmployee(emp_id,emp_firstName,emp_middleName,emp_lastName,emp_position,emp_mail,emp_dob,emp_gender,emp_city,emp_phone,emp_userId,emp_password);
                
                RequestDispatcher rd = request.getRequestDispatcher("showallemp.jsp");
                rd.forward(request, response);  
            }
            
            if(request.getParameter("updateDept")!=null){
            	
            	String dept_name = request.getParameter("dept_name");
            	companyDaoImpl.updateDept(dept_id,dept_name);
                RequestDispatcher rd = request.getRequestDispatcher("editgodept.jsp");
                rd.forward(request, response);  
            }
             
            if(request.getParameter("deleteEmployee")!=null){
            
                employee.setEmp_id(emp_id);
                companyDaoImpl.deleteEmployee(employee);
                RequestDispatcher rd = request.getRequestDispatcher("EmployeeAdd.jsp");
                rd.forward(request, response);
            }
            
            if(request.getParameter("deptDelete")!=null){
            	
                dept.setDept_id(dept_id);
                companyDaoImpl.deptDelete(dept);
                 RequestDispatcher rd = request.getRequestDispatcher("deletegodept.jsp");
               rd.forward(request, response);
            }
            
            if(request.getParameter("deleteNotice")!=null){
            	
            	notice.setNotice_id(notice_id);
            	companyDaoImpl.deleteNotice(notice);
                 RequestDispatcher rd = request.getRequestDispatcher("addnotice.jsp");
               rd.forward(request, response);
            }
            
            if(request.getParameter("compDelete")!=null){
            	
        		comp.setComp_id(comp_id);
        		companyDaoImpl.compDelete(comp);
                 RequestDispatcher rd = request.getRequestDispatcher("sparkadmin.jsp");
               rd.forward(request, response);
            }
        }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}