package com.project.gajraavenu.repository.manager;

import com.project.gajraavenu.model.manager.notices;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ManagerNoticeRepository extends JpaRepository<notices, Long> {
    // This allows both Manager and Owner to see latest notices at the top
    List<notices> findAllByOrderByDateDesc();

}
