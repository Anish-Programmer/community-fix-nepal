package com.communityfix.model;

public class Category {
    private int categoryId;
    private String categoryName;

    public Category() {}

    public Category(int categoryId, String categoryName) {
        this.categoryId = categoryId;
        setCategoryName(categoryName);
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        if (categoryName == null || categoryName.trim().isEmpty() || categoryName.length() > 50) {
            throw new IllegalArgumentException("Category name must be 1-50 characters");
        }
        this.categoryName = categoryName;
    }
}