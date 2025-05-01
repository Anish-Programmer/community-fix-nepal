//package com.communityfix.model;
//
//public class Issue {
//    private int issueId;
//    private String description;
//    private String imagePath;
//    private Status status;
//    private String adminComment;
//    private int userId;
//    private int categoryId;
//
//    public enum Status {
//        PENDING, IN_PROGRESS, RESOLVED
//    }
//
//    public Issue() {
//        this.status = Status.PENDING;
//    }
//
//    public Issue(int issueId, String description, String imagePath, Status status, String adminComment, int userId, int categoryId) {
//        this.issueId = issueId;
//        setDescription(description);
//        setImagePath(imagePath);
//        setStatus(status);
//        setAdminComment(adminComment);
//        this.userId = userId;
//        this.categoryId = categoryId;
//    }
//
//    public int getIssueId() {
//        return issueId;
//    }
//
//    public void setIssueId(int issueId) {
//        this.issueId = issueId;
//    }
//
//    public String getDescription() {
//        return description;
//    }
//
//    public void setDescription(String description) {
//        if (description == null || description.trim().isEmpty()) {
//            throw new IllegalArgumentException("Description cannot be empty");
//        }
//        this.description = description;
//    }
//
//    public String getImagePath() {
//        return imagePath;
//    }
//
//    public void setImagePath(String imagePath) {
//        this.imagePath = imagePath;
//    }
//
//    public Status getStatus() {
//        return status;
//    }
//
//    public void setStatus(Status status) {
//        this.status = (status != null) ? status : Status.PENDING;
//    }
//
//    public String getAdminComment() {
//        return adminComment;
//    }
//
//    public void setAdminComment(String adminComment) {
//        this.adminComment = adminComment;
//    }
//
//    public int getUserId() {
//        return userId;
//    }
//
//    public void setUserId(int userId) {
//        this.userId = userId;
//    }
//
//    public int getCategoryId() {
//        return categoryId;
//    }
//
//    public void setCategoryId(int categoryId) {
//        this.categoryId = categoryId;
//    }
//}



package com.communityfix.model;

public class Issue {
    private final int issueId;
    private final int userId;
    private final int categoryId;
    private final String categoryName;
    private final String description;
    private final String imagePath;
    private String status;
    private String comment;

    public Issue(int issueId, int userId, int categoryId, String categoryName, String description, String imagePath, String status, String comment) {
        this.issueId = issueId;
        this.userId = userId;
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.description = description;
        this.imagePath = imagePath;
        this.status = status;
        this.comment = comment;
    }

    public int getIssueId() { return issueId; }
    public int getUserId() { return userId; }
    public int getCategoryId() { return categoryId; }
    public String getCategoryName() { return categoryName; }
    public String getDescription() { return description; }
    public String getImagePath() { return imagePath; }
    public String getStatus() { return status; }
    public String getComment() { return comment; }

    public void setStatus(String status) {
        if (status == null || !status.matches("^(Pending|In Progress|Resolved)$")) {
            throw new IllegalArgumentException("Status must be one of: Pending, In Progress, Resolved");
        }
        this.status = status;
    }

    public void setComment(String comment) { this.comment = comment; }
}