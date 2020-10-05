package Authentication;

import java.util.ArrayList;
import java.util.List;
import util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Entity.EmployeeEntity;

public class ClientLoginService {

    public boolean authenticate(String emp_mail, String emp_password) {
    	EmployeeEntity client = getUserByEmail(emp_mail);          
        if(client!=null && client.getEmp_mail().equals(emp_mail) && client.getEmp_password().equals(emp_password)){
            return true;
        }else{ 
            return false;
        }
    }

    public EmployeeEntity getUserByEmail(String emp_mail) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        EmployeeEntity client = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from EmployeeEntity where emp_mail='"+emp_mail+"'");
            client = (EmployeeEntity)query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return client;
    }
    
    @SuppressWarnings("unchecked")
	public List<EmployeeEntity> getListOfUsers(){
        List<EmployeeEntity> list = new ArrayList<EmployeeEntity>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from EmployeeEntity").list();                        
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
}
