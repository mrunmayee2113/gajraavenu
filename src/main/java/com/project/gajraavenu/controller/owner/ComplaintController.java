package com.project.gajraavenu.controller.owner;

import com.project.gajraavenu.model.owner.Complaint;
import com.project.gajraavenu.service.owner.ComplaintService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDate;
import java.util.List;
@Controller
public class ComplaintController {
    @Autowired
    private ComplaintService complaintService;

    @GetMapping("/raise-complaint")
    public String showComplaintPage(Model model) {
        List<Complaint> complaints = complaintService.getAllComplaints();
        model.addAttribute("complaints", complaints);
        return "owner/raise_complaint";
    }

    @PostMapping("/submit-complaint")
    public String submitComplaint(@ModelAttribute Complaint complaint) {
        complaint.setDate(LocalDate.now().toString());
        complaint.setStatus("Pending");
        complaintService.saveComplaint(complaint);
        return "redirect:/raise-complaint";
    }

    // This handles the Service Page request
    @GetMapping("/service")
    public String showServicePage() {
        // Path: WEB-INF/views/owner/Service.jsp
        return "owner/Service";
    }
    @GetMapping("/dashboard")
    public String showDashboard(Model model) {
        // This points to WEB-INF/views/owner/owner_dashboard.jsp
        return "owner/owner_dashboard";
    }
}
