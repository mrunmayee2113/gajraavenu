package com.project.gajraavenu.repository.manager;

import com.project.gajraavenu.model.manager.visitors;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ManagerVisitorRepository extends JpaRepository<visitors, Long> {
        // Replaces findAllVisitors() with DESC ordering
        List<visitors> findAllByOrderByEntryTimeDesc();
    }
