<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - CommunityFix Nepal</title>
    <link href="${pageContext.request.contextPath}/assets/css/register.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/js/scripts.js"></script>
</head>
<body>
<div class="register-wrapper">
    <!-- Left Image Section -->
    <div class="left-image">
        <img src="${pageContext.request.contextPath}/assets/images/RegisterSideimage.jpg" alt="Registration Illustration">
    </div>

    <!-- Right Form Section -->
    <div class="container">
        <h1>Create Account</h1>

        <!-- Error message -->
        <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
        <% if (errorMessage != null) { %>
        <div class="alert alert-error"><%= errorMessage %></div>
        <% } %>

        <!-- Registration Form -->
        <form action="${pageContext.request.contextPath}/RegisterServlet" method="post" class="form" onsubmit="return validateRegisterForm()">
            <!-- Username -->
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Choose a username (letters and numbers)" required>
            </div>

            <!-- Email -->
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email (optional)">
            </div>

            <!-- Phone -->
            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="text" id="phone" name="phone" placeholder="Enter your phone (optional)">
            </div>

            <!-- Password -->
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Create a password" required>
            </div>

            <!-- Confirm Password -->
            <div class="form-group">
                <label for="confirm-password">Confirm Password</label>
                <input type="password" id="confirm-password" name="confirm-password" placeholder="Confirm your password" required>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary">Register</button>
        </form>

        <!-- Footer with Login Link -->
        <div class="form-footer">
            <p>Already have an account?</p>
            <a href="${pageContext.request.contextPath}/LoginServlet">Login Here</a>
        </div>
    </div>
</div>
</body>
</html>