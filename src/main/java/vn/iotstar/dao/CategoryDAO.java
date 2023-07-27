package vn.iotstar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vn.iotstar.connection.DBConnection;
import vn.iotstar.model.CategoryModel;
import vn.iotstar.model.ProductModel;

public class CategoryDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<ProductModel> pagingCategory(String cgID, int index) {
        List<ProductModel> list = new ArrayList<>();
        
        String query = "SELECT *\r\n"
                + "FROM\r\n"
                + "    PRODUCT WHERE categoryID = ?\r\n"
                + "ORDER BY id \r\n"
                + "OFFSET ? ROWS \r\n"
                + "FETCH NEXT 10 ROWS ONLY;";
        
        try {
            conn = new DBConnection().getConnection();      
            ps = conn.prepareStatement(query);      
            ps.setString(1, cgID);
            ps.setInt(2, (index - 1) * 10);
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
    
    public int getTotalProduct(String cgID) {
    	String query = "SELECT COUNT(*) FROM PRODUCT WHERE categoryID = ?";
    	try {
    		conn = new DBConnection().getConnection();      
            ps = conn.prepareStatement(query);      
            ps.setString(1, cgID);
            rs = ps.executeQuery();
            while (rs.next()) 
            	return rs.getInt(1);
    	}
    	catch (Exception e){    		
    	}
    	return 0;
    }

    public void deleteCategory(int id) {
        String query = "DELETE FROM PRODUCT_CATEGORY WHERE category_id = ?";

        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            // TODO: handle exception
        }
    }
    public CategoryModel editCategory(CategoryModel cgModel) {
        String query = "UPDATE PRODUCT_CATEGORY SET category_name = ? WHERE category_id = ?";

        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cgModel.getCategory_name());
            ps.setInt(2, cgModel.getCategory_id());
            ps.executeUpdate();

            while (rs.next()) {
                return new CategoryModel(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getDate(6), rs.getDate(7));
            }

        } catch (Exception e) {
            // TODO: handle exception
        }
        return null;
    }

    public CategoryModel insertCategory(CategoryModel cgModel) {
        String query = "INSERT INTO PRODUCT_CATEGORY(category_name) VALUES(?)";

        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cgModel.getCategory_name());
            ps.executeUpdate();

            while (rs.next()) {
                return new CategoryModel(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getDate(6), rs.getDate(7));
            }

        } catch (Exception e) {
            // TODO: handle exception
        }
        return null;
    }

    public List<CategoryModel> getAllCategory() {
        List<CategoryModel> list = new ArrayList<>();

        String query = "SELECT TOP 10 * FROM PRODUCT_CATEGORY";

        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new CategoryModel(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getDate(6), rs.getDate(7)));
            }
            return list;
        } catch (Exception e) {
            // TODO: handle exception
        }
        return null;
    }

    public List<ProductModel> getProductsByID(String cgID) {
        List<ProductModel> list = new ArrayList<>();

        String query = "SELECT * FROM PRODUCT WHERE categoryID = ?";

        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cgID);
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

    public CategoryModel getCategoryName(String cgID) {

        String query = "SELECT * FROM PRODUCT_CATEGORY WHERE category_id = ?";

        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cgID);
            rs = ps.executeQuery();

            while (rs.next()) {
                return new CategoryModel(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getDate(6), rs.getDate(7));
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return null;
    }
}
