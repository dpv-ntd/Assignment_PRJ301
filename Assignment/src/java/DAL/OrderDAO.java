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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;

/**
 *
 * @author MyPC
 */
public class OrderDAO extends BaseDAO<Order> {

    public int InsertAndReturnOrderId(Order order) {
        try {
            String sql = "INSERT INTO Orders (account_id, totalPrice, note, shipping_id) VALUES (?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, order.getAccount_id());
            statement.setDouble(2, order.getTotalPrice());
            statement.setString(3, order.getNote());
            statement.setInt(4, order.getShipping_id());
            statement.executeUpdate();

            ResultSet rs = statement.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

}
