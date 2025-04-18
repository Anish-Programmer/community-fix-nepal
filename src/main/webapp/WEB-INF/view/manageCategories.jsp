<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Categories - CommunityFix Nepal</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/manageCategories.css">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <!-- Add Font Awesome CDN -->
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
                    <a href="${pageContext.request.contextPath}/manageUsers.jsp" class="nav-link">
                        <i class="fas fa-users"></i> Manage Users
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/manageCategories.jsp" class="nav-link active">
                        <i class="fas fa-tags"></i> Manage Categories
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/reports.jsp" class="nav-link">
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
            <h2>Manage Issue Categories</h2>
            <div class="user-info">
                <span>Welcome, Admin</span>
                <a href="${pageContext.request.contextPath}/login.jsp?logout=true" class="btn btn-outline btn-sm">Logout</a>
            </div>
        </div>

        <div class="content-grid">
            <div class="category-form">
                <h3>Add New Category</h3>
                <form action="${pageContext.request.contextPath}/category" method="post" class="form">
                    <input type="hidden" name="action" value="add">
                    <div class="form-group">
                        <label for="name">Category Name</label>
                        <input type="text" id="name" name="name" placeholder="Category Name" required>
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea id="description" name="description" placeholder="Description" maxlength="500"></textarea>
                        <div class="form-help">Description (max 500 chars)</div>
                    </div>
                    <button type="submit" class="btn btn-primary">Add Category</button>
                </form>
            </div>

            <div>
                <h3>Existing Categories</h3>
                <table class="category-table">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Waste Management</td>
                        <td>Issues related to waste collection and disposal</td>
                        <td>
                            <form action="${pageContext.request.contextPath}/category" method="post" onsubmit="return confirm('Are you sure you want to delete this category?');">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="categoryId" value="1">
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <tr>
                        <td>Road Repair</td>
                        <td>Issues related to potholes, road damage, etc.</td>
                        <td>
                            <form action="${pageContext.request.contextPath}/category" method="post" onsubmit="return confirm('Are you sure you want to delete this category?');">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="categoryId" value="2">
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="footer">
            <a href="${pageContext.request.contextPath}/adminDashboard.jsp">Back to Admin Dashboard</a>
            <a href="${pageContext.request.contextPath}/about.jsp">About</a>
            <a href="${pageContext.request.contextPath}/contact.jsp">Contact</a>
            <a href="${pageContext.request.contextPath}/login.jsp?logout=true">Logout</a>
        </div>
    </div>
</div>
</body>
</html>
