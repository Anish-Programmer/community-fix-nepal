package com.communityfix.util;

public class PasswordGenerator {
    public static void main(String[] args) {
        String plainPassword = "admin123";
        String hashedPassword = PasswordUtil.hashPassword(plainPassword);
        System.out.println("Hashed Password: " + hashedPassword);
    }
}
