package com.communityfix.dao;

import com.communityfix.model.Issue;
import com.communityfix.service.IssueService;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;
import java.util.logging.Level;

public class ViewReportDAO {
    private static final Logger LOGGER = Logger.getLogger(ViewReportDAO.class.getName());
    private final IssueService issueService = new IssueService();

    public Map<String, Integer> getSummaryStats() throws SQLException {
        Map<String, Integer> stats = new HashMap<>();
        try {
            List<Issue> issues = issueService.getAllIssues();
            int totalIssues = issues.size();
            int resolvedIssues = (int) issues.stream().filter(i -> "resolved".equalsIgnoreCase(i.getIssueStatus())).count();
            int pendingIssues = (int) issues.stream().filter(i -> "pending".equalsIgnoreCase(i.getIssueStatus())).count();
            int inProgressIssues = (int) issues.stream().filter(i -> "in_progress".equalsIgnoreCase(i.getIssueStatus())).count();

            stats.put("totalIssues", totalIssues);
            stats.put("resolvedIssues", resolvedIssues);
            stats.put("pendingIssues", pendingIssues);
            stats.put("inProgressIssues", inProgressIssues);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error retrieving summary stats", e);
            throw new SQLException("Failed to retrieve summary stats: " + e.getMessage(), e);
        }
        return stats;
    }

    public List<Map<String, Object>> getIssuesByCategory() throws SQLException {
        List<Map<String, Object>> categoryStats = new java.util.ArrayList<>();
        try {
            List<Issue> issues = issueService.getAllIssues();
            // Group by category (assuming category_id is linked via Issue model)
            java.util.Map<Integer, Map<String, Integer>> categoryMap = new java.util.HashMap<>();
            for (Issue issue : issues) {
                int categoryId = issue.getCategoryId(); // Adjust based on your Issue model
                categoryMap.computeIfAbsent(categoryId, k -> new java.util.HashMap<>())
                        .merge("reported", 1, Integer::sum);
                categoryMap.get(categoryId).merge("resolved", "resolved".equalsIgnoreCase(issue.getIssueStatus()) ? 1 : 0, Integer::sum);
                categoryMap.get(categoryId).merge("pending", "pending".equalsIgnoreCase(issue.getIssueStatus()) ? 1 : 0, Integer::sum);
            }

            // Fetch category names (assuming CategoryDAO exists)
            com.communityfix.dao.CategoryDAO categoryDAO = new com.communityfix.dao.CategoryDAO();
            java.util.List<com.communityfix.model.Category> categories = categoryDAO.getAllCategories();
            for (com.communityfix.model.Category category : categories) {
                Map<String, Object> stats = new java.util.HashMap<>();
                stats.put("category", category.getCategoryName());
                Map<String, Integer> counts = categoryMap.getOrDefault(category.getCategoryId(), new java.util.HashMap<>());
                stats.put("reported", counts.getOrDefault("reported", 0));
                stats.put("resolved", counts.getOrDefault("resolved", 0));
                stats.put("pending", counts.getOrDefault("pending", 0));
                categoryStats.add(stats);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error retrieving issues by category", e);
            throw new SQLException("Failed to retrieve issues by category: " + e.getMessage(), e);
        }
        return categoryStats;
    }
}