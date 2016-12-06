package beans;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the follow database table.
 * 
 */
@Embeddable
public class FollowPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(insertable=false, updatable=false)
	private String followerID;

	@Column(insertable=false, updatable=false)
	private String followedID;

	public FollowPK() {
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

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof FollowPK)) {
			return false;
		}
		FollowPK castOther = (FollowPK)other;
		return 
			this.followerID.equals(castOther.followerID)
			&& this.followedID.equals(castOther.followedID);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.followerID.hashCode();
		hash = hash * prime + this.followedID.hashCode();
		
		return hash;
	}
}