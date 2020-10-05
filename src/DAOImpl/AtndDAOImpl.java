package DAOImpl;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import Entity.AtndEntity;
import util.HibernateUtil;

public class AtndDAOImpl {

	public void saveAttendance(AtndEntity atndpojo) {
		Session session = HibernateUtil.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(atndpojo);
        transaction.commit();
        session.close();
    }

	public void update_atnd(int emp_id2, int check_out, Date checkout_time) {
		System.out.println(emp_id2);
		Session session = HibernateUtil.openSession();
        Transaction transaction = session.beginTransaction();
        AtndEntity atndpojo = (AtndEntity)session.load(AtndEntity.class, emp_id2);
        atndpojo.setCheck_out(check_out);
        atndpojo.setCheckout_time(checkout_time);
        session.update(atndpojo);
        transaction.commit();
        session.close();  
   }

}
