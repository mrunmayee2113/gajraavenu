package com.project.gajraavenu.repository.owner;

import com.project.gajraavenu.model.owner.Notice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface NoticeRepository extends JpaRepository<Notice, Long> {
    // This ensures owners see the newest updates at the top
    List<Notice> findAllByOrderByDateDesc();
}