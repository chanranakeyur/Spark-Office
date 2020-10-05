package Entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="spark")
public class SparkEntity implements Serializable {
	@Id
    private String spark_username;
    private String spark_password;

	public String getSpark_username() {
		return spark_username;
	}

	public void setSpark_username(String spark_username) {
		this.spark_username = spark_username;
	}

	public String getSpark_password() {
		return spark_password;
	}

	public void setSpark_password(String spark_password) {
		this.spark_password = spark_password;
	}

	public SparkEntity()
	{
		
	}
    
    public SparkEntity(String spark_username,String spark_password) {
    	this.spark_username = spark_username;
        this.spark_password = spark_password;
    }
}