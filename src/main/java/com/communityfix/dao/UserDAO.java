package com.communityfix.dao;

import com.communityfix.model.User;
import com.communityfix.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDAO {
    public User saveUser(User user) throws SQLException {
        String sql = "INSERT INTO users (username, password, role, email, phone) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getRole().name().toLowerCase());
            stmt.setString(4, user.getEmail());
            stmt.setString(5, user.getPhone());
            stmt.executeUpdate();
            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) {
                    return new User(rs.getInt(1), user.getUsername(), user.getPassword(),
                            user.getRole(), user.getEmail(), user.getPhone());
                }
            }
        }
        return user;
    }

    public User getUserByUsername(String username) throws SQLException {
        String sql = "SELECT * FROM users WHERE username = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new User(rs.getInt("user_id"), rs.getString("username"),
                            rs.getString("password"),
                            User.Role.valueOf(rs.getString("role").toUpperCase()),
                            rs.getString("email"), rs.getString("phone"));
                }
            }
        }
        return null;
    }
}