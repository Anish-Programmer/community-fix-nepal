package model;

public class Inquiry {
    private int id;
    private String name;
    private String email;
    private String message;
    private String submittedAt;

    public Inquiry() {}

    public Inquiry(int id, String name, String email, String message, String submittedAt) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.message = message;
        this.submittedAt = submittedAt;
    }

    public Inquiry(String name, String email, String message, String submittedAt) {
        this.name = name;
        this.email = email;
        this.message = message;
        this.submittedAt = submittedAt;
    }

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
