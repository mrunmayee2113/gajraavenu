package com.project.gajraavenu.controller.owner;


import com.project.gajraavenu.model.owner.Notice;
import com.project.gajraavenu.service.owner.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.List;

@Controller
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    // Mapping for the full Notice Board
    @GetMapping("/notice")
    public String viewNotices(Model model) {
        List<Notice> list = noticeService.getAllNotices();
        model.addAttribute("notices", list);
        return "owner/Owner_notice";
    }

    // Mapping for Society Updates (Fixes the 404 error)
    @GetMapping("/societyUpdates")
    public String viewSocietyUpdates(Model model) {
        List<Notice> list = noticeService.getAllNotices();
        model.addAttribute("notices", list);
        return "owner/societyUpdates";
    }
}