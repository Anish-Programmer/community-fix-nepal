package com.communityfix.dao;

import com.communityfix.model.Issue;
import com.communityfix.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class IssueDAO {

    public void createIssue(Issue issue) throws SQLException {
        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "INSERT INTO issue (user_id, category_id, description, image_path, status, comment) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, issue.getUserId());
                stmt.setInt(2, issue.getCategoryId());
                stmt.setString(3, issue.getDescription());
                stmt.setString(4, issue.getImagePath());
                stmt.setString(5, issue.getStatus());
                stmt.setString(6, issue.getComment());
                stmt.executeUpdate();
            }
        }
    }

    public Issue getIssueById(int issueId) throws SQLException {
        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "SELECT i.issue_id, i.user_id, i.category_id, c.category_name, i.description, i.image_path, i.status, i.comment " +
                    "FROM issue i JOIN categories c ON i.category_id = c.category_id " +
                    "WHERE i.issue_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, issueId);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        return new Issue(
                                rs.getInt("issue_id"),
                                rs.getInt("user_id"),
                                rs.getInt("category_id"),
                                rs.getString("category_name"),
                                rs.getString("description"),
                                rs.getString("image_path"),
                                rs.getString("status"),
                                rs.getString("comment")
                        );
                    }
                }
            }
        }
        return null;
    }

    public List<Issue> getAllIssues() throws SQLException {
        List<Issue> issues = new ArrayList<>();
        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "SELECT i.issue_id, i.user_id, i.category_id, c.category_name, i.description, i.image_path, i.status, i.comment " +
                    "FROM issue i JOIN categories c ON i.category_id = c.category_id";
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

    public List<Issue> getIssuesByUserId(int userId) throws SQLException {
        List<Issue> issues = new ArrayList<>();
        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "SELECT i.issue_id, i.user_id, i.category_id, c.category_name, i.description, i.image_path, i.status, i.comment " +
                    "FROM issue i JOIN categories c ON i.category_id = c.category_id " +
                    "WHERE i.user_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, userId);
                try (ResultSet rs = stmt.executeQuery()) {
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
        }
        return issues;
    }

    public List<Issue> getIssuesByCategoryId(int categoryId) throws SQLException {
        List<Issue> issues = new ArrayList<>();
        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "SELECT i.issue_id, i.user_id, i.category_id, c.category_name, i.description, i.image_path, i.status, i.comment " +
                    "FROM issue i JOIN categories c ON i.category_id = c.category_id " +
                    "WHERE i.category_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, categoryId);
                try (ResultSet rs = stmt.executeQuery()) {
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
        }
        return issues;
    }

    public void updateIssue(Issue issue) throws SQLException {
        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "UPDATE issue SET description = ?, image_path = ?, status = ?, comment = ? WHERE issue_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, issue.getDescription());
                stmt.setString(2, issue.getImagePath());
                stmt.setString(3, issue.getStatus());
                stmt.setString(4, issue.getComment());
                stmt.setInt(5, issue.getIssueId());
                int rowsUpdated = stmt.executeUpdate();
                if (rowsUpdated == 0) {
                    throw new SQLException("No issue found with issue_id: " + issue.getIssueId());
                }
            }
        }
    }

    public void deleteIssue(int issueId) throws SQLException {
        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "DELETE FROM issue WHERE issue_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, issueId);
                int rowsDeleted = stmt.executeUpdate();
                if (rowsDeleted == 0) {
                    throw new SQLException("No issue found with issue_id: " + issueId);
                }
            }
        }
    }
}