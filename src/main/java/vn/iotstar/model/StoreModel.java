package vn.iotstar.model;

import java.sql.Date;

public class StoreModel {
	private int id;
	private String storeName, bio;
	private int userID;
	private String avartar, addressStore;
	private double rating;
	private Date createAt, updateAt;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getAvartar() {
		return avartar;
	}
	public void setAvartar(String avartar) {
		this.avartar = avartar;
	}
	public String getAddressStore() {
		return addressStore;
	}
	public void setAddressStore(String addressStore) {
		this.addressStore = addressStore;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public Date getCreateAt() {
		return createAt;
	}
	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}
	public Date getUpdateAt() {
		return updateAt;
	}
	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
	}
	public StoreModel(int id, String storeName, String bio, int userID, String avartar, String addressStore,
			double rating, Date createAt, Date updateAt) {
		this.id = id;
		this.storeName = storeName;
		this.bio = bio;
		this.userID = userID;
		this.avartar = avartar;
		this.addressStore = addressStore;
		this.rating = rating;
		this.createAt = createAt;
		this.updateAt = updateAt;
	}
	public StoreModel() {
		
	}
	@Override
	public String toString() {
		return "StoreModel [id=" + id + ", storeName=" + storeName + ", bio=" + bio + ", userID=" + userID
				+ ", avartar=" + avartar + ", addressStore=" + addressStore + ", rating=" + rating + ", createAt="
				+ createAt + ", updateAt=" + updateAt + "]";
	}
}
