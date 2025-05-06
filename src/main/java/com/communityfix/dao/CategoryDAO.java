package com.communityfix.dao;

import com.communityfix.model.Category;
import com.communityfix.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import java.util.logging.Level;

public class CategoryDAO {
    private static final Logger LOGGER = Logger.getLogger(CategoryDAO.class.getName());

    public List<Category> getAllCategories() throws SQLException {
        List<Category> categories = new ArrayList<>();
        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "SELECT category_id, category_name, description FROM category";
            try (PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    categories.add(new Category(
                            rs.getInt("category_id"),
                            rs.getString("category_name"),
                            rs.getString("description")
                    ));
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error retrieving categories", e);
            throw new SQLException("Failed to retrieve categories: " + e.getMessage(), e);
        }
        return categories;
    }

    public void addCategory(Category category) throws SQLException {
        String sql = "INSERT INTO category (category_name, description) VALUES (?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, category.getCategoryName());
            stmt.setString(2, category.getDescription());
            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Failed to add category, no rows affected.");
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error adding category: " + category.getCategoryName(), e);
            throw new SQLException("Failed to add category: " + e.getMessage(), e);
        }
    }

    public void deleteCategory(int categoryId) throws SQLException {
        try (Connection conn = DatabaseUtil.getConnection()) {
            // Delete related issues first to avoid foreign key constraint violations
            String deleteIssuesSql = "DELETE FROM issue WHERE category_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(deleteIssuesSql)) {
                stmt.setInt(1, categoryId);
                stmt.executeUpdate();
            }

            // Delete the category
            String deleteCategorySql = "DELETE FROM category WHERE category_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(deleteCategorySql)) {
                stmt.setInt(1, categoryId);
                int affectedRows = stmt.executeUpdate();
                if (affectedRows == 0) {
                    throw new SQLException("No category found with ID: " + categoryId);
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error deleting category with ID: " + categoryId, e);
            throw new SQLException("Failed to delete category: " + e.getMessage(), e);
        }
    }
}