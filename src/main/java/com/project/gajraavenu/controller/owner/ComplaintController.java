package com.project.gajraavenu.controller.owner;

import com.project.gajraavenu.model.landing.User;
import com.project.gajraavenu.model.owner.Complaint;
import com.project.gajraavenu.repository.owner.ComplaintRepository;
import com.project.gajraavenu.service.owner.ComplaintService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/owner")   // 🔥 IMPORTANT
public class ComplaintController {

    @Autowired
    private ComplaintService complaintService;
    @Autowired
    private ComplaintRepository complaintRepo;
    // DASHBOARD COMPLAINTS
    @GetMapping("/complaints")
    public String showDashboard(HttpSession session, Model model) {

        User user = (User) session.getAttribute("loggedUser");
        if (user == null) return "redirect:/login";

        List<Complaint> complaintsList =
                complaintService.getComplaintsByUserId(user.getId());

        model.addAttribute("complaints", complaintsList);

        return "owner/owner_dashboard";
    }

    // 🔥 RAISE COMPLAINT PAGE
    @GetMapping("/raise-complaint")
    public String showComplaintPage(HttpSession session, Model model) {

        User user = (User) session.getAttribute("loggedUser");
        if (user == null) return "redirect:/login";

        model.addAttribute("complaint", new Complaint());

        List<Complaint> complaintsList =
                complaintService.getComplaintsByUserId(user.getId());

        model.addAttribute("complaints", complaintsList);

        return "owner/raise_complaint";
    }

    // SUBMIT
    @PostMapping("/submit-complaint") // This + Class level /owner = /owner/submit-complaint
    public String submitComplaint(@ModelAttribute Complaint complaint, HttpSession session) {
        User loggedUser = (User) session.getAttribute("loggedUser");

        if (loggedUser == null) {
            return "redirect:/login";
        }

        // ✅ STRICT PRIVACY: Link the complaint ONLY to the logged-in user
        complaint.setUser(loggedUser);

        // Set defaults
        if (complaint.getStatus() == null) complaint.setStatus("Pending");
        if (complaint.getDate() == null || complaint.getDate().isEmpty()) {
            complaint.setDate(java.time.LocalDate.now().toString());
        }

        complaintRepo.save(complaint);

        // ✅ REDIRECT: Go back to the dashboard to see YOUR complaints
        return "redirect:/dashboard";
    }

    // EDIT
    @GetMapping("/edit-complaint/{id}")
    public String editComplaint(@PathVariable Long id,
                                HttpSession session,
                                Model model) {

        User user = (User) session.getAttribute("loggedUser");
        if (user == null) return "redirect:/login";

        Complaint existing = complaintService.getComplaintById(id);
        model.addAttribute("complaint", existing);

        List<Complaint> complaintsList =
                complaintService.getComplaintsByUserId(user.getId());

        model.addAttribute("complaints", complaintsList);

        return "owner/raise_complaint";
    }

    // DELETE
    @GetMapping("/delete-complaint/{id}")
    public String deleteComplaint(@PathVariable Long id) {
        complaintService.deleteComplaint(id);
        return "redirect:/owner/raise-complaint";
    }


}

