package com.communityfix.controller.admin;

import com.communityfix.model.User;
import com.communityfix.service.ViewReportService;
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

@WebServlet(name = "ViewReportServlet", value = "/ViewReportServlet")
public class ViewReportServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(ViewReportServlet.class.getName());
    private final ViewReportService viewReportService = new ViewReportService();

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
            request.setAttribute("summaryStats", viewReportService.getSummaryStats());
            request.setAttribute("issuesByCategory", viewReportService.getIssuesByCategory());
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error retrieving report data", e);
            request.setAttribute("error", "Failed to load report data: " + e.getMessage());
        }

        request.getRequestDispatcher("/WEB-INF/view/admin/viewReport.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response); // Reuse GET logic for simplicity
    }
}