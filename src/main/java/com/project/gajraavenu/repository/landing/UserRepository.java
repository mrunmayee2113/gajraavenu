package com.project.gajraavenu.repository.landing;
import com.project.gajraavenu.model.landing.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email);
    Optional<User> findByFlat(String flat);
    Optional<User> findByRole(String role);
    Optional<User> findById(Long id);
}


