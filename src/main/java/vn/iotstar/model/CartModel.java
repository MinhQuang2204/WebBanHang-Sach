package vn.iotstar.model;

import java.sql.Date;

public class CartModel {
	private int cart_id;
	private UserModel buyer;
	private Date buyDate;
    public int getCart_id() {
        return cart_id;
    }
    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }
    public UserModel getBuyer() {
        return buyer;
    }
    public void setBuyer(UserModel buyer) {
        this.buyer = buyer;
    }
    public Date getBuyDate() {
        return buyDate;
    }
    public void setBuyDate(Date buyDate) {
        this.buyDate = buyDate;
    }
    public CartModel(int cart_id, UserModel buyer, Date buyDate) {
        this.cart_id = cart_id;
        this.buyer = buyer;
        this.buyDate = buyDate;
    }
    public CartModel() {
        
    }
    @Override
    public String toString() {
        return "CartModel [cart_id=" + cart_id + ", buyer=" + buyer + ", buyDate=" + buyDate + "]";
    }
}
