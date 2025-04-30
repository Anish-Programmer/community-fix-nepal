package com.communityfix.service;

import com.communityfix.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class IssueService {

    public static class Issue {
        private final int issueId;
        private final int userId;
        private final int categoryId;
        private final String categoryName;
        private final String description;
        private final String imagePath;
        private final String status;
        private final String comment;

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
    }

    public List<Issue> getAllIssues() throws SQLException {
        List<Issue> issues = new ArrayList<>();
        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "SELECT i.issue_id, i.user_id, i.category_id, c.category_name, i.description, i.image_path, i.status, i.comment " +
                    "FROM issues i JOIN categories c ON i.category_id = c.category_id";
            try (PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    issues.add(new Issue(
                            rs.getInt("issue_id"),
                            rs.getInt("user_id"),
                            rs.getInt("category_id"),
                            rs.getString("category_name"),
                            rs.getString("description"),
                            rs.getString("image_path"),
                            rs.getString("status"),
                            rs.getString("comment")
                    ));
                }
            }
        }
        return issues;
    }

    public Map<String, Integer> getSummaryStats() throws SQLException {
        Map<String, Integer> stats = new HashMap<>();
        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "SELECT " +
                    "COUNT(*) AS total_issues, " +
                    "SUM(CASE WHEN status = 'Resolved' THEN 1 ELSE 0 END) AS resolved_issues, " +
                    "SUM(CASE WHEN status = 'Pending' THEN 1 ELSE 0 END) AS pending_issues, " +
                    "SUM(CASE WHEN status = 'In Progress' THEN 1 ELSE 0 END) AS in_progress_issues " +
                    "FROM issues";
            try (PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    stats.put("totalIssues", rs.getInt("total_issues"));
                    stats.put("resolvedIssues", rs.getInt("resolved_issues"));
                    stats.put("pendingIssues", rs.getInt("pending_issues"));
                    stats.put("inProgressIssues", rs.getInt("in_progress_issues"));
                }
            }
        }
        return stats;
    }

    public List<Map<String, Object>> getIssuesByCategory() throws SQLException {
        List<Map<String, Object>> categoryStats = new ArrayList<>();
        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "SELECT c.category_name AS category, " +
                    "COUNT(*) AS reported, " +
                    "SUM(CASE WHEN i.status = 'Resolved' THEN 1 ELSE 0 END) AS resolved, " +
                    "SUM(CASE WHEN i.status = 'Pending' THEN 1 ELSE 0 END) AS pending " +
                    "FROM issues i " +
                    "JOIN categories c ON i.category_id = c.category_id " +
                    "GROUP BY c.category_id, c.category_name";
            try (PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> stats = new HashMap<>();
                    stats.put("category", rs.getString("category"));
                    stats.put("reported", rs.getInt("reported"));
                    stats.put("resolved", rs.getInt("resolved"));
                    stats.put("pending", rs.getInt("pending"));
                    categoryStats.add(stats);
                }
            }
        }
        return categoryStats;
    }
}