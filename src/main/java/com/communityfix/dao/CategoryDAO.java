package com.communityfix.dao;

import com.communityfix.model.Category;
import com.communityfix.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {

    public List<Category> getAllCategories() throws SQLException {
        List<Category> categories = new ArrayList<>();
        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "SELECT category_id, category_name FROM category";
            try (PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    categories.add(new Category(
                            rs.getInt("category_id"),
                            rs.getString("category_name")
                    ));
                }
            }
        }
        return categories;
    }
}