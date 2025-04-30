package com.communityfix.controller.admin;

import com.communityfix.model.User;
import com.communityfix.service.IssueService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

@WebServlet("/ViewReportServlet")
public class ViewReportServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(ViewReportServlet.class.getName());
    private final IssueService issueService = new IssueService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User loggedInUser = (session != null) ? (User) session.getAttribute("user") : null;
        if (loggedInUser == null || loggedInUser.getRole() != User.Role.ADMIN) {
            response.sendRedirect("LoginServlet");
            return;
        }

        try {
            // Fetch summary statistics
            Map<String, Integer> summaryStats = issueService.getSummaryStats();
            List<Map<String, Object>> issuesByCategory = issueService.getIssuesByCategory();

            // Set attributes for JSP
            request.setAttribute("summaryStats", summaryStats);
            request.setAttribute("issuesByCategory", issuesByCategory);

            request.getRequestDispatcher("/WEB-INF/view/viewReports.jsp").forward(request, response);
        } catch (SQLException e) {
            LOGGER.severe("Database error while fetching reports: " + e.getMessage());
            request.setAttribute("error", "Database error: Unable to fetch reports. Please try again.");
            request.getRequestDispatcher("/WEB-INF/view/error.jsp").forward(request, response);
        } catch (Exception e) {
            LOGGER.severe("Unexpected error while fetching reports: " + e.getMessage());
            request.setAttribute("error", "Unexpected error: Please contact support.");
            request.getRequestDispatcher("/WEB-INF/view/error.jsp").forward(request, response);
        }
    }
}