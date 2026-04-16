package com.project.gajraavenu.controller.watchman;

import com.project.gajraavenu.model.landing.User;
import com.project.gajraavenu.service.watchman.EntryService;
import com.project.gajraavenu.service.landing.UserService;
import org.springframework.ui.Model;
import com.project.gajraavenu.model.watchman.Entry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.Comparator;
import java.util.List;

@Controller
@RequestMapping("/watchman")
public class WatchmanController {

    @Autowired
    private EntryService entryService;

    @Autowired
    private UserService userService;

        // Visitors Page
        @GetMapping("/visitors")
        public String visitorsPage(Model model) {
            model.addAttribute("entries", entryService.getAllEntries());
            return "watchman/preapproved_visitors";
        }

        // Updates Page
        @GetMapping("/notice")
        public String updatesPage() {
            return "watchman/notice";
        }

        // Profile Page
        @GetMapping("/profile")
        public String profilePage(Model model) {
            User user = userService.getSecurityUser();
            model.addAttribute("user", user);
            return "watchman/profile";
        }
    @GetMapping("/edit-profile")
    public String editProfile(Model model) {

        User user = userService.getSecurityUser(); // fetch from DB

        model.addAttribute("user", user);

        return "watchman/edit-profile";
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
        entryService.saveEntry(entry);
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


    @PostMapping("/exit/{id}")
    public String markExit(@PathVariable Long id) {
        entryService.markExit(id);
        return "redirect:/watchman/all-entries";
    }


}