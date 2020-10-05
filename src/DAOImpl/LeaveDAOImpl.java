package DAOImpl;

import org.hibernate.Session;
import org.hibernate.Transaction;

import Entity.LeaveEntity;
import util.HibernateUtil;

public class LeaveDAOImpl implements LeaveDAO{
	
	@Override
    public void saveLeave(LeaveEntity leave) {
        Session session = HibernateUtil.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(leave);
        transaction.commit();
        session.close();
    }
	
	
}
