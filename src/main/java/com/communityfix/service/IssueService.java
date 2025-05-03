package com.communityfix.service;

import com.communityfix.dao.IssueDAO;
import com.communityfix.model.Issue;
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
    private final IssueDAO issueDAO = new IssueDAO();

    public void createIssue(Issue issue) throws SQLException {
        issueDAO.createIssue(issue);
    }

    public List<Issue> getAllIssues() throws SQLException {
        return issueDAO.getAllIssues();
    }

    public List<Issue> getIssuesByUserId(int userId) throws SQLException {
        List<Issue> issues = new ArrayList<>();
        String sql = "SELECT i.issue_id, i.user_id, i.category_id, c.category_name, i.issue_description, i.image_data, i.issue_status, i.issue_admin_comment " +
                "FROM issue i " +
                "JOIN category c ON i.category_id = c.category_id " +
                "WHERE i.user_id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Issue issue = new Issue();
                    issue.setIssueId(rs.getInt("issue_id"));
                    issue.setUserId(rs.getInt("user_id"));
                    issue.setCategoryId(rs.getInt("category_id"));
                    issue.setCategoryName(rs.getString("category_name"));
                    issue.setIssueDescription(rs.getString("issue_description"));
                    issue.setImageData(rs.getBytes("image_data"));
                    issue.setIssueStatus(rs.getString("issue_status"));
                    issue.setIssueAdminComment(rs.getString("issue_admin_comment"));
                    issues.add(issue);
                }
            }
        }
        return issues;
    }

    public List<Issue> searchIssuesByKeyword(int userId, String keyword) throws SQLException {
        List<Issue> issues = new ArrayList<>();
        String sql = "SELECT i.issue_id, i.user_id, i.category_id, c.category_name, i.issue_description, i.image_data, i.issue_status, i.issue_admin_comment " +
                "FROM issue i " +
                "JOIN category c ON i.category_id = c.category_id " +
                "WHERE i.user_id = ? AND (i.issue_description LIKE ? OR c.category_name LIKE ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setString(2, "%" + keyword + "%");
            stmt.setString(3, "%" + keyword + "%");
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Issue issue = new Issue();
                    issue.setIssueId(rs.getInt("issue_id"));
                    issue.setUserId(rs.getInt("user_id"));
                    issue.setCategoryId(rs.getInt("category_id"));
                    issue.setCategoryName(rs.getString("category_name"));
                    issue.setIssueDescription(rs.getString("issue_description"));
                    issue.setImageData(rs.getBytes("image_data"));
                    issue.setIssueStatus(rs.getString("issue_status"));
                    issue.setIssueAdminComment(rs.getString("issue_admin_comment"));
                    issues.add(issue);
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
                    "SUM(CASE WHEN issue_status = 'Resolved' THEN 1 ELSE 0 END) AS resolved_issues, " +
                    "SUM(CASE WHEN issue_status = 'Pending' THEN 1 ELSE 0 END) AS pending_issues, " +
                    "SUM(CASE WHEN issue_status = 'In Progress' THEN 1 ELSE 0 END) AS in_progress_issues " +
                    "FROM issue";
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
                    "SUM(CASE WHEN i.issue_status = 'Resolved' THEN 1 ELSE 0 END) AS resolved, " +
                    "SUM(CASE WHEN i.issue_status = 'Pending' THEN 1 ELSE 0 END) AS pending " +
                    "FROM issue i " +
                    "JOIN category c ON i.category_id = c.category_id " +
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