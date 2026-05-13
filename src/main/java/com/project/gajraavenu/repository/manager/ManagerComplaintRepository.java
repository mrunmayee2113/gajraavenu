package com.project.gajraavenu.repository.manager;

import com.project.gajraavenu.model.owner.Complaint;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

/**
 * Repository interface for Manager-side complaint operations.
 * Linked to the same 'complaints' table used by the Owner side.
 */
@Repository
public interface ManagerComplaintRepository extends JpaRepository<Complaint, Long> {

    /**
     * Retrieves all complaints ordered by ID in descending order.
     * This ensures the latest complaints appear first on the Manager Dashboard.
     */
    List<Complaint> findAllByOrderByIdDesc();
    long countByStatus(String status);
}