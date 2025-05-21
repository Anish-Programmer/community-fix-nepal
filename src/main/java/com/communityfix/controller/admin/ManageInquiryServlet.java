package com.communityfix.controller.admin;

import com.communityfix.dao.InquiryDAO;
import com.communityfix.model.Inquiry;
import com.communityfix.model.User;
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

@WebServlet(name = "ManageInquiryServlet", value = "/ManageInquiryServlet")
public class ManageInquiryServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(ManageInquiryServlet.class.getName());
    private final InquiryDAO inquiryDAO;

    public ManageInquiryServlet() {
        this.inquiryDAO = new InquiryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        LOGGER.log(Level.INFO, "Accessing ManageInquiryServlet - Session ID: {0}", (session != null ? session.getId() : "null"));

        if (session == null) {
            LOGGER.log(Level.WARNING, "Session is null, redirecting to login");
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (user == null) {
            LOGGER.log(Level.WARNING, "User attribute is null in session {0}, redirecting to login", session.getId());
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        LOGGER.log(Level.INFO, "User: {0}, Role: {1}", new Object[]{user.getUsername(), user.getRole()});
        if (user.getRole() != User.Role.ADMIN) {
            LOGGER.log(Level.WARNING, "User {0} is not an admin, redirecting to user dashboard", user.getUsername());
            response.sendRedirect(request.getContextPath() + "/UserDashboardServlet");
            return;
        }

        try {
            List<Inquiry> inquiries = inquiryDAO.getAllInquiries();
            request.setAttribute("inquiries", inquiries);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error retrieving inquiries", e);
            request.setAttribute("error", "Failed to load inquiries: " + e.getMessage());
        }

        request.getRequestDispatcher("/WEB-INF/view/admin/manageInquiry.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        LOGGER.log(Level.INFO, "Accessing ManageInquiryServlet (POST) - Session ID: {0}", (session != null ? session.getId() : "null"));

        if (session == null) {
            LOGGER.log(Level.WARNING, "Session is null, redirecting to login");
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (user == null) {
            LOGGER.log(Level.WARNING, "User attribute is null in session {0}, redirecting to login", session.getId());
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        LOGGER.log(Level.INFO, "User: {0}, Role: {1}", new Object[]{user.getUsername(), user.getRole()});
        if (user.getRole() != User.Role.ADMIN) {
            LOGGER.log(Level.WARNING, "User {0} is not an admin, redirecting to user dashboard", user.getUsername());
            response.sendRedirect(request.getContextPath() + "/UserDashboardServlet");
            return;
        }

        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            try {
                int inquiryId = Integer.parseInt(request.getParameter("inquiryId"));
                inquiryDAO.deleteInquiry(inquiryId);
                request.setAttribute("message", "Inquiry deleted successfully!");
            } catch (NumberFormatException e) {
                LOGGER.log(Level.WARNING, "Invalid inquiry ID", e);
                request.setAttribute("error", "Invalid inquiry ID: " + e.getMessage());
            } catch (SQLException e) {
                LOGGER.log(Level.SEVERE, "Error deleting inquiry", e);
                request.setAttribute("error", "Failed to delete inquiry: " + e.getMessage());
            }
        }

        try {
            List<Inquiry> inquiries = inquiryDAO.getAllInquiries();
            request.setAttribute("inquiries", inquiries);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error retrieving inquiries after operation", e);
            request.setAttribute("error", "Failed to load inquiries: " + e.getMessage());
        }

        request.getRequestDispatcher("/WEB-INF/view/admin/manageInquiry.jsp").forward(request, response);
    }
}