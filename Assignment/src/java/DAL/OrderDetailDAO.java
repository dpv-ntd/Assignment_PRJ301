/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.OrderDetail;

/**
 *
 * @author MyPC
 */
public class OrderDetailDAO extends BaseDAO<OrderDetail> {

    public void saveCart(int orderId, Map<Integer, Cart> carts) {
        try {
            String sql = "INSERT INTO OrderDetail(order_id, productName, productImage, productPrice, quantity, productId) VALUES (?,?,?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, orderId);
            for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                Integer key = entry.getKey();
                Cart value = entry.getValue();
                
                statement.setString(2, value.getProducts().getName());
                statement.setString(3, value.getProducts().getImage_url());
                statement.setDouble(4, value.getProducts().getPrice());
                statement.setInt(5, value.getQuantity());
                statement.setInt(6, value.getProducts().getId());
                statement.executeUpdate();
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
