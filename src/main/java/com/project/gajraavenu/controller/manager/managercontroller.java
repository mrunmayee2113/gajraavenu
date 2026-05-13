package com.project.gajraavenu.controller.manager;

import com.project.gajraavenu.model.landing.User;
import com.project.gajraavenu.model.manager.*;
import com.project.gajraavenu.model.owner.Complaint;
import com.project.gajraavenu.model.watchman.Entry;
import com.project.gajraavenu.repository.landing.UserRepository;
import com.project.gajraavenu.repository.manager.ExpenseRepository;
import com.project.gajraavenu.repository.manager.MaintenanceRepository;
import com.project.gajraavenu.repository.owner.ComplaintRepository;
import com.project.gajraavenu.repository.watchman.AlertRepository;
import com.project.gajraavenu.service.landing.UserService;
import com.project.gajraavenu.service.manager.managerservice;
import com.project.gajraavenu.service.watchman.EntryService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/manager")
public class managercontroller {


    @Autowired private managerservice service;
    @Autowired private UserRepository userRepo;
    @Autowired private ComplaintRepository complaintRepository;
    @Autowired private UserService userService;
    @Autowired private MaintenanceRepository maintenanceRepository;
    @Autowired private AlertRepository alertRepository;
    @Autowired private EntryService entryService;
    @Autowired private ExpenseRepository expenseRepository;

    // ================= CONTACTS =================
    @GetMapping("/contacts")
    public String viewContacts(Model model, HttpSession session) {
        if (session.getAttribute("loggedUser") == null) return "redirect:/login";
        model.addAttribute("contacts", userService.getAllContacts());
        return "manager/contact_messages";
    }

    // ================= DASHBOARD =================
    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {

        User user = (User) session.getAttribute("loggedUser");
        if (user == null || !user.getRole().equals("Managing Committee"))
            return "redirect:/login";

        model.addAttribute("contactCount", userService.getAllContacts().size());

        dashboardstats stats = service.getDashboardStats();
        model.addAttribute("stats", stats);

        model.addAttribute("allComplaints", service.getAllComplaints());

        model.addAttribute("alertCount", alertRepository.count());

        return "manager/manager-dashboard";
    }

    // ================= VISITORS =================
    @GetMapping("/visitors")
    public String showVisitors(Model model) {

        List<Entry> entries = entryService.getAllEntries();
        model.addAttribute("entries", entries);

        model.addAttribute("totalToday", entries.stream()
                .filter(e -> e.getEntryTime().toLocalDate().equals(LocalDate.now()))
                .count());

        model.addAttribute("currentlyInside", entries.stream()
                .filter(e -> e.getExitTime() == null)
                .count());

        model.addAttribute("deliveries", entries.stream()
                .filter(e -> "delivery".equalsIgnoreCase(e.getEntryType()))
                .count());

        return "manager/visitors";
    }

    // ================= COMPLAINTS =================
    @GetMapping("/complaints")
    public String showComplaints(Model model) {

        List<Complaint> all = complaintRepository.findAllByOrderByIdDesc();

        long totalCount = all.size();

        long activeCount = all.stream()
                .filter(c -> !c.getStatus().equalsIgnoreCase("Resolved"))
                .count();

        model.addAttribute("allComplaints", all);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("activeCount", activeCount);

        return "manager/complaints";
    }

    // ================= UPDATE STATUS =================
    @PostMapping("/updateComplaintStatus")
    @ResponseBody
    public String updateComplaintStatus(@RequestParam Long id,
                                        @RequestParam String status) {

        Complaint comp = service.getComplaintById(id);

        if (comp == null) {
            return "FAIL";
        }

        // ✅ If resolved → delete
        if ("Resolved".equalsIgnoreCase(status)) {
            service.deleteComplaint(id);
            return "DELETED";
        }

        // ✅ Otherwise update
        comp.setStatus(status);
        service.saveComplaint(comp);

        return "SUCCESS";
    }

    // ================= NOTICES =================
    @GetMapping("/notices")
    public String viewNotices(Model model) {
        model.addAttribute("allNotices", service.getAllNotices());
        return "manager/notices";
    }

    @PostMapping("/saveNotice")
    public String saveNotice(@RequestParam String title,
                             @RequestParam String content,
                             @RequestParam String date,
                             @RequestParam String category) {

        notices n = new notices();
        n.setTitle(title);
        n.setContent(content);
        n.setDate(LocalDate.parse(date));
        n.setCategory(category);

        service.saveNotice(n);

        return "redirect:/manager/notices";
    }

    @GetMapping("/deleteNotice/{id}")
    public String deleteNotice(@PathVariable Long id) {
        service.deleteNotice(id);
        return "redirect:/manager/notices";
    }

    // ================= RESIDENTS =================
    @GetMapping("/residents")
    public String viewResidents(@RequestParam(required = false) String wing, Model model) {

        if (wing != null && !wing.isEmpty()) {
            model.addAttribute("residentsList",
                    userRepo.findByRoleAndWing("Society Member", wing));
            model.addAttribute("selectedWing", wing);
        }

        return "manager/residents";
    }

    @PostMapping("/saveResident")
    public String saveResident(@RequestParam String wing,
                               @RequestParam String flat,
                               @RequestParam String name,
                               @RequestParam String phone,
                               @RequestParam String email) {

        User user = new User();
        user.setRole("Society Member");
        user.setName(name);
        user.setWing(wing);
        user.setFlatNumber(flat);
        user.setEmail(email);
        user.setPhone(phone);
        user.setPassword("Gajra@123");

        userRepo.save(user);

        return "redirect:/manager/residents?wing=" + wing;
    }

    // ================= MAINTENANCE =================
    @GetMapping("/maintenance")
    public String viewMaintenance(Model model) {

        List<Maintenance> allRecords = maintenanceRepository.findAll();

        double expected = allRecords.stream()
                .mapToDouble(m -> m.getTotalAmount() != null ? m.getTotalAmount() : 0)
                .sum();

        double collected = allRecords.stream()
                .filter(m -> "Paid".equalsIgnoreCase(m.getStatus()))
                .mapToDouble(m -> m.getTotalAmount() != null ? m.getTotalAmount() : 0)
                .sum();

        model.addAttribute("maintenanceList", allRecords);
        model.addAttribute("expected", expected);
        model.addAttribute("collected", collected);
        model.addAttribute("pending", expected - collected);

        model.addAttribute("expenseList", expenseRepository.findAll());

        return "manager/maintenance";
    }

    @PostMapping("/add-maintenance-entry")
    @ResponseBody
    public String addMaintenance(@RequestBody Maintenance m) {

        double total =
                (m.getMonthlyMaintenance() != null ? m.getMonthlyMaintenance() : 0) +
                        (m.getParkingCharges() != null ? m.getParkingCharges() : 0) +
                        (m.getWaterCharges() != null ? m.getWaterCharges() : 0);

        m.setTotalAmount(total);
        m.setStatus("Pending");

        maintenanceRepository.save(m);

        return "SUCCESS";
    }

    @GetMapping("/delete-maintenance/{id}")
    public String deleteMaintenance(@PathVariable Long id) {
        maintenanceRepository.deleteById(id);
        return "redirect:/manager/maintenance";
    }

    // ================= PROFILE =================
    @GetMapping("/profile")
    public String showProfile(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedUser");
        if (user == null) return "redirect:/login";

        model.addAttribute("manager", user);
        return "manager/profile";
    }

    @GetMapping("/settings")
    public String showSettings(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedUser");
        if (user == null) return "redirect:/login";
        return "manager/settings";
    }
    @PostMapping("/update-password")
    public String updatePassword(@RequestParam String currentPassword,
                                 @RequestParam String newPassword,
                                 @RequestParam String confirmPassword,
                                 HttpSession session,
                                 RedirectAttributes ra) {

        User loggedUser = (User) session.getAttribute("loggedUser");
        if (loggedUser == null) return "redirect:/login";

        // 1. Verify Current Password (Assuming your User model has a getPassword method)
        if (!loggedUser.getPassword().equals(currentPassword)) {
            ra.addFlashAttribute("error", "Incorrect current password!");
            return "redirect:/manager/settings";
        }

        // 2. Validate New Password Match
        if (!newPassword.equals(confirmPassword)) {
            ra.addFlashAttribute("error", "New passwords do not match!");
            return "redirect:/manager/settings";
        }

        // 3. Update the password
        User userInDb = userRepo.findById(loggedUser.getId()).get();
        userInDb.setPassword(newPassword);
        userRepo.save(userInDb);

        // 4. Update session and notify user
        session.setAttribute("loggedUser", userInDb);
        ra.addFlashAttribute("message", "Password updated successfully!");

        return "redirect:/manager/settings";
    }
    @PostMapping("/add-expense")
    @ResponseBody
    public String addExpense(@RequestBody Expense exp) {

        expenseRepository.save(exp);

        return "SUCCESS";
    }
    @GetMapping("/service_applications")
    public String viewApplications(Model model) {
        model.addAttribute("applications", service.getAllContactRequests());
        return "manager/service_applications";
    }

    @GetMapping("/service_providers")
    public String viewProviders(Model model) {
        model.addAttribute("allProviders", service.getAllProviders());
        return "manager/service_provider";
    }

    @PostMapping("/saveProvider")
    public String saveProvider(@ModelAttribute ServiceProvider sp) {
        service.saveProvider(sp);
        return "redirect:/manager/service_providers";
    }

    @GetMapping("/deleteProvider/{id}")
    public String deleteProvider(@PathVariable Long id) {
        service.deleteProvider(id);
        return "redirect:/manager/service_providers";
    }
    @GetMapping("/delete-expense/{id}")
    public String deleteExpense(@PathVariable Long id) {
        expenseRepository.deleteById(id);
        return "redirect:/manager/maintenance";
    }
    // === SHOW EDIT PAGE ===
    @GetMapping("/edit_profile")
    public String showEditProfile(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedUser");
        if (user == null) return "redirect:/login";

        model.addAttribute("loggedUser", user);
        return "manager/edit_profile"; // This must match your JSP filename
    }

    // === PROCESS UPDATE ===
    @PostMapping("/update-profile")
    public String updateProfile(@ModelAttribute User updatedUser, HttpSession session, RedirectAttributes ra) {
        User loggedUser = (User) session.getAttribute("loggedUser");
        if (loggedUser == null) return "redirect:/login";

        // 1. Fetch the REAL record from DB using the ID
        User userInDb = userRepo.findById(loggedUser.getId()).orElse(null);

        if (userInDb != null) {
            // 2. Update fields
            userInDb.setName(updatedUser.getName());
            userInDb.setPhone(updatedUser.getPhone());
            userInDb.setEmail(updatedUser.getEmail());

            // 3. Save (Trigger UPDATE because ID is present)
            userRepo.save(userInDb);

            // 4. Update session
            session.setAttribute("loggedUser", userInDb);
            ra.addFlashAttribute("message", "Profile updated successfully!");
        }
        return "redirect:/manager/profile";
    }

}
