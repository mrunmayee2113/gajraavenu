package com.project.gajraavenu.service.manager;

import com.project.gajraavenu.model.owner.Complaint;
import com.project.gajraavenu.model.landing.Contact;
import com.project.gajraavenu.model.manager.*;
import com.project.gajraavenu.repository.landing.UserRepository;
import com.project.gajraavenu.repository.manager.*;
import com.project.gajraavenu.repository.landing.ContactRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@Transactional
public class managerservice {

    @Autowired private ManagerVisitorRepository visitorRepo;
    @Autowired private ResidentRepository residentRepo;
    @Autowired private ManagerComplaintRepository complaintRepo;
    @Autowired private ManagerNoticeRepository noticeRepo;
    @Autowired private SettingsRepository settingsRepo;
    @Autowired private ManagerRepository managerRepo;
    @Autowired private ContactRepository contactRepo;
    @Autowired private ServiceProviderRepository providerRepo;
    @Autowired
    private UserRepository userRepo;

    // --- COMPLAINT METHODS ---s
    public List<Complaint> getAllComplaints() {
        return complaintRepo.findAllByOrderByIdDesc();
    }

    public Complaint getComplaintById(Long id) {
        return complaintRepo.findById(id).orElse(null);
    }

    public void saveComplaint(Complaint c) {
        complaintRepo.save(c);
    }

    public void deleteComplaint(Long id) {
        complaintRepo.deleteById(id);
    }

    public dashboardstats getDashboardStats() {
        // 1. Get live count of residents from the users table
        long totalRes = userRepo.countByRole("Society Member");

        // 2. Get other stats using your existing logic
        long activeComp = complaintRepo.count(); // Example: change to your actual open complaint count logic
        long pendVis = visitorRepo.count();      // Example: change to your actual pending visitor logic
        Double rev = 0.0;                        // Placeholder for your revenue logic

        // 3. Return the stats object (ensure your constructor matches these 4 fields)
        return new dashboardstats(totalRes, activeComp, pendVis, rev);
    }

    // --- VISITOR METHODS ---
    public List<visitors> getAllVisitors() {
        return visitorRepo.findAll();
    }

    // --- RESIDENT METHODS ---
    public List<residents> getResidentsByWing(String wing) {
        return residentRepo.findByWing(wing);
    }

    public void saveResident(residents r) {
        residentRepo.save(r);
    }

    // --- SETTINGS METHODS ---
    public settings getSettings() {
        return settingsRepo.findAll().stream().findFirst().orElse(new settings());
    }

    public void saveSettings(settings s) {
        settingsRepo.save(s);
    }


    public List<notices> getAllNotices() {
        return noticeRepo.findAllByOrderByDateDesc();
    }

    public void saveNotice(notices n) {
        noticeRepo.save(n);
    }

    public void deleteNotice(Long id) {
        noticeRepo.deleteById(id);
    }

    // --- CONTACT / APPLICATION METHODS ---
    public List<Contact> getAllContactRequests() {
        return contactRepo.findAll();
    }

    public Contact getContactById(Long id) {
        return contactRepo.findById(id).orElse(null);
    }

    public void deleteContact(Long id) {
        contactRepo.deleteById(id);
    }




    // These will stop being red now:
    public List<ServiceProvider> getAllProviders() {
        return providerRepo.findAll();
    }

    public void saveProvider(ServiceProvider sp) {
        providerRepo.save(sp);
    }

    public void deleteProvider(Long id) {
        providerRepo.deleteById(id);
    }
}
