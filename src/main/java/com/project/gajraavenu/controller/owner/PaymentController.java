package com.project.gajraavenu.controller.owner;


import com.itextpdf.html2pdf.HtmlConverter;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.project.gajraavenu.model.landing.User;
import com.project.gajraavenu.model.manager.Maintenance;
import com.project.gajraavenu.model.owner.Payment;
import com.project.gajraavenu.repository.manager.MaintenanceRepository;
import com.project.gajraavenu.repository.owner.PaymentRepository;
import com.project.gajraavenu.service.owner.PaymentService;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class PaymentController {

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private PaymentRepository paymentRepository;
    @Autowired
    private MaintenanceRepository maintenanceRepository;
    /**
     * 1. Displays the 'Pay Now' billing form.
     */



    @PostMapping("/create-order")
    @ResponseBody
    public String createOrder(@RequestParam(value = "amount", required = false) Double amount) throws Exception {

        // Keeping your specific keys exactly as requested
        RazorpayClient client = new RazorpayClient("rzp_test_SfeTEH5J2doZUV", "D5eCwgnoY1C2KANprl0d4BxR");

        // Use the dynamic amount if provided, otherwise default to 3850
        double finalAmount = (amount != null) ? amount : 3850.0;

        JSONObject options = new JSONObject();
        options.put("amount", (int)(finalAmount * 100)); // amount in paise
        options.put("currency", "INR");
        options.put("receipt", "txn_123456");

        Order order = client.orders.create(options);

        return order.toString();
    }
    @PostMapping("/verify-payment")
    @ResponseBody
    public String verifyPayment(HttpSession session) {
        try {
            User user = (User) session.getAttribute("loggedUser");

            // 1. Save payment
            Payment p = new Payment();
            p.setAmount(0.0); // or pass actual
            p.setFlatNumber(user.getFlatNumber());
            p.setStatus("SUCCESS");

            paymentRepository.save(p);

            // 2. Update maintenance
            List<Maintenance> bills =
                    maintenanceRepository.findAllByFlatNumberFlexible(user.getFlatNumber());

            if (!bills.isEmpty()) {
                Maintenance bill = bills.get(0);
                bill.setStatus("Paid");
                maintenanceRepository.save(bill);
            }

            return "success";

        } catch (Exception e) {
            return "error";
        }
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

    @GetMapping("/download-receipt/{id}")
    public void downloadReceipt(@PathVariable Long id,
                                HttpServletResponse response) throws Exception {

        Payment payment = paymentRepository.findById(id).orElse(null);

        // Build HTML manually (same as JSP)
        String html = "<html><body>" +
                "<h1>GAJRA AVENUE APARTMENT</h1>" +
                "<h2>Maintenance Receipt</h2>" +

                "<p><b>Receipt No:</b> " + payment.getId() + "</p>" +
                "<p><b>Date:</b> " + java.time.LocalDate.now() + "</p>" +
                "<p><b>Flat No:</b> " + payment.getFlatNumber() + "</p>" +

                "<table border='1' width='100%' style='border-collapse:collapse'>" +
                "<tr><th>No</th><th>Particulars</th><th>Amount</th></tr>" +
                "<tr><td>1</td><td>Maintenance Charges</td><td>₹ " + payment.getAmount() + "</td></tr>" +
                "<tr><td colspan='2'><b>Total</b></td><td>₹ " + payment.getAmount() + "</td></tr>" +
                "</table>" +

                "</body></html>";

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=receipt.pdf");

        HtmlConverter.convertToPdf(html, response.getOutputStream());
    }



}