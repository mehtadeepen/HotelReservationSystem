package beans;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Likes implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String likeID;
	private String username;
	
	private String hotelID;
	
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
	
	public Likes() {
		super();
	}
	
	public Likes(String username, String hotelID) {
		super();
		this.username = username;
		this.hotelID = hotelID;
	}
}
