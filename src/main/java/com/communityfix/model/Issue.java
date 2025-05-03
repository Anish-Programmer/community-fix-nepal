package com.communityfix.model;

public class Issue {
    private int issueId;
    private int userId;
    private int categoryId;
    private String categoryName;
    private String issueDescription; // Aligned with issue_description
    private byte[] imageData;
    private String issueStatus; // Aligned with issue_status
    private String issueAdminComment; // Aligned with issue_admin_comment

    // Constructors
    public Issue() {}

    public Issue(int issueId, int userId, int categoryId, String categoryName, String issueDescription, byte[] imageData, String issueStatus, String issueAdminComment) {
        this.issueId = issueId;
        this.userId = userId;
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.issueDescription = issueDescription;
        this.imageData = imageData;
        this.issueStatus = issueStatus;
        this.issueAdminComment = issueAdminComment;
    }

    // Getters and Setters
    public int getIssueId() { return issueId; }
    public void setIssueId(int issueId) { this.issueId = issueId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getCategoryId() { return categoryId; }
    public void setCategoryId(int categoryId) { this.categoryId = categoryId; }

    public String getCategoryName() { return categoryName; }
    public void setCategoryName(String categoryName) { this.categoryName = categoryName; }

    public String getIssueDescription() { return issueDescription; }
    public void setIssueDescription(String issueDescription) { this.issueDescription = issueDescription; }

    public byte[] getImageData() { return imageData; }
    public void setImageData(byte[] imageData) { this.imageData = imageData; }

    public String getIssueStatus() { return issueStatus; }
    public void setIssueStatus(String issueStatus) { this.issueStatus = issueStatus; }

    public String getIssueAdminComment() { return issueAdminComment; }
    public void setIssueAdminComment(String issueAdminComment) { this.issueAdminComment = issueAdminComment; }
}