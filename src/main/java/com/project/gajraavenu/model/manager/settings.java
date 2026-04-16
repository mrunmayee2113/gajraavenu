package com.project.gajraavenu.model.manager;

import jakarta.persistence.*;

@Entity
public class settings {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String societyName;
    private String registrationNumber;
    private String maintenanceRate;
    private String dueDate;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getSocietyName() { return societyName; }
    public void setSocietyName(String societyName) { this.societyName = societyName; }
    public String getRegistrationNumber() { return registrationNumber; }
    public void setRegistrationNumber(String registrationNumber) { this.registrationNumber = registrationNumber; }
    public String getMaintenanceRate() { return maintenanceRate; }
    public void setMaintenanceRate(String maintenanceRate) { this.maintenanceRate = maintenanceRate; }
    public String getDueDate() { return dueDate; }
    public void setDueDate(String dueDate) { this.dueDate = dueDate; }
}