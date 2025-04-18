<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.communityfix.model.User" %>
<%@ page session="true" %>
<%
    // Get the logged-in user from the session
    User user = (User) session.getAttribute("user");
    String username = (user != null) ? user.getFullName() : "Admin";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - CommunityFix Nepal</title>

    <!-- Stylesheets with context path -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminDashboard.css">

    <!-- Fonts and Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<div class="dashboard-container">

    <!-- Sidebar Navigation -->
    <div class="sidebar">
        <div class="logo">COMMUNITY FIX NEPAL</div>
        <nav>
            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/dashboard.jsp" class="nav-link active">
                        <i class="fa fa-wrench"></i> Manage Issues
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/manageUsers.jsp" class="nav-link">
                        <i class="fa fa-users"></i> Manage Users
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/manageCategories.jsp" class="nav-link">
                        <i class="fa fa-tags"></i> Manage Categories
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/report.jsp" class="nav-link">
                        <i class="fa fa-chart-bar"></i> View Reports
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/userPortal.jsp" class="nav-link">
                        <i class="fa fa-home"></i> User Portal
                    </a>
                </li>
            </ul>
        </nav>
    </div>

    <!-- Main Content Area -->
    <div class="main-content">
        <div class="header">
            <h2>Manage All Issues</h2>
            <div class="user-info">
                <span>Welcome, <%= username %></span>
                <a href="${pageContext.request.contextPath}/login.jsp?logout=true" class="btn btn-outline btn-sm">Logout</a>
            </div>
        </div>

        <!-- Success Message (can be shown conditionally) -->
        <div class="alert alert-success" style="display: none;">
            Issue updated successfully.
        </div>

        <!-- Issue Management Table -->
        <table class="issue-table">
            <thead>
            <tr>
                <th>Category</th>
                <th>Description</th>
                <th>Image</th>
                <th>Status</th>
                <th>Comment</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <!-- Example row, replace with dynamic iteration -->
            <tr>
                <td>Road</td>
                <td>Pothole on street</td>
                <td>
                    <img src="${pageContext.request.contextPath}/Images/Thumbnail.jpeg" alt="Issue Image" class="thumbnail">
                </td>
                <td>
                    <form action="${pageContext.request.contextPath}/update" method="post">
                        <input type="hidden" name="issueId" value="1">
                        <select name="status" class="status-select">
                            <option value="Pending" selected>Pending</option>
                            <option value="In Progress">In Progress</option>
                            <option value="Resolved">Resolved</option>
                        </select>
                </td>
                <td>
                    <input type="text" name="comment" value="Will fix soon" placeholder="Add comment">
                </td>
                <td class="action-buttons">
                    <button type="submit" class="btn btn-primary btn-sm">Update</button>
                    </form>
                    <form action="${pageContext.request.contextPath}/delete" method="post" onsubmit="return confirm('Are you sure you want to delete this issue?');">
                        <input type="hidden" name="issueId" value="1">
                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                    </form>
                </td>
            </tr>
            <!-- End row -->
            </tbody>
        </table>

        <!-- Footer Links -->
        <div class="footer">
            <a href="${pageContext.request.contextPath}/about.jsp">About</a>
            <a href="${pageContext.request.contextPath}/contact.jsp">Contact</a>
            <a href="${pageContext.request.contextPath}/login.jsp?logout=true">Logout</a>
        </div>
    </div>
</div>

</body>
</html>
