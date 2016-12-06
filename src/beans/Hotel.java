package beans;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Hotel {
	
	@Id
	private String hotelID;
	private String name;
	private String location;
	
	public String getHotelId() {
		return hotelID;
	}
	
	public void setHotelId(String hotelID) {
		this.hotelID = hotelID;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getLocation() {
		return location;
	}
	
	public void setLocation(String location) {
		this.location = location;
	}
	
	public Hotel() {
		super();
	}
	
	public Hotel(String hotelID, String name, String location) {
		super();
		this.hotelID = hotelID;
		this.name = name;
		this.location = location;
	}
}
