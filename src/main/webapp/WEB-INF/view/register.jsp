<%--
  Created by IntelliJ IDEA.
  User: Anish
  Date: 4/15/2025
  Time: 11:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register - CommunityFix Nepal</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
    <script src="${pageContext.request.contextPath}/static/js/scripts.js"></script>
</head>
<body>
<div class="form-container">
    <h2>Register</h2>
    <% String error = (String) request.getAttribute("errorMessage"); %>
    <% String success = request.getParameter("success"); %>
    <% if (error != null) { %>
    <p class="error"><%= error %></p>
    <% } %>
    <% if (success != null) { %>
    <p class="success"><%= success %></p>
    <% } %>
    <form action="${pageContext.request.contextPath}/RegisterServlet" method="post" onsubmit="return validateRegisterForm()">
        <input type="text" id="username" name="username" placeholder="Username" required>
        <input type="password" id="password" name="password" placeholder="Password" required>
        <input type="email" id="email" name="email" placeholder="Email (optional)">
        <input type="text" name="phone" placeholder="Phone (optional)">
        <button type="submit">Register</button>
    </form>
    <p>Already have an account? <a href="${pageContext.request.contextPath}/LoginServlet">Login</a></p>
</div>
</body>
</html>