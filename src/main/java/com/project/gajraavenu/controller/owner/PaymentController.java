package com.project.gajraavenu.controller.owner;


import com.project.gajraavenu.model.owner.Payment;
import com.project.gajraavenu.repository.owner.PaymentRepository;
import com.project.gajraavenu.service.owner.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class PaymentController {

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private PaymentRepository paymentRepository;

    /**
     * 1. Displays the 'Pay Now' billing form.
     */
    @GetMapping("/pay-now")
    public String showPayPage() {
        return "owner/pay_now";
    }

    /**
     * 2. Handles the payment form submission.
     * After saving to MySQL, it redirects to the success page
     * where the user can choose to download the receipt or see history.
     */
    @PostMapping("/process-payment")
    public String handlePayment(@ModelAttribute Payment payment) {
        paymentService.processPayment(payment);
        // Redirect to the success bridge page
        return "redirect:/payment-success";
    }

    /**
     * 3. Displays the maintenance history table.
     * Fetches all records from the 'payments' table in MySQL.
     */
    @GetMapping("/payments")
    public String showPaymentHistory(Model model) {
        List<Payment> allPayments = paymentRepository.findAll();

        // Debugging line to check data in IntelliJ console
        System.out.println("DEBUG: Found " + allPayments.size() + " payments in database.");

        // This attribute name MUST match the items="${paymentList}" in your JSP
        model.addAttribute("paymentList", allPayments);

        return "owner/payments"; // Path: WEB-INF/views/owner/payment.jsp
    }
}