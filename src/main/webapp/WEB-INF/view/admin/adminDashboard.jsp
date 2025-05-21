<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.communityfix.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Portal - CommunityFix</title>
    <link href="${pageContext.request.contextPath}/assets/css/userPortal.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<div class="dashboard-container">
    <div class="sidebar">
        <div class="logo">CommunityFix Nepal</div>
        <nav>
            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/ManageIssueServlet" class="nav-link">
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
            <h2>Admin Dashboard</h2>
            <div class="user-info">
                <span>Welcome, <%= ((User) session.getAttribute("user")).getUsername() %> </span>
                <a href="${pageContext.request.contextPath}/LogoutServlet" class="logout-btn">Logout</a>
            </div>
        </div>

        <div class="portal-cards">
            <a href="${pageContext.request.contextPath}/ManageIssueServlet" class="portal-card">
                <div class="card-icon"><i class="fas fa-tools"></i></div>
                <h3 class="card-title">Manage Issues</h3>
                <p class="card-description">View and manage community-reported issues</p>
                <button class="btn btn-outline">Manage Issues</button>
            </a>

            <a href="${pageContext.request.contextPath}/ManageUserServlet" class="portal-card">
                <div class="card-icon"><i class="fas fa-users"></i></div>
                <h3 class="card-title">Manage Users</h3>
                <p class="card-description">Administer user accounts and permissions</p>
                <button class="btn btn-outline">MANAGE USERS</button>
            </a>

            <a href="${pageContext.request.contextPath}/ManageCategoriesServlet" class="portal-card">
                <div class="card-icon"><i class="fas fa-tags"></i></div>
                <h3 class="card-title">Manage Categories</h3>
                <p class="card-description">Organize issue categories for better tracking</p>
                <button class="btn btn-outline">Manage Categories</button>
            </a>

            <a href="${pageContext.request.contextPath}/ManageInquiryServlet" class="portal-card">
                <div class="card-icon"><i class="fas fa-question-circle"></i></div>
                <h3 class="card-title">Manage Inquries</h3>
                <p class="card-description">Manage all the citizen inquries</p>
                <button class="btn btn-outline">Manage Inquries </button>
            </a>

                <a href="${pageContext.request.contextPath}/ViewReportServlet" class="portal-card">
                    <div class="card-icon"><i class="fas fa-chart-bar"></i></div>
                    <h3 class="card-title">View Reports</h3>
                    <p class="card-description">Analyze system usage and issue statistics</p>
                    <button class="btn btn-outline">View Reports</button>
                </a>
        </div>

        <div class="footer">
            <a href="${pageContext.request.contextPath}/AboutServlet">About</a>
            <a href="${pageContext.request.contextPath}/ContactServlet">Contact</a>
            <a href="${pageContext.request.contextPath}/LogoutServlet">Logout</a>
        </div>
    </div>
</div>
</body>
</html>