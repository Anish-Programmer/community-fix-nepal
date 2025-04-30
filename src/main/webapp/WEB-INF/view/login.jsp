<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.Cookie" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - CommunityFix Nepal</title>
    <link href="${pageContext.request.contextPath}/assets/css/login.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="login-wrapper">
    <!-- Left side image section -->
    <div class="left-image">
        <img src="${pageContext.request.contextPath}/assets/images/Login-form-Side.png" alt="Login Image">
    </div>

    <!-- Right side form section -->
    <div class="container">
        <h1>CommunityFix Nepal</h1>
        <h1>Welcome</h1>

        <%
            // Retrieve success or error messages from request attributes
            String logoutSuccess = (String) request.getAttribute("logoutSuccess");
            String errorMessage = (String) request.getAttribute("errorMessage");

            // Initialize variable to store username from cookie
            String cookieUsername = null;

            // Fetch cookies from the request
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("username".equals(cookie.getName())) {
                        cookieUsername = cookie.getValue();
                        break;
                    }
                }
            }
        %>

        <!-- Show logout success message if present -->
        <% if (logoutSuccess != null) { %>
        <div class="alert alert-success">Logged out successfully.</div>
        <% } %>

        <!-- Show error message if login fails -->
        <% if (errorMessage != null) { %>
        <div class="alert alert-error"><%= errorMessage %></div>
        <% } %>

        <!-- Login form: submits data to LoginServlet -->
        <form action="${pageContext.request.contextPath}/LoginServlet" method="post" class="form">
            <!-- Username input field with value pre-filled from cookie -->
            <div class="form-group">
                <label for="username">Username</label>
                <input
                        type="text"
                        id="username"
                        name="username"
                        placeholder="Enter username"
                        value="<%= cookieUsername != null ? cookieUsername : "" %>"
                        required>
            </div>

            <!-- Password input field -->
            <div class="form-group">
                <label for="password">Password</label>
                <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Enter password"
                        required>
            </div>

            <!-- Remember me checkbox -->
            <div class="remember-me-group">
                <label class="remember-me-label">
                    <input type="checkbox" name="remember">
                    <span class="remember-text">Remember me</span>
                </label>
            </div>

            <!-- Submit button -->
            <button type="submit" class="btn btn-primary">Login</button>
        </form>

        <!-- Link to register page -->
        <div class="form-footer">
            <p>Don't have an account?</p>
            <a href="${pageContext.request.contextPath}/RegisterServlet">Register Here</a>
        </div>
    </div>
</div>
</body>
</html>