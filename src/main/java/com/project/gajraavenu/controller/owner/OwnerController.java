package com.project.gajraavenu.controller.owner;

import com.project.gajraavenu.model.landing.User;
import com.project.gajraavenu.model.manager.Maintenance;
import com.project.gajraavenu.model.owner.Complaint;
import com.project.gajraavenu.model.owner.Payment;
import com.project.gajraavenu.repository.landing.UserRepository;
import com.project.gajraavenu.repository.manager.MaintenanceRepository;
import com.project.gajraavenu.repository.owner.ComplaintRepository;
import com.project.gajraavenu.repository.owner.PaymentRepository;
import com.project.gajraavenu.service.owner.PdfService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class OwnerController {

    @Autowired
    private PdfService pdfService;

    @Autowired
    private MaintenanceRepository maintenanceRepo;

    @Autowired
    private ComplaintRepository complaintRepo;

    @Autowired
    private PaymentRepository paymentRepository;

    @Autowired
    private UserRepository userRepository; // Ensure you have this repository created
    // ================= DASHBOARD =================
    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {

        User user = (User) session.getAttribute("loggedUser");
        if (user == null) return "redirect:/login";
        System.out.println("=== DB DUMP ===");
        System.out.println("USER FLAT: " + user.getFlatNumber());
        // ✅ SIMPLE + FLEXIBLE
        //String flatNo = user.getFlatNumber();

        maintenanceRepo.findAll().forEach(m ->
                System.out.println(m.getFlatNumber() + " -> " + m.getTotalAmount())
        );
        String flatNo = user.getWing() + "-" + user.getFlatNumber();

        List<Maintenance> bills =
                maintenanceRepo.findAllByFlatNumberFlexible(flatNo);

        Maintenance bill = (bills != null && !bills.isEmpty())
                ? bills.get(0)
                : createEmptyBill(user.getFlatNumber());

        model.addAttribute("bill", bill);

        // complaints
        List<Complaint> myComplaints = complaintRepo.findByUserIdOrderByIdDesc(user.getId());

        // ✅ JSP MATCH: Use 'allComplaints' name
        model.addAttribute("allComplaints", myComplaints);
        return "owner/owner_dashboard";
    }

    // ================= PAY NOW =================
    @GetMapping("/owner/pay-now")
    public String payNow(HttpSession session, Model model) {

        User user = (User) session.getAttribute("loggedUser");
        if (user == null) return "redirect:/login";

        String flatNo = user.getFlatNumber();

        List<Maintenance> bills =
                maintenanceRepo.findAllByFlatNumberFlexible(flatNo);

        Maintenance bill = bills.isEmpty()
                ? createEmptyBill(flatNo)
                : bills.get(0);

        model.addAttribute("bill", bill);

        return "owner/pay_now";
    }

    // ================= PAYMENTS =================
    @GetMapping("/payments")
    public String payments(HttpSession session, Model model) {

        User user = (User) session.getAttribute("loggedUser");
        if (user == null) return "redirect:/login";

        String flatNo = user.getFlatNumber();

        List<Maintenance> bills =
                maintenanceRepo.findAllByFlatNumberFlexible(flatNo);

        Maintenance bill = bills.isEmpty()
                ? createEmptyBill(flatNo)
                : bills.get(0);

        model.addAttribute("bill", bill);

        // ✅ IMPORTANT FIX (consistent flat format)
        List<Payment> history =
                paymentRepository.findByFlatNumber(flatNo);

        model.addAttribute("paymentList", history);

        return "owner/payments";
    }

    // ================= SUCCESS =================
    @GetMapping("/payment-success")
    public String showSuccessPage() {
        return "owner/payment_success";
    }

    // ================= RECEIPT =================
    @GetMapping("/download-receipt")
    public ResponseEntity<byte[]> downloadReceipt() {

        String name = "Owner";
        String flat = "Gajra Avenue";
        String amount = "0";
        String date = "Today";

        byte[] pdf = pdfService.generateMaintenanceReceipt(name, flat, amount, date);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_PDF);
        headers.setContentDispositionFormData("attachment", "receipt.pdf");

        return new ResponseEntity<>(pdf, headers, HttpStatus.OK);
    }

    // ================= PROFILE =================
    @GetMapping("/owner/profile")
    public String showProfile(HttpSession session) {
        if (session.getAttribute("loggedUser") == null)
            return "redirect:/login";
        return "owner/profile";
    }
    @PostMapping("/owner/update-profile")
    public String updateProfile(@ModelAttribute User updatedUser, HttpSession session) {
        User loggedUser = (User) session.getAttribute("loggedUser");
        if (loggedUser == null) return "redirect:/login";

        // 1. Fetch the REAL record from MySQL using the ID from your session
        User userInDb = userRepository.findById(loggedUser.getId()).orElse(null);

        if (userInDb != null) {
            // 2. Map the new values to the database object
            userInDb.setName(updatedUser.getName());
            userInDb.setPhone(updatedUser.getPhone());
            userInDb.setEmail(updatedUser.getEmail());

            // 3. Save the object that has the ID
            userRepository.save(userInDb);

            // 4. Update the session so the UI shows the new number/email
            session.setAttribute("loggedUser", userInDb);
        }
        return "redirect:/owner/profile";
    }
    // Inside OwnerController.java

    @GetMapping("/owner/edit-profile")
    public String showEditProfile(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedUser");
        if (user == null) {
            return "redirect:/login";
        }
        model.addAttribute("user", user);

        // This MUST match the folder structure and file name exactly
        return "owner/edit_profile";
    }
    @GetMapping("/owner/settings")
    public String showSettings(HttpSession session) {
        if (session.getAttribute("loggedUser") == null)
            return "redirect:/login";
        return "owner/settings";
    }

    // ================= EMPTY BILL =================
    private Maintenance createEmptyBill(String flatNo) {
        Maintenance m = new Maintenance();
        m.setFlatNumber(flatNo);
        m.setMonthlyMaintenance(0.0);
        m.setParkingCharges(0.0);
        m.setWaterCharges(0.0);
        m.setTotalAmount(0.0);

        // Change "Paid" to "Pending" so the "Pay Now" button shows up
        m.setStatus("Pending");

        return m;
    }
    @PostMapping("/owner/update-password")
    public String updatePassword(@RequestParam String currentPassword,
                                 @RequestParam String newPassword,
                                 @RequestParam String confirmPassword,
                                 HttpSession session, Model model) {
        User loggedUser = (User) session.getAttribute("loggedUser");
        if (loggedUser == null) return "redirect:/login";

        // Standard Validation
        if (!loggedUser.getPassword().equals(currentPassword)) {
            model.addAttribute("error", "Current password incorrect!");
            return "owner/settings";
        }

        // Fetch from DB and Update
        User userInDb = userRepository.findById(loggedUser.getId()).orElse(null);
        if (userInDb != null) {
            userInDb.setPassword(newPassword);
            userRepository.save(userInDb); // This triggers: UPDATE users SET password = ... WHERE id = 12
            session.setAttribute("loggedUser", userInDb);
        }

        model.addAttribute("message", "Password updated successfully!");
        return "owner/settings";
    }

}
