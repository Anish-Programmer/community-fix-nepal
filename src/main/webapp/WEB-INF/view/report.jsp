<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="your.package.User" %>
<%
  String username = (String) session.getAttribute("username");
  if (username == null) {
    response.sendRedirect("login.jsp");
    return;
  }
  // Assume the user object is fetched and available
  User currentUser = (User) request.getAttribute("currentUser");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Report Issue - CommunityFix Nepal</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/report.css">
  <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> <!-- Font Awesome for icons -->
</head>
<body>
<div class="dashboard-container">
  <div class="sidebar">
    <div class="logo">CommunityFix</div>
    <nav>
      <ul class="nav-menu">
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/profile.jsp" class="nav-link"><i class="fas fa-user"></i> Manage Profile</a>
        </li>
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/dashboard.jsp" class="nav-link"><i class="fas fa-eye"></i> View Issues</a>
        </li>
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/report.jsp" class="nav-link active"><i class="fas fa-pencil-alt"></i> Report New Issue</a>
        </li>
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/searchResults.jsp" class="nav-link"><i class="fas fa-search"></i> Search Your Issues</a>
        </li>
      </ul>
    </nav>
  </div>

  <div class="main-content">
    <div class="header">
      <h2>Report New Issue</h2>
      <div class="user-info">
        <span>Welcome, <%= username %> (Citizen)</span>
        <a href="${pageContext.request.contextPath}/login?logout=true" class="btn btn-outline btn-sm">Logout</a>
      </div>
    </div>

    <div class="report-form">
      <form action="${pageContext.request.contextPath}/report" method="post" enctype="multipart/form-data" class="form">
        <div class="form-group">
          <label for="category">Category</label>
          <select id="category" name="categoryId" required>
            <option value="">Select a category</option>
            <option value="1">Road Damage</option>
            <option value="2">Water Leakage</option>
            <option value="3">Street Light Issue</option>
          </select>
        </div>

        <div class="form-group">
          <label for="description">Description</label>
          <textarea id="description" name="description" placeholder="Describe the issue" required maxlength="500" oninput="updateCharCount(this)"></textarea>
          <div class="char-count"><span id="charCount">0</span>/500</div>
          <div class="form-help">Description (max 500 chars)</div>
        </div>

        <div class="form-group">
          <label for="image">Image (Optional)</label>
          <div class="file-upload">
            <label for="image" class="file-upload-label">
              <div class="file-upload-icon"><i class="fa fa-camera"></i>
              </div>
              <div class="file-upload-text">Choose a file or drag it here</div>
            </label>
            <input type="file" id="image" name="image" accept="image/*">
          </div>
          <div id="image-preview" class="image-preview"></div>
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
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
