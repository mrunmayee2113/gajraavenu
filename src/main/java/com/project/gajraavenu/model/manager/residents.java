package com.project.gajraavenu.model.manager;

import jakarta.persistence.*;

@Entity
public class residents {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String wing;
    private String flatNumber;
    private String ownerName;
    private String contact;
    private String email;
    private String membersCount;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getWing() { return wing; }
    public void setWing(String wing) { this.wing = wing; }
    public String getFlatNumber() { return flatNumber; }
    public void setFlatNumber(String flatNumber) { this.flatNumber = flatNumber; }
    public String getOwnerName() { return ownerName; }
    public void setOwnerName(String ownerName) { this.ownerName = ownerName; }
    public String getContact() { return contact; }
    public void setContact(String contact) { this.contact = contact; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getMembersCount() { return membersCount; }
    public void setMembersCount(String membersCount) { this.membersCount = membersCount; }
}