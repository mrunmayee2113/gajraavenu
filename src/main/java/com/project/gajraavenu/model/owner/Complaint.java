package com.project.gajraavenu.model.owner;

import com.project.gajraavenu.model.landing.User;
import jakarta.persistence.*;

@Entity
@Table(name = "complaints")
public class Complaint {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // ✅ This is the correct way to link the user.
    // Delete 'private Long userId' entirely!
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    private String category;
    private String location;

    @Column(columnDefinition = "TEXT")
    private String description;

    private String date;
    private String status = "Pending";

    public Complaint() {}

    // Updated constructor to use the User object
    public Complaint(User user, String category, String location, String description, String date, String status) {
        this.user = user;
        this.category = category;
        this.location = location;
        this.description = description;
        this.date = date;
        this.status = status;
    }

    // --- Getters and Setters ---

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}