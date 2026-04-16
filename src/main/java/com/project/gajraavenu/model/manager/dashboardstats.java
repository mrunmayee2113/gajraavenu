package com.project.gajraavenu.model.manager;

public class dashboardstats {
    private long totalResidents;
    private long activeComplaints;
    private long pendingVisitors;
    private double maintenanceRevenue;

    public dashboardstats() {}

    public dashboardstats(long totalResidents, long activeComplaints, long pendingVisitors, double maintenanceRevenue) {
        this.totalResidents = totalResidents;
        this.activeComplaints = activeComplaints;
        this.pendingVisitors = pendingVisitors;
        this.maintenanceRevenue = maintenanceRevenue;
    }

    // Getters
    public long getTotalResidents() { return totalResidents; }
    public long getActiveComplaints() { return activeComplaints; }
    public long getPendingVisitors() { return pendingVisitors; }
    public double getMaintenanceRevenue() { return maintenanceRevenue; }

    // Setters
    public void setTotalResidents(long totalResidents) { this.totalResidents = totalResidents; }
    public void setActiveComplaints(long activeComplaints) { this.activeComplaints = activeComplaints; }
    public void setPendingVisitors(long pendingVisitors) { this.pendingVisitors = pendingVisitors; }
    public void setMaintenanceRevenue(double maintenanceRevenue) { this.maintenanceRevenue = maintenanceRevenue; }
}

