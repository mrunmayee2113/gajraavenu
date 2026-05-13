package com.project.gajraavenu.model.manager;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "complaints")
public class complaints {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Field names updated to match your Controller/JSP logic
    private String location;      // Used for Flat Number
    private String category;

    @Column(columnDefinition = "TEXT")
    private String description;

    private String status = "Pending"; // Default status for new entries

    // Using String to match the date format in your existing form submissions
    private String date = LocalDate.now().toString();

    // Default Constructor
    public complaints() {}

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}