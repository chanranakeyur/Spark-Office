package Entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Table(name="empleave")
@Entity
public class LeaveEntity implements Serializable{
	@Id
	@GeneratedValue
	int leave_id;
	int emp_id;
	int dept_id;
	int comp_id;
	String leave_title;
	String leave_des;
	String leave_date;
	String leave_start;
	String leave_end;
	
	public int getLeave_id() {
		return leave_id;
	}
	public void setLeave_id(int leave_id) {
		this.leave_id = leave_id;
	}
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public int getDept_id() {
		return dept_id;
	}
	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}
	public int getComp_id() {
		return comp_id;
	}
	public void setComp_id(int comp_id) {
		this.comp_id = comp_id;
	}
	public String getLeave_title() {
		return leave_title;
	}
	public void setLeave_title(String leave_title) {
		this.leave_title = leave_title;
	}
	public String getLeave_des() {
		return leave_des;
	}
	public void setLeave_des(String leave_des) {
		this.leave_des = leave_des;
	}
	public String getLeave_date() {
		return leave_date;
	}
	public void setLeave_date(String leave_date) {
		this.leave_date = leave_date;
	}
	public String getLeave_start() {
		return leave_start;
	}
	public void setLeave_start(String leave_start) {
		this.leave_start = leave_start;
	}
	public String getLeave_end() {
		return leave_end;
	}
	public void setLeave_end(String leave_end) {
		this.leave_end = leave_end;
	}	
}
