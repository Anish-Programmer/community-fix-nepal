<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users - Community Fix Nepal</title>
    <link rel="stylesheet" href="/styles.css">
    <link rel="stylesheet" href="/manageUser.css">
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
                    <a href="/dashboard.jsp" class="nav-link">
                        <i class="fas fa-tools"></i> Manage Issues
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/manageUsers.jsp" class="nav-link active">
                        <i class="fas fa-users"></i> Manage Users
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/manageCategories.jsp" class="nav-link">
                        <i class="fas fa-tags"></i> Manage Categories
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/report.jsp" class="nav-link">
                        <i class="fas fa-chart-bar"></i> View Reports
                    </a>
                </li>
                <li class="nav-item">
                    <a href="/userPortal.jsp" class="nav-link">
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
                <span>Welcome, <c:out value="${sessionScope.username}" /></span>
                <a href="/login?logout=true" class="btn btn-outline btn-sm">Logout</a>
            </div>
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
                <!-- Sample static entries; replace with dynamic list later -->
                <tr>
                    <td>Samir Bhandari</td>
                    <td><span class="role-badge role-admin">Admin</span></td>
                    <td>samir@example.com</td>
                    <td>9812356734</td>
                    <td>
                        <form action="/user" method="post" onsubmit="return confirm('Are you sure you want to delete this user?');">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="userId" value="1">
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>Bipan Thapa</td>
                    <td><span class="role-badge role-citizen">Citizen</span></td>
                    <td>Bipan@example.com</td>
                    <td>9800000000</td>
                    <td>
                        <form action="/user" method="post" onsubmit="return confirm('Are you sure you want to delete this user?');">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="userId" value="2">
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="footer">
            <a href="/adminDashboard.jsp">Back to Admin Dashboard</a>
            <a href="/about.jsp">About</a>
            <a href="/contact.jsp">Contact</a>
            <a href="/login?logout=true">Logout</a>
        </div>
    </div>
</div>
</body>
</html>
