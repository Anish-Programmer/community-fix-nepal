package com.communityfix.controller.citizen;

import com.communityfix.model.Issue;
import com.communityfix.model.User;
import com.communityfix.service.IssueService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;
import java.util.logging.Level;

@WebServlet(name = "ViewIssueServlet", value = "/ViewIssueServlet")
public class ViewIssueServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(ViewIssueServlet.class.getName());
    private final IssueService issueService = new IssueService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User loggedInUser = (User) request.getSession().getAttribute("user");
        if (loggedInUser == null || loggedInUser.getRole() != User.Role.CITIZEN) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        try {
            List<Issue> issues = issueService.getIssuesByUserId(loggedInUser.getUserId());
            request.setAttribute("issues", issues);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching issues for user ID: " + loggedInUser.getUserId(), e);
            request.setAttribute("errorMessage", "Error fetching issues: " + e.getMessage());
        }

        request.getRequestDispatcher("/WEB-INF/view/citizen/viewIssue.jsp").forward(request, response);
    }
}