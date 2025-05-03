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

@WebServlet(name = "SearchIssueServlet", value = "/SearchIssueServlet")
public class SearchIssueServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(SearchIssueServlet.class.getName());
    private final IssueService issueService = new IssueService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User loggedInUser = (User) request.getSession().getAttribute("user");
        if (loggedInUser == null || loggedInUser.getRole() != User.Role.CITIZEN) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        String keyword = request.getParameter("keyword");
        if (keyword == null || keyword.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Please enter a keyword to search.");
            request.getRequestDispatcher("/WEB-INF/view/citizen/searchIssue.jsp").forward(request, response);
            return;
        }

        try {
            List<Issue> issues = issueService.searchIssuesByKeyword(loggedInUser.getUserId(), keyword);
            request.setAttribute("issues", issues);
            request.setAttribute("keyword", keyword);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error searching issues for keyword: " + keyword, e);
            request.setAttribute("errorMessage", "Error searching issues: " + e.getMessage());
        }

        request.getRequestDispatcher("/WEB-INF/view/citizen/searchIssue.jsp").forward(request, response);
    }
}