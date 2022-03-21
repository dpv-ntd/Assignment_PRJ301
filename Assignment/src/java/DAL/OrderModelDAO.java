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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.OrderModel;
import model.ProductModel;

/**
 *
 * @author DPV
 */
public class OrderModelDAO extends BaseDAO<OrderModel> {

    public ArrayList<OrderModel> getAllOrder() {
        ArrayList<OrderModel> order = new ArrayList<>();
        try {
            String sql = "Select DISTINCT a.id,d.username, a.totalPrice, c.name, c.phone, c.address, c.email, a.note, a.created_date from Orders as a INNER JOIN OrderDetail as b on a.id = b.order_id INNER JOIN Shipping as c on a.shipping_id = c.id INNER JOIN Account as d on a.account_id = d.id ORDER BY a.id desc";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                List<ProductModel> listProduct = new ProductModelDAO().getProductByOrderId(rs.getInt("id"));
                OrderModel s = new OrderModel();
                s.setId(rs.getInt("id"));
                s.setUsername(rs.getString("username"));
                s.setTotalprice(rs.getDouble("totalPrice"));
                s.setCustomerName(rs.getString("name"));
                s.setAddress(rs.getString("address"));
                s.setPhone(rs.getString("phone"));
                s.setEmail(rs.getString("email"));
                s.setNote(rs.getString("note"));
                s.setDateCreated(rs.getDate("created_date"));
                s.setListProduct(listProduct);
                order.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return order;
    }

    public OrderModel getOrderById(int id) {
        try {
            String sql = "Select DISTINCT a.id,d.username, a.totalPrice, c.name, c.phone, c.address, c.email, a.note, a.created_date from Orders as a INNER JOIN OrderDetail as b on a.id = b.order_id INNER JOIN Shipping as c on a.shipping_id = c.id INNER JOIN Account as d on a.account_id = d.id WHERE a.id = ? ORDER BY a.id desc ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                List<ProductModel> listProduct = new ProductModelDAO().getProductByOrderId(rs.getInt("id"));
                OrderModel s = new OrderModel();
                s.setId(rs.getInt("id"));
                s.setUsername(rs.getString("username"));
                s.setTotalprice(rs.getDouble("totalPrice"));
                s.setCustomerName(rs.getString("name"));
                s.setAddress(rs.getString("address"));
                s.setPhone(rs.getString("phone"));
                s.setEmail(rs.getString("email"));
                s.setNote(rs.getString("note"));
                s.setDateCreated(rs.getDate("created_date"));
                s.setListProduct(listProduct);
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        //System.out.println(new OrderModelDAO().getAllOrder());
        System.out.println(new OrderModelDAO().getOrderById(22).getListProduct().toString());
    }
}
