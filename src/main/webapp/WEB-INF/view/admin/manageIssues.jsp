<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.communityfix.model.User" %>
<%@ page import="com.communityfix.model.Issue" %>
<%@ page import="java.util.List" %>
<%@ page session="true" %>
<%
    // Get the logged-in user from the session
    User user = (User) session.getAttribute("user");
    if (user == null || user.getRole() != User.Role.ADMIN) {
        response.sendRedirect("LoginServlet");
        return;
    }
    String username = user.getUsername();

    // Retrieve the list of issues from the request (set by ManageIssueServlet)
    List<Issue> issues = (List<Issue>) request.getAttribute("issues");
    if (issues == null) {
        // Fallback: Redirect to servlet to fetch issues if not present
        response.sendRedirect("ManageIssueServlet");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Issues - CommunityFix Nepal</title>

    <!-- Stylesheets with context path -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/adminDashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/manageIssue.css">

    <!-- Fonts and Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- jQuery for AJAX -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Inline CSS for button hover effect -->
    <style>
        .update-btn:hover {
            background-color: #E5941A !important; /* Darker orange on hover */
        }
    </style>
</head>
<body>

<div class="dashboard-container">

    <!-- Sidebar Navigation -->
    <div class="sidebar">
        <div class="logo">COMMUNITY FIX NEPAL</div>
        <nav>
            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/ManageIssueServlet" class="nav-link active">
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
                    <a href="${pageContext.request.contextPath}/ViewReportServlet" class="nav-link">
                        <i class="fas fa-chart-bar"></i> View Reports
                    </a>
                </li>
            </ul>
        </nav>
    </div>

    <!-- Main Content Area -->
    <div class="main-content">
        <div class="header">
            <h2>Manage All Issues</h2>
            <div class="user-info">
                <span>Welcome, <%= username %> (Admin)</span>
                <a href="${pageContext.request.contextPath}/LogoutServlet" class="logout-btn">Logout</a>
            </div>
        </div>

        <!-- Success Message -->
        <div class="alert alert-success" id="success-message" style="display: none;">
            Issue updated successfully.
        </div>

        <!-- Issue Management Table -->
        <table class="issue-table">
            <thead>
            <tr>
                <th>Category</th>
                <th>Description</th>
                <th>Image</th>
                <th>Status</th>
                <th>Comment</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <% for (Issue issue : issues) { %>
            <tr>
                <td><%= issue.getCategoryName() != null ? issue.getCategoryName() : "Unknown" %></td>
                <td><%= issue.getIssueDescription() %></td>
                <td>
                    <% if (issue.getImageData() != null) { %>
                    <img src="${pageContext.request.contextPath}/images/<%= issue.getIssueId() %>" alt="Issue Image" class="thumbnail">
                    <% } else { %>
                    <span>No Image</span>
                    <% } %>
                </td>
                <td>
                    <form class="update-form" data-issue-id="<%= issue.getIssueId() %>">
                        <input type="hidden" name="issueId" value="<%= issue.getIssueId() %>">
                        <select name="status" class="status-select">
                            <option value="pending" <%= "pending".equals(issue.getIssueStatus()) ? "selected" : "" %>>Pending</option>
                            <option value="in_progress" <%= "in_progress".equals(issue.getIssueStatus()) ? "selected" : "" %>>In Progress</option>
                            <option value="resolved" <%= "resolved".equals(issue.getIssueStatus()) ? "selected" : "" %>>Resolved</option>
                        </select>
                </td>
                <td>
                    <input type="text" name="comment" value="<%= issue.getIssueAdminComment() != null ? issue.getIssueAdminComment() : "" %>" placeholder="Add comment">
                </td>
                <td class="action-buttons">
                    <button type="submit" class="btn btn-outline update-btn" style="background-color: #F5A623; color: white; border: none; border-radius: 4px; padding: 10px 20px; font-weight: 500; cursor: pointer; transition: background-color 0.2s ease;">Update</button>
                    </form>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>

        <!-- Footer Links -->
        <div class="footer">
            <a href="${pageContext.request.contextPath}/AboutServlet">About</a>
            <a href="${pageContext.request.contextPath}/ContactServlet">Contact</a>
            <a href="${pageContext.request.contextPath}/LogoutServlet">Logout</a>
        </div>
    </div>
</div>

<!-- JavaScript for AJAX Updates -->
<script>
    $(document).ready(function() {
        $('.update-form').on('submit', function(e) {
            e.preventDefault(); // Prevent form submission

            const form = $(this);
            const issueId = form.data('issue-id');
            const status = form.find('select[name="status"]').val();
            const comment = form.find('input[name="comment"]').val();
            const successMessage = $('#success-message');

            // Send AJAX request to update the issue
            $.ajax({
                url: '${pageContext.request.contextPath}/updateIssue',
                type: 'POST',
                data: {
                    issueId: issueId,
                    status: status,
                    comment: comment
                },
                success: function(response) {
                    // Show success message
                    successMessage.text('Issue updated successfully.').show();
                    setTimeout(() => successMessage.hide(), 3000); // Hide after 3 seconds
                },
                error: function(xhr, status, error) {
                    // Show error message
                    successMessage.text('Error updating issue: ' + xhr.responseText).show();
                    setTimeout(() => successMessage.hide(), 3000);
                }
            });
        });
    });
</script>

</body>
</html>