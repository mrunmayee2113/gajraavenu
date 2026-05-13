package com.project.gajraavenu.repository.manager;

import com.project.gajraavenu.model.manager.ServiceProvider;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ServiceProviderRepository extends JpaRepository<ServiceProvider, Long> {
}