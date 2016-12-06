package beans;

import javax.persistence.*;

@Entity
@Table(name = "room_type")
public class RoomType {
	
	@Id
	private String type;
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public RoomType() {
		super();
	}
	
	public RoomType(String type) {
		super();
		this.type = type;
	}
}
