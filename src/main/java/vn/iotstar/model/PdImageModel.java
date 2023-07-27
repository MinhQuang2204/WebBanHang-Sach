package vn.iotstar.model;

import java.sql.Date;

public class PdImageModel {
    private int product_im_id, product_id;
    private String product_image;
    private Date create_at, update_at;
    public int getProduct_im_id() {
        return product_im_id;
    }
    public void setProduct_im_id(int product_im_id) {
        this.product_im_id = product_im_id;
    }
    public int getProduct_id() {
        return product_id;
    }
    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }
    public String getProduct_image() {
        return product_image;
    }
    public void setProduct_image(String product_image) {
        this.product_image = product_image;
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
    public PdImageModel(int product_im_id, int product_id, String product_image, Date create_at, Date update_at) {
        this.product_im_id = product_im_id;
        this.product_id = product_id;
        this.product_image = product_image;
        this.create_at = create_at;
        this.update_at = update_at;
    }
    @Override
    public String toString() {
        return "PdImageModel [product_im_id=" + product_im_id + ", product_id=" + product_id + ", product_image="
                + product_image + ", create_at=" + create_at + ", update_at=" + update_at + "]";
    }
}
