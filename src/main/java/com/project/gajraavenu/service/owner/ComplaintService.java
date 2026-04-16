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

    public void saveComplaint(Complaint complaint) {
        complaintRepository.save(complaint);
    }

    public List<Complaint> getAllComplaints() {
        return complaintRepository.findAll();
    }
}
