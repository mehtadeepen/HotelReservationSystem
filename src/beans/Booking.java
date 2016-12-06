package beans;

import java.io.Serializable;
import java.lang.Integer;
import java.lang.String;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: Booking
 *
 */

@Entity
@Cacheable(false)
public class Booking implements Serializable {

	   
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer bookingID;
	private String hotelID;
	private String username;
	private String firstname;
	private String lastname;
	private String roomType;
	private String price;
	private String arrivalDate;
	private String departureDate;
	private String specialrequest;
	
	private Integer active = 1;
	private static final long serialVersionUID = 1L;

	public Booking() {
		super();
	}   
	public Integer getBookingID() {
		return this.bookingID;
	}

	public void setBookingID(Integer bookingID) {
		this.bookingID = bookingID;
	}   
	public String getHotelID() {
		return this.hotelID;
	}

	public void setHotelID(String hotelID) {
		this.hotelID = hotelID;
	}   
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}   
	public String getFirstname() {
		return this.firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}   
	public String getLastname() {
		return this.lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}   
	public String getRoomType() {
		return this.roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}   
	
	public String getArrivalDate() {
		return this.arrivalDate;
	}

	public void setArrivalDate(String arrivalDate) {
		this.arrivalDate = arrivalDate;
	}   
	public String getDepartureDate() {
		return this.departureDate;
	}

	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}   
	public String getSpecialrequest() {
		return this.specialrequest;
	}

	public void setSpecialrequest(String specialrequest) {
		this.specialrequest = specialrequest;
	}
	@Override
	public String toString() {
		return "Booking [bookingID=" + bookingID + ", hotelID=" + hotelID
				+ ", username=" + username + ", firstname=" + firstname
				+ ", lastname=" + lastname + ", roomType=" + roomType
				+ ", price=" + price + ", arrivalDate=" + arrivalDate
				+ ", departureDate=" + departureDate + ", specialrequest="
				+ specialrequest + "]";
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public Integer getActive() {
		return active;
	}
	public void setActive(Integer active) {
		this.active = active;
	}
	
	
   
}
