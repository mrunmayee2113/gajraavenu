package com.project.gajraavenu.service.owner;

import com.project.gajraavenu.model.owner.Complaint;
import com.project.gajraavenu.repository.owner.ComplaintRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ComplaintService {

    @Autowired
    private ComplaintRepository complaintRepository;

    /**
     * ✅ NEW: Retrieves only the complaints for a specific user.
     * This ensures User A cannot see User B's data.
     */
    public List<Complaint> getComplaintsByUserId(Long userId) {
        return complaintRepository.findByUserIdOrderByIdDesc(userId);
    }

    /**
     * Retrieves the list of all complaints (Used by Manager only).
     */
    public List<Complaint> getAllComplaints() {
        return complaintRepository.findAll();
    }

    /**
     * Saves or Updates a complaint object in the database.
     */
    public void saveComplaint(Complaint complaint) {
        complaintRepository.save(complaint);
    }

    /**
     * Finds a specific complaint by its ID.
     */
    public Complaint getComplaintById(Long id) {
        return complaintRepository.findById(id).orElse(null);
    }

    /**
     * Deletes a complaint from the database using its ID.
     */
    public void deleteComplaint(Long id) {
        complaintRepository.deleteById(id);
    }
}