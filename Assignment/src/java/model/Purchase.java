/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author DPV
 */
public class Purchase {

    private String productName;
    private String productImage;
    private double productPrice;
    private int productId;

    public Purchase() {
    }

    public Purchase(String productName, String productImage, double productPrice, int productId) {
        this.productName = productName;
        this.productImage = productImage;
        this.productPrice = productPrice;
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    @Override
    public String toString() {
        return "Purchase{" + "productName=" + productName + ", productImage=" + productImage + ", productPrice=" + productPrice + ", productId=" + productId + '}';
    }
    
    

}
