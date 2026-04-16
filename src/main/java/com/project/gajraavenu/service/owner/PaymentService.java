package com.project.gajraavenu.service.owner;

import com.project.gajraavenu.model.owner.Payment;
import com.project.gajraavenu.repository.owner.PaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.UUID;

@Service
public class PaymentService {
    @Autowired private PaymentRepository paymentRepository;

    public Payment processPayment(Payment payment) {
        // Generate random TXN ID
        payment.setTransactionId("TXN-" + UUID.randomUUID().toString().substring(0,8).toUpperCase());
        // Save to Database
        return paymentRepository.save(payment);
    }
}