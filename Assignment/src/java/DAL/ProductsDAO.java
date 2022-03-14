/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Products;

/**
 *
 * @author MyPC
 */
public class ProductsDAO extends BaseDAO<Products> {

    public ArrayList<Products> getProducts() {
        ArrayList<Products> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Product ORDER BY id";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Products s = new Products();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setQuantity(rs.getInt("quantity"));
                s.setPrice(rs.getDouble("price"));
                s.setDescription(rs.getString("description"));
                s.setImage_url(rs.getString("image_url"));
                s.setCreated_date(rs.getDate("created_date"));
                s.setCategory_id(rs.getInt("category_id"));
                products.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    
    public ArrayList<Products> getRelatedProductsByCategoryId(int category_id, String products_id) {
        ArrayList<Products> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Product WHERE category_id = ? and id != ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, category_id);
            statement.setString(2, products_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Products s = new Products();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setQuantity(rs.getInt("quantity"));
                s.setPrice(rs.getDouble("price"));
                s.setDescription(rs.getString("description"));
                s.setImage_url(rs.getString("image_url"));
                s.setCreated_date(rs.getDate("created_date"));
                s.setCategory_id(rs.getInt("category_id"));
                products.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public Products getProductsByProductsId(String products_id) {
        try {
            String sql = "SELECT * FROM Product WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, products_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Products s = new Products();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setQuantity(rs.getInt("quantity"));
                s.setPrice(rs.getDouble("price"));
                s.setDescription(rs.getString("description"));
                s.setImage_url(rs.getString("image_url"));
                s.setCreated_date(rs.getDate("created_date"));
                s.setCategory_id(rs.getInt("category_id"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Products> getProductsByCategoryId(String category_id) {
        ArrayList<Products> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Product WHERE category_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, category_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Products s = new Products();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setQuantity(rs.getInt("quantity"));
                s.setPrice(rs.getDouble("price"));
                s.setDescription(rs.getString("description"));
                s.setImage_url(rs.getString("image_url"));
                s.setCreated_date(rs.getDate("created_date"));
                s.setCategory_id(rs.getInt("category_id"));
                products.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ArrayList<Products> getProductsWithPage(int page, int page_size) {
        ArrayList<Products> products = new ArrayList<>();
        try {
            String sql = "SELECT TOP (?) * FROM Product WHERE id > (?-1)*? ORDER BY id";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, page_size);
            statement.setInt(2, page);
            statement.setInt(3, page_size);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Products s = new Products();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setQuantity(rs.getInt("quantity"));
                s.setPrice(rs.getDouble("price"));
                s.setDescription(rs.getString("description"));
                s.setImage_url(rs.getString("image_url"));
                s.setCreated_date(rs.getDate("created_date"));
                s.setCategory_id(rs.getInt("category_id"));
                products.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ArrayList<Products> getProductsWithKeyword(String keyword) {
        ArrayList<Products> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Product WHERE name like ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + keyword + "%");

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Products s = new Products();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setQuantity(rs.getInt("quantity"));
                s.setPrice(rs.getDouble("price"));
                s.setDescription(rs.getString("description"));
                s.setImage_url(rs.getString("image_url"));
                s.setCreated_date(rs.getDate("created_date"));
                s.setCategory_id(rs.getInt("category_id"));
                products.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public int countProducts() {
        try {
            String sql = "SELECT COUNT(*) FROM Product";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ArrayList<Category> getCategory() {
        ArrayList<Category> category = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Category";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                category.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return category;
    }

}
