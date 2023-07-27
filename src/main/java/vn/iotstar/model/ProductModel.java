package vn.iotstar.model;

import java.sql.Date;

public class ProductModel {
	private int id;
	private String productName, image, description;
	private double price;
	private int categoryID, discontinued, quantity;
	private Date createAt, updateAt;
	private int id_discount, cover_id, storeID, id_NXB;
	private Date expiration;
	private int rating_count;
	private double average_rating;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	public int getDiscontinued() {
		return discontinued;
	}
	public void setDiscontinued(int discontinued) {
		this.discontinued = discontinued;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
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
	public int getId_discount() {
		return id_discount;
	}
	public void setId_discount(int id_discount) {
		this.id_discount = id_discount;
	}
	public int getCover_id() {
		return cover_id;
	}
	public void setCover_id(int cover_id) {
		this.cover_id = cover_id;
	}
	public int getStoreID() {
		return storeID;
	}
	public void setStoreID(int storeID) {
		this.storeID = storeID;
	}
	public int getId_NXB() {
		return id_NXB;
	}
	public void setId_NXB(int id_NXB) {
		this.id_NXB = id_NXB;
	}
	public Date getExpiration() {
		return expiration;
	}
	public void setExpiration(Date expiration) {
		this.expiration = expiration;
	}
	public int getRating_count() {
		return rating_count;
	}
	public void setRating_count(int rating_count) {
		this.rating_count = rating_count;
	}
	public double getAverage_rating() {
		return average_rating;
	}
	public void setAverage_rating(double average_rating) {
		this.average_rating = average_rating;
	}
	public ProductModel() {
		
	}
	public ProductModel(int id, String productName, String image, String description, double price, int categoryID,
			int discontinued, int quantity, Date createAt, Date updateAt, int id_discount, int cover_id, int storeID,
			int id_NXB, Date expiration, int rating_count, double average_rating) {
		this.id = id;
		this.productName = productName;
		this.image = image;
		this.description = description;
		this.price = price;
		this.categoryID = categoryID;
		this.discontinued = discontinued;
		this.quantity = quantity;
		this.createAt = createAt;
		this.updateAt = updateAt;
		this.id_discount = id_discount;
		this.cover_id = cover_id;
		this.storeID = storeID;
		this.id_NXB = id_NXB;
		this.expiration = expiration;
		this.rating_count = rating_count;
		this.average_rating = average_rating;
	}
	@Override
	public String toString() {
		return "ProductModel [id=" + id + ", productName=" + productName + ", image=" + image + ", description="
				+ description + ", price=" + price + ", categoryID=" + categoryID + ", discontinued=" + discontinued
				+ ", quantity=" + quantity + ", createAt=" + createAt + ", updateAt=" + updateAt + ", id_discount="
				+ id_discount + ", cover_id=" + cover_id + ", storeID=" + storeID + ", id_NXB=" + id_NXB
				+ ", expiration=" + expiration + ", rating_count=" + rating_count + ", average_rating=" + average_rating
				+ "]";
	}
}
