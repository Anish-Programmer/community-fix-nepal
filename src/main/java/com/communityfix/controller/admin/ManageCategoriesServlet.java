package com.communityfix.controller.admin;

import com.communityfix.model.User;
import com.communityfix.service.CategoryService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Logger;
import java.util.logging.Level;

@WebServlet(name = "ManageCategoriesServlet", value = "/ManageCategoriesServlet")
public class ManageCategoriesServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(ManageCategoriesServlet.class.getName());
    private final CategoryService categoryService = new CategoryService();

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
            request.setAttribute("categories", categoryService.getAllCategories());
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error retrieving categories", e);
            request.setAttribute("error", "Failed to load categories: " + e.getMessage());
        }

        request.getRequestDispatcher("/WEB-INF/view/admin/manageCategories.jsp").forward(request, response);
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
        try {
            if ("add".equals(action)) {
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                categoryService.addCategory(name, description);
                request.setAttribute("message", "Category added successfully.");
            } else if ("delete".equals(action)) {
                int categoryId = Integer.parseInt(request.getParameter("categoryId"));
                categoryService.deleteCategory(categoryId);
                request.setAttribute("message", "Category deleted successfully.");
            }
        } catch (NumberFormatException e) {
            LOGGER.log(Level.WARNING, "Invalid category ID", e);
            request.setAttribute("error", "Invalid category ID: " + e.getMessage());
        } catch (IllegalArgumentException e) {
            LOGGER.log(Level.WARNING, "Invalid request", e);
            request.setAttribute("error", "Invalid request: " + e.getMessage());
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error processing action: " + action, e);
            request.setAttribute("error", "Failed to process action: " + e.getMessage());
        }

        try {
            request.setAttribute("categories", categoryService.getAllCategories());
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error retrieving categories after action", e);
            request.setAttribute("error", "Failed to load categories: " + e.getMessage());
        }

        request.getRequestDispatcher("/WEB-INF/view/admin/manageCategories.jsp").forward(request, response);
    }
}