package com.communityfix.controller;

import com.communityfix.model.User;
import com.communityfix.util.DatabaseUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.util.regex.Pattern;

import org.mindrot.jbcrypt.BCrypt;

@WebServlet(name = "ProfileServlet", value = "/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(ProfileServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null || user.getRole() != User.Role.CITIZEN) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/view/citizen/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null || user.getRole() != User.Role.CITIZEN) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        // Get form data
        String newPassword = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // Validate email
        if (!isValidEmail(email)) {
            request.setAttribute("error", "Invalid email format.");
            request.getRequestDispatcher("/WEB-INF/view/citizen/profile.jsp").forward(request, response);
            return;
        }

        // Validate phone (basic regex for Nepali phone numbers, e.g., +977-1234567890 or 9812345678)
        if (!isValidPhone(phone)) {
            request.setAttribute("error", "Invalid phone number. Use format like +977-1234567890 or 9812345678.");
            request.getRequestDispatcher("/WEB-INF/view/citizen/profile.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "UPDATE users SET email = ?, phone = ?" + (newPassword != null && !newPassword.trim().isEmpty() ? ", password = ?" : "") + " WHERE user_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, phone);
            if (newPassword != null && !newPassword.trim().isEmpty()) {
                if (newPassword.length() < 6) {
                    request.setAttribute("error", "Password must be at least 6 characters long.");
                    request.getRequestDispatcher("/WEB-INF/view/citizen/profile.jsp").forward(request, response);
                    return;
                }
                String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());
                stmt.setString(3, hashedPassword);
                stmt.setInt(4, user.getUserId());
            } else {
                stmt.setInt(3, user.getUserId());
            }

            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                // Update the session user object
                user.setEmail(email);
                user.setPhone(phone);
                if (newPassword != null && !newPassword.trim().isEmpty()) {
                    user.setPassword(BCrypt.hashpw(newPassword, BCrypt.gensalt()));
                }
                session.setAttribute("user", user);
                request.setAttribute("message", "Profile updated successfully!");
            } else {
                request.setAttribute("error", "Failed to update profile.");
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error updating user profile for user_id: " + user.getUserId(), e);
            request.setAttribute("error", "Error updating profile: " + e.getMessage());
        }

        request.getRequestDispatcher("/WEB-INF/view/citizen/profile.jsp").forward(request, response);
    }

    private boolean isValidEmail(String email) {
        if (email == null) return false;
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        return Pattern.matches(emailRegex, email);
    }

    private boolean isValidPhone(String phone) {
        if (phone == null) return false;
        // Accepts formats like +977-1234567890 or 9812345678 (10 digits starting with 9 for Nepali mobile numbers)
        String phoneRegex = "^(\\+977-\\d{9,10}|9\\d{9})$";
        return Pattern.matches(phoneRegex, phone);
    }
}