<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Community Fix Nepal</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/about.css">
<%--</head>--%>
<body>
<!-- Header -->
<header class="header">
    <div class="header-container">
        <div class="logo">
            <img src="<%= request.getContextPath() %>/assets/images/logo.jpeg" alt="CommunityFix Nepal Logo">
            <span class="logo-text">CommunityFix</span>
        </div>

        <nav class="nav-menu">
            <a href="<%= request.getContextPath() %>/" class="nav-link">Home</a>
            <a href="<%= request.getContextPath() %>/AboutServlet" class="nav-link active">About</a>
            <a href="<%= request.getContextPath() %>/ContactServlet" class="nav-link">Contact</a>
        </nav>

        <div class="auth-buttons">
            <a href="<%= request.getContextPath() %>/LoginServlet" class="btn btn-outline">Login</a>
            <a href="<%= request.getContextPath() %>/RegisterServlet" class="btn btn-primary">Register</a>
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
        <h1 class="reveal-text">About Community Fix Nepal</h1>
        <p class="reveal-text">Empowering citizens to build better communities across Nepal</p>
    </div>
</section>

<!-- Mission Section -->
<section class="mission">
    <div class="container">
        <div class="mission-grid">
            <div class="mission-content">
                <div class="section-badge">Our Mission</div>
                <h2>Transforming Communities Through Civic Engagement</h2>
                <p>CommunityFix Nepal was founded with a simple yet powerful vision: to create a platform where citizens can actively participate in improving their communities.</p>
                <p>We believe that by providing the tools for citizens to report issues, track progress, and collaborate with local authorities, we can create more livable, sustainable, and inclusive communities across Nepal.</p>
                <div class="mission-stats">
                    <div class="stat-item">
                        <div class="stat-number">1,200+</div>
                        <div class="stat-label">Issues Reported</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">850+</div>
                        <div class="stat-label">Issues Resolved</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">25+</div>
                        <div class="stat-label">Communities</div>
                    </div>
                </div>
            </div>
            <div class="mission-image">
                <img src="<%= request.getContextPath() %>/assets/images/About.png" alt="Community Engagement">
                <div class="image-shape"></div>
            </div>
        </div>
    </div>
</section>

<!-- Values Section -->
<section class="values">
    <div class="container">
        <div class="section-header">
            <div class="section-badge">Our Values</div>
            <h2>Principles That Guide Us</h2>
            <p>At CommunityFix Nepal, our work is guided by a set of core values that define who we are and how we operate.</p>
        </div>

        <div class="values-grid">
            <div class="value-card animate">
                <div class="value-icon">
                    <i class="fas fa-handshake"></i>
                </div>
                <h3>Collaboration</h3>
                <p>We believe in the power of working together. Our platform connects citizens, local authorities, and community organizations to solve problems collectively.</p>
            </div>

            <div class="value-card animate">
                <div class="value-icon">
                    <i class="fas fa-lightbulb"></i>
                </div>
                <h3>Innovation</h3>
                <p>We continuously seek new and better ways to address community challenges, leveraging technology to create effective solutions.</p>
            </div>

            <div class="value-card animate">
                <div class="value-icon">
                    <i class="fas fa-lock"></i>
                </div>
                <h3>Transparency</h3>
                <p>We believe in open communication and accountability. Our platform provides clear visibility into the status and progress of reported issues.</p>
            </div>

            <div class="value-card animate">
                <div class="value-icon">
                    <i class="fas fa-users"></i>
                </div>
                <h3>Inclusivity</h3>
                <p>We strive to make our platform accessible to all citizens, regardless of their background, ensuring everyone has a voice in community improvement.</p>
            </div>
        </div>
    </div>
</section>

<!-- Journey Section -->
<section class="journey">
    <div class="container">
        <div class="section-header">
            <div class="section-badge">Our Journey</div>
            <h2>From Vision to Reality</h2>
            <p>The story of CommunityFix Nepal is one of growth, learning, and impact.</p>
        </div>

        <div class="timeline">
            <div class="timeline-item animate">
                <div class="timeline-dot"></div>
                <div class="timeline-date">2020</div>
                <div class="timeline-content">
                    <h3>The Beginning</h3>
                    <p>CommunityFix Nepal was conceptualized by a group of tech enthusiasts and civic-minded individuals who wanted to address the growing urban challenges in Nepal.</p>
                </div>
            </div>

            <div class="timeline-item animate">
                <div class="timeline-dot"></div>
                <div class="timeline-date">2021</div>
                <div class="timeline-content">
                    <h3>Pilot Launch</h3>
                    <p>The platform was launched as a pilot project in Dharan, allowing citizens to report issues in their neighborhoods.</p>
                </div>
            </div>

            <div class="timeline-item animate">
                <div class="timeline-dot"></div>
                <div class="timeline-date">2022</div>
                <div class="timeline-content">
                    <h3>Expansion</h3>
                    <p>After a successful pilot, CommunityFix Nepal expanded to other major cities in Nepal, including Biratnagar, Jhapa, and Illam.</p>
                </div>
            </div>

            <div class="timeline-item animate">
                <div class="timeline-dot"></div>
                <div class="timeline-date">2023</div>
                <div class="timeline-content">
                    <h3>Partnership with Local Governments</h3>
                    <p>We established formal partnerships with several local governments, enhancing the platform's effectiveness in resolving reported issues.</p>
                </div>
            </div>

            <div class="timeline-item animate">
                <div class="timeline-dot"></div>
                <div class="timeline-date">2024</div>
                <div class="timeline-content">
                    <h3>Nationwide Coverage</h3>
                    <p>CommunityFix Nepal now covers all provinces of Nepal, making it the largest civic engagement platform in the country.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Team Section -->
<section class="team">
    <div class="container">
        <div class="section-header">
            <div class="section-badge">Our Team</div>
            <h2>Meet the People Behind CommunityFix</h2>
            <p>Our diverse team brings together expertise in technology, community development, and public policy.</p>
        </div>

        <div class="team-grid">
            <!-- team members ... -->
            <div class="team-member animate">
                <div class="member-image">
                    <img src="<%= request.getContextPath() %>/assets/images/kushi_profile_picture.jpg" alt="Kushi Bohora">
                    <div class="member-social">
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fas fa-envelope"></i></a>
                    </div>
                </div>
                <div class="member-info">
                    <h3>Khushi Bohora</h3>
                    <p class="member-role">Customer Service</p>
                    <p class="member-location"></p>
                </div>
            </div>

            <div class="team-member animate">
                <div class="member-image">
                    <img src="<%= request.getContextPath() %>/assets/images/pratikshya_profile_picture.jpg" alt="Pratikshya Dahal ">
                    <div class="member-social">
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fas fa-envelope"></i></a>
                    </div>
                </div>
                <div class="member-info">
                    <h3>Pratikshya Dahal</h3>
                    <p class="member-role">Marketing</p>
                    <p class="member-location"></p>
                </div>
            </div>

            <div class="team-member animate">
                <div class="member-image">
                    <img src="<%= request.getContextPath() %>/assets/images/samir_profile_picture.jpg" alt="Samir Bhandari">
                    <div class="member-social">
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fas fa-envelope"></i></a>
                    </div>
                </div>
                <div class="member-info">
                    <h3>Samir Bhandari</h3>
                    <p class="member-role">Founder & CEO</p>
                    <p class="member-location">Sundarharaincha-5, Morang</p>
                </div>
            </div>


            <div class="team-member animate">
                <div class="member-image">
                    <img src="<%= request.getContextPath() %>/assets/images/Bipan.jpg" alt="Bipan Thapa">
                    <div class="member-social">
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fas fa-envelope"></i></a>
                    </div>
                </div>
                <div class="member-info">
                    <h3>Bipan Thapa</h3>
                    <p class="member-role">Member</p>
                    <p class="member-location"></p>
                </div>
            </div>

            <div class="team-member animate">
                <div class="member-image">
                    <img src="<%= request.getContextPath() %>/assets/images/anish_profile_picture.jpg" alt="Anish Tamang">
                    <div class="member-social">
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fas fa-envelope"></i></a>
                    </div>
                </div>
                <div class="member-info">
                    <h3>Anish Tamang</h3>
                    <p class="member-role">Chief Technology Officer</p>
                    <p class="member-location"></p>
                </div>
            </div>




        </div>
    </div>
</section>

<!-- Partners Section -->
<section class="partners">
    <div class="container">
        <div class="section-header">
            <div class="section-badge">Our Partners</div>
            <h2>Collaborating for Change</h2>
            <p>We work with a diverse range of organizations to maximize our impact.</p>
        </div>

        <div class="partners-grid">
            <div class="partner-logo animate">
                <img src="<%= request.getContextPath() %>/assets/images/User-3.jpeg" alt="Partner 1">
            </div>
            <div class="partner-logo animate">
                <img src="<%= request.getContextPath() %>/assets/images/User-1.jpeg" alt="Partner 2">
            </div>
            <div class="partner-logo animate">
                <img src="<%= request.getContextPath() %>/assets/images/" alt="Partner 3">
            </div>
            <div class="partner-logo animate">
                <img src="<%= request.getContextPath() %>/assets/images/" alt="Partner 4">
            </div>
        </div>
    </div>
</section>

<!-- CTA Section -->
<section class="cta">
    <div class="container">
        <div class="cta-content">
            <h2>Join Our Mission</h2>
            <p>Be part of the movement to transform communities across Nepal.</p>
            <div class="cta-buttons">
                <a href="<%= request.getContextPath() %>/RegisterServlet" class="btn btn-primary btn-lg">Get Started</a>
                <a href="<%= request.getContextPath() %>/ContactServlet" class="btn btn-outline btn-lg">Contact Us</a>
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
                    <li><a href="/"><i class="fas fa-chevron-right"></i> Home</a></li>
                    <li><a href="/AboutServlet"><i class="fas fa-chevron-right"></i> About Us</a></li>
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Services</a></li>
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Reports</a></li>
                    <li><a href="ContactServlet"><i class="fas fa-chevron-right"></i> Contact Us</a></li>
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