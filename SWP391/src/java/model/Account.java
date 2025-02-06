/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


public class Account {
    public int account_id;
    public String username;
    public String password;
    public String email;
    public String phonenumber;
    public String created_date;
    public Role role;

    public Account() {
    }

    public Account(int account_id, String username, String email, String phonenumber, String created_date, Role role) {
        this.account_id = account_id;
        this.username = username;
        this.email = email;
        this.phonenumber = phonenumber;
        this.created_date = created_date;
        this.role = role;
    }

    
    public Account(int account_id, String username, String password, String email, String phonenumber, String created_date, Role role) {
        this.account_id = account_id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.phonenumber = phonenumber;
        this.created_date = created_date;
        this.role = role;
    }

    public Account(String username, String password, String email, String phonenumber, String created_date, Role role) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.phonenumber = phonenumber;
        this.created_date = created_date;
        this.role = role;
    }
    
    

    public Account(String username, String password, String email, String phonenumber, Role role) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.phonenumber = phonenumber;
        this.role = role;
    }
    
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCreated_date() {
        return created_date;
    }

    public void setCreated_date(String created_date) {
        this.created_date = created_date;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Account{" + "account_id=" + account_id + ", username=" + username + ", password=" + password + ", email=" + email + ", phonenumber=" + phonenumber + ", created_date=" + created_date + ", role=" + role + '}';
    }
    
}
