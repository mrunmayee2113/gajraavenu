package com.project.gajraavenu.service.owner;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.properties.TextAlignment;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;

@Service
public class PdfService {

    public byte[] generateMaintenanceReceipt(String ownerName, String flatNo, String amount, String date) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();

        try {
            PdfWriter writer = new PdfWriter(out);
            PdfDocument pdf = new PdfDocument(writer);
            Document document = new Document(pdf);

            // Add Content to PDF
            document.add(new Paragraph("GAJRA AVENUE - MAINTENANCE RECEIPT")
                    .setBold().setFontSize(20).setTextAlignment(TextAlignment.CENTER));

            document.add(new Paragraph("\n")); // Space
            document.add(new Paragraph("Receipt Date: " + date));
            document.add(new Paragraph("Owner Name: " + ownerName));
            document.add(new Paragraph("Flat Number: " + flatNo));
            document.add(new Paragraph("--------------------------------------------------"));
            document.add(new Paragraph("Total Amount Paid: ₹" + amount).setBold());
            document.add(new Paragraph("--------------------------------------------------"));
            document.add(new Paragraph("\nThank you for your payment!"));

            document.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return out.toByteArray();
    }
}

