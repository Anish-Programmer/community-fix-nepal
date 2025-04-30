<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>View Reports - CommunityFix Nepal</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/viewReport.css"/>
  <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
</head>
<body>
<div class="dashboard-container">
  <!-- Sidebar -->
  <div class="sidebar">
    <div class="logo">COMMUNITY FIX NEPAL</div>
    <nav>
      <ul class="nav-menu">
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/dashboard.jsp" class="nav-link">
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
          <a href="${pageContext.request.contextPath}/viewReports.jsp" class="nav-link active">
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

  <!-- Main Content -->
  <div class="main-content">
    <div class="header">
      <h2>Reports & Statistics</h2>
      <div class="user-info">
        <span>Welcome, <c:out value="${sessionScope.username != null ? sessionScope.username : 'Admin'}"/></span>
        <a href="${pageContext.request.contextPath}/login.jsp?logout=true" class="btn btn-outline btn-sm">Logout</a>
      </div>
    </div>

    <!-- Summary Cards -->
    <div class="report-cards">
      <div class="report-card">
        <h3>Total Issues Reported</h3>
        <p class="report-value">154</p>
      </div>
      <div class="report-card">
        <h3>Resolved Issues</h3>
        <p class="report-value">67</p>
      </div>
      <div class="report-card">
        <h3>Pending Issues</h3>
        <p class="report-value">59</p>
      </div>
      <div class="report-card">
        <h3>In Progress</h3>
        <p class="report-value">28</p>
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
      <tr>
        <td>Road</td>
        <td>80</td>
        <td>40</td>
        <td>30</td>
      </tr>
      <tr>
        <td>Water</td>
        <td>40</td>
        <td>15</td>
        <td>20</td>
      </tr>
      <tr>
        <td>Electricity</td>
        <td>34</td>
        <td>12</td>
        <td>9</td>
      </tr>
      </tbody>
    </table>

    <!-- Chart Placeholder -->
    <h3>Status Breakdown (Chart)</h3>
    <div class="chart-container">
      <img src="${pageContext.request.contextPath}/Images/chart-placeholder.png" alt="Chart showing status breakdown" class="chart-img"/>
    </div>

    <!-- Footer -->
    <div class="footer">
      <a href="${pageContext.request.contextPath}/about.jsp">About</a>
      <a href="${pageContext.request.contextPath}/contact.jsp">Contact</a>
      <a href="${pageContext.request.contextPath}/login.jsp?logout=true">Logout</a>
    </div>
  </div>
</div>
</body>
</html>
