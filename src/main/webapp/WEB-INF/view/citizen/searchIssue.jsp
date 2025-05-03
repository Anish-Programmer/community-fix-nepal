<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.communityfix.model.User" %>
<%@ page import="com.communityfix.controller.LoginServlet" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    User username = (User) session.getAttribute("user");
    if (username == null) {
        response.sendRedirect("LoginServlet");
        return;
    }
    String keyword = (String) request.getAttribute("keyword");
    if (keyword == null) {
        keyword = "";
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
    <link href="${pageContext.request.contextPath}/assets/css/searchResult.css" rel="stylesheet">
</head>
<body>
<div class="dashboard-container">
    <div class="sidebar">
        <div class="logo">CommunityFix</div>
        <nav>
            <ul class="nav-menu">
                <li class="nav-item"><a href="${pageContext.request.contextPath}/ProfileServlet" class="nav-link"><i class="fas fa-user"></i> Manage Profile</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/ViewIssueServlet" class="nav-link"><i class="fas fa-eye"></i> View Issues</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/ReportNewIssueServlet" class="nav-link"><i class="fas fa-pencil-alt"></i> Report New Issue</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/SearchIssueServlet" class="nav-link active"><i class="fas fa-search"></i> Search Your Issues</a></li>
            </ul>
        </nav>
    </div>

    <div class="main-content">
        <div class="header">
            <h2>Search Issues</h2>
            <div class="user-info">
                <span>Welcome, <%= username.getUsername() %> (Citizen)</span>
                <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn btn-outline btn-sm">Logout</a>
            </div>
        </div>

        <form action="${pageContext.request.contextPath}/SearchIssueServlet" method="get" class="search-form">
            <input style="padding: 15px; margin: 15px" type="text" name="keyword" value="<%= keyword %>" placeholder="Enter keyword (e.g., streetlight, road)" required>
            <button type="submit">Search</button>
        </form>

        <div class="search-results">
            <h3>Search Results for "<%= keyword %>"</h3>

            <c:if test="${not empty errorMessage}">
                <div class="error-message">${errorMessage}</div>
            </c:if>

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
                <c:choose>
                    <c:when test="${empty issues}">
                        <tr>
                            <td colspan="5">No issues found matching "<%= keyword %>".</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="issue" items="${issues}">
                            <tr>
                                <td>${issue.categoryName}</td>
                                <td>${issue.issueDescription}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty issue.imageData}">
                                            <img src="${pageContext.request.contextPath}/GetIssueImageServlet?issueId=${issue.issueId}" alt="Issue Image" class="thumbnail" />
                                        </c:when>
                                        <c:otherwise>
                                            No Image
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <span class="status-badge status-${fn:toLowerCase(issue.issueStatus)}">
                                        <c:choose>
                                            <c:when test="${issue.issueStatus == 'pending'}">Pending</c:when>
                                            <c:when test="${issue.issueStatus == 'in_progress'}">In Progress</c:when>
                                            <c:when test="${issue.issueStatus == 'resolved'}">Resolved</c:when>
                                            <c:otherwise>${issue.issueStatus}</c:otherwise>
                                        </c:choose>
                                    </span>
                                </td>
                                <td>${issue.issueAdminComment != null ? issue.issueAdminComment : 'No comment'}</td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>

        <div class="footer">
            <a href="${pageContext.request.contextPath}/UserDashboardServlet">Back to User Portal</a>
            <a href="${pageContext.request.contextPath}/AboutServlet">About</a>
            <a href="${pageContext.request.contextPath}/ContactServlet">Contact</a>
            <a href="${pageContext.request.contextPath}/LogoutServlet">Logout</a>
        </div>
    </div>
</div>
</body>
</html>