<%@ page contentType="text/html; charset=UTF-8" language="java" %>
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
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet" />
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
                    <a href="${pageContext.request.contextPath}/SearchIssueServlet" class="nav-link"><i class="fa fa-search"></i> Search Your Issues</a>
                </li>
            </ul>
        </nav>
    </div>

    <div class="main-content">
        <div class="header">
            <h2>Your Reported Issues</h2>
            <div class="user-info">
                <span>Welcome, <strong>Community Fix Nepal</strong> (Citizen)</span>
                <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn btn-outline btn-sm"><i class="fa fa-sign-out-alt"></i> Logout</a>
            </div>
        </div>

        <table class="issue-table">
            <thead>
            <tr>
                <th>Category</th>
                <th>Description</th>
                <th>Image</th>
                <th>Status</th>
                <th>Comment</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Road Damage</td>
                <td>Potholes near the main junction causing traffic jams.</td>
                <td><img src="${pageContext.request.contextPath}/Images/Road Damage.jpeg" alt="Issue Image" class="thumbnail" /></td>
                <td><span class="status-badge status-pending">Pending</span></td>
                <td>Under review by the municipality.</td>
            </tr>
            <tr>
                <td>Garbage Collection</td>
                <td>Trash not collected for over a week in Ward 4.</td>
                <td><img src="${pageContext.request.contextPath}/Images/Garbage.jpeg" alt="Issue Image" class="thumbnail" /></td>
                <td><span class="status-badge status-progress">In Progress</span></td>
                <td>Team dispatched for cleanup.</td>
            </tr>
            <tr>
                <td>Streetlight Issue</td>
                <td>Lights flicker and go off randomly at night.</td>
                <td><img src="${pageContext.request.contextPath}/Images/Streetlight.jpeg" alt="Issue Image" class="thumbnail" /></td>
                <td><span class="status-badge status-resolved">Resolved</span></td>
                <td>Technician repaired the faulty unit.</td>
            </tr>
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
