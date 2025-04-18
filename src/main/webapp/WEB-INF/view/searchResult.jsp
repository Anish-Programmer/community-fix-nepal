<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="your.package.User" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    // Assume the search keyword is passed in as a request parameter
    String keyword = request.getParameter("keyword");
    if (keyword == null) {
        keyword = "streetlight"; // Default value for testing
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results - CommunityFix Nepal</title>

    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/searchResult.css" rel="stylesheet">
</head>
<body>
<div class="dashboard-container">
    <div class="sidebar">
        <div class="logo">CommunityFix</div>
        <nav>
            <ul class="nav-menu">
                <li class="nav-item"><a href="${pageContext.request.contextPath}/profile.jsp" class="nav-link"><i class="fas fa-user"></i> Manage Profile</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/dashboard.jsp" class="nav-link"><i class="fas fa-eye"></i> View Issues</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/report.jsp" class="nav-link"><i class="fas fa-pencil-alt"></i> Report New Issue</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/searchResults.jsp" class="nav-link active"><i class="fas fa-search"></i> Search Your Issues</a></li>
            </ul>
        </nav>
    </div>

    <div class="main-content">
        <div class="header">
            <h2>Search Issues</h2>
            <div class="user-info">
                <span>Welcome, <%= username %> (Citizen)</span>
                <a href="${pageContext.request.contextPath}/login?logout=true" class="btn btn-outline btn-sm">Logout</a>
            </div>
        </div>

        <form action="${pageContext.request.contextPath}/searchResults.jsp" method="get" class="search-form">
            <input type="text" name="keyword" value="<%= keyword %>" placeholder="Enter keyword (e.g., streetlight, road)" required>
            <button type="submit">Search</button>
        </form>

        <div class="search-results">
            <h3>Search Results for "<%= keyword %>"</h3>

            <table class="issue-table">
                <thead>
                <tr>
                    <th>Category</th>
                    <th>Description</th>
                    <th>Image</th>
                    <th>Status</th>
                    <th>Comment</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>Infrastructure</td>
                    <td>Streetlight not working</td>
                    <td><img src="${pageContext.request.contextPath}/images/Streetlight.jpeg" alt="Issue Image" class="thumbnail"></td>
                    <td><span class="status-badge status-pending">Pending</span></td>
                    <td>Needs urgent fix</td>
                </tr>
                <tr>
                    <td>Road</td>
                    <td>Construction on the highway near the Dharan area</td>
                    <td><img src="${pageContext.request.contextPath}/images/RoadProgress.jpeg" alt="Issue Image" class="thumbnail"></td>
                    <td><span class="status-badge status-progress">In Progress</span></td>
                    <td>Work started by municipality</td>
                </tr>
                </tbody>
            </table>

        </div>

        <div class="footer">
            <a href="${pageContext.request.contextPath}/userPortal.jsp">Back to User Portal</a>
            <a href="${pageContext.request.contextPath}/about.jsp">About</a>
            <a href="${pageContext.request.contextPath}/contact.jsp">Contact</a>
            <a href="${pageContext.request.contextPath}/login?logout=true">Logout</a>
        </div>
    </div>
</div>
</body>
</html>
