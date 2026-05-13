package com.project.gajraavenu.repository.landing;

import com.project.gajraavenu.model.landing.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    /**
     * 1. AUTHENTICATION & PROFILE
     */
    Optional<User> findByEmail(String email);

    /**
     * 2. MANAGER DASHBOARD WING CARDS
     */
    List<User> findByRoleAndWing(String role, String wing);
    User findByFlatNumber(String flatNumber);    /**
     * 3. STAFF / SECURITY LOOKUP
     */
    Optional<User> findFirstByRole(String role);

    /**
     * 4. UNIT SEARCH
     */
//    List<User> findByFlatNumber(String flatNumber);

    /**
     * 5. GENERAL ROLE FETCH
     */
    List<User> findByRole(String role);

    /**
     * 6. DASHBOARD STATS
     * Used to count total residents for the Manager Dashboard.
     */
    long countByRole(String role);
}