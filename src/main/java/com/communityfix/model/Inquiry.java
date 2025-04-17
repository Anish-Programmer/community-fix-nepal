package com.communityfix.model;

import java.time.LocalDateTime;

public class Inquiry {
    private int inquiryId;
    private String inquiryName;
    private String message;
    private LocalDateTime submittedAt;
    private int userId;

    public Inquiry() {
        this.submittedAt = LocalDateTime.now();
    }

    public Inquiry(int inquiryId, String inquiryName, String message, LocalDateTime submittedAt, int userId) {
        this.inquiryId = inquiryId;
        setInquiryName(inquiryName);
        setMessage(message);
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

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        if (message == null || message.trim().isEmpty()) {
            throw new IllegalArgumentException("Message cannot be empty");
        }
        this.message = message;
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