<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="your.package.User" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<User> users = (List<User>) request.getAttribute("users"); // Assume it's set by servlet
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users - Community Fix Nepal</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/manageUser.css">
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
                    <a href="${pageContext.request.contextPath}/dashboard.jsp" class="nav-link">
                        <i class="fas fa-tools"></i> Manage Issues
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/manageUsers.jsp" class="nav-link active">
                        <i class="fas fa-users"></i> Manage Users
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/manageCategories.jsp" class="nav-link">
                        <i class="fas fa-tags"></i> Manage Categories
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/report.jsp" class="nav-link">
                        <i class="fas fa-chart-bar"></i> View Reports
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/userPortal.jsp" class="nav-link">
                        <i class="fas fa-home"></i> User Portal
                    </a>
                </li>
            </ul>
        </nav>
    </div>

    <div class="main-content">
        <div class="header">
            <h2>Manage Users</h2>
            <div class="user-info">
                <span>Welcome, <%= username %></span>
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

        <div class="content-grid">
            <div class="user-form">
                <h3>Add New User</h3>
                <form action="${pageContext.request.contextPath}/user" method="post" class="form">
                    <input type="hidden" name="action" value="add">

                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" placeholder="Username" required>
                        <div class="form-help">Username (3-20 alphanumeric)</div>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" placeholder="Password" required>
                        <div class="form-help">Password (min 6 chars)</div>
                    </div>

                    <div class="form-group">
                        <label for="role">Role</label>
                        <select id="role" name="role" required>
                            <option value="">Select Role</option>
                            <option value="Citizen">Citizen</option>
                            <option value="Admin">Admin</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" placeholder="Email" required>
                    </div>

                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="text" id="phone" name="phone" placeholder="Phone Number">
                    </div>

                    <button type="submit" class="btn btn-primary">Add User</button>
                </form>
            </div>

            <div>
                <h3>Existing Users</h3>
                <table class="user-table">
                    <thead>
                    <tr>
                        <th>Username</th>
                        <th>Role</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% if (users != null) {
                        for (User user : users) { %>
                    <tr>
                        <td><%= user.getUsername() %></td>
                        <td>
                                <span class="role-badge <%= user.getRole().equals("Admin") ? "role-admin" : "role-citizen" %>">
                                    <%= user.getRole() %>
                                </span>
                        </td>
                        <td><%= user.getEmail() %></td>
                        <td><%= user.getPhone() %></td>
                        <td>
                            <form action="${pageContext.request.contextPath}/user" method="post"
                                  onsubmit="return confirm('Are you sure you want to delete this user?');">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="userId" value="<%= user.getId() %>">
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <% }} else { %>
                    <tr><td colspan="5">No users found.</td></tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="footer">
            <a href="${pageContext.request.contextPath}/adminDashboard.jsp">Back to Admin Dashboard</a>
            <a href="${pageContext.request.contextPath}/about.jsp">About</a>
            <a href="${pageContext.request.contextPath}/contact.jsp">Contact</a>
            <a href="${pageContext.request.contextPath}/login?logout=true">Logout</a>
        </div>
    </div>
</div>
</body>
</html>
