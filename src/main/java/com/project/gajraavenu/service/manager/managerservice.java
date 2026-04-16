package com.project.gajraavenu.service.manager;

import com.project.gajraavenu.model.manager.*;
import com.project.gajraavenu.repository.manager.*;
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
    @Autowired private ServiceProviderRepository providerRepo;
    @Autowired private SettingsRepository settingsRepo;
    @Autowired private ManagerRepository managerRepo;

    // --- DASHBOARD LOGIC ---
    public dashboardstats getDashboardStats() {
        long totalRes = managerRepo.countAllResidents();
        long activeComp = managerRepo.countOpenComplaints();
        long pendVis = managerRepo.countPendingVisitors();

        Double rev = managerRepo.calculateTotalRevenue();
        double totalRev = (rev != null) ? rev : 0.0;

        return new dashboardstats(totalRes, activeComp, pendVis, totalRev);
    }

    // --- VISITORS ---
    public List<visitors> getAllVisitors() {
        return visitorRepo.findAllByOrderByEntryTimeDesc();
    }

    public void saveVisitor(visitors v) {
        visitorRepo.save(v);
    }

    public visitors getVisitorById(Long id) {
        return visitorRepo.findById(id).orElse(null);
    }

    // --- NOTICES ---
    public List<notices> getAllNotices() {
        return noticeRepo.findAll();
    }

    public void saveNotice(notices n) {
        noticeRepo.save(n);
    }

    public void deleteNotice(Long id) {
        noticeRepo.deleteById(id);
    }

    // --- RESIDENTS ---
    public List<residents> getResidentsByWing(String wing) {
        return residentRepo.findByWing(wing);
    }

    public void saveResident(residents r) {
        residentRepo.save(r);
    }

    // --- PROVIDERS ---
    public List<serviceprovider> getAllProviders() {
        return providerRepo.findAll();
    }

    public void saveProvider(serviceprovider s) {
        providerRepo.save(s);
    }

    public serviceprovider getProviderById(Long id) {
        return providerRepo.findById(id).orElse(null);
    }

    public void deleteProvider(Long id) {
        providerRepo.deleteById(id);
    }

    // --- COMPLAINTS ---
    public List<complaints> getAllComplaints() {
        return complaintRepo.findAllByOrderByDateFiledDesc();
    }

    public complaints getComplaintById(Long id) {
        return complaintRepo.findById(id).orElse(null);
    }

    public void saveComplaint(complaints c) {
        complaintRepo.save(c);
    }

    // --- SETTINGS ---
    public settings getSettings() {
        return settingsRepo.findAll().stream().findFirst().orElse(new settings());
    }

    public void saveSettings(settings s) {
        settingsRepo.save(s);
    }
}