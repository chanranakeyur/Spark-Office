
package Authentication;

import Entity.CompanyEntity;
import util.HibernateUtil;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class CompanyRegisterService {
        
    public boolean register(CompanyEntity comp){
        Session session = HibernateUtil.openSession();
        if(isUserExists(comp)) return false;        
        
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            session.saveOrUpdate(comp);            
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        } 
        return true;
    }
    
    public boolean isUserExists(CompanyEntity comp){
        Session session = HibernateUtil.openSession();
        boolean result = false;
        Transaction tx = null;
        try{
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from CompanyEntity where comp_mail='"+comp.getComp_mail()+"'");
            CompanyEntity u = (CompanyEntity)query.uniqueResult();
            tx.commit();
            if(u!=null) result = true;
        }catch(Exception ex){
            if(tx!=null){
                tx.rollback();
            }
        }finally{
            session.close();
        }
        return result;
    }
}
