package vn.iotstar.model;

import java.sql.Date;

public class UserModel {
	private int userID;
	private String users_username, 
	users_pass_word, users_avatar, 
	users_last_name, users_first_name, 
	users_gender;
	private int role;
	private Date users_birthday, create_at,update_at;
	private String users_email, users_phone, 
	users_shipping_address, users_ship_postal_code;
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getUsers_username() {
		return users_username;
	}
	public void setUsers_username(String users_username) {
		this.users_username = users_username;
	}
	public String getUsers_pass_word() {
		return users_pass_word;
	}
	public void setUsers_pass_word(String users_pass_word) {
		this.users_pass_word = users_pass_word;
	}
	public String getUsers_avatar() {
		return users_avatar;
	}
	public void setUsers_avatar(String users_avatar) {
		this.users_avatar = users_avatar;
	}
	public String getUsers_last_name() {
		return users_last_name;
	}
	public void setUsers_last_name(String users_last_name) {
		this.users_last_name = users_last_name;
	}
	public String getUsers_first_name() {
		return users_first_name;
	}
	public void setUsers_first_name(String users_first_name) {
		this.users_first_name = users_first_name;
	}
	public String getUsers_gender() {
		return users_gender;
	}
	public void setUsers_gender(String users_gender) {
		this.users_gender = users_gender;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public Date getUsers_birthday() {
		return users_birthday;
	}
	public void setUsers_birthday(Date users_birthday) {
		this.users_birthday = users_birthday;
	}
	public Date getCreate_at() {
		return create_at;
	}
	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}
	public Date getUpdate_at() {
		return update_at;
	}
	public void setUpdate_at(Date update_at) {
		this.update_at = update_at;
	}
	public String getUsers_email() {
		return users_email;
	}
	public void setUsers_email(String users_email) {
		this.users_email = users_email;
	}
	public String getUsers_phone() {
		return users_phone;
	}
	public void setUsers_phone(String users_phone) {
		this.users_phone = users_phone;
	}
	public String getUsers_shipping_address() {
		return users_shipping_address;
	}
	public void setUsers_shipping_address(String users_shipping_address) {
		this.users_shipping_address = users_shipping_address;
	}
	public String getUsers_ship_postal_code() {
		return users_ship_postal_code;
	}
	public void setUsers_ship_postal_code(String users_ship_postal_code) {
		this.users_ship_postal_code = users_ship_postal_code;
	}
	public UserModel(int userID, String users_username, String users_pass_word, String users_avatar,
			String users_last_name, String users_first_name, String users_gender, int role, Date users_birthday,
			Date create_at, Date update_at, String users_email, String users_phone, String users_shipping_address,
			String users_ship_postal_code) {
		this.userID = userID;
		this.users_username = users_username;
		this.users_pass_word = users_pass_word;
		this.users_avatar = users_avatar;
		this.users_last_name = users_last_name;
		this.users_first_name = users_first_name;
		this.users_gender = users_gender;
		this.role = role;
		this.users_birthday = users_birthday;
		this.create_at = create_at;
		this.update_at = update_at;
		this.users_email = users_email;
		this.users_phone = users_phone;
		this.users_shipping_address = users_shipping_address;
		this.users_ship_postal_code = users_ship_postal_code;
	}
	public UserModel() {

	}
	@Override
	public String toString() {
		return "UserModel [userID=" + userID + ", users_username=" + users_username + ", users_pass_word="
				+ users_pass_word + ", users_avatar=" + users_avatar + ", users_last_name=" + users_last_name
				+ ", users_first_name=" + users_first_name + ", users_gender=" + users_gender + ", role=" + role
				+ ", users_birthday=" + users_birthday + ", create_at=" + create_at + ", update_at=" + update_at
				+ ", users_email=" + users_email + ", users_phone=" + users_phone + ", users_shipping_address="
				+ users_shipping_address + ", users_ship_postal_code=" + users_ship_postal_code + "]";
	}
}
