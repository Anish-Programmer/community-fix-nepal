package com.communityfix.service;

import com.communityfix.dao.UserDAO;
import com.communityfix.model.User;
import com.communityfix.util.PasswordUtil;

import java.sql.SQLException;
import java.util.List;

public class UserService {
    private final UserDAO userDAO = new UserDAO();

    public User registerUser(String username, String password, String email, String phone) throws SQLException {
        if (userDAO.getUserByUsername(username) != null) {
            throw new IllegalArgumentException("Username already exists");
        }
        String hashedPassword = PasswordUtil.hashPassword(password);
        User user = new User(username, hashedPassword, User.Role.CITIZEN, email, phone);
        return userDAO.saveUser(user);
    }

    public User loginUser(String username, String password) throws SQLException {
        User user = userDAO.getUserByUsername(username);
        if (user == null || !PasswordUtil.verifyPassword(password, user.getPassword())) {
            throw new IllegalArgumentException("Invalid username or password");
        }
        return user;
    }

    public List<User> getAllUsers() throws SQLException {
        return userDAO.getAllUsers();
    }

    public void deleteUser(int userId) throws SQLException {
        userDAO.deleteUser(userId);
    }
}