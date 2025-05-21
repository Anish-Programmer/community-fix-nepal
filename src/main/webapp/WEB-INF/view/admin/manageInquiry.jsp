<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.communityfix.model.User" %>
<%@ page import="com.communityfix.model.Inquiry" %>
<%-- Type casting to User object --%>
<%
  User username = (User) session.getAttribute("user");
  if (username == null || username.getRole() != User.Role.ADMIN) {
    response.sendRedirect("LoginServlet");
    return;
  }
  List<Inquiry> inquiries = (List<Inquiry>) request.getAttribute("inquiries"); // Assume it's set by servlet
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Manage Inquiries - Community Fix Nepal</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/manageUser.css">
  <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 1rem;
    }
    th, td {
      padding: 0.75rem;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    th {
      background-color: #f4f4f4;
      font-weight: 600;
    }
    .btn-danger {
      background-color: #e3342f;
      color: white;
      padding: 0.25rem 0.5rem;
      border: none;
      border-radius: 0.25rem;
      cursor: pointer;
    }
    .btn-danger:hover {
      background-color: #cc1f1a;
    }
  </style>
</head>
<body>
<div class="dashboard-container">
  <div class="sidebar">
    <div class="logo">CommunityFix</div>
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
          <a href="${pageContext.request.contextPath}/ManageInquiryServlet" class="nav-link active">
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
      <h2>Manage Inquiries</h2>
      <div class="user-info">
        <span>Welcome, <%= username.getUsername() %> (Admin)</span>
        <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn btn-outline btn-sm">Logout</a>
      </div>
    </div>

    <%-- Optional: success or error message --%>
    <% if (request.getAttribute("message") != null) { %>
    <div class="alert alert-success"><%= request.getAttribute("message") %></div>
    <% } %>
    <% if (request.getAttribute("error") != null) { %>
    <div class="alert alert-error"><%= request.getAttribute("error") %></div>
    <% } %>

    <div>
      <h3>Existing Inquiries</h3>
      <table class="user-table">
        <thead>
        <tr>
          <th>Inquiry ID</th>
          <th>Inquiry Name</th>
          <th>Message</th>
          <th>Submitted At</th>
          <th>User ID</th>
          <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <% if (inquiries != null && !inquiries.isEmpty()) {
          for (Inquiry inquiry : inquiries) { %>
        <tr>
          <td><%= inquiry.getInquiryId() %></td>
          <td><%= inquiry.getInquiryName() %></td>
          <td><%= inquiry.getInquiryMessage() %></td>
          <td><%= inquiry.getSubmittedAt() %></td>
          <td><%= inquiry.getUserId() %></td>
          <td>
            <form action="${pageContext.request.contextPath}/ManageInquiryServlet" method="post"
                  onsubmit="return confirm('Are you sure you want to delete this inquiry?');">
              <input type="hidden" name="action" value="delete">
              <input type="hidden" name="inquiryId" value="<%= inquiry.getInquiryId() %>">
              <button type="submit" class="btn-danger btn-sm">Delete</button>
            </form>
          </td>
        </tr>
        <% }
        } else { %>
        <tr><td colspan="6">No inquiries found.</td></tr>
        <% } %>
        </tbody>
      </table>
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