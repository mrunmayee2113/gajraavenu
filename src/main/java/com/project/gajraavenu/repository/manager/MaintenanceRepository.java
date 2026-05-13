package com.project.gajraavenu.repository.manager;

import com.project.gajraavenu.model.manager.Maintenance;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MaintenanceRepository extends JpaRepository<Maintenance, Long> {

    // 1. Flexible Search: Matches "110" to "A-110" or "B-110"
//    @Query("SELECT m FROM Maintenance m WHERE m.flatNumber LIKE %:flatNo% ORDER BY m.id DESC")
//    List<Maintenance> findAllByFlatNumberFlexible(@Param("flatNo") String flatNo);

    // 2. Strict Search: Used for exact matches, ignoring spaces/case
    @Query("SELECT m FROM Maintenance m WHERE TRIM(UPPER(m.flatNumber)) = TRIM(UPPER(:flatNo))")
    Maintenance findByFlatNumberIgnoreCase(@Param("flatNo") String flatNo);

    // 3. Status Search: Helpful for finding only 'Pending' bills
    Maintenance findTopByFlatNumberContainingAndStatusOrderByIdDesc(String flatNumber, String status);
    @Query(value = "SELECT * FROM maintenance WHERE flat_number LIKE CONCAT('%', ?1, '%') ORDER BY id DESC", nativeQuery = true)
    List<Maintenance> findAllByFlatNumberFlexible(String flatNo);
}