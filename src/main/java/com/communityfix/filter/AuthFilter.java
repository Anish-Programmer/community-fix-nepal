package com.communityfix.filter;

import com.communityfix.model.User;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(urlPatterns = {"/AdminDashboardServlet", "/UserDashboardServlet", "/profile"})
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        String path = req.getServletPath();
        String contextPath = req.getContextPath();

        // Allow public access to index.jsp, LoginServlet, RegisterServlet, and static pages
        if ("/index.jsp".equals(path) ||
                "/LoginServlet".equals(path) ||
                "/RegisterServlet".equals(path) ||
                "/about".equals(path) ||
                "/contact".equals(path) ||
                "/LogoutServlet".equals(path) ||  // Add this line
                path.startsWith("/assets/")) {
            chain.doFilter(request, response);
            return;
        }

        // Check if user is authenticated
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(contextPath + "/LoginServlet?error=Please log in");
            return;
        }

        // Check user role for role-based access
        User user = (User) session.getAttribute("user");

        // Admin-only access
        if ("/AdminDashboardServlet".equals(path)) {
            if (user.getRole() != User.Role.ADMIN) {
                resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Access denied: Admins only");
                return;
            }
        }

        // Citizen-only access
        if ("/UserDashboardServlet".equals(path)) {
            if (user.getRole() != User.Role.CITIZEN) {
                resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Access denied: Citizens only");
                return;
            }
        }

        // Profile page can be accessed by both roles
        if ("/profile".equals(path)) {
            // No additional role check needed; both admins and citizens can access
            chain.doFilter(request, response);
            return;
        }

        // If no specific restrictions apply, proceed
        chain.doFilter(request, response);
    }
}