package Authentication;

import java.util.ArrayList;
import java.util.List;
import util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Entity.CompanyEntity;

public class CompanyLoginService {

    public boolean authenticate(String comp_mail, String comp_password) {
        CompanyEntity user = getUserBygetComp_mail(comp_mail);          
        if(user!=null && user.getComp_mail().equals(comp_mail) && user.getComp_password().equals(comp_password)){
        	
            return true;
        }else{ 
            return false;
        }
    }

    public CompanyEntity getUserBygetComp_mail(String comp_mail) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        CompanyEntity user = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from CompanyEntity where comp_mail='"+comp_mail+"'");
            user = (CompanyEntity)query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return user;
    }
    
    @SuppressWarnings("unchecked")
	public List<CompanyEntity> getListOfUsers(){
        List<CompanyEntity> list = new ArrayList<CompanyEntity>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from CompanyEntity").list();
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
