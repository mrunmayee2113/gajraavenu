package com.project.gajraavenu.model.manager;

import jakarta.persistence.*;

@Entity
@Table(name = "maintenance")
public class Maintenance {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String flatNumber;      // To link the bill to a specific owner
    private String ownerName;       // For the "Flat Record" card
    private String billingMonth;    // e.g., "February 2026"

    // Breakdown fields for the "Bill Summary" section
    private Double monthlyMaintenance;
    private Double parkingCharges;
    private Double waterCharges;

    private Double totalAmount;     // The sum of the three charges above
    private String status;          // 'Paid' or 'Pending'

    // Default Constructor
    public Maintenance() {}

    // Helper method to calculate total before saving
    @PrePersist
    @PreUpdate
    public void calculateTotal() {
        this.totalAmount = (monthlyMaintenance != null ? monthlyMaintenance : 0.0) +
                (parkingCharges != null ? parkingCharges : 0.0) +
                (waterCharges != null ? waterCharges : 0.0);
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getFlatNumber() { return flatNumber; }
    public void setFlatNumber(String flatNumber) { this.flatNumber = flatNumber; }

    public String getOwnerName() { return ownerName; }
    public void setOwnerName(String ownerName) { this.ownerName = ownerName; }

    public String getBillingMonth() { return billingMonth; }
    public void setBillingMonth(String billingMonth) { this.billingMonth = billingMonth; }

    public Double getMonthlyMaintenance() { return monthlyMaintenance; }
    public void setMonthlyMaintenance(Double monthlyMaintenance) { this.monthlyMaintenance = monthlyMaintenance; }

    public Double getParkingCharges() { return parkingCharges; }
    public void setParkingCharges(Double parkingCharges) { this.parkingCharges = parkingCharges; }

    public Double getWaterCharges() { return waterCharges; }
    public void setWaterCharges(Double waterCharges) { this.waterCharges = waterCharges; }

    public Double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(Double totalAmount) { this.totalAmount = totalAmount; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}