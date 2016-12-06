package beans;

import java.io.Serializable;
import java.lang.String;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: RoleType
 *
 */
@Entity

public class RoleType implements Serializable {

	   
	@Id
	private String type;
	private static final long serialVersionUID = 1L;

	public RoleType() {
		super();
	}   
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}
   
}
