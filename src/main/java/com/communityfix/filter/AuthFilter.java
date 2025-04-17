package com.communityfix.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter(urlPatterns = {"/WEB-INF/view/*"})
public class AuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        String path = req.getServletPath();
        String contextPath = req.getContextPath();

        // Allow public access to index.jsp, LoginServlet, RegisterServlet
        if ("/index.jsp".equals(path) || "/LoginServlet".equals(path) || "/RegisterServlet".equals(path)) {
            chain.doFilter(request, response);
            return;
        }

        // Redirect to LoginServlet if not authenticated
        if (req.getSession().getAttribute("user") == null) {
            resp.sendRedirect(contextPath + "/LoginServlet?error=Please log in");
            return;
        }

        chain.doFilter(request, response);
    }
}