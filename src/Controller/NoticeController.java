package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAOImpl.NoticeDAO;
import DAOImpl.NoticeDAOImpl;
import Entity.NoticeEntity;

@SuppressWarnings("serial")
public class NoticeController extends HttpServlet {

		NoticeEntity notice = new NoticeEntity();
		NoticeDAOImpl noticeDaoImpl = new NoticeDAOImpl();
		NoticeDAO noticedao;
      
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         if(request.getParameter("showNotice")!=null){
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
             @SuppressWarnings({ "rawtypes", "unchecked" })
 			List<NoticeEntity> noticeList = new ArrayList();
             noticeList = noticeDaoImpl.showAllNotices(comp_id2);
             request.setAttribute("noticeList", noticeList);
             RequestDispatcher rd = request.getRequestDispatcher("addnotice.jsp");
             rd.forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
