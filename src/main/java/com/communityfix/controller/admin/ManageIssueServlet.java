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

@WebServlet(name = "ManageIssueServlet", value = {"/ManageIssueServlet", "/updateIssue"})
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

        String servletPath = request.getServletPath();
        if ("/updateIssue".equals(servletPath)) {
            handleUpdateIssue(request, response);
        } else {
            handleManageIssue(request, response);
        }
    }

    private void handleManageIssue(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int issueId = Integer.parseInt(request.getParameter("issueId"));

        try {
            if ("delete".equals(action)) {
                issueService.deleteIssue(issueId);
                request.setAttribute("message", "Issue deleted successfully.");
            } else if ("updateStatus".equals(action)) {
                String newStatus = request.getParameter("newStatus");
                issueService.updateIssueStatus(issueId, newStatus);
                request.setAttribute("message", "Issue status updated to " + newStatus + ".");
            }
            List<Issue> issues = issueService.getAllIssues();
            request.setAttribute("issues", issues);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error processing action: " + action, e);
            request.setAttribute("error", "Failed to process action: " + e.getMessage());
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", e.getMessage());
        }

        request.getRequestDispatcher("/WEB-INF/view/admin/manageIssues.jsp").forward(request, response);
    }

    private void handleUpdateIssue(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int issueId = Integer.parseInt(request.getParameter("issueId"));
            String status = request.getParameter("status");
            String comment = request.getParameter("comment");

            issueService.updateIssue(issueId, status, comment);

            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("Issue updated successfully");
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error updating issue", e);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Failed to update issue: " + e.getMessage());
        } catch (IllegalArgumentException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Invalid request: " + e.getMessage());
        }
    }
}