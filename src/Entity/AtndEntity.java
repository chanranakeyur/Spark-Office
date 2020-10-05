package Entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Table(name="attendance")
@Entity
public class AtndEntity implements Serializable {
	
	@Id
	@GeneratedValue
	int atnd_id;
	int comp_id;
	int emp_id;
	int check_in;
	int check_out;
	Date checkin_time;
	Date checkout_time;
	String username;
	String password;
	
	
	public int getComp_id() {
		return comp_id;
	}

	public void setComp_id(int comp_id) {
		this.comp_id = comp_id;
	}

	public int getAtnd_id() {
		return atnd_id;
	}

	public void setAtnd_id(int atnd_id) {
		this.atnd_id = atnd_id;
	}

	public int getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}

	public int getCheck_in() {
		return check_in;
	}

	public void setCheck_in(int check_in) {
		this.check_in = check_in;
	}

	public int getCheck_out() {
		return check_out;
	}

	public void setCheck_out(int check_out) {
		this.check_out = check_out;
	}

	public Date getCheckin_time() {
		return checkin_time;
	}

	public void setCheckin_time(Date checkin_time) {
		this.checkin_time = checkin_time;
	}

	public Date getCheckout_time() {
		return checkout_time;
	}

	public void setCheckout_time(Date checkout_time) {
		this.checkout_time = checkout_time;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}