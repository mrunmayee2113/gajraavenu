package com.project.gajraavenu.controller.owner;

import com.project.gajraavenu.service.owner.PdfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OwnerController {

    @Autowired
    private PdfService pdfService;

    /**
     * 1. The Main Dashboard
     */
    @GetMapping("/owner-dashboard")
    public String showDashboard() {
        return "owner/owner_dashboard";
    }

    /**
     * 2. The Success Bridge Page
     * This is the page that shows "Payment Successful"
     * and contains the "View History" button.
     */
    @GetMapping("/payment-success")
    public String showSuccessPage() {
        return "owner/payment_success";
    }

    /**
     * 3. PDF Receipt Generation
     * Triggered when the user clicks "Download Receipt"
     * on the success page.
     */
    @GetMapping("/download-receipt")
    public ResponseEntity<byte[]> downloadReceipt() {
        // Updated with your specific project details
        String name = "Sayali Jadhav";
        String flat = "A-302, Gajra Avenue";
        String amount = "3,850";
        String date = "April 12, 2026";

        byte[] pdfContents = pdfService.generateMaintenanceReceipt(name, flat, amount, date);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_PDF);
        // This ensures the browser downloads the file as a PDF
        headers.setContentDispositionFormData("attachment", "Gajra_Avenue_Receipt.pdf");

        return new ResponseEntity<>(pdfContents, headers, HttpStatus.OK);
    }
}