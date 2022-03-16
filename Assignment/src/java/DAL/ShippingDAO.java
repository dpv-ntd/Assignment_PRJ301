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
import model.Shipping;

/**
 *
 * @author MyPC
 */
public class ShippingDAO extends BaseDAO<Shipping>{

    public int InsertAndReturnShippingId(Shipping shipping) {
        try {
            String sql = "INSERT INTO Shipping(name, phone,address) VALUES (?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, shipping.getName());
            statement.setString(2, shipping.getPhone());
            statement.setString(3, shipping.getAddress());
            statement.executeUpdate();
            
            ResultSet rs = statement.getGeneratedKeys();
            if(rs.next()) return rs.getInt(1);
            
        } catch (SQLException ex) {
            Logger.getLogger(ShippingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
        
    }
    
}
