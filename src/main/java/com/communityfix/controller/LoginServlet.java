package com.communityfix.controller;

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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String success = request.getParameter("success");
        if (success != null) {
            request.setAttribute("successMessage", success);
        }
        request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            User user = userService.loginUser(username, password);
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Role-based redirection
            if (user.getRole() == User.Role.ADMIN) {
                response.sendRedirect("DashboardServlet");
            } else {
                response.sendRedirect("UserDashboardServlet");
            }
        } catch (IllegalArgumentException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
        } catch (SQLException e) {
            log("Database error during login: " + e.getMessage(), e);
            request.setAttribute("errorMessage", "Database error: Unable to login. Please try again.");
            request.getRequestDispatcher("/WEB-INF/view/error.jsp").forward(request, response);
        } catch (Exception e) {
            log("Unexpected error during login: " + e.getMessage(), e);
            request.setAttribute("errorMessage", "Unexpected error: Please contact support.");
            request.getRequestDispatcher("/WEB-INF/view/error.jsp").forward(request, response);
        }
    }
}