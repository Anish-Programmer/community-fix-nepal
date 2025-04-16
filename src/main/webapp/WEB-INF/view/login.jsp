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
    <title>Login - CommunityFix Nepal</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
    <script src="${pageContext.request.contextPath}/static/js/scripts.js"></script>
</head>
<body>
<div class="form-container">
    <h2>Login</h2>
    <% String error = (String) request.getAttribute("errorMessage"); %>
    <% String cookieUsername = null; %>
    <% Cookie[] cookies = request.getCookies(); %>
    <% if (cookies != null) { %>
    <% for (Cookie cookie : cookies) { %>
    <% if ("username".equals(cookie.getName())) { cookieUsername = cookie.getValue(); break; } %>
    <% } %>
    <% } %>
    <% if (error != null) { %>
    <p class="error"><%= error %></p>
    <% } %>
    <form action="${pageContext.request.contextPath}/LoginServlet" method="post" onsubmit="return validateLoginForm()">
        <input type="text" id="username" name="username" placeholder="Username"
               value="<%= cookieUsername != null ? cookieUsername : "" %>" required>
        <input type="password" id="password" name="password" placeholder="Password" required>
        <label><input type="checkbox" name="rememberMe"> Remember me</label>
        <button type="submit">Login</button>
    </form>
    <p>Don't have an account? <a href="${pageContext.request.contextPath}/RegisterServlet">Register</a></p>
</div>
</body>
</html>