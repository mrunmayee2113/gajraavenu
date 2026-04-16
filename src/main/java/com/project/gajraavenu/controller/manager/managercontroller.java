package com.project.gajraavenu.controller.manager;

import com.project.gajraavenu.model.landing.User;
import com.project.gajraavenu.model.manager.*;
import com.project.gajraavenu.service.manager.managerservice;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/manager")
public class managercontroller {

    @Autowired
    private managerservice service;

    // --- MAIN DASHBOARD ---

    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {
        // 1. Security check
        User user = (User) session.getAttribute("loggedUser");
        if (user == null || !user.getRole().equals("Managing Committee")) {
            return "redirect:/login";
        }


        // 2. Fetch the stats we fixed earlier
        dashboardstats stats = service.getDashboardStats();
        model.addAttribute("stats", stats);

        // 3. Return the dashboard JSP
        return "manager/manager-dashboard";
    }

    // --- VISITORS ---
    @GetMapping("/visitors")
    public String visitorsPage(Model model) {
        List<visitors> entries = service.getAllVisitors();

        // Stats for Visitor-specific Cards
        long totalToday = entries.size();
        long currentlyInside = entries.stream().filter(e -> e.getExitTime() == null).count();
        long deliveries = entries.stream().filter(e -> "Delivery".equalsIgnoreCase(e.getEntryType())).count();

        model.addAttribute("entries", entries);
        model.addAttribute("totalToday", totalToday);
        model.addAttribute("currentlyInside", currentlyInside);
        model.addAttribute("deliveries", deliveries);

        return "manager/visitors";
    }

    // --- COMPLAINTS ---
    @GetMapping("/complaints")
    public String viewComplaints(Model model) {
        List<complaints> all = service.getAllComplaints();
        model.addAttribute("allComplaints", all);
        model.addAttribute("totalCount", all.size());
        model.addAttribute("activeCount", all.stream().filter(c -> !"Resolved".equalsIgnoreCase(c.getStatus())).count());
        model.addAttribute("resolvedCount", all.stream().filter(c -> "Resolved".equalsIgnoreCase(c.getStatus())).count());
        return "manager/complaints";
    }

    @PostMapping("/updateComplaintStatus")
    @ResponseBody
    public String updateComplaintStatus(@RequestParam("id") Long id, @RequestParam("status") String status) {
        complaints comp = service.getComplaintById(id);
        if (comp != null) {
            comp.setStatus(status);
            service.saveComplaint(comp);
            return "SUCCESS";
        }
        return "FAIL";
    }

    // --- NOTICES ---
    @GetMapping("/notices")
    public String viewNotices(Model model) {
        model.addAttribute("allNotices", service.getAllNotices());
        return "manager/notices";
    }

    @PostMapping("/saveNotice")
    public String saveNotice(@RequestParam("title") String title,
                             @RequestParam("content") String content,
                             @RequestParam("date") String date,
                             @RequestParam("category") String category) {
        Notice n = new Notice();
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
    }s

    // --- RESIDENTS ---
    @GetMapping("/residents")
    public String viewResidents(@RequestParam(value = "wing", required = false) String wing, Model model) {
        if (wing != null && !wing.isEmpty()) {
            model.addAttribute("residentsList", service.getResidentsByWing(wing));
            model.addAttribute("selectedWing", wing);
        }
        return "manager/residents";
    }

    @PostMapping("/saveResident")
    public String saveResident(@RequestParam("wing") String wing,
                               @RequestParam("flat") String flat,
                               @RequestParam("name") String name,
                               @RequestParam("contact") String contact,
                               @RequestParam("email") String email,
                               @RequestParam("members") String members) {
        residents r = new residents();
        r.setWing(wing);
        r.setFlatNumber(flat);
        r.setOwnerName(name);
        r.setContact(contact);
        r.setEmail(email);
        r.setMembersCount(members);
        service.saveResident(r);
        return "redirect:/manager/residents?wing=" + wing;
    }

    // --- SERVICE PROVIDERS ---
    @GetMapping("/service_providers")
    public String viewProviders(Model model) {
        model.addAttribute("allProviders", service.getAllProviders());
        return "manager/service_provider";
    }

    @PostMapping("/saveProvider")
    public String saveProvider(@RequestParam(value = "id", required = false) Long id,
                               @RequestParam("name") String name,
                               @RequestParam("service") String serviceType,
                               @RequestParam("contact") String contact,
                               @RequestParam("location") String location) {
        serviceprovider sp = (id != null) ? service.getProviderById(id) : new serviceprovider();
        sp.setName(name);
        sp.setServiceType(serviceType);
        sp.setContact(contact);
        sp.setLocation(location);
        service.saveProvider(sp);
        return "redirect:/manager/service_providers";
    }

    @GetMapping("/deleteProvider/{id}")
    public String deleteProvider(@PathVariable Long id) {
        service.deleteProvider(id);
        return "redirect:/manager/service_providers";
    }

    // --- SETTINGS ---
    @GetMapping("/settings")
    public String viewSettings(Model model) {
        settings s = service.getSettings();
        if(s.getSocietyName() == null) {
            s.setSocietyName("Gajra Avenue CHS");
            s.setMaintenanceRate("3.50");
        }
        model.addAttribute("settings", s);
        return "manager/settings";
    }

    @PostMapping("/saveSettings")
    public String saveSettings(@ModelAttribute settings s) {
        service.saveSettings(s);
        return "redirect:/manager/settings?success=true";
    }

    // --- BILLING / MAINTENANCE ---
    @GetMapping("/maintenance")
    public String viewMaintenance(Model model) {
        return "manager/maintenance";
    }
}