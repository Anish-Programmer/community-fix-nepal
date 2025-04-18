<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="your.package.User" %>
<%
  String username = (String) session.getAttribute("username");
  if (username == null) {
    response.sendRedirect("login.jsp");
    return;
  }

  // Assume a User object is set in the request with user data (or fetched from DB).
  User currentUser = (User) request.getAttribute("currentUser");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Profile - Community Fix Nepal</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/profile.css">

  <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<div class="dashboard-container">
  <div class="sidebar">
    <div class="logo">CommunityFix</div>
    <nav>
      <ul class="nav-menu">
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/profile.jsp" class="nav-link active">
            <i class="fas fa-user"></i> Manage Profile
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
      <h2>Manage Profile</h2>
      <div class="user-info">
        <span>Welcome, <%= username %> </span>
        <a href="${pageContext.request.contextPath}/login?logout=true" class="btn btn-outline btn-sm">Logout</a>
      </div>
    </div>

    <%-- Optional: success or error message --%>
    <% if (request.getAttribute("message") != null) { %>
    <div class="alert alert-success"><%= request.getAttribute("message") %></div>
    <% } %>
    <% if (request.getAttribute("error") != null) { %>
    <div class="alert alert-error"><%= request.getAttribute("error") %></div>
    <% } %>

    <div class="profile-form">
      <form action="${pageContext.request.contextPath}/profile" method="post" class="form">
        <div class="form-group">
          <label for="username">Username</label>
          <input type="text" id="username" name="username" value="<%= currentUser != null ? currentUser.getUsername() : "" %>" disabled>
          <div class="form-help">Username cannot be changed</div>
        </div>

        <div class="form-group">
          <label for="password">Password</label>
          <input type="password" id="password" name="password" value="<%= currentUser != null ? currentUser.getPassword() : "" %>" required>
          <div class="form-help">Password (min 6 chars)</div>
        </div>

        <div class="form-group">
          <label for="email">Email</label>
          <input type="email" id="email" name="email" value="<%= currentUser != null ? currentUser.getEmail() : "" %>" required>
        </div>

        <div class="form-group">
          <label for="phone">Phone</label>
          <input type="text" id="phone" name="phone" value="<%= currentUser != null ? currentUser.getPhone() : "" %>" required>
        </div>

        <button type="submit" class="btn btn-primary">Update Profile</button>
      </form>
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
