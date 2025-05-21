<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.communityfix.model.User" %>
<%@ page import="com.communityfix.model.Inquiry" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%
    User loggedInUser = (User) session.getAttribute("user");
    if (loggedInUser == null || loggedInUser.getRole() != User.Role.CITIZEN) {
        response.sendRedirect(request.getContextPath() + "/LoginServlet");
        return;
    }

    @SuppressWarnings("unchecked")
    List<Inquiry> inquiries = (List<Inquiry>) request.getAttribute("inquiries");
    if (inquiries == null) {
        inquiries = Collections.emptyList();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Inquiry - CommunityFix Nepal</title>
    <link href="${pageContext.request.contextPath}/assets/css/reportNewIssue.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
        .btn-delete {
            background-color: #e3342f;
            color: white;
            padding: 0.25rem 0.5rem;
            border: none;
            border-radius: 0.25rem;
            cursor: pointer;
        }
        .btn-delete:hover {
            background-color: #cc1f1a;
        }
    </style>
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
                    <a href="${pageContext.request.contextPath}/ReportNewIssueServlet" class="nav-link"><i class="fas fa-pencil-alt"></i> Report New Issue</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/SubmitNewInquiry" class="nav-link">
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
            <h2>Submit Inquiry</h2>
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

            <form action="${pageContext.request.contextPath}/SubmitNewInquiry" method="post" class="form">
                <div class="form-group">
                    <label for="inquiryName">Inquiry Name</label>
                    <input type="text" id="inquiryName" name="inquiryName" placeholder="Enter inquiry name" required maxlength="100"
                           class="w-full p-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                    <div class="form-help">Inquiry Name (max 100 chars)</div>
                </div>

                <div class="form-group">
                    <label for="message">Message</label>
                    <textarea id="message" name="message" placeholder="Describe your inquiry" required maxlength="500" oninput="updateCharCount(this)"></textarea>
                    <div class="char-count"><span id="charCount">0</span>/500</div>
                    <div class="form-help">Message (max 500 chars)</div>
                </div>

                <button type="submit" class="btn btn-primary">Submit Inquiry</button>
            </form>

            <!-- Display Submitted Inquiries -->
            <div class="mt-8">
                <h3 class="text-xl font-semibold mb-4">Your Inquiries</h3>
                <% if (inquiries.isEmpty()) { %>
                <p class="text-gray-600">No inquiries found.</p>
                <% } else { %>
                <table>
                    <thead>
                    <tr>
                        <th>Inquiry Name</th>
                        <th>Message</th>
                        <th>Submitted At</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (Inquiry inquiry : inquiries) { %>
                    <tr>
                        <td><%= inquiry.getInquiryName() %></td>
                        <td><%= inquiry.getInquiryMessage() %></td>
                        <td><%= inquiry.getSubmittedAt() %></td>
                        <td>
                            <form action="${pageContext.request.contextPath}/DeleteInquiry" method="post" style="display:inline;">
                                <input type="hidden" name="inquiryId" value="<%= inquiry.getInquiryId() %>">
                                <button type="submit" class="btn-delete">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
                <% } %>
            </div>
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
</script>
</body>
</html>