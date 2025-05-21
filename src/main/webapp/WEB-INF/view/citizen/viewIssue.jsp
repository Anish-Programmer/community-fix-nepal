<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.communityfix.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="com.communityfix.controller.LoginServlet" %>
<%
    User username = (User) session.getAttribute("user");
    if (username == null){
        response.sendRedirect("LoginServlet");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Dashboard - Community Fix Nepal</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-HgQ3PIfvN3pWw+lg/YpV08sX7XgbmEXF+F4V84lRJ3IQ6Wz5Dj+S7ikEQUYvDWn+N2eDQ7t0bT5b0PFXO0fAg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<div class="dashboard-container">
    <div class="sidebar">
        <div class="logo">Community Fix Nepal</div>
        <nav>
            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/ProfileServlet" class="nav-link"><i class="fa fa-user"></i> Manage Profile</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/ViewIssueServlet" class="nav-link active"><i class="fa fa-eye"></i> View Issues</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/ReportNewIssueServlet" class="nav-link"><i class="fa fa-pen"></i> Report New Issue</a>
                </li>

                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}//SubmitNewInquiry" class="nav-link">
                        <i class="fas fa-question-circle"></i> Submit New Inquiry
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/SearchIssueServlet" class="nav-link"><i class="fa fa-search"></i> Search Your Issues</a>
                </li>
            </ul>
        </nav>
    </div>

    <div class="main-content">
        <div class="header">
            <h2>Your Reported Issues</h2>
            <div class="user-info">
                <span>Welcome, <%= username.getUsername() %> (Citizen)</span>
                <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn btn-outline btn-sm"><i class="fa fa-sign-out-alt"></i> Logout</a>
            </div>
        </div>

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
                <th>Admin Comment</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${empty issues}">
                    <tr>
                        <td colspan="5">No issues reported yet.</td>
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

        <div class="footer">
            <a href="${pageContext.request.contextPath}/AboutServlet">About</a>
            <a href="${pageContext.request.contextPath}/ContactServlet">Contact</a>
            <a href="${pageContext.request.contextPath}/LogoutServlet">Logout</a>
        </div>
    </div>
</div>
</body>
</html>