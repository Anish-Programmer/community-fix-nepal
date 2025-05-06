package com.communityfix.controller.admin;

import com.communityfix.model.User;
import com.communityfix.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;
import java.util.logging.Level;

@WebServlet(name = "ManageUserServlet", value = "/ManageUserServlet")
public class ManageUserServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(ManageUserServlet.class.getName());
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (user.getRole() != User.Role.ADMIN) {
            response.sendRedirect(request.getContextPath() + "/UserDashboardServlet");
            return;
        }

        try {
            List<User> users = userService.getAllUsers();
            request.setAttribute("users", users);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error retrieving users", e);
            request.setAttribute("error", "Failed to load users: " + e.getMessage());
        }

        request.getRequestDispatcher("/WEB-INF/view/admin/manageUser.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (user.getRole() != User.Role.ADMIN) {
            response.sendRedirect(request.getContextPath() + "/UserDashboardServlet");
            return;
        }

        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            try {
                int userId = Integer.parseInt(request.getParameter("userId"));
                if (user.getUserId() == userId) {
                    request.setAttribute("error", "Cannot delete your own account.");
                } else {
                    userService.deleteUser(userId); // Assume deleteUser is added to UserService
                    request.setAttribute("message", "User deleted successfully.");
                }
            } catch (NumberFormatException e) {
                LOGGER.log(Level.WARNING, "Invalid user ID", e);
                request.setAttribute("error", "Invalid user ID: " + e.getMessage());
            } catch (SQLException e) {
                LOGGER.log(Level.SEVERE, "Error deleting user", e);
                request.setAttribute("error", "Failed to delete user: " + e.getMessage());
            }
        }

        try {
            List<User> users = userService.getAllUsers();
            request.setAttribute("users", users);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error retrieving users after action", e);
            request.setAttribute("error", "Failed to load users: " + e.getMessage());
        }

        request.getRequestDispatcher("/WEB-INF/view/admin/manageUser.jsp").forward(request, response);
    }

    // Placeholder for deleteUser method (to be implemented in UserService)
    private void deleteUser(int userId) throws SQLException {
        // This will be implemented in UserService
    }
}