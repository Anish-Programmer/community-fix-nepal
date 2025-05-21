<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.communityfix.model.User" %>
<%@ page import="com.communityfix.model.Issue" %>
<%@ page import="java.util.List" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || user.getRole() != User.Role.ADMIN) {
        response.sendRedirect("LoginServlet");
        return;
    }
    String username = user.getUsername();

    List<Issue> issues = (List<Issue>) request.getAttribute("issues");
    if (issues == null) {
        response.sendRedirect("ManageIssueServlet");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Issues - CommunityFix Nepal</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/adminDashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/manageIssues.css">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .update-btn:hover {
            background-color: #E5941A !important;
        }
    </style>
</head>
<body>
<div class="dashboard-container">
    <div class="sidebar">
        <div class="logo">COMMUNITY FIX NEPAL</div>
        <nav>
            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/ManageIssueServlet" class="nav-link active">
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
                    <a href="${pageContext.request.contextPath}/ManageInquiryServlet" class="nav-link">
                        <i class="fas fa-question-circle"></i> Manage Inquiries
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/ViewReportServlet" class="nav-link">
                        <i class="fas fa-chart-bar"></i> View Reports
                    </a>
                </li>
            </ul>
        </nav>
    </div>
    <div class="main-content">
        <div class="header">
            <h2>Manage All Issues</h2>
            <div class="user-info">
                <span>Welcome, <%= username %> (Admin)</span>
                <a href="${pageContext.request.contextPath}/LogoutServlet" class="logout-btn">Logout</a>
            </div>
        </div>
        <% if (request.getAttribute("message") != null) { %>
        <div class="alert alert-success"><%= request.getAttribute("message") %></div>
        <% } %>
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-error"><%= request.getAttribute("error") %></div>
        <% } %>

        <div class="content-grid">
            <div>
                <h3>Existing Issues</h3>
                <table class="issue-table">
                    <thead>
                    <tr>
                        <th>Category</th>
                        <th>Citizen ID</th>
                        <th>Description</th>
                        <th>Image</th>
                        <th>Status</th>
                        <th>Comment</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (Issue issue : issues) { %>
                    <tr>
                        <td><%= issue.getCategoryName() != null ? issue.getCategoryName() : "Unknown" %></td>
                        <td><%= issue.getUserId()%></td>
                        <td><%= issue.getIssueDescription() %></td>
                        <td>
                            <% if (issue.getImageData() != null) { %>
<%--                            <img style="width: fit-content()" src="${pageContext.request.contextPath}/images/<%= issue.getIssueId() %>" alt="Issue Image" class="thumbnail">--%>
                            <img style="max-width: 150px; max-height: 150px; width: auto; height: auto; object-fit: cover; border-radius: 6px;"
                                 src="${pageContext.request.contextPath}/images/<%= issue.getIssueId() %>"
                                 alt="Issue Image" class="thumbnail">
                            <% } else { %>
                            <span>No Image</span>
                            <% } %>
                        </td>
                        <td>
                            <form action="${pageContext.request.contextPath}/ManageIssueServlet" method="post">
                                <input type="hidden" name="issueId" value="<%= issue.getIssueId() %>">
                                <select name="status" class="status-select">
                                    <option value="pending" <%= "pending".equals(issue.getIssueStatus()) ? "selected" : "" %>>Pending</option>
                                    <option value="in_progress" <%= "in_progress".equals(issue.getIssueStatus()) ? "selected" : "" %>>In Progress</option>
                                    <option value="resolved" <%= "resolved".equals(issue.getIssueStatus()) ? "selected" : "" %>>Resolved</option>
                                </select>
                        </td>
                        <td>
                            <input type="text" name="comment" value="<%= issue.getIssueAdminComment() != null ? issue.getIssueAdminComment() : "" %>" placeholder="Add comment">
                        </td>
                        <td class="action-buttons">
                            <button type="submit" class="btn btn-outline update-btn" style="background-color: #F5A623; color: white; border: none; border-radius: 4px; padding: 10px 20px; font-weight: 500; cursor: pointer;">Update</button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>

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