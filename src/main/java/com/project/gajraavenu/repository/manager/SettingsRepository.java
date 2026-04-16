package com.project.gajraavenu.repository.manager;

import com.project.gajraavenu.model.manager.settings;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SettingsRepository extends JpaRepository<settings, Long> {
    // No code needed here, Spring handles the rest!
}