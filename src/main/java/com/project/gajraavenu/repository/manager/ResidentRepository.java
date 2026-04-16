package com.project.gajraavenu.repository.manager;

import com.project.gajraavenu.model.manager.residents;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ResidentRepository extends JpaRepository<residents, Long> {
        // Replaces findResidentsByWing
        List<residents> findByWing(String wing);
    }

