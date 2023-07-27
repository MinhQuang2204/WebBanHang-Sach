package vn.iotstar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vn.iotstar.connection.DBConnection;
import vn.iotstar.model.ProductModel;

public class ProductDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public List<ProductModel> getNext5NewBook(int amount_newbook) {
        List<ProductModel> list = new ArrayList<>();
        
        String query = "SELECT *\r\n"
                + "FROM\r\n"
                + "    PRODUCT\r\n"
                + "ORDER BY id \r\n"
                + "OFFSET ? ROWS \r\n"
                + "FETCH NEXT 5 ROWS ONLY;";
        
        try {
            conn = new DBConnection().getConnection();      
            ps = conn.prepareStatement(query);      
            ps.setInt(1, amount_newbook);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                list.add(new ProductModel(
                        rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9),
                        rs.getDate(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getDate(15),
                        rs.getInt(16),
                        rs.getDouble(17)));
            }
            return list;
        } catch (Exception e) {
            // TODO: handle exception
        }
        return null;
    }
	
	public List<ProductModel> getTop10Products() {
		List<ProductModel> list = new ArrayList<>();
		
		String query = "SELECT TOP 10 id, productName, image, description, price, categoryID, discontinued, quantity, createAt, updateAt, per_discount, cover_id, storeID, id_NXB, DateXB, expiration, rating_count, average_rating "
				+ "FROM   PRODUCT AS p INNER JOIN DISCOUNT AS d "
				+ "ON p.id_discount = d.id_discount WHERE p.discontinued = 1 ORDER BY p.id DESC";
		
		try {
			conn = new DBConnection().getConnection();		
			ps = conn.prepareStatement(query);		
			rs = ps.executeQuery();
			
			while (rs.next()) {
				list.add(new ProductModel(
                        rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9),
                        rs.getDate(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getDate(15),
                        rs.getInt(16),
                        rs.getDouble(17)));
			}
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	public List<ProductModel> getDisplayProducts() {
		List<ProductModel> list = new ArrayList<>();
		
		String query = "SELECT TOP 10 * FROM getProduct";
		
		try {
			conn = new DBConnection().getConnection();
			ps = conn.prepareStatement(query);	
			rs = ps.executeQuery();
			
			while (rs.next()) {
				list.add(new ProductModel(
                        rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9),
                        rs.getDate(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getDate(15),
                        rs.getInt(16),
                        rs.getDouble(17)));
			}
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	public List<ProductModel> getProductsBySearch(String txtSearch) {
		List<ProductModel> list = new ArrayList<>();
		
		String query = "SELECT * FROM PRODUCT WHERE productName LIKE ? AND discontinued = 1";
		
		try {
			conn = new DBConnection().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, "%" + txtSearch + "%");
			rs = ps.executeQuery();
			
			while (rs.next()) {
				list.add(new ProductModel(
                        rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9),
                        rs.getDate(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getDate(15),
                        rs.getInt(16),
                        rs.getDouble(17)));
			}
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	public ProductModel getProductById(String pro_id) {	
		String query = "SELECT * FROM PRODUCT WHERE id = ?";
		
		try {
			conn = new DBConnection().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, pro_id);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				return (new ProductModel(
                        rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9),
                        rs.getDate(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getDate(15),
                        rs.getInt(16),
                        rs.getDouble(17)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	public List<ProductModel> getAllProducts() {
		List<ProductModel> list = new ArrayList<>();
		
		String query = "SELECT * FROM PRODUCT";
		
		try {
			conn = new DBConnection().getConnection();
			
			ps = conn.prepareStatement(query);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				list.add(new ProductModel(
                        rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9),
                        rs.getDate(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getInt(13),
                        rs.getInt(14),
                        rs.getDate(15),
                        rs.getInt(16),
                        rs.getDouble(17)));
			}
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
}
