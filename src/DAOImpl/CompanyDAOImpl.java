package DAOImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import Entity.CompanyEntity;
import Entity.AtndEntity;
import Entity.DeptEntity;
import Entity.EmployeeEntity;
import Entity.NoticeEntity;

import util.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;

public class CompanyDAOImpl implements CompanyDAO {

	@Override
	public void saveEmployee(EmployeeEntity employee) {
		Session session = HibernateUtil.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(employee);
		transaction.commit();
		session.close();
	}

	@Override
	public Long Count(int comp_id,String entityName) {
		Session session = HibernateUtil.openSession();
		 Long rowCount=null;
        try {
        	Query query = session.createQuery("select count(*) from "+ entityName +" where comp_id="+ comp_id +" ");
        	@SuppressWarnings("rawtypes")
			Iterator count = query.iterate();
        	rowCount = Long.parseLong(count.next().toString());
        	System.out.println("No. of rows : "+rowCount);
        }
        catch (HibernateException e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
		return rowCount;
    }
	
	@SuppressWarnings("unchecked")
	@Override
	public List<EmployeeEntity> selectEmployee(int emp_id) {
		Session session = HibernateUtil.openSession();
		Query query = session.createQuery("From EmployeeEntity where id=" + emp_id + "");
		List<EmployeeEntity> employeeList = new ArrayList<EmployeeEntity>();
		employeeList = query.list();
		return employeeList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DeptEntity> selectDept(int dept_id) {
		Session session = HibernateUtil.openSession();
		Query query = session.createQuery("From DeptEntity where dept_id=" + dept_id + "");
		List<DeptEntity> deptList = new ArrayList<DeptEntity>();
		deptList = query.list();
		return deptList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EmployeeEntity> showAllEmployee(int comp_id) {
		Session session = HibernateUtil.openSession();
		Query query = session.createQuery("From EmployeeEntity where comp_id=" + comp_id + "");
		List<EmployeeEntity> employeeList = new ArrayList<EmployeeEntity>();
		employeeList = query.list();
		return employeeList;
	}

	@Override
	public void updateEmployee(int emp_id, String emp_firstName, String emp_middleName, String emp_lastName,
			String emp_position, String emp_mail, String emp_dob, String emp_gender, String emp_city, String emp_phone,
			String emp_userId, String emp_password) {
		Session session = HibernateUtil.openSession();
		Transaction transaction = session.beginTransaction();
		EmployeeEntity empdetails = (EmployeeEntity) session.load(EmployeeEntity.class, emp_id);
		empdetails.setEmp_firstName(emp_firstName);
		empdetails.setEmp_middleName(emp_middleName);
		empdetails.setEmp_lastName(emp_lastName);
		empdetails.setEmp_position(emp_position);
		empdetails.setEmp_mail(emp_mail);
		empdetails.setEmp_dob(emp_dob);
		empdetails.setEmp_gender(emp_gender);
		empdetails.setEmp_city(emp_city);
		empdetails.setEmp_phone(emp_phone);
		empdetails.setEmp_userId(emp_userId);
		empdetails.setEmp_password(emp_password);

		session.update(empdetails);
		transaction.commit();
		session.close();
	}

	@Override
	public void updateDept(int dept_id, String dept_name) {
		Session session = HibernateUtil.openSession();
		Transaction transaction = session.beginTransaction();
		DeptEntity dept = (DeptEntity) session.load(DeptEntity.class, dept_id);
		dept.setDept_id(dept_id);
		dept.setDept_name(dept_name);
		session.update(dept);
		transaction.commit();
		session.close();
	}

	@Override
	public void deleteEmployee(EmployeeEntity employee) {
		Session session = HibernateUtil.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(employee);
		transaction.commit();
		session.close();
	}

	@Override
	public void deptDelete(DeptEntity dept) {
		Session session = HibernateUtil.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(dept);
		transaction.commit();
		session.close();
	}

	@Override
	public void deleteNotice(NoticeEntity notice) {
		Session session = HibernateUtil.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(notice);
		transaction.commit();
		session.close();
	}

	@Override
	public void saveDept(DeptEntity dept) {
		Session session = HibernateUtil.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(dept);
		transaction.commit();
		session.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DeptEntity> showAllDept(int comp_id) {
		Session session = HibernateUtil.openSession();
		Query query = session.createQuery("From DeptEntity where comp_id=" + comp_id + "");
		List<DeptEntity> deptList = new ArrayList<DeptEntity>();
		deptList = query.list();
		return deptList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CompanyEntity> showAllComp() {
		Session session = HibernateUtil.openSession();
		Query query = session.createQuery("From CompanyEntity");
		List<CompanyEntity> compList = new ArrayList<CompanyEntity>();
		compList = query.list();
		return compList;
	}

	@Override
	public void compDelete(CompanyEntity comp) {
		Session session = HibernateUtil.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(comp);
		transaction.commit();
		session.close();
	}

	@Override
	public void saveAtnd(AtndEntity atnd) {
		Session session = HibernateUtil.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(atnd);
		transaction.commit();
		session.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AtndEntity> showAllAtnd(int comp_id) {
		Session session = HibernateUtil.openSession();
		Query query = session.createQuery("From AtndEntity where comp_id=" + comp_id + "");
		List<AtndEntity> atndList = new ArrayList<AtndEntity>();
		atndList = query.list();
		return atndList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AtndEntity> showtodayAtnd(int comp_id) {
		Session session = HibernateUtil.openSession();
		Date date = new Date();
		Query query = session
				.createQuery("From AtndEntity where comp_id=" + comp_id + " and checkin_time=" + date + "");
		List<AtndEntity> atndList = new ArrayList<AtndEntity>();
		atndList = query.list();
		return atndList;
	}

	@Override
	public void saveNotice(NoticeEntity notice) {
		Session session = HibernateUtil.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(notice);
		transaction.commit();
		session.close();
	}
}