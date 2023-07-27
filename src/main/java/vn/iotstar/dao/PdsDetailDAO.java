package vn.iotstar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vn.iotstar.connection.DBConnection;
import vn.iotstar.model.CoverTypeModel;
import vn.iotstar.model.PdImageModel;
import vn.iotstar.model.ProductModel;

public class PdsDetailDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public CoverTypeModel getCoverType(String id) {
	    String query = "SELECT C.id, [type_name], p.description, C.create_at, C.update_at "
	            + "FROM PRODUCT P JOIN COVER_TYPE C ON P.id = C.id "
	            + "WHERE P.id = ?";
	    
	    try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            
            while(rs.next()) {
                return new CoverTypeModel(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getDate(5));
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
	    return null;
	}
	public List<PdImageModel> getImage(String pro_id) {
	    List<PdImageModel> list = new ArrayList<>();
	    String query = "SELECT i.product_im_id, p.id, i.product_image, i.create_at, i.update_at "
	            + "FROM PRODUCT p JOIN PRODUCT_IMAGE i "
	            + "ON p.id = i.product_id "
	            + "WHERE p.id = ?";
	    try {
	        conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pro_id);
            rs = ps.executeQuery();
            
            while(rs.next()) {
                list.add(new PdImageModel(
                        rs.getInt(1),
                        rs.getInt(2), 
                        rs.getString(3), 
                        rs.getDate(4),
                        rs.getDate(5)));
            }
            return list;
        } catch (Exception e) {
            // TODO: handle exception
        }
	    return null;
	}
	public ProductModel getProductDetail(String psdID) {
		String query = "SELECT p.id, productName, image, description, price, categoryID, discontinued, quantity, createAt, updateAt, per_discount, cover_id, storeID, id_NXB, DateXB, expiration, rating_count, average_rating "
				+ "FROM   PRODUCT AS p INNER JOIN DISCOUNT AS d ON p.id_discount = d.id_discount "
				+ "WHERE p.id = ?";

		try {
			conn = new DBConnection().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, psdID);
			rs = ps.executeQuery();

			while (rs.next()) {
				return new ProductModel(
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
                        rs.getDouble(17));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
}
