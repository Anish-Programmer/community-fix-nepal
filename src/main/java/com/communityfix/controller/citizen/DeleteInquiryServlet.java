package com.communityfix.controller.citizen;

import com.communityfix.dao.InquiryDAO;
import com.communityfix.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DeleteInquiryServlet", value = "/DeleteInquiry")
public class DeleteInquiryServlet extends HttpServlet {
    private final InquiryDAO inquiryDAO;

    public DeleteInquiryServlet() {
        this.inquiryDAO = new InquiryDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User loggedInUser = (User) request.getSession().getAttribute("user");
        if (loggedInUser == null || loggedInUser.getRole() != User.Role.CITIZEN) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        try {
            int inquiryId = Integer.parseInt(request.getParameter("inquiryId"));
            inquiryDAO.deleteInquiry(inquiryId);
            request.setAttribute("successMessage", "Inquiry deleted successfully!");
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid inquiry ID.");
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Failed to delete inquiry: " + e.getMessage());
        }

        // Reload inquiries and forward back to the inquiry page
        try {
            request.setAttribute("inquiries", inquiryDAO.getInquiriesByUserId(loggedInUser.getUserId()));
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Failed to load inquiries: " + e.getMessage());
        }

        request.getRequestDispatcher("/WEB-INF/view/citizen/submitInquiry.jsp").forward(request, response);
    }
}