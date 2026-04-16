package com.project.gajraavenu.service.owner;

import com.project.gajraavenu.model.owner.Visitor;
import com.project.gajraavenu.repository.owner.VisitorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class VisitorService {

    @Autowired
    private VisitorRepository visitorRepository;

    public void saveVisitor(Visitor v) {
        // This is the line that actually pushes data to MySQL
        visitorRepository.save(v);
    }

    public List<Visitor> getAllVisitors() {
        return visitorRepository.findAll();
    }
}