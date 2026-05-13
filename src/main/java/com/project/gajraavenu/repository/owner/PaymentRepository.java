package com.project.gajraavenu.repository.owner;

import com.project.gajraavenu.model.owner.Payment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, Long> {
    List<Payment> findByFlatNumber(String flatNumber);
}