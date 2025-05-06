package com.communityfix.dao;

import com.communityfix.model.Issue;
import com.communityfix.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import java.util.logging.Level;

public class IssueDAO {
    private static final Logger LOGGER = Logger.getLogger(IssueDAO.class.getName());
    private static final String INSERT_ISSUE_SQL = "INSERT INTO issue (user_id, category_id, issue_description, image_data, issue_status, issue_admin_comment) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SELECT_ALL_ISSUES_SQL = "SELECT issue_id, user_id, category_id, issue_description, image_data, issue_status, issue_admin_comment FROM issue";
    private static final String UPDATE_ISSUE_SQL = "UPDATE issue SET issue_status = ?, issue_admin_comment = ? WHERE issue_id = ?";

    public int createIssue(Issue issue) throws SQLException {
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ISSUE_SQL, new String[]{"issue_id"})) {

            preparedStatement.setInt(1, issue.getUserId());
            preparedStatement.setInt(2, issue.getCategoryId());
            preparedStatement.setString(3, issue.getIssueDescription());
            preparedStatement.setBytes(4, issue.getImageData());
            preparedStatement.setString(5, issue.getIssueStatus());
            preparedStatement.setString(6, issue.getIssueAdminComment());

            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating issue failed, no rows affected.");
            }

            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating issue failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error while creating issue", e);
            throw e;
        }
    }

    public List<Issue> getAllIssues() throws SQLException {
        List<Issue> issues = new ArrayList<>();
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ISSUES_SQL);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Issue issue = new Issue();
                issue.setIssueId(resultSet.getInt("issue_id"));
                issue.setUserId(resultSet.getInt("user_id"));
                issue.setCategoryId(resultSet.getInt("category_id"));
                issue.setIssueDescription(resultSet.getString("issue_description"));
                issue.setImageData(resultSet.getBytes("image_data"));
                issue.setIssueStatus(resultSet.getString("issue_status"));
                issue.setIssueAdminComment(resultSet.getString("issue_admin_comment"));
                issues.add(issue);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error while fetching all issues", e);
            throw e;
        }
        return issues;
    }

    public void deleteIssue(int issueId) throws SQLException {
        String sql = "DELETE FROM issue WHERE issue_id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, issueId);
            stmt.executeUpdate();
        }
    }

    public void updateIssueStatus(int issueId, String newStatus) throws SQLException {
        String sql = "UPDATE issue SET issue_status = ? WHERE issue_id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, newStatus);
            stmt.setInt(2, issueId);
            stmt.executeUpdate();
        }
    }

    public void updateIssue(int issueId, String newStatus, String adminComment) throws SQLException {
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(UPDATE_ISSUE_SQL)) {
            stmt.setString(1, newStatus);
            stmt.setString(2, adminComment);
            stmt.setInt(3, issueId);
            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Updating issue failed, no rows affected.");
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error while updating issue", e);
            throw e;
        }
    }
}