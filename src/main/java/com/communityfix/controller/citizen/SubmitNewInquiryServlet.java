package com.communityfix.controller.citizen;

import com.communityfix.model.User;
import com.communityfix.service.InquiryService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "SubmitNewInquiry", value = "/SubmitNewInquiry")
public class SubmitNewInquiryServlet extends HttpServlet {
    private final InquiryService inquiryService;

    public SubmitNewInquiryServlet() {
        this.inquiryService = new InquiryService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User loggedInUser = (User) request.getSession().getAttribute("user");
        if (loggedInUser == null || loggedInUser.getRole() != User.Role.CITIZEN) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        try {
            request.setAttribute("inquiries", inquiryService.getInquiriesForUser(loggedInUser.getUserId()));
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Failed to load inquiries: " + e.getMessage());
        }

        request.getRequestDispatcher("WEB-INF/view/citizen/submitInquiry.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User loggedInUser = (User) request.getSession().getAttribute("user");
        if (loggedInUser == null || loggedInUser.getRole() != User.Role.CITIZEN) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        String inquiryName = request.getParameter("inquiryName");
        String inquiryMessage = request.getParameter("message"); // Matches form field

        try {
            inquiryService.submitInquiry(inquiryName, inquiryMessage, loggedInUser.getUserId());
            request.setAttribute("successMessage", "Inquiry submitted successfully!");
        } catch (IllegalArgumentException | SQLException e) {
            request.setAttribute("errorMessage", e.getMessage());
        }

        // Refresh the inquiries list
        try {
            request.setAttribute("inquiries", inquiryService.getInquiriesForUser(loggedInUser.getUserId()));
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Failed to load inquiries: " + e.getMessage());
        }

        request.getRequestDispatcher("WEB-INF/view/citizen/submitInquiry.jsp").forward(request, response);
    }
}