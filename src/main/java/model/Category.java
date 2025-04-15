package model;

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
}

