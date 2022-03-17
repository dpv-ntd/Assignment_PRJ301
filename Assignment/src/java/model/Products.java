/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author MyPC
 */
public class Products {

    private int id;
    private String name;
    private int quantity;
    private double price;
    private String description;
    private String image_url;
    private Date created_date;
    private int category_id;
    private String category;

    public Products() {
    }

    public Products(int id, String name, int quantity, double price, String description, String image_url, Date created_date, int category_id, String category) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.description = description;
        this.image_url = image_url;
        this.created_date = created_date;
        this.category_id = category_id;
        this.category = category;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
    

    public Products(int id, String name, int quantity, double price, String description, String image_url, Date created_date, int category_id) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.description = description;
        this.image_url = image_url;
        this.created_date = created_date;
        this.category_id = category_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public Date getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Date created_date) {
        this.created_date = created_date;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    @Override
    public String toString() {
        return "Products{" + "id=" + id + ", name=" + name + ", quantity=" + quantity + ", price=" + price + ", description=" + description + ", image_url=" + image_url + ", created_date=" + created_date + ", category_id=" + category_id + '}';
    }

}
