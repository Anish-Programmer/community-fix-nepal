<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CommunityFix Nepal - Empowering Communities</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
<!-- Header -->
<header class="header">
    <div class="header-container">
        <div class="logo">
            <img src="${pageContext.request.contextPath}/assets/images/logo.jpeg" alt="CommunityFix Nepal Logo">
            <span class="logo-text">Community Fix Nepal</span>
        </div>

        <nav class="nav-menu">
            <a href="${pageContext.request.contextPath}/" class="nav-link active">Home</a>
            <a href="${pageContext.request.contextPath}/WEB-INF/view/about.jsp" class="nav-link">About</a>
            <a href="${pageContext.request.contextPath}/WEB-INF/view/contact.jsp" class="nav-link">Contact</a>
        </nav>

        <div class="auth-buttons">
            <%
                if (session.getAttribute("user") == null) {
            %>
            <a href="${pageContext.request.contextPath}/LoginServlet" class="btn btn-outline">Login</a>
            <a href="${pageContext.request.contextPath}/RegisterServlet" class="btn btn-primary">Register</a>
            <%
            } else {
            %>
            <a href="${pageContext.request.contextPath}/WEB-INF/view/profile.jsp" class="btn btn-outline">Profile</a>
            <a href="${pageContext.request.contextPath}/WEB-INF/view/LoginServlet" class="btn btn-outline">Logout</a>
            <%
                }
            %>
        </div>

        <button class="mobile-menu-btn">
            <i class="fas fa-bars"></i>
        </button>
    </div>
</header>

<!-- Hero Section -->
<section class="hero">
    <div class="hero-container">
        <div class="hero-content">
            <h1>Empowering Communities Through Civic Engagement</h1>
            <p>Report and track community issues in your neighborhood. Together, we can build better communities across Nepal.</p>
            <div class="hero-buttons">
                <a href="${pageContext.request.contextPath}/RegisterServlet" class="btn btn-primary btn-lg">Get Started</a>
                <a href="${pageContext.request.contextPath}/WEB-INF/view/about.jsp" class="btn btn-outline btn-lg">Learn More</a>
            </div>
        </div>
        <div class="hero-image">
            <img src="${pageContext.request.contextPath}/assets/images/hero.jpeg" alt="Community Engagement Illustration">
        </div>
    </div>
</section>

<!-- How It Works Section -->
<section class="how-it-works">
    <div class="container">
        <div class="section-header">
            <h2>How It Works</h2>
            <p>A simple process to report and resolve community issues</p>
        </div>
        <div class="steps-container">
            <div class="step">
                <div class="step-icon">
                    <i class="fas fa-user-plus"></i>
                </div>
                <h3>Create an Account</h3>
                <p>Sign up for a free account to start reporting issues in your community.</p>
            </div>
            <div class="step">
                <div class="step-icon">
                    <i class="fas fa-exclamation-circle"></i>
                </div>
                <h3>Report an Issue</h3>
                <p>Submit details about the issue with location, description, and photos.</p>
            </div>
            <div class="step">
                <div class="step-icon">
                    <i class="fas fa-tasks"></i>
                </div>
                <h3>Track Progress</h3>
                <p>Follow the status of your reported issues as they get addressed.</p>
            </div>
            <div class="step">
                <div class="step-icon">
                    <i class="fas fa-check-circle"></i>
                </div>
                <h3>Issue Resolved</h3>
                <p>Get notified when your reported issues are successfully resolved.</p>
            </div>
        </div>
    </div>
</section>

<!-- Features Section -->
<section class="features">
    <div class="container">
        <div class="section-header">
            <h2>Our Features</h2>
            <p>Designed to make community improvement easy and effective</p>
        </div>
        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-map-marker-alt"></i>
                </div>
                <h3>Location Mapping</h3>
                <p>Precisely mark the location of issues on an interactive map for easy identification.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-camera"></i>
                </div>
                <h3>Photo Evidence</h3>
                <p>Upload photos of issues to provide visual evidence and context.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-bell"></i>
                </div>
                <h3>Status Updates</h3>
                <p>Receive real-time notifications about the progress of your reported issues.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-chart-bar"></i>
                </div>
                <h3>Community Analytics</h3>
                <p>Access data and insights about issues in your community.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-comments"></i>
                </div>
                <h3>Public Discussion</h3>
                <p>Engage in constructive discussions about community issues.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-users"></i>
                </div>
                <h3>Community Collaboration</h3>
                <p>Work together with neighbors to address local challenges.</p>
            </div>
        </div>
    </div>
</section>

<!-- Categories Section -->
<section class="categories">
    <div class="container">
        <div class="section-header">
            <h2>Issue Categories</h2>
            <p>We handle a wide range of community issues</p>
        </div>
        <div class="categories-grid">
            <div class="category-card">
                <div class="category-icon">
                    <i class="fas fa-road"></i>
                </div>
                <h3>Road Repair</h3>
                <p>Report potholes, damaged roads, and other road-related issues.</p>
            </div>
            <div class="category-card">
                <div class="category-icon">
                    <i class="fas fa-trash"></i>
                </div>
                <h3>Waste Management</h3>
                <p>Report garbage collection problems and illegal dumping.</p>
            </div>
            <div class="category-card">
                <div class="category-icon">
                    <i class="fas fa-lightbulb"></i>
                </div>
                <h3>Street Lighting</h3>
                <p>Report broken street lights and areas needing illumination.</p>
            </div>
            <div class="category-card">
                <div class="category-icon">
                    <i class="fas fa-tint"></i>
                </div>
                <h3>Water Supply</h3>
                <p>Report water leakages, contamination, and supply issues.</p>
            </div>
        </div>
    </div>
</section>

<!-- Testimonials Section -->
<section class="testimonials">
    <div class="container">
        <div class="section-header">
            <h2>What Our Users Say</h2>
            <p>Real stories from community members</p>
        </div>
        <div class="testimonials-slider">
            <div class="testimonial">
                <div class="testimonial-content">
                    <p>"CommunityFix Nepal helped us get a dangerous pothole fixed in our neighborhood within a week. The platform is easy to use and the response was quick!"</p>
                </div>
                <div class="testimonial-author">
                    <img src="${pageContext.request.contextPath}/assets/images/User-1.jpeg" alt="User Avatar" class="author-avatar">
                    <div class="author-info">
                        <h4>Ramesh Sharma</h4>
                        <p>Jhapa</p>
                    </div>
                </div>
            </div>
            <div class="testimonial">
                <div class="testimonial-content">
                    <p>"As a community leader, this platform has made it much easier to collect and address concerns from residents. The tracking feature keeps everyone informed."</p>
                </div>
                <div class="testimonial-author">
                    <img src="${pageContext.request.contextPath}/assets/images/User-2.jpeg" alt="User Avatar" class="author-avatar">
                    <div class="author-info">
                        <h4>Rohan Thapa</h4>
                        <p>Dharan</p>
                    </div>
                </div>
            </div>
            <div class="testimonial">
                <div class="testimonial-content">
                    <p>"The street light in our area was broken for months. After reporting it through CommunityFix Nepal, it was fixed within days. Highly recommended!"</p>
                </div>
                <div class="testimonial-author">
                    <img src="${pageContext.request.contextPath}/assets/images/User-3.jpeg" alt="User Avatar" class="author-avatar">
                    <div class="author-info">
                        <h4>Bikash Rai</h4>
                        <p>Biratnagar</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- CTA Section -->
<section class="cta">
    <div class="container">
        <div class="cta-content">
            <h2>Ready to Improve Your Community?</h2>
            <p>Join thousands of citizens making a difference across Nepal.</p>
            <a href="${pageContext.request.contextPath}/RegisterServlet" class="btn btn-primary btn-lg">Sign Up Now</a>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="footer">
    <div class="footer-container">
        <div class="footer-grid">
            <div class="footer-column">
                <h3>About Us</h3>
                <p style="color: rgba(255, 255, 255, 0.8); margin-bottom: 20px;">
                    Community Fix Nepal is dedicated to empowering citizens to report and address civic issues in their communities.
                </p>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>

            <div class="footer-column">
                <h3>Quick Links</h3>
                <ul class="footer-links">
                    <li><a href="${pageContext.request.contextPath}/index.jsp"><i class="fas fa-chevron-right"></i> Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/WEB-INF/view/about.jsp"><i class="fas fa-chevron-right"></i> About Us</a></li>
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Services</a></li>
                    <li><a href="${pageContext.request.contextPath}/LoginServlet"><i class="fas fa-chevron-right"></i> Reports</a></li>
                    <li><a href="${pageContext.request.contextPath}/WEB-INF/view/contact.jsp"><i class="fas fa-chevron-right"></i> Contact Us</a></li>
                </ul>
            </div>

            <div class="footer-column">
                <h3>Services</h3>
                <ul class="footer-links">
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Issue Reporting</a></li>
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Community Engagement</a></li>
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Issue Tracking</a></li>
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Civic Awareness</a></li>
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Data Analytics</a></li>
                </ul>
            </div>

            <div class="footer-column">
                <h3>Contact Us</h3>
                <div class="contact-info">
                    <i class="fas fa-map-marker-alt"></i>
                    <div>
                        <p>Sundarharaincha-5, Morang</p>
                        <p>Province 1, Nepal</p>
                    </div>
                </div>
                <div class="contact-info">
                    <i class="fas fa-phone-alt"></i>
                    <div>
                        <p>+977 9814363662</p>
                    </div>
                </div>
                <div class="contact-info">
                    <i class="fas fa-envelope"></i>
                    <div>
                        <p>support@communityfixnepal.org</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer-bottom">
            <p>&copy; 2025 Community Fix Nepal. All Rights Reserved. | Designed with <i class="fas fa-heart" style="color: #F9A826;"></i> for Nepal</p>
            <p style="margin-top: 10px;">
                <a href="#">Privacy Policy</a> |
                <a href="#">Terms of Service</a> |
                <a href="#">FAQ</a>
            </p>
        </div>
    </div>
</footer>
</body>
</html>
