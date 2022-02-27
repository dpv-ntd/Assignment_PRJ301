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
import model.Catagory;
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
    
    public ArrayList<Products> getProductsByCid(String cid) {
        ArrayList<Products> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Product WHERE cid = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, cid);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Products s = new Products();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));

                s.setPrice(rs.getDouble("price"));

                s.setDescription(rs.getString("description"));
                products.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ArrayList<Catagory> getCatagory() {
        ArrayList<Catagory> catagory = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Catagory";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Catagory c = new Catagory();
                c.setCid(rs.getInt("cid"));
                c.setCname(rs.getString("cname"));
                catagory.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return catagory;
    }
 
}
