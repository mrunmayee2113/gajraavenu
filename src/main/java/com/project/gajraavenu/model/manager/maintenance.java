package com.project.gajraavenu.model.manager;

import jakarta.persistence.*;

@Entity
@Table(name = "maintenance") // Matches your database table
public class maintenance {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Double amount;
    private String status; // Should be 'Paid' or 'Pending'

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Double getAmount() { return amount; }
    public void setAmount(Double amount) { this.amount = amount; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}