package Controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAOImpl.LeaveDAOImpl;
import Entity.LeaveEntity;

@SuppressWarnings("serial")
public class LeaveController extends HttpServlet {
	
	LeaveEntity leave = new LeaveEntity();
	LeaveDAOImpl leaveDAOImpl = new LeaveDAOImpl();
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		String comp_id1 = request.getParameter("comp_id");
    	int comp_id2 = 0;
    	if(comp_id1!=null)
    	{
    		comp_id2 =Integer.parseInt(comp_id1);
    	}
    	else
    	{
    		System.out.println("not found");
    	}
    	
    	String dept_id1 = request.getParameter("dept_id");
    	int dept_id2=0;
    	if(dept_id1!=null)
    	{
    		dept_id2 =Integer.parseInt(dept_id1);
    	}
    	else
    	{
    		System.out.println("not found");
    	}
    	
		if(request.getParameter("addEmployee")!=null){
		
    	String emp_id1 = request.getParameter("emp_id");
    	int emp_id2 = 0;
    	if(emp_id1!=null)
    	{
    		emp_id2 =Integer.parseInt(emp_id1);
    	}
    	else
    	{
    		System.out.println("not found");
    	}
    	
		String leave_title= request.getParameter("title");
		String leave_des= request.getParameter("description");
		String leave_start= request.getParameter("start");
		String leave_end= request.getParameter("end");
		
		Date d=new Date();
		String leave_date=d.toString();

		leave.setEmp_id(emp_id2);
		leave.setDept_id(dept_id2);
		leave.setComp_id(comp_id2);
		leave.setLeave_title(leave_title);
		leave.setLeave_des(leave_des);
		leave.setLeave_date(leave_date);
		leave.setLeave_start(leave_start);
		leave.setLeave_end(leave_end);
				
		leaveDAOImpl.saveLeave(leave);
		RequestDispatcher rd = request.getRequestDispatcher("client_leave.jsp");
		rd.forward(request, response);
		
		}
	}

}