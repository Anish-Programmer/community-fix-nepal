package com.communityfix.service;

import com.communityfix.dao.ViewReportDAO;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class ViewReportService {
    private final ViewReportDAO viewReportDAO = new ViewReportDAO();

    public Map<String, Integer> getSummaryStats() throws SQLException {
        return viewReportDAO.getSummaryStats();
    }

    public List<Map<String, Object>> getIssuesByCategory() throws SQLException {
        return viewReportDAO.getIssuesByCategory();
    }
}