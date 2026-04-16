package com.project.gajraavenu.repository.manager;

import com.project.gajraavenu.model.manager.residents;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ManagerRepository extends JpaRepository<residents, Long> {

    @Query("SELECT COUNT(r) FROM residents r")
    long countAllResidents();

    // Changed 'complaints' to match your entity class name if it is 'complaints'
    @Query("SELECT COUNT(c) FROM complaints c WHERE c.status != 'Resolved'")
    long countOpenComplaints();

    @Query("SELECT COUNT(v) FROM visitors v WHERE v.exitTime IS NULL")
    long countPendingVisitors();

    // If 'maintenance' class doesn't exist yet, comment this line out to bypass the error
    @Query("SELECT SUM(m.amount) FROM maintenance m WHERE m.status = 'Paid'")
    Double calculateTotalRevenue();
}