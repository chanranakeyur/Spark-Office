package DAOImpl;

import java.util.List;

import Entity.AtndEntity;
import Entity.CompanyEntity;
import Entity.DeptEntity;
import Entity.EmployeeEntity;
import Entity.NoticeEntity;

public interface CompanyDAO{
	
	public void saveEmployee(EmployeeEntity employee);
	public List<EmployeeEntity> selectEmployee(int emp_id);
	public List<DeptEntity> selectDept(int dept_id);
	public List<EmployeeEntity> showAllEmployee(int comp_id);
	public void updateEmployee(int emp_id,String emp_firstName, String emp_middleName,String emp_lastName,String emp_position,String emp_mail, String emp_dob,String emp_gender,String emp_city,String emp_phone,String emp_userId,String emp_password);
	public void updateDept(int dept_id, String dept_name);
	public void deleteEmployee(EmployeeEntity employee);
	public void deptDelete(DeptEntity dept);
	public void deleteNotice(NoticeEntity notice);
	public void saveDept(DeptEntity dept);
	public List<DeptEntity> showAllDept(int comp_id);
	public List<CompanyEntity> showAllComp();
	public void compDelete(CompanyEntity comp);
	public void saveAtnd(AtndEntity atnd);
	public List<AtndEntity> showAllAtnd(int comp_id);
	public List<AtndEntity> showtodayAtnd(int comp_id);
	public void saveNotice(NoticeEntity notice);
	Long Count(int comp_id, String entityName);
}
