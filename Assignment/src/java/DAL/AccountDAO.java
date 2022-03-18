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
                s.setRole(rs.getString("role"));
                s.setBlock(rs.getString("block"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateProfiles(String id, String name, String email, String phone, String address) {
        try {
            String sql = "UPDATE Account SET displayName = ?, address = ?, email = ?, phone = ? WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, name);
            statement.setString(2, address);
            statement.setString(3, email);
            statement.setString(4, phone);
            statement.setString(5, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Account getAccountById(String id) {
        try {
            String sql = "SELECT * FROM Account WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Account s = new Account();
                s.setId(rs.getInt("id"));
                s.setUsername(rs.getString("username"));
                s.setPassword(rs.getString("password"));
                s.setDisplayName(rs.getString("displayName"));
                s.setEmail(rs.getString("email"));
                s.setPhone(rs.getString("phone"));
                s.setAddress(rs.getString("address"));
                s.setRole(rs.getString("role"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Account getAccountByUsername(String username) {
        try {
            String sql = "SELECT * FROM Account WHERE username = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Account s = new Account();
                s.setId(rs.getInt("id"));
                s.setUsername(rs.getString("username"));
                s.setPassword(rs.getString("password"));
                s.setDisplayName(rs.getString("displayName"));
                s.setEmail(rs.getString("email"));
                s.setPhone(rs.getString("phone"));
                s.setAddress(rs.getString("address"));
                s.setRole(rs.getString("role"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void createAccount(String username, String password) {
        try {
            String sql = "INSERT INTO Account (username, password, role, block) VALUES(?,?,'Customer','no')";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Account> getAllAccount() {
        ArrayList<Account> account = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Account ORDER BY id";
            PreparedStatement statement = connection.prepareStatement(sql);
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
                s.setRole(rs.getString("role"));
                s.setBlock(rs.getString("block"));

                account.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return account;
    }

    public void bannedAccount(int accountId, String block) {
        try {
            String sql = "UPDATE Account SET block = ? WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, block);
            statement.setInt(2, accountId);
            
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void main(String[] args) {
        new AccountDAO().bannedAccount(5, "yes");
    }
}
