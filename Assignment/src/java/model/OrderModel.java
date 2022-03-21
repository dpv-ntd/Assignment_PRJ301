/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.util.List;

/**
 *
 * @author DPV
 */
public class OrderModel {

    private int id;
    private String username;
    private double totalprice;
    private String customerName;
    private String phone;
    private String address;
    private String email;
    private String note;
    private Date dateCreated;
    private List<ProductModel> listProduct;

    public OrderModel() {
    }

    public OrderModel(int id, String username, double totalprice, String customerName, String phone, String address, String email, String note, Date dateCreated, List<ProductModel> listProduct) {
        this.id = id;
        this.username = username;
        this.totalprice = totalprice;
        this.customerName = customerName;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.note = note;
        this.dateCreated = dateCreated;
        this.listProduct = listProduct;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(double totalprice) {
        this.totalprice = totalprice;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public List<ProductModel> getListProduct() {
        return listProduct;
    }

    public void setListProduct(List<ProductModel> listProduct) {
        this.listProduct = listProduct;
    }

    @Override
    public String toString() {
        return "OrderModel{" + "id=" + id + ", username=" + username + ", totalprice=" + totalprice + ", customerName=" + customerName + ", phone=" + phone + ", address=" + address + ", email=" + email + ", note=" + note + ", dateCreated=" + dateCreated + ", listProduct=" + listProduct + '}';
    }

}
