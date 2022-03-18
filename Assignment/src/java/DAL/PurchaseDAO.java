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
import model.Purchase;

/**
 *
 * @author DPV
 */
public class PurchaseDAO extends BaseDAO<Purchase> {

    public ArrayList<Purchase> getPurchase(int account_id) {
        ArrayList<Purchase> purchase = new ArrayList<>();
        try {
            String sql = "select DISTINCT productName, productImage, productPrice,productId from OrderDetail inner join Orders on OrderDetail.order_id = Orders.id where account_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, account_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Purchase s = new Purchase();
                s.setProductName(rs.getString("productName"));
                s.setProductImage(rs.getString("productImage"));
                s.setProductPrice(rs.getDouble("productPrice"));
                s.setProductId(rs.getInt("productId"));
                purchase.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return purchase;
    }

    public static void main(String[] args) {
        ArrayList<Purchase> purchase = new PurchaseDAO().getPurchase(1);
        System.out.println(purchase);

    }
}
