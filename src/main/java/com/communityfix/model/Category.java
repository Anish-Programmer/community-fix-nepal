package com.communityfix.model;

public class Category {
    // attributes
    private int id;
    private String name;
    private String description;

    // empty constructor
    public Category() {}

    // parameterized constructor
    public Category(int id, String name, String description) {
        this.id = id;
        this.name = name;
        this.description = description;
    }

    // convience constructor
    public Category(String name, String description) {
        this.name = name;
        this.description = description;
    }

    // getter and setter methods
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public static class Inquiry {
        // attributes
        private int id;
        private String name;
        private String email;
        private String message;
        private String submittedAt;

        // empty constructor
        public Inquiry() {}

        // parameterized constructor
        public Inquiry(int id, String name, String email, String message, String submittedAt) {
            this.id = id;
            this.name = name;
            this.email = email;
            this.message = message;
            this.submittedAt = submittedAt;
        }

        // convience constructor
        public Inquiry(String name, String email, String message, String submittedAt) {
            this.name = name;
            this.email = email;
            this.message = message;
            this.submittedAt = submittedAt;
        }

        // getter and setter methods
        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public String getMessage() {
            return message;
        }

        public void setMessage(String message) {
            this.message = message;
        }

        public String getSubmittedAt() {
            return submittedAt;
        }

        public void setSubmittedAt(String submittedAt) {
            this.submittedAt = submittedAt;
        }
    }
}

