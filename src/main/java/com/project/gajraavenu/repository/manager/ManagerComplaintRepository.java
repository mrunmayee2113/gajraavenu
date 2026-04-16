package com.project.gajraavenu.repository.manager;

import com.project.gajraavenu.model.manager.complaints;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ManagerComplaintRepository extends JpaRepository<complaints, Long> {
    // Replaces getAllComplaints()
    List<complaints> findAllByOrderByDateFiledDesc();
}