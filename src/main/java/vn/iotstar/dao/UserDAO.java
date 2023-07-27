package vn.iotstar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vn.iotstar.connection.DBConnection;
import vn.iotstar.model.UserModel;

public class UserDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void editRole(UserModel user) {
        String query = "UPDATE USERS SET role = ? WHERE users_username = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, user.getRole());
            ps.setString(2, user.getUsers_username());
            ps.executeUpdate();
        } catch (Exception e) {
            // TODO: handle exception
        }
    }
    public void insertUser(UserModel user) {
        String query = "INSERT INTO USERS(users_username, users_pass_word, role) VALUES(?, ?, ?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user.getUsers_username());
            ps.setString(2, user.getUsers_pass_word());
            ps.setInt(3, user.getRole());
            ps.executeUpdate();
        } catch (Exception e) {
            // TODO: handle exception
        }
    }
    public void insertUsers(UserModel user) {
        String query = "INSERT INTO USERS(users_username, users_pass_word, role, users_last_name, users_first_name) VALUES(?, ?, ?, ?, ?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user.getUsers_username());
            ps.setString(2, user.getUsers_pass_word());
            ps.setInt(3, user.getRole());
            ps.setString(4, user.getUsers_last_name());
            ps.setString(5, user.getUsers_first_name());
            ps.executeUpdate();
        } catch (Exception e) {
            // TODO: handle exception
        }
    }
    public void insertUserGG(UserModel user) {
        String query = "INSERT INTO USERS(users_username, users_last_name) VALUES(?, ?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user.getUsers_username());
            ps.setString(2, user.getUsers_last_name());
            ps.executeUpdate();
        } catch (Exception e) {
            // TODO: handle exception
        }
    }

    public UserModel getUser(String userName) {

        String query = "SELECT * FROM USERS WHERE users_username = ?";

        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userName);
            rs = ps.executeQuery();

            while (rs.next()) {
            	UserModel user = new UserModel();
                user.setUserID(rs.getInt("users_id"));
                user.setUsers_username(rs.getString("users_username"));
                user.setUsers_pass_word(rs.getString("users_pass_word"));
                user.setUsers_avatar(rs.getString("users_avatar"));
                user.setUsers_last_name(rs.getString("users_last_name"));
                user.setUsers_first_name(rs.getString("users_first_name"));
                user.setUsers_gender(rs.getString("users_gender"));
                user.setRole(rs.getInt("role"));
                user.setUsers_birthday(rs.getDate("users_birthday"));
                user.setUsers_email(rs.getString("users_email"));
                user.setUsers_phone(rs.getString("users_phone"));
                user.setUsers_shipping_address(rs.getString("users_shipping_address"));
                user.setUsers_ship_postal_code(rs.getString("users_ship_postal_code"));
                user.setCreate_at(rs.getDate("create_at"));
                user.setUpdate_at(rs.getDate("update_at"));
                                        
                return user;
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return null;
    }
    public UserModel getUserById(int id) {

        String query = "SELECT * FROM USERS WHERE users_id = ?";

        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
            	UserModel user = new UserModel();
                user.setUserID(rs.getInt("users_id"));
                user.setUsers_username(rs.getString("users_username"));
                user.setUsers_pass_word(rs.getString("users_pass_word"));
                user.setUsers_avatar(rs.getString("users_avatar"));
                user.setUsers_last_name(rs.getString("users_last_name"));
                user.setUsers_first_name(rs.getString("users_first_name"));
                user.setUsers_gender(rs.getString("users_gender"));
                user.setRole(rs.getInt("role"));
                user.setUsers_birthday(rs.getDate("users_birthday"));
                user.setUsers_email(rs.getString("users_email"));
                user.setUsers_phone(rs.getString("users_phone"));
                user.setUsers_shipping_address(rs.getString("users_shipping_address"));
                user.setUsers_ship_postal_code(rs.getString("users_ship_postal_code"));
                user.setCreate_at(rs.getDate("create_at"));
                user.setUpdate_at(rs.getDate("update_at"));
                                        
                return user;
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return null;
    }

    public UserModel checkAccount(String userName, String pass) {

        String query = "SELECT * FROM USERS WHERE users_username = ? AND users_pass_word = ?";

        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userName);
            ps.setString(2, pass);
            rs = ps.executeQuery();

            while (rs.next()) {
                UserModel user = new UserModel();
                user.setUserID(rs.getInt("users_id"));
                user.setUsers_username(rs.getString("users_username"));
                user.setUsers_pass_word(rs.getString("users_pass_word"));
                user.setUsers_avatar(rs.getString("users_avatar"));
                user.setUsers_last_name(rs.getString("users_last_name"));
                user.setUsers_first_name(rs.getString("users_first_name"));
                user.setUsers_gender(rs.getString("users_gender"));
                user.setRole(rs.getInt("role"));
                user.setUsers_birthday(rs.getDate("users_birthday"));
                user.setUsers_email(rs.getString("users_email"));
                user.setUsers_phone(rs.getString("users_phone"));
                user.setUsers_shipping_address(rs.getString("users_shipping_address"));
                user.setUsers_ship_postal_code(rs.getString("users_ship_postal_code"));
                user.setCreate_at(rs.getDate("create_at"));
                user.setUpdate_at(rs.getDate("update_at"));
                                        
                return user;
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return null;
    }
    public static void main(String[] args) {
		System.out.println(new UserDAO().getUser("20110639"));
	}
}
