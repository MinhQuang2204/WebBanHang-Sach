package vn.iotstar.model;

import java.sql.Date;

public class CategoryModel {
	private int category_id;
	private String category_code, category_name, category_description, category_image;
	private Date create_at, update_at;

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public String getCategory_code() {
		return category_code;
	}

	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public String getCategory_description() {
		return category_description;
	}

	public void setCategory_description(String category_description) {
		this.category_description = category_description;
	}

	public String getCategory_image() {
		return category_image;
	}

	public void setCategory_image(String category_image) {
		this.category_image = category_image;
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

	public CategoryModel(int category_id, String category_code, String category_name, String category_description,
			String category_image, Date create_at, Date update_at) {
		this.category_id = category_id;
		this.category_code = category_code;
		this.category_name = category_name;
		this.category_description = category_description;
		this.category_image = category_image;
		this.create_at = create_at;
		this.update_at = update_at;
	}

	@Override
	public String toString() {
		return "CategoryModel [category_id=" + category_id + ", category_code=" + category_code + ", category_name="
				+ category_name + ", category_description=" + category_description + ", category_image="
				+ category_image + ", create_at=" + create_at + ", update_at=" + update_at + "]\n";
	}
}
