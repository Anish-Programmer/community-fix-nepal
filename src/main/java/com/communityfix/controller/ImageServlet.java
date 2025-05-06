package com.communityfix.controller;

import com.communityfix.model.Issue;
import com.communityfix.service.IssueService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ImageServlet", value = "/images/*")
public class ImageServlet extends HttpServlet {
    private final IssueService issueService = new IssueService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo(); // e.g., "/123"
        if (pathInfo == null || pathInfo.length() <= 1) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Issue ID required");
            return;
        }

        try {
            int issueId = Integer.parseInt(pathInfo.substring(1)); // Extract issueId from "/123"
            List<Issue> issues = issueService.getAllIssues();
            Issue issue = issues.stream()
                    .filter(i -> i.getIssueId() == issueId)
                    .findFirst()
                    .orElse(null);

            if (issue == null || issue.getImageData() == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found");
                return;
            }

            response.setContentType("image/jpeg"); // Adjust based on actual image type
            response.setContentLength(issue.getImageData().length);
            response.getOutputStream().write(issue.getImageData());
        } catch (SQLException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching image: " + e.getMessage());
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid issue ID");
        }
    }
}