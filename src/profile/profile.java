package profile;

import java.io.Serializable;

@SuppressWarnings("serial")
public class profile implements java.io.Serializable {
	private Integer profileId;
	private byte[] image;

	public profile() {
	}

	public profile(byte[] image) {
		this.image = image;
	}

	public Integer getProfileId() {
		return this.profileId;
	}

	public void setProfileId(Integer profileId) {
		this.profileId = profileId;
	}

	public byte[] getImage() {
		return this.image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}
	//remove this before use
	public Serializable getprofileId() {
		// TODO Auto-generated method stub
		return null;
	}

}