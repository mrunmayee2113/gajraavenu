package com.project.gajraavenu.repository.landing;

import com.project.gajraavenu.model.landing.Contact;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ContactRepository extends JpaRepository<Contact, Long> {
}
