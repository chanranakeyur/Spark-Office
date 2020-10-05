package Entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="company")
public class CompanyEntity implements Serializable {
    
    @Id
    @GeneratedValue
    int comp_id;
    String comp_name;                                                               
    String comp_phone;
    String comp_address;
    String comp_fax;
    String comp_mail;
    String comp_password;
    
    
    public int getComp_id() {
		return comp_id;
	}

	public void setComp_id(int comp_id) {
		this.comp_id = comp_id;
	}

	public String getComp_name() {
		return comp_name;
	}

	public void setComp_name(String comp_name) {
		this.comp_name = comp_name;
	}

	public String getComp_mail() {
		return comp_mail;
	}

	public void setComp_email(String comp_mail) {
		this.comp_mail = comp_mail;
	}

	public String getComp_phone() {
		return comp_phone;
	}

	public void setComp_phone(String comp_phone) {
		this.comp_phone = comp_phone;
	}

	public String getComp_address() {
		return comp_address;
	}

	public void setComp_address(String comp_address) {
		this.comp_address = comp_address;
	}

	public String getComp_fax() {
		return comp_fax;
	}

	public void setComp_fax(String comp_fax) {
		this.comp_fax = comp_fax;
	}


	public String getComp_password() {
		return comp_password;
	}

	public void setComp_password(String comp_password) {
		this.comp_password = comp_password;
	}
	public CompanyEntity()
	{
		
	}
    
    public CompanyEntity(String comp_name, String comp_phone, String comp_address, String comp_fax, String comp_mail,String comp_password) {
    	this.comp_name = comp_name;
        this.comp_phone = comp_phone;
        this.comp_address = comp_address;
        this.comp_fax= comp_fax;
        this.comp_mail = comp_mail;
        this.comp_password = comp_password;
        
    }
}