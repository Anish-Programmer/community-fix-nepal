<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.communityfix.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard - CommunityFix Nepal</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
<header class="header">
    <div class="header-container">
        <div class="logo">
            <img src="${pageContext.request.contextPath}/assets/images/logo.jpeg" alt="CommunityFix Nepal Logo">
            <span class="logo-text">Community Fix Nepal</span>
        </div>
        <nav class="nav-menu">
            <a href="${pageContext.request.contextPath}/" class="nav-link">Home</a>
            <a href="${pageContext.request.contextPath}/about" class="nav-link">About</a>
            <a href="${pageContext.request.contextPath}/contact" class="nav-link">Contact</a>
        </nav>
        <div class="auth-buttons">
            <a href="${pageContext.request.contextPath}/profile" class="btn btn-outline">Profile</a>
            <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn btn-outline">Logout</a>
        </div>
        <button class="mobile-menu-btn">
            <i class="fas fa-bars"></i>
        </button>
    </div>
</header>

<section class="user-dashboard">
    <div class="container">
        <h1>User Dashboard</h1>
        <p>Welcome, <%= ((User) session.getAttribute("user")).getUsername() %> (Citizen)!</p>
        <div class="dashboard-options">
            <h2>Manage Profile</h2>
            <p>Update your personal information and account settings.</p>
            <a href="${pageContext.request.contextPath}/profile" class="btn btn-primary">Go to Profile</a>
        </div>
        <div class="dashboard-options">
            <h2>View Issues</h2>
            <p>Check the status of your reported issues.</p>
            <a href="${pageContext.request.contextPath}/ViewIssuesServlet" class="btn btn-primary">View Issues</a>
        </div>
        <div class="dashboard-options">
            <h2>Report a Community Issue</h2>
            <p>Submit details about issues in your community.</p>
            <a href="${pageContext.request.contextPath}/ReportIssueServlet" class="btn btn-primary">Report Issue</a>
        </div>
        <div class="dashboard-options">
            <h2>Search Issues</h2>
            <p>Find specific issues using keywords.</p>
            <a href="${pageContext.request.contextPath}/SearchIssuesServlet" class="btn btn-primary">Search Issues</a>
        </div>
    </div>
</section>

<footer class="footer">
    <div class="footer-container">
        <div class="footer-bottom">
            <p>© 2025 Community Fix Nepal. All Rights Reserved.</p>
        </div>
    </div>
</footer>
</body>
</html>