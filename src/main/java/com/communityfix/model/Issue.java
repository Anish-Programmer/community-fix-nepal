package com.communityfix.model;

public class Issue {
    // attributes
    private int id;
    private int userId;
    private String category;
    private String description;
    private String imagePath;
    private String status;
    private String adminComment;

    // empty constructor
    public Issue() {}

    // parameterized constructor
    public Issue(int id, int userId, String category, String description, String imagePath, String status, String adminComment) {
        this.id = id;
        this.userId = userId;
        this.category = category;
        this.description = description;
        this.imagePath = imagePath;
        this.status = status;
        this.adminComment = adminComment;
    }

    // convience constructor
    public Issue(int userId, String category, String description, String imagePath, String status, String adminComment) {
        this.userId = userId;
        this.category = category;
        this.description = description;
        this.imagePath = imagePath;
        this.status = status;
        this.adminComment = adminComment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAdminComment() {
        return adminComment;
    }

    public void setAdminComment(String adminComment) {
        this.adminComment = adminComment;
    }
}
