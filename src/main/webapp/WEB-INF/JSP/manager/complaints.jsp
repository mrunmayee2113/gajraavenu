<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complaints | Gajra Avenue</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manager/complaints.css">
</head>

<body>

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

<div class="content">
    <h1 style="margin-bottom:30px; font-family: 'Cinzel'; color: white;">COMPLAINTS OVERVIEW</h1>

    <div class="cards">
        <div class="card">
            <h3>Total Complaints</h3>
            <h2 id="totalCount">${totalCount}</h2>
        </div>
        <div class="card">
            <h3>Active</h3>
            <h2 id="activeCount">${activeCount}</h2>
        </div>
    </div>

    <div class="section">
        <h2>Complaint Records</h2>
        <div class="table-container">
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Flat/Location</th>
                    <th>Category</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Date</th>
                </tr>
                </thead>
                <tbody id="complaintsTableBody">
                <c:forEach var="comp" items="${allComplaints}">
                    <tr id="row-${comp.id}">
                        <td>C${comp.id}</td>
                        <td>${comp.location}</td>
                        <td>${comp.category}</td>
                        <td>${comp.description}</td>
                        <td>
                            <div class="status-wrapper">
                                <button class="status ${comp.status == 'Pending' ? 'status-pending' : (comp.status == 'In Progress' ? 'status-in-progress' : 'status-resolved')}"
                                        onclick="toggleStatusDropdown(this)">
                                    <span>${comp.status}</span> <i class="fa fa-caret-down"></i>
                                </button>
                                <div class="status-dropdown">
                                    <button onclick="changeStatus(this, ${comp.id}, 'Pending')">Pending</button>
                                    <button onclick="changeStatus(this, ${comp.id}, 'In Progress')">In Progress</button>
                                    <button onclick="changeStatus(this, ${comp.id}, 'Resolved')">Resolved</button>
                                </div>
                            </div>
                        </td>
                        <td>${comp.date}</td>
                    </tr>
                </c:forEach>
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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function confirmLogout(e){
        e.preventDefault();
        document.getElementById("logoutModal").style.display="flex";
    }

    function closeModal(){
        document.getElementById("logoutModal").style.display="none";
    }

    function logout(){
        window.location.href="/";
    }

    function toggleStatusDropdown(button){
        const dropdown = button.nextElementSibling;
        document.querySelectorAll('.status-dropdown').forEach(d=>{
            if(d!==dropdown) d.style.display='none';
        });
        dropdown.style.display = dropdown.style.display === 'flex' ? 'none' : 'flex';
        dropdown.style.flexDirection='column';
    }

    /**
     * UPDATED: Handles real-time UI updates and Auto-Deletion logic
     */
    function changeStatus(el, complaintId, newStatus) {
        const params = new URLSearchParams();
        params.append('id', complaintId);
        params.append('status', newStatus);

        fetch('${pageContext.request.contextPath}/manager/updateComplaintStatus', {
            method: 'POST',
            body: params
        })
        .then(response => response.text())
        .then(data => {
            if(data === "DELETED") {
                // Visual feedback for resolution and automatic removal
                alert("Complaint marked as Resolved and removed from active records.");
                $("#row-" + complaintId).fadeOut(600, function() {
                    location.reload();
                });
            } else if(data === "SUCCESS") {
                // Normal status update (Pending or In Progress)
                location.reload();
            } else {
                alert("Update failed. Please check the server logs.");
            }
        });
    }

    window.addEventListener('click', function(e){
        if(!e.target.closest('.status-wrapper')){
            document.querySelectorAll('.status-dropdown').forEach(d=>d.style.display='none');
        }
    });
</script>

</body>
</html>