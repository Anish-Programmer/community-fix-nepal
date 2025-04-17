<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Metadata and resource links -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Community Fix Nepal</title>

    <!-- Linking to custom stylesheet located in /static/css/login.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css">


    <script src="${pageContext.request.contextPath}/assets/js/scripts.js"></script>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="login-wrapper">

    <!-- Left side image section -->
    <div class="left-image">
        <!-- Dynamic path to the login illustration image -->
        <img src="${pageContext.request.contextPath}/assets/images/Login-form-Side.png" alt="Login Image" >
    </div>

    <!-- Right side form section -->
    <div class="container">
        <h1>CommunityFix Nepal</h1>
        <h1>Welcome</h1>

        <%
            // Retrieve success or error messages from request attributes
            String logoutSuccess = (String) request.getAttribute("logoutSuccess");
            String loginError = (String) request.getAttribute("loginError");

            // Initialize variable to store username from cookie
            String cookieUsername = null;

            // Fetch cookies from the request
            Cookie[] cookies = request.getCookies();

            // Loop through cookies to find one named "username"
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

        <!-- Show login error message if login failed -->
        <% if (loginError != null) { %>
        <div class="alert alert-error">Invalid username or password.</div>
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
