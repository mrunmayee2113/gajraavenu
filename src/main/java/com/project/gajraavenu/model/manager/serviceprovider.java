package com.project.gajraavenu.model.manager;

import jakarta.persistence.*;

@Entity
public class serviceprovider {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String serviceType;
    private String contact;
    private String location;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getServiceType() { return serviceType; }
    public void setServiceType(String serviceType) { this.serviceType = serviceType; }
    public String getContact() { return contact; }
    public void setContact(String contact) { this.contact = contact; }
    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }
}