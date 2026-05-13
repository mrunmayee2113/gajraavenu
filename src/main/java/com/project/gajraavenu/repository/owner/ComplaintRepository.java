package com.project.gajraavenu.repository.owner;

import com.project.gajraavenu.model.owner.Complaint;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

/**
 * Repository interface for Owner-side complaint operations.
 */
@Repository
public interface ComplaintRepository extends JpaRepository<Complaint, Long> {

    /**
     * ✅ RECOMMENDED: This uses the 'User' object relationship
     * and sorts by ID so newest complaints appear first.
     */
    List<Complaint> findByUserIdOrderByIdDesc(Long userId);

    /**
     * ✅ MANUAL QUERY: Use this if the method above gives errors.
     * It explicitly looks inside the user object for the ID.
     */
    @Query("SELECT c FROM Complaint c WHERE c.user.id = :userId ORDER BY c.id DESC")
    List<Complaint> findByUserId(@Param("userId") Long userId);

    // Keep this for the Manager's view only
    List<Complaint> findAllByOrderByIdDesc();
}