package com.communityfix.util;

public class ValidationUtil {
    public static void validateUsername(String username) {
        if (username == null || username.trim().isEmpty() || username.length() > 20) {
            throw new IllegalArgumentException("Username must be 1-20 characters");
        }
        if (!username.matches("^[a-zA-Z0-9]+$")) {
            throw new IllegalArgumentException("Username must be alphanumeric");
        }
    }

    public static void validatePassword(String password) {
        if (password == null || password.length() < 6) {
            throw new IllegalArgumentException("Password must be at least 6 characters");
        }
    }

    public static void validateEmail(String email) {
        if (email != null && !email.isEmpty() && !email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            throw new IllegalArgumentException("Invalid email format");
        }
    }
}