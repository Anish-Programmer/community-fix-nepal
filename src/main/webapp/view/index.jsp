<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>CommunityFix Nepal</title>
    <link rel="stylesheet" href="static/css/style.css">
</head>
<body>
<div class="form-container">
    <h1>Welcome to CommunityFix Nepal</h1>
    <% if (session.getAttribute("user") == null) { %>
    <p><a href="view/login.jsp">Login</a> | <a href="view/register.jsp">Register</a></p>
    <% } else { %>
    <p>Welcome, <%= ((com.communityfix.model.User) session.getAttribute("user")).getUsername() %>!</p>
    <p><a href="LogoutServlet">Logout</a></p>
    <% } %>
</div>
</body>
</html>