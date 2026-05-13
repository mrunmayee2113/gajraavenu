package com.project.gajraavenu.repository.manager;

import com.project.gajraavenu.model.manager.residents;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ResidentRepository extends JpaRepository<residents, Long> {

    List<residents> findByWing(String wing);
}