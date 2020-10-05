package Authentication;

import java.util.ArrayList;
import java.util.List;

import Entity.SparkEntity;
import util.HibernateUtil;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class SparkLoginService {

    public boolean authenticate(String spark_username, String spark_password) {
        SparkEntity spark = getUserBygetspark_username(spark_username);          
        if(spark!=null && spark.getSpark_username().equals(spark_username) && spark.getSpark_password().equals(spark_password)){
            return true;
        }else{ 
            return false;
        }
    }
    
	public SparkEntity getUserBygetspark_username(String spark_username) {
		Session session = HibernateUtil.openSession();
	        Transaction tx = null;
	        SparkEntity spark = null;
	        try {
	            tx = session.getTransaction();
	            tx.begin();
	            Query query = session.createQuery("from Spark where spark_username='"+spark_username+"'");
	            spark = (SparkEntity)query.uniqueResult();
	            tx.commit();
	        } catch (Exception e) {
	            if (tx != null) {
	                tx.rollback();
	            }
	            e.printStackTrace();
	        } finally {
	            session.close();
	        }
	        return spark;
		
	}
	
	@SuppressWarnings("unchecked")
	public List<SparkEntity> getListOfUsers(){
        List<SparkEntity> list = new ArrayList<SparkEntity>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Spark").list();                        
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
