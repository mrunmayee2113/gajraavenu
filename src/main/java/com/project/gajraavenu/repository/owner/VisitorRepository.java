package com.project.gajraavenu.repository.owner;

import com.project.gajraavenu.model.owner.Visitor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VisitorRepository extends JpaRepository<Visitor, Long> {
    // Standard CRUD operations are handled automatically
}