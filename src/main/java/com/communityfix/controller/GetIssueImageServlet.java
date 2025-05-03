package com.communityfix.controller;

import com.communityfix.model.Issue;
import com.communityfix.util.DatabaseUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Logger;
import java.util.logging.Level;

@WebServlet(name = "GetIssueImageServlet", value = "/GetIssueImageServlet")
public class GetIssueImageServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(GetIssueImageServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int issueId;
        try {
            issueId = Integer.parseInt(request.getParameter("issueId"));
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid issue ID");
            return;
        }

        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT image_data FROM issue WHERE issue_id = ?")) {
            preparedStatement.setInt(1, issueId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    byte[] imageData = resultSet.getBytes("image_data");
                    if (imageData != null && imageData.length > 0) {
                        response.setContentType("image/jpeg"); // Adjust MIME type as needed
                        response.getOutputStream().write(imageData);
                    } else {
                        response.sendError(HttpServletResponse.SC_NOT_FOUND, "No image found for issue ID: " + issueId);
                    }
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Issue not found for ID: " + issueId);
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching image for issue ID: " + issueId, e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error while fetching image");
        }
    }
}