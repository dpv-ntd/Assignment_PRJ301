/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author MyPC
 */
public class Account {

    private int id;
    private String username;
    private String password;
    private String displayName;
    private String address;
    private String email;
    private String phone;
    private String role;
    private String block;

    public Account() {
    }

    public Account(int id, String username, String password, String displayName, String address, String email, String phone, String role, String block) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.displayName = displayName;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.role = role;
        this.block = block;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getBlock() {
        return block;
    }

    public void setBlock(String block) {
        this.block = block;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", username=" + username + ", password=" + password + ", displayName=" + displayName + ", address=" + address + ", email=" + email + ", phone=" + phone + ", role=" + role + ", block=" + block + '}';
    }

}
