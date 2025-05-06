<%--
  Created by IntelliJ IDEA.
  User: Anish
  Date: 4/30/2025
  Time: 8:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.communityfix.model.User" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.communityfix.service.IssueService" %>
<%
    User loggedInUser = (User) session.getAttribute("user");
    if (loggedInUser == null || loggedInUser.getRole() != User.Role.ADMIN) {
        response.sendRedirect("LoginServlet");
        return;
    }

    // Retrieve report data set by ViewReportServlet
    Map<String, Integer> summaryStats = (Map<String, Integer>) request.getAttribute("summaryStats");
    List<Map<String, Object>> issuesByCategory = (List<Map<String, Object>>) request.getAttribute("issuesByCategory");

    // Default values if data is not set
    if (summaryStats == null) {
        summaryStats = Map.of(
                "totalIssues", 0,
                "resolvedIssues", 0,
                "pendingIssues", 0,
                "inProgressIssues", 0
        );
    }
    if (issuesByCategory == null) {
        issuesByCategory = new ArrayList<>();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Reports - CommunityFix Nepal</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/viewReport.css">
</head>
<body>
<div class="dashboard-container">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="logo">CommunityFix Nepal</div>
        <nav>
            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/AdminDashboardServlet" class="nav-link">
                        <i class="fas fa-tools"></i> Manage Issues
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/ManageUserServlet" class="nav-link">
                        <i class="fas fa-users"></i> Manage Users
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/ManageCategoriesServlet" class="nav-link">
                        <i class="fas fa-tags"></i> Manage Categories
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/ViewReportServlet" class="nav-link active">
                        <i class="fas fa-chart-bar"></i> View Reports
                    </a>
                </li>
            </ul>
        </nav>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header">
            <h2>Reports & Statistics</h2>
            <div class="user-info">
                <span>Welcome, <%= loggedInUser.getUsername() %> (<%= loggedInUser.getRole() %>)</span>
                <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn btn-outline btn-sm">Logout</a>
            </div>
        </div>

        <% if (request.getAttribute("message") != null) { %>
        <div class="alert alert-success"><%= request.getAttribute("message") %></div>
        <% } %>
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-error"><%= request.getAttribute("error") %></div>
        <% } %>

        <!-- Summary Cards -->
        <div class="report-cards">
            <div class="report-card">
                <h3>Total Issues Reported</h3>
                <p class="report-value"><%= summaryStats.get("totalIssues") %></p>
            </div>
            <div class="report-card">
                <h3>Resolved Issues</h3>
                <p class="report-value"><%= summaryStats.get("resolvedIssues") %></p>
            </div>
            <div class="report-card">
                <h3>Pending Issues</h3>
                <p class="report-value"><%= summaryStats.get("pendingIssues") %></p>
            </div>
            <div class="report-card">
                <h3>In Progress</h3>
                <p class="report-value"><%= summaryStats.get("inProgressIssues") %></p>
            </div>
        </div>

        <!-- Issues by Category Table -->
        <h3>Issues by Category</h3>
        <table class="issue-table">
            <thead>
            <tr>
                <th>Category</th>
                <th>Reported</th>
                <th>Resolved</th>
                <th>Pending</th>
            </tr>
            </thead>
            <tbody>
            <%
                if (issuesByCategory != null && !issuesByCategory.isEmpty()) {
                    for (Map<String, Object> categoryStats : issuesByCategory) {
            %>
            <tr>
                <td><%= categoryStats.get("category") %></td>
                <td><%= categoryStats.get("reported") != null ? categoryStats.get("reported") : 0 %></td>
                <td><%= categoryStats.get("resolved") != null ? categoryStats.get("resolved") : 0 %></td>
                <td><%= categoryStats.get("pending") != null ? categoryStats.get("pending") : 0 %></td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="4">No data available.</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>

        <!-- Chart Placeholder -->
        <h3>Status Breakdown (Chart)</h3>
        <div class="chart-container">
            <img src="${pageContext.request.contextPath}/assets/images/chart-placeholder.png" alt="Chart showing status breakdown" class="chart-img"/>
        </div>

        <!-- Footer -->
        <div class="footer">
            <a href="${pageContext.request.contextPath}/AdminDashboardServlet">Back to Admin Dashboard</a>
            <a href="${pageContext.request.contextPath}/AboutServlet">About</a>
            <a href="${pageContext.request.contextPath}/ContactServlet">Contact</a>
            <a href="${pageContext.request.contextPath}/LogoutServlet">Logout</a>
        </div>
    </div>
</div>
</body>
</html>