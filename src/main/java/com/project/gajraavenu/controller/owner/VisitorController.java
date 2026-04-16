package com.project.gajraavenu.controller.owner;

import com.project.gajraavenu.model.owner.Visitor;
import com.project.gajraavenu.service.owner.VisitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class VisitorController {

    @Autowired
    private VisitorService visitorService;

    // 1. URL to open the "Add Visitor" page
    @GetMapping("/add-visitor")
    public String showAddVisitorForm() {
        return "owner/addVisitor";
    }

    // 2. URL to handle the FORM SUBMISSION (Saves to DB)
    @PostMapping("/process-visitor")
    public String processVisitorForm(@ModelAttribute Visitor visitor) {
        visitorService.saveVisitor(visitor);
        return "redirect:/visitor-history"; // Redirects to table view after saving
    }

    // 3. URL to show the list of all visitors
    @GetMapping("/visitor-history")
    public String showVisitorHistory(Model model) {
        model.addAttribute("visitors", visitorService.getAllVisitors());
        return "owner/visitorHistory";
    }
}