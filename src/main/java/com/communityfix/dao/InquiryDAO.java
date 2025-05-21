package com.communityfix.dao;

import com.communityfix.model.Inquiry;
import com.communityfix.util.DatabaseUtil;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import java.util.logging.Level;

public class InquiryDAO {
    private static final Logger LOGGER = Logger.getLogger(InquiryDAO.class.getName());
    private static final String INSERT_INQUIRY_SQL = "INSERT INTO inquiry (inquiry_name, inquiry_message, user_id) VALUES (?, ?, ?)"; // Fixed table name
    private static final String SELECT_INQUIRIES_BY_USER_SQL = "SELECT * FROM inquiry WHERE user_id = ? ORDER BY inquiry_submitted_at DESC"; // Fixed table name
    private static final String DELETE_INQUIRY_SQL = "DELETE FROM inquiry WHERE inquiry_id = ?"; // Fixed table name
    private static final String SELECT_ALL_INQUIRIES_SQL = "SELECT * FROM inquiry ORDER BY inquiry_submitted_at DESC"; // New method

    // Save a new inquiry to the database
    public void saveInquiry(Inquiry inquiry) throws SQLException {
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INQUIRY_SQL, Statement.RETURN_GENERATED_KEYS)) {

            preparedStatement.setString(1, inquiry.getInquiryName());
            preparedStatement.setString(2, inquiry.getInquiryMessage());
            preparedStatement.setInt(3, inquiry.getUserId());

            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating inquiry failed, no rows affected.");
            }

            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    inquiry.setInquiryId(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Creating inquiry failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error while creating inquiry", e);
            throw e;
        }
    }

    // Retrieve all inquiries for a specific user
    public List<Inquiry> getInquiriesByUserId(int userId) throws SQLException {
        List<Inquiry> inquiries = new ArrayList<>();
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_INQUIRIES_BY_USER_SQL)) {

            preparedStatement.setInt(1, userId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Inquiry inquiry = new Inquiry();
                    inquiry.setInquiryId(resultSet.getInt("inquiry_id"));
                    inquiry.setInquiryName(resultSet.getString("inquiry_name"));
                    inquiry.setInquiryMessage(resultSet.getString("inquiry_message"));
                    inquiry.setSubmittedAt(resultSet.getTimestamp("inquiry_submitted_at").toLocalDateTime());
                    inquiry.setUserId(resultSet.getInt("user_id"));
                    inquiries.add(inquiry);
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error while fetching inquiries", e);
            throw e;
        }
        return inquiries;
    }

    // Delete an inquiry by inquiryId
    public void deleteInquiry(int inquiryId) throws SQLException {
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_INQUIRY_SQL)) {

            preparedStatement.setInt(1, inquiryId);
            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Deleting inquiry failed, no rows affected.");
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error while deleting inquiry with ID: " + inquiryId, e);
            throw e;
        }
    }

    // Retrieve all inquiries
    public List<Inquiry> getAllInquiries() throws SQLException {
        List<Inquiry> inquiries = new ArrayList<>();
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_INQUIRIES_SQL);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Inquiry inquiry = new Inquiry();
                inquiry.setInquiryId(resultSet.getInt("inquiry_id"));
                inquiry.setInquiryName(resultSet.getString("inquiry_name"));
                inquiry.setInquiryMessage(resultSet.getString("inquiry_message"));
                inquiry.setSubmittedAt(resultSet.getTimestamp("inquiry_submitted_at").toLocalDateTime());
                inquiry.setUserId(resultSet.getInt("user_id"));
                inquiries.add(inquiry);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error while fetching all inquiries", e);
            throw e;
        }
        return inquiries;
    }
}