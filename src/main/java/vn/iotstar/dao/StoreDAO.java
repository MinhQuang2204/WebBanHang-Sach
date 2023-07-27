package vn.iotstar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import vn.iotstar.connection.DBConnection;
import vn.iotstar.model.StoreModel;

public class StoreDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public void insert(StoreModel store) {
		String query = "INSERT INTO Store(storeName, addressStore, userID) "
				+ "VALUES(?, ?, ?)";
		
		try {
			conn = new DBConnection().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, store.getStoreName());
			ps.setString(2, store.getAddressStore());
			ps.setInt(3, store.getUserID());
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public StoreModel getUserID(int id) {
		String query = "SELECT * FROM Store WHERE userID = ?";
		
		try {
			conn = new DBConnection().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				return new StoreModel(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getInt(4),
						rs.getString(5),
						rs.getString(6),
						rs.getDouble(7),
						rs.getDate(8),
						rs.getDate(9));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	
}
