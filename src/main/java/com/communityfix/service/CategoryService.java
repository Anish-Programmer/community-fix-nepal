package com.communityfix.service;

import com.communityfix.dao.CategoryDAO;
import com.communityfix.model.Category;

import java.sql.SQLException;
import java.util.List;

public class CategoryService {
    private final CategoryDAO categoryDAO = new CategoryDAO();

    public List<Category> getAllCategories() throws SQLException {
        return categoryDAO.getAllCategories();
    }

    public void addCategory(String name, String description) throws SQLException {
        if (name == null || name.trim().isEmpty()) {
            throw new IllegalArgumentException("Category name is required.");
        }
        Category category = new Category();
        category.setCategoryName(name.trim());
        category.setDescription(description != null ? description.trim() : null);
        categoryDAO.addCategory(category);
    }

    public void deleteCategory(int categoryId) throws SQLException {
        categoryDAO.deleteCategory(categoryId);
    }
}