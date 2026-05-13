package com.project.gajraavenu.model.watchman;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "alerts") // optional but good
public class Alert {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;   // ✅ REQUIRED PRIMARY KEY

    @Column(columnDefinition = "TEXT")
    private String message;

    private LocalDateTime createdAt;

    // ✅ getters & setters

    public Long getId() {
        return id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}