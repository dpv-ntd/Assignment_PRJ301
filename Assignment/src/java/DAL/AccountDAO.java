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
import model.Account;

/**
 *
 * @author MyPC
 */
public class AccountDAO extends BaseDAO<Account> {

    public Account getAccount(String username, String password) {
        try {
            String sql = "SELECT * FROM Account where username = ? and password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Account s = new Account();
                s.setId(rs.getInt("id"));
                s.setUsername(rs.getString("username"));
                s.setPassword(rs.getString("password"));
                s.setDisplayName(rs.getString("displayName"));
                s.setAddress(rs.getString("address"));
                s.setEmail(rs.getString("email"));
                s.setPhone(rs.getString("phone"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        System.out.println(dao.getAccount("ducprovng", "12345"));
    }
}
