package com.communityfix.controller.admin;

import com.communityfix.model.Issue;
import com.communityfix.service.IssueService;
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

@WebServlet(name = "ManageIssueServlet", value = "/ManageIssueServlet")
public class ManageIssueServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(ManageIssueServlet.class.getName());
    private final IssueService issueService = new IssueService();

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
            List<Issue> issues = issueService.getAllIssues();
            request.setAttribute("issues", issues);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error retrieving issues", e);
            request.setAttribute("error", "Failed to load issues: " + e.getMessage());
        }

        request.getRequestDispatcher("/WEB-INF/view/admin/manageIssues.jsp").forward(request, response);
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

        try {
            int issueId = Integer.parseInt(request.getParameter("issueId"));
            String status = request.getParameter("status");
            String comment = request.getParameter("comment");

            if (status == null || status.trim().isEmpty()) {
                throw new IllegalArgumentException("Status is required.");
            }

            issueService.updateIssue(issueId, status, comment);
            request.setAttribute("message", "Issue updated successfully.");
        } catch (NumberFormatException e) {
            LOGGER.log(Level.WARNING, "Invalid issue ID", e);
            request.setAttribute("error", "Invalid issue ID: " + e.getMessage());
        } catch (IllegalArgumentException e) {
            LOGGER.log(Level.WARNING, "Invalid request", e);
            request.setAttribute("error", "Invalid request: " + e.getMessage());
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error updating issue", e);
            request.setAttribute("error", "Failed to update issue: " + e.getMessage());
        }

        // Always reload issues after an update attempt
        try {
            List<Issue> issues = issueService.getAllIssues();
            request.setAttribute("issues", issues);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error retrieving issues after update", e);
            request.setAttribute("error", "Failed to load issues: " + e.getMessage());
        }

        request.getRequestDispatcher("/WEB-INF/view/admin/manageIssues.jsp").forward(request, response);
    }
}