<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manager Dashboard | Gajra Avenue</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manager/manager-dashboard.css">
</head>

<body>

<div class="dashboard">

    <div class="sidebar">
        <h4><b>GAJRA<br>AVENUE</b></h4>
        <hr>
        <a href="${pageContext.request.contextPath}/manager/dashboard"><i class="fa-solid fa-chart-line"></i> Dashboard</a>
        <a href="${pageContext.request.contextPath}/manager/residents"><i class="fa-solid fa-users"></i> Residents</a>
        <a href="${pageContext.request.contextPath}/manager/maintenance"><i class="fa-solid fa-building"></i> Maintenance</a>
        <a href="${pageContext.request.contextPath}/manager/complaints"><i class="fa-solid fa-clipboard-list"></i> Complaints</a>
        <a href="${pageContext.request.contextPath}/manager/visitors"><i class="fa-solid fa-shield-halved"></i> Security Logs</a>
        <a href="${pageContext.request.contextPath}/manager/notices"><i class="fa-solid fa-money-bill"></i> Notices</a>
        <a href="${pageContext.request.contextPath}/manager/service_providers"><i class="fa-solid fa-bell"></i> Service</a>

        <a href="/" onclick="confirmLogout(event)"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
    </div>
 <div class="overlay"></div>
    <div class="main">

       <div class="topbar">

           <!-- ADD THIS -->
           <i class="fa-solid fa-bars menu-toggle"></i>

           <div class="topbar-right d-flex align-items-center gap-3">
               <h2>Manager Dashboard</h2>
           </div>

           <div class="topbar-right d-flex align-items-center gap-3">
                <a href="${pageContext.request.contextPath}/manager/contacts" style="position:relative; color:inherit; text-decoration: none;">
                    <i class="fa-solid fa-bell" style="font-size:20px; color: #c5a059;"></i>
                    <span style="position:absolute; top:-8px; right:-10px; background:#ff4d4d; color:white; font-size:10px; min-width:18px; height:18px; display:flex; align-items:center; justify-content:center; border-radius:50%; padding:2px; font-weight: bold;">
                        ${contactCount}
                    </span>
                </a>

                <div class="dropdown">
                    <div class="d-flex align-items-center gap-2" id="profileDropdown" data-bs-toggle="dropdown" aria-expanded="false" style="cursor: pointer;">
                        <div class="text-end d-none d-sm-block me-1">
                            <p class="mb-0" style="color: #c5a059; font-weight: 600; font-size: 13px; line-height: 1;">${loggedUser.name}</p>
                            <small style="color: #888; font-size: 10px;">Managing Committee</small>
                        </div>
                        <img src="https://i.pravatar.cc/40" class="rounded-circle border border-warning" width="38" height="38" alt="Avatar">
                    </div>

                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profileDropdown" style="background: #111; border: 1px solid rgba(197,160,89,0.4); margin-top: 10px; box-shadow: 0 10px 25px rgba(0,0,0,0.5);">
                        <li>
                            <a class="dropdown-item py-2" href="${pageContext.request.contextPath}/manager/profile" style="color: #ccc; font-size: 14px;">
                                <i class="fa-solid fa-user-circle me-2" style="color: #c5a059;"></i> My Profile
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item py-2" href="${pageContext.request.contextPath}/manager/settings" style="color: #ccc; font-size: 14px;">
                                <i class="fa-solid fa-gear me-2" style="color: #c5a059;"></i> Settings
                            </a>
                        </li>
                        <li><hr class="dropdown-divider" style="border-color: rgba(255,255,255,0.1);"></li>
                        <li>
                            <a class="dropdown-item py-2" href="#" onclick="confirmLogout(event)" style="color: #ff4d4d; font-size: 14px;">
                                <i class="fa-solid fa-right-from-bracket me-2"></i> Logout
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row g-4 mb-4">
           <div class="col-12 col-md-4">
                <div class="card-box">
                    <h5>Total Residents</h5>
                    <h3>${stats.totalResidents}</h3>
                </div>
            </div>
           <div class="col-12 col-md-4">
                <div class="card-box">
                    <h5>Active Complaints</h5>
                    <h3>${stats.activeComplaints}</h3>
                </div>
            </div>
          <div class="col-12 col-md-4">
                <div class="card-box">
                    <h5>Security Alerts</h5>
                    <h3>${alertCount}</h3>
                </div>
            </div>

        </div>

        <div class="table-wrapper">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h5 style="font-family:'Cinzel'; color:#d4af37; margin:0;">Recent Complaints</h5>
                <a href="${pageContext.request.contextPath}/manager/complaints" class="btn btn-sm btn-outline-warning">View All</a>
            </div>

            <table class="table table-hover">
                <thead>
                <tr>
                    <th>Flat</th>
                    <th>Issue</th>
                    <th>Status</th>
                    <th>Date</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${not empty allComplaints}">
                        <c:forEach var="c" items="${allComplaints}" begin="0" end="4">
                            <tr>
                                <td>${c.location}</td>
                                <td>${c.category}</td>
                                <td>
                                    <span class="badge ${c.status == 'Pending' ? 'bg-danger' : 'bg-warning text-dark'}">
                                        ${c.status}
                                    </span>
                                </td>
                                <td>${c.date}</td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="4" class="text-center text-muted">No recent complaints found.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>

    </div>
</div>

<footer class="py-2 text-center">
    <p class="small text-white-50 mb-0">Gajra Avenue Manager System <i class="fa-solid fa-at"></i> 2026</p>
</footer>

<div id="logoutModal" style="display:none;position:fixed;inset:0;background:rgba(0,0,0,0.8);justify-content:center;align-items:center;z-index:1000;">
    <div style="background:#111111; padding:35px 30px; border-radius:20px; border:1px solid #7c622d; text-align:center; min-width:440px; box-shadow: 0 4px 15px rgba(0,0,0,0.5);">
        <h5 style="margin-bottom:30px; font-family: 'Cinzel', serif; color:#c5a059; letter-spacing:1px; font-size:16px; text-transform: uppercase;">Are you sure you want to logout?</h5>

        <div style="display:flex; justify-content:center; gap:15px;">
            <button onclick="logout()" style="padding:10px 30px; background:#a17b1d; color:#111; border:none; border-radius:6px; cursor:pointer; font-family:'Montserrat', sans-serif; font-weight: 500; font-size:14px; min-width:80px;">Yes</button>
            <button onclick="closeModal()" style="padding:10px 25px; background:transparent; color:#c5a059; border:1px solid #443515; border-radius:6px; cursor:pointer; font-family:'Montserrat', sans-serif; font-weight: 500; font-size:14px; min-width:80px;">Cancel</button>
        </div>
    </div>
</div>

<script>
    function confirmLogout(e){
        e.preventDefault();
        document.getElementById("logoutModal").style.display="flex";
    }

    function closeModal(){
        document.getElementById("logoutModal").style.display="none";
    }

    function logout(){
        window.location.href = "${pageContext.request.contextPath}/";
    }
</script>
<script>
const toggleBtn = document.querySelector(".menu-toggle");
const sidebar = document.querySelector(".sidebar");
const overlay = document.querySelector(".overlay");

toggleBtn.addEventListener("click", () => {
    sidebar.classList.toggle("active");
    overlay.classList.toggle("active");
});

overlay.addEventListener("click", () => {
    sidebar.classList.remove("active");
    overlay.classList.remove("active");
});



</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>