<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Meta Tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Page Title -->
    <title>Error - CommunityFix Nepal</title>

    <!-- CSS and Fonts -->
    <link rel="stylesheet" href="/error.css">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="error-container">
    <!-- Warning Icon -->
    <div class="error-icon">⚠️</div>

    <!-- Title and Message -->
    <h1 class="error-title">Oops! Something went wrong</h1>
    <p class="error-message">We apologize for the inconvenience. An error has occurred while processing your request.</p>

    <!-- Actions -->
    <div class="error-actions">
        <a href="javascript:history.back()" class="btn btn-secondary btn-action">Go Back</a>
        <a href="<%= request.getContextPath() %>/" class="btn btn-primary btn-action">Go to Home</a>
    </div>

    <!-- Dynamic Error Details -->
    <div class="error-details">
        <h3>Error Details:</h3>
        <p><strong>Type:</strong> <%= request.getAttribute("errorType") != null ? request.getAttribute("errorType") : "UnknownError" %></p>
        <p><strong>Message:</strong> <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "An unexpected error occurred." %></p>
        <p><strong>Stack Trace:</strong></p>
        <pre>
<%= request.getAttribute("stackTrace") != null ? request.getAttribute("stackTrace") : "No stack trace available." %>
            </pre>
    </div>

    <!-- Footer Links -->
    <div class="form-footer">
        <a href="/contact.jsp">Report this issue</a> |
        <a href="/about.jsp">About Us</a>
    </div>
</div>
</body>
</html>
