package com.communityfix.model;

import java.time.LocalDateTime;

public class Inquiry {
    private int inquiryId;
    private String inquiryName;
    private String inquiryMessage; // Updated to match database column
    private LocalDateTime submittedAt;
    private int userId;

    public Inquiry() {
        this.submittedAt = LocalDateTime.now();
    }

    public Inquiry(int inquiryId, String inquiryName, String inquiryMessage, LocalDateTime submittedAt, int userId) {
        this.inquiryId = inquiryId;
        setInquiryName(inquiryName);
        setInquiryMessage(inquiryMessage);
        this.submittedAt = submittedAt != null ? submittedAt : LocalDateTime.now();
        this.userId = userId;
    }

    public int getInquiryId() {
        return inquiryId;
    }

    public void setInquiryId(int inquiryId) {
        this.inquiryId = inquiryId;
    }

    public String getInquiryName() {
        return inquiryName;
    }

    public void setInquiryName(String inquiryName) {
        if (inquiryName == null || inquiryName.trim().isEmpty() || inquiryName.length() > 100) {
            throw new IllegalArgumentException("Inquiry name must be 1-100 characters");
        }
        this.inquiryName = inquiryName;
    }

    public String getInquiryMessage() {
        return inquiryMessage;
    }

    public void setInquiryMessage(String inquiryMessage) {
        if (inquiryMessage == null || inquiryMessage.trim().isEmpty()) {
            throw new IllegalArgumentException("Inquiry message cannot be empty");
        }
        this.inquiryMessage = inquiryMessage;
    }

    public LocalDateTime getSubmittedAt() {
        return submittedAt;
    }

    public void setSubmittedAt(LocalDateTime submittedAt) {
        this.submittedAt = submittedAt != null ? submittedAt : LocalDateTime.now();
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}