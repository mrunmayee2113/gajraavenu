package com.project.gajraavenu.service.owner;

import com.project.gajraavenu.model.manager.notices; // Import manager's model
import com.project.gajraavenu.repository.manager.ManagerNoticeRepository; // Import manager's repo
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class NoticeService {
    @Autowired
    private ManagerNoticeRepository noticeRepo;

    public List<notices> getAllNotices() {
        return noticeRepo.findAll();
    }
}