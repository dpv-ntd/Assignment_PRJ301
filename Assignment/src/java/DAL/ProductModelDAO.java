/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ProductModel;

/**
 *
 * @author DPV
 */
public class ProductModelDAO extends BaseDAO<ProductModelDAO> {

    List<ProductModel> getProductByOrderId(int id) {
        List<ProductModel> list = new ArrayList<>();
        try {
            String sql = "Select a.id,d.username, b.productName, b.quantity, b.productPrice, a.totalPrice, c.name, c.phone, c.address, c.email, a.note, a.created_date from Orders as a INNER JOIN OrderDetail as b on a.id = b.order_id INNER JOIN Shipping as c on a.shipping_id = c.id INNER JOIN Account as d on a.account_id = d.id where a.id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                ProductModel s = new ProductModel();
                s.setName(rs.getString("productName"));
                s.setQuantity(rs.getInt("quantity"));
                s.setPrice(rs.getDouble("productPrice"));
                list.add(s);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(ProductModelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
