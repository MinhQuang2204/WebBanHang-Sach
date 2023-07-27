package vn.iotstar.model;

public class CartItemsModel {
    private int id;
    private int quantity;
    private double unitPrice;
    private ProductModel product;
    private CartModel cart;
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public double getUnitPrice() {
        return unitPrice;
    }
    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }
    public ProductModel getProduct() {
        return product;
    }
    public void setProduct(ProductModel product) {
        this.product = product;
    }
    public CartModel getCart() {
        return cart;
    }
    public void setCart(CartModel cart) {
        this.cart = cart;
    }
    public CartItemsModel() {
        
    }
    public CartItemsModel(int id, int quantity, double unitPrice, ProductModel product, CartModel cart) {
        this.id = id;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.product = product;
        this.cart = cart;
    }
    @Override
    public String toString() {
        return "CartItemsModel [id=" + id + ", quantity=" + quantity + ", unitPrice=" + unitPrice + ", product="
                + product + ", cart=" + cart + "]";
    }
}
