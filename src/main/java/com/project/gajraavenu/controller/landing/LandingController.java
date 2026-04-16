package com.project.gajraavenu.controller.landing;

import com.project.gajraavenu.model.landing.Contact;
import com.project.gajraavenu.model.landing.User;
import com.project.gajraavenu.service.landing.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LandingController {

    @Autowired
    private UserService userService;

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
                return "redirect:/owner/owner_dashboard";
            }
            else if (user.getRole().equals("Managing Committee")) {
                return "redirect:/manager/dashboard";
            }
            else if (user.getRole().equals("Security")) {
                return "redirect:/watchman/landingpage_watchman";
            }
        }
        model.addAttribute("error", "Invalid credentials");
        return "landing/login"; // back to login page
    }

    @GetMapping("/signup")
    public String signup() {
        return "landing/signup";
    }



    @PostMapping("/register")
    public String registerUser(@ModelAttribute User user) {

        userService.registerUser(user);

        return "redirect:/login";
    }

//    @GetMapping("/manager/manager_dashboard")
//    public String managerDashboard(HttpSession session) {
//
//        User user = (User) session.getAttribute("loggedUser");
//
//        if (user == null) {
//            return "redirect:/login";
//        }
//
//        return "manager/dashboard";
//    }

    @GetMapping("/owner/owner_dashboard")
    public String memberDashboard(HttpSession session) {

        User user = (User) session.getAttribute("loggedUser");

        if (user == null) {
            return "redirect:/login";
        }

        return "owner/owner_dashboard";
    }

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
    public String rentals() {
        return "landing/rental";
    }

    @GetMapping("/wing")
    public String wing() {
        return "landing/wing";
    }

    @GetMapping("/flat-details")
    public String flatDetails(
            @RequestParam String id,
            @RequestParam String type,
            @RequestParam String rent,
            Model model) {

        model.addAttribute("id", id);
        model.addAttribute("type", type);
        model.addAttribute("rent", rent);

        return "landing/flat-details";
    }
    @PostMapping("/contact")
    @ResponseBody
    public String handleContact(@RequestBody Contact contact) {
        userService.saveContact(contact);
        return "success";
    }
}