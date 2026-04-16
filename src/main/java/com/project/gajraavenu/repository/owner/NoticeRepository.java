package com.project.gajraavenu.repository;

import com.project.gajraavenu.model.Notice;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface NoticeRepository extends JpaRepository<Notice, Long> {
    // Sort so newest notices appear first for Owners and Watchmen
    List<Notice> findAllByOrderByDateDesc();
}