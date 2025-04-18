<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - CommunityFix Nepal</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/error.css">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="error-container">
    <div class="error-icon">⚠️</div>
    <h1 class="error-title">Oops! Something went wrong</h1>
    <p class="error-message">We apologize for the inconvenience. An error has occurred while processing your request.</p>

    <div class="error-actions">
        <a href="javascript:history.back()" class="btn btn-secondary btn-action">Go Back</a>
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-primary btn-action">Go to Home</a>
    </div>
</div>
</body>
</html>
