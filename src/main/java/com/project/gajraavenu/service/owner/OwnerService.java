package com.project.gajraavenu.service.owner;

import com.project.gajraavenu.model.manager.ServiceProvider;
import com.project.gajraavenu.repository.manager.ServiceProviderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class OwnerService {
    @Autowired
    private ServiceProviderRepository providerRepo;

    public List<ServiceProvider> getAvailableServices() {
        return providerRepo.findAll();
    }
}