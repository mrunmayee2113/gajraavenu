package com.project.gajraavenu.repository.manager;

import com.project.gajraavenu.model.manager.residents;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ManagerRepository extends JpaRepository<residents, Long> {

    // 👥 TOTAL RESIDENTS
    @Query("SELECT COUNT(r) FROM residents r")
    long countAllResidents();

    // ⚠ ACTIVE COMPLAINTS
    @Query("SELECT COUNT(c) FROM Complaint c WHERE c.status != 'Resolved'")
    long countOpenComplaints();

    // 🚪 PENDING VISITORS
    @Query("SELECT COUNT(v) FROM visitors v WHERE v.exitTime IS NULL")
    long countPendingVisitors();

    // 💰 TOTAL REVENUE
    @Query("SELECT SUM(m.totalAmount) FROM Maintenance m WHERE m.status = 'PAID'")
    Double calculateTotalRevenue();
}