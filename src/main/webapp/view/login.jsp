<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<%--
    Optional: Retrieve messages set by servlet if login fails or succeeds
    These can be set using:
    request.setAttribute("errorMessage", "Invalid username or password");
    request.setAttribute("successMessage", "Logged out successfully");
--%>
<%
    String successMessage = (String) request.getAttribute("successMessage");
    String errorMessage = (String) request.getAttribute("errorMessage");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Community Fix Nepal</title>

    <%-- External CSS file for styling --%>
    <link href="/register.css" rel="stylesheet">

    <%-- Google Fonts for typography --%>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1>CommunityFix Nepal</h1>
    <h1>Welcome</h1>
    <p class="welcome-message">Please login to report and track community issues.</p>

    <%-- Success message shown after logout (optional) --%>
    <% if (successMessage != null) { %>
    <div class="alert alert-success">
        <%= successMessage %>
    </div>
    <% } %>

    <%-- Error message shown after failed login attempt --%>
    <% if (errorMessage != null) { %>
    <div class="alert alert-error">
        <%= errorMessage %>
    </div>
    <% } %>

    <%-- Login form posts to LoginServlet for processing --%>
    <form action="LoginServlet" method="post" class="form">
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Enter username" required>
            <div class="form-help">Username (3-20 alphanumeric)</div>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter password" required>
            <div class="form-help">Password (min 6 chars)</div>
        </div>

        <%-- Remember me checkbox --%>
        <div class="remember-me-group">
            <label class="remember-me-label">
                <input type="checkbox" name="remember">
                <span class="checkmark"></span>
                <span class="remember-text">Remember me</span>
            </label>
        </div>

        <%-- Submit button --%>
        <button type="submit" class="btn btn-primary">Login</button>
    </form>

    <%-- Link to registration page --%>
    <div class="form-footer">
        <p>Don't have an account?</p>
        <a href="register.jsp">Register Here</a>
    </div>
</div>
</body>
</html>
