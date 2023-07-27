package vn.iotstar.model;

import java.sql.Date;

public class CoverTypeModel {
    private int id;
    private String type_name, description;
    private Date create_at, update_at;
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getType_name() {
        return type_name;
    }
    public void setType_name(String type_name) {
        this.type_name = type_name;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
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
    public CoverTypeModel(int id, String type_name, String description, Date create_at, Date update_at) {
        this.id = id;
        this.type_name = type_name;
        this.description = description;
        this.create_at = create_at;
        this.update_at = update_at;
    }
    @Override
    public String toString() {
        return "CoverTypeModel [id=" + id + ", type_name=" + type_name + ", description=" + description + ", create_at="
                + create_at + ", update_at=" + update_at + "]";
    }
}
