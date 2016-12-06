package beans;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.*;

@Entity
public class Review implements Serializable {
	
	@Id
	private int reviewID;
	private String username;
	private String hotelID;
	private String title;
	private String review;
	private Date reviewDate;
	
	public int getReviewId() {
		return reviewID;
	}
	
	public void setReviewId(int reviewID) {
		this.reviewID = reviewID;
	}
	
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
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getReview() {
		return review;
	}
	
	public void setReview(String review) {
		this.review = review;
	}
	
	public Date getReviewDate() {
		return reviewDate;
	}
	
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	
	public Review(String username, String hotelID, String title, 
			String review, Date reviewDate) {
		super();
		this.username = username;
		this.hotelID = hotelID;
		this.title = title;
		this.review = review;
		this.reviewDate = reviewDate;
	}
	
	public Review() {
		super();
	}
	
}
