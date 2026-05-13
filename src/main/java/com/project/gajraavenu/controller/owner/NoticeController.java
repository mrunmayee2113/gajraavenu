package com.project.gajraavenu.controller.owner;


import com.project.gajraavenu.model.manager.notices;
import com.project.gajraavenu.service.owner.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.List;

@Controller
public class NoticeController {

    @Autowired
    private NoticeService service;

    @GetMapping("/notice")
    public String viewOwnerNotices(Model model) {
        // Now returns the correct List type from manager's service
        List<notices> list = service.getAllNotices();
        model.addAttribute("notices", list);
        return "owner/Owner_notice";
    }

}