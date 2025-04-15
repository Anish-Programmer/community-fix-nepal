<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%-- JSP directive to define content type and language --%>
<!DOCTYPE html> <%-- HTML5 document declaration --%>
<html>
<head>
    <%-- Set character encoding and responsive meta tag --%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%-- Page title --%>
    <title>Register - Community Fix Nepal</title>

    <%-- Link to external CSS file for styling the form --%>
    <link href="register.css" rel="stylesheet">

    <%-- Google Fonts for clean and modern typography --%>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>

<body>
<div class="container">
    <%-- Project and form heading --%>
    <h1>Community Fix Nepal</h1>
    <h1>Create Account</h1>

    <%-- Welcome text --%>
    <p class="welcome-message">Join us to report and track community issues.</p>

    <%-- Success message shown only if 'success' attribute is set in the request --%>
    <div class="alert alert-success" style="<%= request.getAttribute("success") != null ? "" : "display:none;" %>">
        <%= request.getAttribute("success") != null ? request.getAttribute("success") : "" %>
    </div>

    <%-- Error message shown only if 'error' attribute is set in the request --%>
    <div class="alert alert-error" style="<%= request.getAttribute("error") != null ? "" : "display:none;" %>">
        <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
    </div>

    <%-- Registration form with POST method directed to 'register' endpoint --%>
    <form action="register" method="post" class="form">

        <%-- Full name input field --%>
        <div class="form-group">
            <label for="fullname">Full Name</label>
            <input type="text" id="fullname" name="fullname" placeholder="Enter your full name" required>
        </div>

        <%-- Username input field --%>
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Choose a username" required>
            <div class="form-help">Username (3-20 alphanumeric)</div>
        </div>

        <%-- Email input field --%>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>
        </div>

        <%-- Password input field --%>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Create a password" required>
            <div class="form-help">Password (min 6 chars)</div>
        </div>

        <%-- Confirm password input field --%>
        <div class="form-group">
            <label for="confirm-password">Confirm Password</label>
            <input type="password" id="confirm-password" name="confirm-password" placeholder="Confirm your password" required>
        </div>

        <%-- Terms and conditions checkbox with links to JSP pages --%>
        <div class="terms-group">
            <label class="terms-label">
                <input type="checkbox" name="terms" required>
                <span>
                    I agree to the
                    <a href="terms.jsp">Terms of Service</a> and
                    <a href="privacy.jsp">Privacy Policy</a>
                </span>
            </label>
        </div>

        <%-- Submit button --%>
        <button type="submit" class="btn btn-primary">Register</button>
    </form>

    <%-- Footer with login redirection --%>
    <div class="form-footer">
        <p>Already have an account?</p>
        <a href="login.jsp">Login Here</a>
    </div>
</div>
</body>
</html>
