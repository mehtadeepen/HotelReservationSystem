package beans;

import java.io.Serializable;
import java.lang.String;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: Follow
 *
 */
@Entity

@IdClass(FollowPK.class)
public class Follow implements Serializable {

	   
	@Id
	private String followerID;   
	@Id
	private String followedID;
	private static final long serialVersionUID = 1L;

	public Follow() {
		super();
	}   
	public String getFollowerID() {
		return this.followerID;
	}

	public void setFollowerID(String followerID) {
		this.followerID = followerID;
	}   
	public String getFollowedID() {
		return this.followedID;
	}

	public void setFollowedID(String followedID) {
		this.followedID = followedID;
	}
   
}
