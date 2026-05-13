package com.project.gajraavenu.controller.landing;

import com.project.gajraavenu.model.landing.Contact;
import com.project.gajraavenu.model.landing.User;
import com.project.gajraavenu.model.manager.notices;
import com.project.gajraavenu.model.manager.residents;
import com.project.gajraavenu.model.owner.Notice;
import com.project.gajraavenu.model.owner.Rental;
import com.project.gajraavenu.repository.landing.UserRepository;
import com.project.gajraavenu.repository.owner.NoticeRepository;
import com.project.gajraavenu.service.landing.UserService;
import com.project.gajraavenu.service.manager.managerservice;
import com.project.gajraavenu.service.owner.NoticeService;
import com.project.gajraavenu.service.owner.RentalService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class LandingController {

    @Autowired
    private UserService userService;
    @Autowired
    private RentalService rentalService;
    @Autowired
    private UserRepository userRepo;
    @Autowired
    private NoticeRepository noticeRepository;
    @Autowired
    private managerservice managerService;
    @Autowired
    private UserRepository userRepository;
    @GetMapping("/")
    public String home() {
        return "landing/landingpage";
    }

    @GetMapping("/login")
    public String login() {
        return "landing/login";
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam String username,
                            @RequestParam String password,
                            HttpSession session,
                            Model model) {
        User user = userService.findByEmailOrFlat(username);
        if (user != null && user.getPassword().equals(password)){

            session.setAttribute("loggedUser", user);

            if (user.getRole().equals("Society Member")) {
                // This redirect goes to your PRIVATE ComplaintController
                return "redirect:/owner/complaints";
            }
            else if (user.getRole().equals("Managing Committee")) {
                return "redirect:/manager/dashboard";
            }
            else if (user.getRole().equals("Security")) {
                return "redirect:/watchman/landingpage_watchman";
            }
        }
        model.addAttribute("error", "Invalid credentials");
        return "landing/login";
    }

    @GetMapping("/signup")
    public String signup() {
        return "landing/signup";
    }

    @PostMapping("/register")
    public String handleRegistration(
            @RequestParam("role") String role,
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("phone") String phone,
            @RequestParam("password") String password,
            @RequestParam(value = "flatAndWing", required = false) String flatAndWing,
            Model model) { // Added Model to show the error message

        // 1. DUPLICATE CHECK: Look for existing email BEFORE creating the new object
        User existingUser = userRepository.findByEmail(email).orElse(null);

        if (existingUser != null) {
            model.addAttribute("error", "This email is already registered. Please login.");
            return "landing/signup";
        }

        // 2. If no duplicate, proceed with creating the user
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPhone(phone);
        user.setPassword(password);
        user.setRole(role);

        // Keep your specific logic for splitting Wing and Flat
        if ("Society Member".equals(role) && flatAndWing != null && flatAndWing.contains("-")) {
            String[] parts = flatAndWing.split("-");
            user.setWing(parts[0].trim().toUpperCase());
            user.setFlatNumber(parts[1].trim());
        }

        // 3. Save the unique user
        userRepo.save(user);

        return "redirect:/login?success=true";
    }
    // REMOVED: memberDashboard method that was causing the privacy leak.
    // The dashboard is now handled correctly in ComplaintController.java

    @GetMapping("/watchman/landingpage_watchman")
    public String securityDashboard(HttpSession session) {

        User user = (User) session.getAttribute("loggedUser");

        if (user == null) {
            return "redirect:/login";
        }

        return "redirect:/watchman/dashboard";
    }

    @GetMapping("/contact")
    public String contact() {
        return "landing/contactus";
    }

    @GetMapping("/rentals")
    public String rentals(Model model) {

        List<Rental> rentals = rentalService.getAllRentals();
        model.addAttribute("rentals", rentals);

        return "landing/rental";
    }

    @GetMapping("/wing")
    public String wing() {
        return "landing/wing";
    }

    @GetMapping("/flat-details")
    public String flatDetails(@RequestParam Long id, Model model) {

        Rental rental = rentalService.getRentalById(id);
        model.addAttribute("r", rental);

        return "landing/flat-details";
    }

    @PostMapping("/contact")
    @ResponseBody
    public String handleContact(@RequestBody Contact contact) {
        userService.saveContact(contact);
        return "success";
    }
}