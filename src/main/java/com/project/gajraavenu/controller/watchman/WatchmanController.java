package com.project.gajraavenu.controller.watchman;

import com.project.gajraavenu.model.owner.Visitor;
import com.project.gajraavenu.model.watchman.Alert;
import com.project.gajraavenu.repository.watchman.AlertRepository;
import com.project.gajraavenu.service.owner.VisitorService;
import com.project.gajraavenu.service.watchman.EmailService;
import org.springframework.ui.Model;
import com.project.gajraavenu.model.landing.User;
import com.project.gajraavenu.service.watchman.EntryService;
import com.project.gajraavenu.service.landing.UserService;
import com.project.gajraavenu.model.watchman.Entry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.project.gajraavenu.model.manager.notices;
import com.project.gajraavenu.service.manager.managerservice;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;

@Controller
@RequestMapping("/watchman")
public class WatchmanController {

    @Autowired
    private EntryService entryService;

    @Autowired
    private UserService userService;

    @Autowired
    private VisitorService visitorService;
    @Autowired
    private managerservice managerService;

    @GetMapping("/visitors")
    public String showPreApprovedVisitors(Model model) {
        model.addAttribute("visitors", visitorService.getAllVisitors());
        return "watchman/preapproved_visitors";
    }

    @GetMapping("/notice")
    public String updatesPage(Model model) {
        // Calling method on the instance, not the class
        List<notices> list = managerService.getAllNotices();
        model.addAttribute("notices", list); // Name matches JSP
        return "watchman/notice";
    }
    @GetMapping("/profile")
    public String showProfile(Model model) {

        User user = userService.getSecurityUser(); // logged-in user

        model.addAttribute("user", user);

        return "watchman/profile"; // your JSP file
    }
    @PostMapping("/update-profile")
    public String updateProfile(@ModelAttribute User user) {

        userService.updateUser(user);

        return "redirect:/watchman/profile";
    }

    @PostMapping("/change-password")
    public String changePassword(
            @RequestParam String currentPassword,
            @RequestParam String newPassword,
            @RequestParam String confirmPassword,
            Model model) {

        User user = userService.getSecurityUser(); // OR session user

        // ✅ Check current password
        if (!user.getPassword().equals(currentPassword)) {
            model.addAttribute("status", "error");
            model.addAttribute("message", "Current password is incorrect");
            return "watchman/settings";
        }

        // ✅ Check confirm password
        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("status", "error");
            model.addAttribute("message", "Passwords do not match");
            return "watchman/settings";
        }

        // ✅ Update password
        user.setPassword(newPassword);
        userService.updateUser(user);

        model.addAttribute("status", "success");
        model.addAttribute("message", "Password updated successfully");

        return "watchman/settings";
    }

        // Settings Page
        @GetMapping("/settings")
        public String settingsPage() {
            return "watchman/settings";
        }



    @GetMapping("/log-entry")
    public String showForm() {



        return "watchman/log-entry";
    }

    @GetMapping("/edit-profile")
    public String showEditProfile(Model model) {

        User user = userService.getSecurityUser(); // logged-in user

        model.addAttribute("user", user);

        return "watchman/edit-profile"; // JSP file name
    }
    @GetMapping("/all-entries")
    public String showAllEntries(
            @RequestParam(required = false) String order,
            @RequestParam(required = false) String wing,
            @RequestParam(required = false) String type,
            Model model) {

        List<Entry> entries = entryService.getAllEntries();

        // ✅ FILTER BY WING
        if (wing != null && !wing.isEmpty()) {
            entries = entries.stream()
                    .filter(e -> wing.equalsIgnoreCase(e.getWing()))
                    .toList();
        }

        // ✅ FILTER BY TYPE
        if (type != null && !type.isEmpty()) {
            entries = entries.stream()
                    .filter(e -> e.getEntryType().equalsIgnoreCase(type)
                            || (type.equals("service") && e.getEntryType().equalsIgnoreCase("service provider")))
                    .toList();
        }

        // ✅ SORT BY TIME
        if (order == null) order = "desc";

        Comparator<Entry> comparator = Comparator.comparing(Entry::getEntryTime);

        if ("desc".equals(order)) {
            comparator = comparator.reversed();
        }

        entries = entries.stream().sorted(comparator).toList();

        model.addAttribute("entries", entries);
        model.addAttribute("order", order);
        model.addAttribute("wing", wing);
        model.addAttribute("type", type);

        return "watchman/all-entries";
    }

    @PostMapping("/save-entry")
    public String saveEntry(@ModelAttribute Entry entry) {

        Entry savedEntry = entryService.saveEntry(entry);

        Visitor visitor = new Visitor();
        visitor.setName(savedEntry.getVisitorName());
        String flat = savedEntry.getFlatNumber();

// Fix cases like 107 → A-107
        if (!flat.contains("-") && savedEntry.getWing() != null) {
            flat = savedEntry.getWing() + "-" + flat;
        }

        visitor.setFlatNumber(flat);
        visitor.setPhone(savedEntry.getMobileNumber());
        visitor.setPurpose(savedEntry.getPurpose());
        visitor.setStatus("Visited");
        visitor.setVisitDate(LocalDate.now().toString());

        // ✅ FIND OWNER USING FLAT NUMBER
        User owner = userService.findByFlatNumber(savedEntry.getFlatNumber());

        if (owner == null) {
            System.out.println("❌ OWNER NOT FOUND FOR FLAT: " + savedEntry.getFlatNumber());
        }
        // ✅ LINK OWNER
        visitor.setOwner(owner);

        visitorService.saveVisitor(visitor);

        return "redirect:/watchman/dashboard";
    }
    @GetMapping("/dashboard")
    public String showDashboard(Model model) {

        List<Entry> entries = entryService.getAllEntries();

        // Filter today's entries
        LocalDate today = LocalDate.now();

        List<Entry> todayEntries = entries.stream()
                .filter(e -> e.getEntryTime().toLocalDate().equals(today))
                .toList();

        long visitors = todayEntries.stream()
                .filter(e -> "visitor".equalsIgnoreCase(e.getEntryType()))
                .count();

        long deliveries = todayEntries.stream()
                .filter(e -> "delivery".equalsIgnoreCase(e.getEntryType()))
                .count();

        long services = todayEntries.stream()
                .filter(e -> "service".equalsIgnoreCase(e.getEntryType()))
                .count();

        long active = todayEntries.stream()
                .filter(e -> e.getExitTime() == null)
                .count();

        model.addAttribute("entries", todayEntries.stream().limit(6).toList());
        model.addAttribute("visitorCount", visitors);
        model.addAttribute("deliveryCount", deliveries);
        model.addAttribute("serviceCount", services);
        model.addAttribute("activeCount", active);

        return "watchman/landingpage_watchman";
    }

    @GetMapping("/markVisited/{id}")
    public String markVisited(@PathVariable Long id) {

        // Get visitor data
        Visitor v = visitorService.getVisitorById(id);

        // Mark visitor as visited

        visitorService.markAsVisited(id);

        // Create entry log
        Entry entry = new Entry();
        entry.setVisitorName(v.getName());
        entry.setFlatNumber(v.getFlatNumber());
        entry.setEntryType("visitor");

        entryService.saveEntry(entry);

        return "redirect:/watchman/visitors";
    }

    @PostMapping("/exit/{id}")
    public String markExit(@PathVariable Long id) {
        entryService.markExit(id);
        return "redirect:/watchman/all-entries";
    }
    @Autowired
    private EmailService emailService;

    @Autowired
    private AlertRepository alertRepository;

    @PostMapping("/broadcast-alert")
    @ResponseBody
    public String broadcastAlert() {

        String message = " !!!! EMERGENCY ALERT !!!!" +
                "\n" +
                "Dear Resident,\n" +
                "\n" +
                "An urgent situation has been reported within the society premises. \n" +
                "We request you to stay alert and follow safety precautions.\n" +
                "\n" +
                "Please avoid unnecessary movement and cooperate with security staff.\n" +
                "\n" +
                "Further updates will be shared shortly.\n" +
                "\n" +
                "- Gajra Avenue Management";

        // ✅ SAVE ALERT IN DB
        Alert alert = new Alert();
        alert.setMessage(message);
        alert.setCreatedAt(LocalDateTime.now());

        alertRepository.save(alert);

        // ✅ SEND EMAILS
        List<User> users = userService.getAllUsers();

        for (User user : users) {

            if (!"Society Member".equals(user.getRole())) continue;

            if (user.getEmail() == null || user.getEmail().isEmpty()) continue;

            emailService.sendEmail(
                    user.getEmail(),
                    "Emergency Alert",
                    message
            );
        }

        return "Emails sent successfully!";
    }


}