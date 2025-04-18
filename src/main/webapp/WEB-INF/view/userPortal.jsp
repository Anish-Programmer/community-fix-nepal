<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="your.package.User" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Portal - CommunityFix</title>
    <link href="${pageContext.request.contextPath}/userPortal.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<div class="dashboard-container">
    <div class="sidebar">
        <div class="logo">CommunityFix</div>
        <nav>
            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/profile.jsp" class="nav-link">
                        <i class="fas fa-users"></i> Manage Profile
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/dashboard.jsp" class="nav-link">
                        <i class="fas fa-eye"></i> View Issues
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/report.jsp" class="nav-link">
                        <i class="fas fa-pencil-alt"></i> Report New Issue
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/searchResults.jsp" class="nav-link">
                        <i class="fas fa-search"></i> Search Your Issues
                    </a>
                </li>
            </ul>
        </nav>
    </div>

    <div class="main-content">
        <div class="header">
            <h2>User Portal</h2>
            <div class="user-info">
                <span>Welcome, <%= username %> (Citizen)</span>
                <a href="${pageContext.request.contextPath}/login?logout=true" class="logout-btn">LOGOUT</a>
            </div>
        </div>

        <div class="portal-cards">
            <a href="${pageContext.request.contextPath}/profile.jsp" class="portal-card">
                <div class="card-icon"><i class="fas fa-users"></i></div>
                <h3 class="card-title">Manage Profile</h3>
                <p class="card-description">Update your personal information and account settings</p>
                <button class="btn btn-outline">GO TO PROFILE</button>
            </a>

            <a href="${pageContext.request.contextPath}/dashboard.jsp" class="portal-card">
                <div class="card-icon"><i class="fas fa-eye"></i></div>
                <h3 class="card-title">View Issues</h3>
                <p class="card-description">Check the status of your reported issues</p>
                <button class="btn btn-outline">VIEW ISSUES</button>
            </a>

            <a href="${pageContext.request.contextPath}/report.jsp" class="portal-card">
                <div class="card-icon"><i class="fas fa-pencil-alt"></i></div>
                <h3 class="card-title">Report Issue</h3>
                <p class="card-description">Submit a new community issue for resolution</p>
                <button class="btn btn-outline">REPORT NOW</button>
            </a>

            <a href="${pageContext.request.contextPath}/searchResults.jsp" class="portal-card">
                <div class="card-icon"><i class="fas fa-search"></i></div>
                <h3 class="card-title">Search Issues</h3>
                <p class="card-description">Find specific issues using keywords</p>
                <button class="btn btn-outline">SEARCH</button>
            </a>
        </div>

        <div class="footer">
            <a href="${pageContext.request.contextPath}/about.jsp">About</a>
            <a href="${pageContext.request.contextPath}/contact.jsp">Contact</a>
            <a href="${pageContext.request.contextPath}/login?logout=true">Logout</a>
        </div>
    </div>
</div>
</body>
</html>
