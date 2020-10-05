package Entity;

import java.io.Serializable;
import java.util.function.LongBinaryOperator;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.websocket.Decoder.Binary;

@SuppressWarnings("serial")
@Entity
@Table(name="employee")
public class EmployeeEntity implements Serializable {
    
    @Id
    @GeneratedValue
    int emp_id;
    int comp_id;
    int dept_id;
    String emp_firstName;
    String emp_middleName;
    String emp_lastName;
    String emp_position;
    String emp_mail;
    String emp_dob;
    String emp_gender;
    String emp_city;
    String emp_phone;
    String emp_userId;
    String emp_password;
    
    public int getComp_id() {
		return comp_id;
	}
	public void setComp_id(int comp_id) {
		this.comp_id = comp_id;
	}
	public int getDept_id() {
		return dept_id;
	}
	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_firstName() {
		return emp_firstName;
	}
	public void setEmp_firstName(String emp_firstName) {
		this.emp_firstName = emp_firstName;
	}
	public String getEmp_middleName() {
		return emp_middleName;
	}
	public void setEmp_middleName(String emp_middleName) {
		this.emp_middleName = emp_middleName;
	}
	public String getEmp_lastName() {
		return emp_lastName;
	}
	public void setEmp_lastName(String emp_lastName) {
		this.emp_lastName = emp_lastName;
	}
	public String getEmp_position() {
		return emp_position;
	}
	public void setEmp_position(String emp_position) {
		this.emp_position = emp_position;
	}
	public String getEmp_mail() {
		return emp_mail;
	}
	public void setEmp_mail(String emp_mail) {
		this.emp_mail = emp_mail;
	}
	public String getEmp_dob() {
		return emp_dob;
	}
	public void setEmp_dob(String emp_dob) {
		this.emp_dob = emp_dob;
	}
	public String getEmp_gender() {
		return emp_gender;
	}
	public void setEmp_gender(String emp_gender) {
		this.emp_gender = emp_gender;
	}
	public String getEmp_city() {
		return emp_city;
	}
	public void setEmp_city(String emp_city) {
		this.emp_city = emp_city;
	}
	public String getEmp_phone() {
		return emp_phone;
	}
	public void setEmp_phone(String emp_phone) {
		this.emp_phone = emp_phone;
	}
	public String getEmp_userId() {
		return emp_userId;
	}
	public void setEmp_userId(String emp_userId) {
		this.emp_userId = emp_userId;
	}
	public String getEmp_password() {
		return emp_password;
	}
	public void setEmp_password(String emp_password) {
		this.emp_password = emp_password;
	}
}