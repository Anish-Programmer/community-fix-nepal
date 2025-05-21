package com.communityfix.service;

import com.communityfix.dao.InquiryDAO;
import com.communityfix.model.Inquiry;

import java.sql.SQLException;
import java.util.List;

public class InquiryService {
    private final InquiryDAO inquiryDAO;

    public InquiryService() {
        this.inquiryDAO = new InquiryDAO();
    }

    // Submit a new inquiry
    public void submitInquiry(String inquiryName, String inquiryMessage, int userId) throws SQLException {
        Inquiry inquiry = new Inquiry();
        inquiry.setInquiryName(inquiryName); // Triggers validation
        inquiry.setInquiryMessage(inquiryMessage); // Triggers validation
        inquiry.setUserId(userId);
        inquiryDAO.saveInquiry(inquiry);
    }

    // Retrieve inquiries for a specific user
    public List<Inquiry> getInquiriesForUser(int userId) throws SQLException {
        if (userId <= 0) {
            throw new IllegalArgumentException("User ID must be positive");
        }
        return inquiryDAO.getInquiriesByUserId(userId);
    }
}