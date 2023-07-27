package vn.iotstar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vn.iotstar.connection.DBConnection;
import vn.iotstar.model.CartItemsModel;
import vn.iotstar.model.CartModel;
import vn.iotstar.model.ProductModel;
import vn.iotstar.model.UserModel;

public class CartItemsDAO {
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    UserDAO userDAO = new UserDAO();
    
    public void insert(CartItemsModel cartItem) {              
        String query = "INSERT INTO CartItems(cart_id, pro_id, quantity, unitPrice) VALUES(?, ?, ?, ?)";
        try {
            connection = new DBConnection().getConnection();
            ps = connection.prepareStatement(query);
            //ps.setInt(1, cartItem.getId());
            ps.setInt(1, cartItem.getCart().getCart_id());
            ps.setInt(2, cartItem.getProduct().getId());
            ps.setInt(3, cartItem.getQuantity());
            ps.setDouble(4, cartItem.getUnitPrice());
            ps.executeUpdate();                 
            
        } catch (Exception e) {
            // TODO: handle exception
        }
    }
    public void edit(CartItemsModel cartItem) {
        String query = "UPDATE CartItems SET quantity = ?, unitPrice = ? WHERE cart_id = ? AND pro_id = ?";
        try {
            connection = new DBConnection().getConnection();
            ps = connection.prepareStatement(query);           
            
            ps.setInt(1, cartItem.getQuantity());
            ps.setDouble(2, cartItem.getUnitPrice());
            ps.setInt(3, cartItem.getCart().getCart_id());
            ps.setInt(4, cartItem.getProduct().getId());
            ps.executeUpdate();                 
            
        } catch (Exception e) {
            // TODO: handle exception
        }
    }
    public void delete(int id, int pro_id) {
        String query = "DELETE FROM CartItems WHERE cart_id = ? AND pro_id = ?";
        try {
            connection = new DBConnection().getConnection();
            ps = connection.prepareStatement(query);           
            ps.setInt(1, id);
            ps.setInt(2, pro_id);
            ps.executeUpdate();
            
        } catch (Exception e) {
            // TODO: handle exception
        }        
    }
    public List<CartItemsModel> get(int id) {
    	List<CartItemsModel> list = new ArrayList<>();
        String query = "SELECT CartItems.id, CartItems.cart_id, CartItems.pro_id, CartItems.quantity, unitPrice, CART.user_id, buy_date, productName, price, image "
        		+ "FROM CartItems JOIN CART ON CartItems.cart_id = CART.cart_id JOIN PRODUCT ON CartItems.pro_id = PRODUCT.id "
        		+ "WHERE CartItems.cart_id = ?";
        try {
            connection = new DBConnection().getConnection();
            ps = connection.prepareStatement(query);           
            ps.setInt(1, id);
            rs = ps.executeQuery();   
            
            while(rs.next()) {
                UserModel userModel = userDAO.getUserById(rs.getInt("user_id"));
                CartModel cartModel = new CartModel();
                cartModel.setBuyer(userModel);
                cartModel.setBuyDate(rs.getDate("buy_date"));
                cartModel.setCart_id(rs.getInt("cart_id"));
                
                ProductModel productModel = new ProductModel();
                productModel.setId(rs.getInt("pro_id"));
                productModel.setImage(rs.getString("image"));
                productModel.setProductName(rs.getString("productName"));
                productModel.setPrice(rs.getInt("price"));
                
                CartItemsModel cartItem = new CartItemsModel();
                cartItem.setCart(cartModel);
                cartItem.setProduct(productModel);
                cartItem.setQuantity(rs.getInt("quantity"));
                cartItem.setUnitPrice(rs.getDouble("unitPrice"));
                list.add(cartItem);
            }
            return list;
        } catch (Exception e) {
            // TODO: handle exception
        }   
        return null;
    }
}
