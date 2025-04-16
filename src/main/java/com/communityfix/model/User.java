package com.communityfix.model;

public class User {
    private final int userId;
    private String username;
    private String password;
    private Role role;
    private String email;
    private String phone;

    public enum Role {
        CITIZEN, ADMIN
    }

    public User() {
        this.userId = 0;
    }

    public User(String username, String password, Role role, String email, String phone) {
        this.userId = 0;
        setUsername(username);
        setPassword(password);
        this.role = role;
        setEmail(email);
        setPhone(phone);
    }

    public User(int userId, String username, String password, Role role, String email, String phone) {
        this.userId = userId;
        setUsername(username);
        setPassword(password);
        this.role = role;
        setEmail(email);
        setPhone(phone);
    }

    public int getUserId() {
        return userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        if (username == null || username.trim().isEmpty() || username.length() > 20) {
            throw new IllegalArgumentException("Username must be 1-20 characters");
        }
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        if (password == null || password.length() < 6) {
            throw new IllegalArgumentException("Password must be at least 6 characters");
        }
        this.password = password;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        if (role == null) {
            throw new IllegalArgumentException("Role cannot be null");
        }
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        if (email != null && email.length() > 100) {
            throw new IllegalArgumentException("Email must be under 100 characters");
        }
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        if (phone != null && phone.length() > 20) {
            throw new IllegalArgumentException("Phone must be under 20 characters");
        }
        this.phone = phone;
    }
}
