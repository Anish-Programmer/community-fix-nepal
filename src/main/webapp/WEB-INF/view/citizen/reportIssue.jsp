<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.communityfix.model.User" %>
<%@ page import="com.communityfix.model.Category" %>
<%@ page import="java.util.List" %>
<%
  User loggedInUser = (User) session.getAttribute("user");
  if (loggedInUser == null || loggedInUser.getRole() != User.Role.CITIZEN) {
    response.sendRedirect(request.getContextPath() + "/LoginServlet");
    return;
  }

  @SuppressWarnings("unchecked")
  List<Category> categories = (List<Category>) request.getAttribute("categories");
  if (categories == null) {
    categories = java.util.Collections.emptyList();
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Report Issue - CommunityFix Nepal</title>
  <link href="${pageContext.request.contextPath}/assets/css/reportNewIssue.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
<div class="dashboard-container">
  <div class="sidebar">
    <div class="logo">CommunityFix Nepal</div>
    <nav>
      <ul class="nav-menu">
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/ProfileServlet" class="nav-link"><i class="fas fa-user"></i> Manage Profile</a>
        </li>
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/ViewIssueServlet" class="nav-link"><i class="fas fa-eye"></i> View Issues</a>
        </li>
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/ReportNewIssueServlet" class="nav-link active"><i class="fas fa-pencil-alt"></i> Report New Issue</a>
        </li>

        <li class="nav-item">
          <a href="${pageContext.request.contextPath}//SubmitNewInquiry" class="nav-link">
            <i class="fas fa-question-circle"></i> Submit New Inquiry
          </a>
        </li>
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/SearchIssueServlet" class="nav-link"><i class="fas fa-search"></i> Search Your Issues</a>
        </li>
      </ul>
    </nav>
  </div>

  <div class="main-content">
    <div class="header">
      <h2>Report New Issue</h2>
      <div class="user-info">
        <span>Welcome, <%= loggedInUser.getUsername() %> (Citizen)</span>
        <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn btn-outline btn-sm">Logout</a>
      </div>
    </div>

    <div class="report-form">
      <% if (request.getAttribute("errorMessage") != null) { %>
      <div class="alert-error"><%= request.getAttribute("errorMessage") %></div>
      <% } %>
      <% if (request.getAttribute("successMessage") != null) { %>
      <div class="alert-success"><%= request.getAttribute("successMessage") %></div>
      <% } %>

      <form action="${pageContext.request.contextPath}/ReportNewIssueServlet" method="post" enctype="multipart/form-data" class="form">
        <div class="form-group">
          <label for="category">Category</label>
          <select id="category" name="categoryId" required>
            <option value="">Select a category</option>
            <% for (Category category : categories) { %>
            <option value="<%= category.getCategoryId() %>"><%= category.getCategoryName() %></option>
            <% } %>
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
              <div class="file-upload-icon"><i class="fa fa-camera"></i></div>
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
      <a href="${pageContext.request.contextPath}/UserDashboardServlet">Back to User Portal</a>
      <a href="${pageContext.request.contextPath}/AboutServlet">About</a>
      <a href="${pageContext.request.contextPath}/ContactServlet">Contact</a>
      <a href="${pageContext.request.contextPath}/LogoutServlet">Logout</a>
    </div>
  </div>
</div>

<script>
  function updateCharCount(textarea) {
    const charCount = textarea.value.length;
    document.getElementById("charCount").textContent = charCount;
    if (charCount > 500) {
      textarea.value = textarea.value.substring(0, 500);
      document.getElementById("charCount").textContent = 500;
    }
  }

  document.addEventListener("DOMContentLoaded", function() {
    const imageInput = document.getElementById("image");
    const imagePreview = document.getElementById("image-preview");

    imageInput.addEventListener("change", function() {
      const file = this.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
          imagePreview.innerHTML = `<img src="${e.target.result}" alt="Image Preview">`;
        };
        reader.readAsDataURL(file);
      } else {
        imagePreview.innerHTML = "";
      }
    });
  });
</script>
</body>
</html>