package com.project.gajraavenu.model.landing;

import jakarta.persistence.*;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)
    private Long id;

    private String role;
    private String name;
    private String email;
    private String password;
    private String phone;
    private String wing;
    private String flatNumber;
    private String flat; // Keep this if you use it for "Flat Name", otherwise remove
    private String shift; // For security/staff users

    // ID
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    // Role
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    // Name
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    // Email
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    // Password (THIS FIXES YOUR ERROR)
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    // Phone
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    // Wing
    public String getWing() { return wing; }
    public void setWing(String wing) { this.wing = wing; }

    // Flat Number
    public String getFlatNumber() { return flatNumber; }
    public void setFlatNumber(String flatNumber) { this.flatNumber = flatNumber; }

    // Flat (Optional combined field)
    public String getFlat() { return flat; }
    public void setFlat(String flat) { this.flat = flat; }

    // Shift
    public String getShift() { return shift; }
    public void setShift(String shift) { this.shift = shift; }
}