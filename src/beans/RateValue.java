package beans;

import javax.persistence.*;

@Entity
@Table(name="ratevalues")
public class RateValue {
	
	@Id
	private int value;
	
	public int getValue() {
		return value;
	}
	
	public void setValue(int value) {
		this.value = value;
	}
	
	public RateValue() {
		super();
	}
	
	public RateValue(int value) {
		super();
		this.value = value;
	}
}
