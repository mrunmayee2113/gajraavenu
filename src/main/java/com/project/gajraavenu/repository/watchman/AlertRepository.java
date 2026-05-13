package com.project.gajraavenu.repository.watchman;

import com.project.gajraavenu.model.watchman.Alert;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AlertRepository extends JpaRepository<Alert, Long> {
}
