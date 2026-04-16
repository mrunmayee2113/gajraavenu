package com.project.gajraavenu.service.owner;

import com.project.gajraavenu.model.owner.Notice;
import com.project.gajraavenu.repository.owner.NoticeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class NoticeService {
    @Autowired
    private NoticeRepository noticeRepository;

    public List<Notice> getAllNotices() {
        return noticeRepository.findAll();
    }
}
