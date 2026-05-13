package com.project.gajraavenu.repository.owner;

import com.project.gajraavenu.model.landing.User;
import com.project.gajraavenu.model.owner.Visitor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VisitorRepository extends JpaRepository<Visitor, Long> {
    List<Visitor> findByVisitDateOrderByIdDesc(String visitDate);
    List<Visitor> findByFlatNumber(String flatNumber);
}