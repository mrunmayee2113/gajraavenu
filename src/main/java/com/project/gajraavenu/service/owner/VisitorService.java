package com.project.gajraavenu.service.owner;

import com.project.gajraavenu.model.owner.Visitor;
import com.project.gajraavenu.repository.owner.VisitorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class VisitorService {

    @Autowired
    private VisitorRepository visitorRepository;
    public Visitor saveVisitor(Visitor visitor) {
        return visitorRepository.save(visitor);
    }
    public List<Visitor> getVisitorsByFlat(String flatNumber) {
        return visitorRepository.findByFlatNumber(flatNumber);
    }
    public List<Visitor> findAll() {
        return visitorRepository.findAll();
    }

    public Optional<Visitor> findById(Long id) {
        return visitorRepository.findById(id);
    }

    public void deleteById(Long id) {
        visitorRepository.deleteById(id);
    }

    public void save(Visitor visitor) {
        visitorRepository.save(visitor);
    }

    // Optional (if needed later)
    public List<Visitor> getAllVisitors() {
        String today = LocalDate.now().toString();
        return visitorRepository.findByVisitDateOrderByIdDesc(today);
    }

    public Visitor getVisitorById(Long id) {
        return visitorRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Visitor not found"));
    }
    public void markAsVisited(Long id) {
        Visitor v = visitorRepository.findById(id).orElse(null);
        if (v != null) {
            v.setStatus("Visited");
            visitorRepository.save(v);
        }
    }
}