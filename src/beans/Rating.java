package beans;

import javax.persistence.*;

@Entity
public class Rating {
	
	@Id
	private Integer rateID;
	private String username;
	private String hotelID;
	private int value;
	
	public String getUserName() {
		return username;
	}
	
	public void setUserName(String username) {
		this.username = username;
	}
	
	public String getHotelId() {
		return hotelID;
	}
	
	public void setHotelId(String hotelID) {
		this.hotelID = hotelID;
	}
	
	public int getValue() {
		return value;
	}
	
	public void setValue(int value) {
		this.value = value;
	}
	
	public Rating() {
		super();
	}
	
	public Rating(String username, String hotelID, int value) {
		super();
		this.username = username;
		this.hotelID = hotelID;
		this.value = value;
	}
}
