<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Community Fix Nepal</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="contact.css">
</head>
<body>
<!-- Header -->
<header class="header">
    <div class="header-container">
        <div class="logo">
            <img src="/Images/Logo.png" alt="CommunityFix Nepal Logo">
            <span class="logo-text">Community Fix Nepal</span>
        </div>

        <nav class="nav-menu">
            <a href="<%= request.getContextPath() %>/" class="nav-link">Home</a>
            <a href="<%= request.getContextPath() %>/about.jsp" class="nav-link">About</a>
            <a href="<%= request.getContextPath() %>/contact.jsp" class="nav-link active">Contact</a>
        </nav>

        <div class="auth-buttons">
            <a href="<%= request.getContextPath() %>/login.jsp" class="btn btn-outline">Login</a>
            <a href="<%= request.getContextPath() %>/register.jsp" class="btn btn-primary">Register</a>
        </div>

        <button class="mobile-menu-btn">
            <i class="fas fa-bars"></i>
        </button>
    </div>
</header>

<!-- Hero Section -->
<section class="hero">
    <div class="hero-overlay"></div>
    <div class="hero-content">
        <h1>Contact Us</h1>
        <p>We're here to help and answer any questions you might have</p>
    </div>
</section>

<!-- Contact Info Section -->
<section class="contact-info-section">
    <div class="container">
        <div class="info-cards">
            <div class="info-card">
                <div class="card-icon">
                    <i class="fas fa-map-marker-alt"></i>
                </div>
                <h3>Our Location</h3>
                <p>Sundarharaincha-5, Morang</p>
                <p>Province 1, Nepal</p>
            </div>

            <div class="info-card">
                <div class="card-icon">
                    <i class="fas fa-phone-alt"></i>
                </div>
                <h3>Phone Number</h3>
                <p>+977 9814363662</p>
                <p>Monday to Friday, 9am to 5pm</p>
            </div>

            <div class="info-card">
                <div class="card-icon">
                    <i class="fas fa-envelope"></i>
                </div>
                <h3>Email Address</h3>
                <p>support@communityfixnepal.org</p>
                <p>info@communityfixnepal.org</p>
            </div>
        </div>
    </div>
</section>

<!-- Contact Form Section -->
<section class="contact-form-section">
    <div class="container">
        <div class="contact-grid">
            <div class="form-container">
                <div class="section-badge">Get In Touch</div>
                <h2>Send Us a Message</h2>
                <p>Fill out the form below and we'll get back to you as soon as possible.</p>

                <form class="contact-form" action="<%= request.getContextPath() %>/contact" method="post">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="name">Full Name</label>
                            <input type="text" id="name" name="name" placeholder="Your full name" required>
                        </div>

                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <input type="email" id="email" name="email" placeholder="Your email address" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="phone">Phone Number</label>
                        <input type="tel" id="phone" name="phone" placeholder="Your phone number">
                    </div>

                    <div class="form-group">
                        <label for="subject">Subject</label>
                        <input type="text" id="subject" name="subject" placeholder="What is this regarding?" required>
                    </div>

                    <div class="form-group">
                        <label for="message">Message</label>
                        <textarea id="message" name="message" rows="5" placeholder="Your message" required></textarea>
                    </div>

                    <button type="submit" class="btn btn-primary btn-lg">Send Message</button>
                </form>
            </div>

            <div class="map-container">
                <!-- Embedded Google Map showing Baneshwor, Kathmandu -->
                <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3532.2080431409247!2d85.32395931506156!3d27.70496798279492!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb19a7c6cd102b%3A0x78049640e89dd5d3!2sBaneshwor%2C%20Kathmandu%2044600!5e0!3m2!1sen!2snp!4v1617345678901!5m2!1sen!2snp"
                        width="100%"
                        height="800"
                        style="border:0;"
                        allowfullscreen=""
                        loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade">
                </iframe>
            </div>
        </div>
    </div>
</section>

<!-- FAQ Section -->
<section class="faq-section">
    <div class="container">
        <div class="section-header">
            <div class="section-badge">FAQ</div>
            <h2>Frequently Asked Questions</h2>
            <p>Find answers to the most common questions about CommunityFix Nepal.</p>
        </div>

        <div class="faq-grid">
            <div class="faq-item">
                <h3>How do I report an issue in my community?</h3>
                <p>To report an issue, you need to create an account on our platform. Once registered, you can click on the "Report Issue" button on the dashboard, fill in the details of the issue, and submit it. You can also attach photos to help illustrate the problem.</p>
            </div>

            <div class="faq-item">
                <h3>How long does it take for an issue to be resolved?</h3>
                <p>The resolution time varies depending on the nature and complexity of the issue. Once an issue is reported, it is forwarded to the relevant local authority. You can track the progress of your reported issue through your account dashboard.</p>
            </div>

            <div class="faq-item">
                <h3>Is CommunityFix Nepal available in all parts of Nepal?</h3>
                <p>Yes, CommunityFix Nepal is available across all provinces of Nepal. However, the level of integration with local authorities may vary by location. We are continuously working to establish partnerships with more local governments to improve our service.</p>
            </div>

            <div class="faq-item">
                <h3>How can I volunteer with CommunityFix Nepal?</h3>
                <p>We welcome volunteers who are passionate about community development. You can apply to volunteer by sending an email to volunteer@communityfixnepal.org with your resume and a brief note about why you want to join our mission.</p>
            </div>
        </div>
    </div>
</section>

<!-- Connect Section -->
<section class="connect-section">
    <div class="container">
        <div class="connect-content">
            <h2>Connect With Us</h2>
            <p>Follow us on social media to stay updated on our latest initiatives and community stories.</p>

            <div class="social-links">
                <a href="#" class="social-link">
                    <i class="fab fa-facebook-f"></i>
                    <span>Facebook</span>
                </a>
                <a href="#" class="social-link">
                    <i class="fab fa-twitter"></i>
                    <span>Twitter</span>
                </a>
                <a href="#" class="social-link">
                    <i class="fab fa-instagram"></i>
                    <span>Instagram</span>
                </a>
                <a href="#" class="social-link">
                    <i class="fab fa-linkedin-in"></i>
                    <span>LinkedIn</span>
                </a>
            </div>
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
                    <li><a href="<%= request.getContextPath() %>/"><i class="fas fa-chevron-right"></i> Home</a></li>
                    <li><a href="<%= request.getContextPath() %>/about.jsp"><i class="fas fa-chevron-right"></i> About Us</a></li>
                    <li><a href="<%= request.getContextPath() %>/services.jsp"><i class="fas fa-chevron-right"></i> Services</a></li>
                    <li><a href="<%= request.getContextPath() %>/reports.jsp"><i class="fas fa-chevron-right"></i> Reports</a></li>
                    <li><a href="<%= request.getContextPath() %>/contact.jsp"><i class="fas fa-chevron-right"></i> Contact Us</a></li>
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
            <p>&copy; 2025 CommunityFix Nepal. All Rights Reserved. | Designed with <i class="fas fa-heart" style="color: #F9A826;"></i> for Nepal</p>
            <p style="margin-top: 10px;">
                <a href="<%= request.getContextPath() %>/privacy-policy.jsp">Privacy Policy</a> |
                <a href="<%= request.getContextPath() %>/terms-of-service.jsp">Terms of Service</a> |
                <a href="<%= request.getContextPath() %>/faq.jsp">FAQ</a>
            </p>
        </div>
    </div>
</footer>
</body>
</html>
