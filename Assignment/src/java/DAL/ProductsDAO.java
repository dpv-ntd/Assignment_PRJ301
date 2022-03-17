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
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    
    public ArrayList<Products> getProductsAndCategory() {
        ArrayList<Products> products = new ArrayList<>();
        try {
            String sql = "SELECT Product.id,Product.name,quantity,price,description,image_url,created_date,Category.name as [category] FROM Product "
                    + "inner join Category on Product.category_id = Category.id";
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
                s.setCategory(rs.getString("category"));
                products.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public Products getProductsByProductsId(int products_id) {
        try {
            String sql = "SELECT * FROM Product WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, products_id);
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
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return category;
    }

    public void deleteProduct(String id) {
        try {
            String sql = "DELETE Product WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateProduct(String id, String name, String quantity, String price, String description, String image_url, String category_id) {
        try {
            String sql = "UPDATE Product SET name = ?, quantity = ?, price = ?, description = ?, image_url = ?, category_id = ? WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, quantity);
            statement.setString(3, price);
            statement.setString(4, description);
            statement.setString(5, image_url);
            statement.setString(6, category_id);
            statement.setString(7, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void createProduct(Products product) {
        try {
            String sql = "INSERT INTO [Product]\n"
                    + "           ([name]\n"
                    + "           ,[quantity]\n"
                    + "           ,[price]\n"
                    + "           ,[description]\n"
                    + "           ,[image_url]\n"
                    + "           ,[created_date]\n"
                    + "           ,[category_id])\n"
                    + "     VALUES ( ?,?,?,?,?,GETDATE(),?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, product.getName());
            statement.setInt(2, product.getQuantity());
            statement.setDouble(3, product.getPrice());
            statement.setString(4, product.getDescription());
            statement.setString(5, product.getImage_url());
            statement.setInt(6, product.getCategory_id());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    

}
