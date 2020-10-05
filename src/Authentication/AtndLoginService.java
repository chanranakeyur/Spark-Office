package Authentication;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Entity.AtndEntity;
import util.HibernateUtil;

public class AtndLoginService {
	public boolean authenticate(String username, String password) {
		AtndEntity detail = getUserByUsername(username);
		
        if(detail!=null && detail.getUsername().equals(username) && detail.getPassword().equals(password)){
            return true;
        }else{ 
            return false;
        }
    }

    public AtndEntity getUserByUsername(String username) {
    	System.out.println(username);
    	Session session = HibernateUtil.openSession();
        Transaction tx = null;
        AtndEntity detail = null;
        System.out.println("abcd");
        try {
        	System.out.println("try");
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from AtndEntity where username='"+username+"'");
            detail = (AtndEntity)query.uniqueResult();
            System.out.println(detail);
            tx.commit();
        } catch (Exception e) {
        	System.out.println("catch");

            if (tx != null) {
            	System.out.println("not null");

                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return detail;
    }
    
    @SuppressWarnings("unchecked")
	public List<AtndEntity> getListOfUsers(){
        List<AtndEntity> list = new ArrayList<AtndEntity>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from AtndEntity").list();                        
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
