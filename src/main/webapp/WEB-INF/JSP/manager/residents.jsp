<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Residents | Gajra Avenue</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manager/residents.css">

</head>

<body>

<div class="mobile-navbar">
    <h4>GAJRA AVENUE</h4>
    <button class="menu-btn" onclick="toggleSidebar()">
        <i class="fa-solid fa-bars"></i>
    </button>
</div>

<div class="sidebar-overlay" id="overlay" onclick="toggleSidebar()"></div>

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
        <a href="${pageContext.request.contextPath}/manager/settings"><i class="fa-solid fa-gear"></i> Settings</a>
        <a href="/" onclick="confirmLogout(event)"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
    </div>


    <div class="content">

        <div id="wingSection" style="${not empty selectedWing ? 'display:none' : 'display:block'}">
            <h2>Residents Wings</h2>
            <div class="wing-container">
                <div class="wing-card">
                    <img src="../../images/manager/img.png" alt="Wing A">
                    <div class="wing-overlay">
                        <h3>Wing A</h3>
                        <button onclick="location.href='/residents?wing=A'">VIEW UNITS</button>
                    </div>
                </div>
                <div class="wing-card">
                    <img src="../../images/manager/img.png" alt="Wing B">
                    <div class="wing-overlay">
                        <h3>Wing B</h3>
                        <button onclick="location.href='/residents?wing=B'">VIEW UNITS</button>
                    </div>
                </div>
                <div class="wing-card">
                    <img src="../../images/manager/img.png" alt="Wing C">
                    <div class="wing-overlay">
                        <h3>Wing C</h3>
                        <button onclick="location.href='/residents?wing=C'">VIEW UNITS</button>
                    </div>
                </div>
                <div class="wing-card">
                    <img src="../../images/manager/img.png" alt="Wing D">
                    <div class="wing-overlay">
                        <h3>Wing D</h3>
                        <button onclick="location.href='/residents?wing=D'">VIEW UNITS</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="residentPage" style="${not empty selectedWing ? 'display:block' : 'display:none'}">
            <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom: 20px;">
                <button onclick="location.href='/residents'" class="back-btn">Back</button>
                <button class="add-member-top" onclick="openAddMember()">+ Add Member</button>
            </div>

            <h2>${selectedWing} Wing Residents</h2>

            <div class="table-responsive">
                <table>
                    <thead>
                    <tr>
                        <th>Flat</th>
                        <th>Owner Name</th>
                        <th>Contact</th>
                        <th>Email</th>
                        <th>Members</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="res" items="${residentsList}">
                        <tr>
                            <td data-label="Flat">${res.flatNumber}</td>
                            <td data-label="Owner Name">${res.ownerName}</td>
                            <td data-label="Contact">${res.contact}</td>
                            <td data-label="Email">${res.email}</td>
                            <td data-label="Members">${res.membersCount}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>

<footer class="py-2 text-center">
    <p class="small text-white-50 mb-0">Gajra Avenue Manager System <i class="fa-solid fa-at"></i> 2026</p>
</footer>

<div id="memberModal" style="display:none">
    <div class="modal-card">
        <h3>Add Member</h3>
        <form action="/saveResident" method="POST">
            <input type="hidden" name="wing" value="${selectedWing}">

            <input type="text" name="flat" placeholder="Flat No" required>
            <input type="text" name="name" placeholder="Owner Name" required>
            <input type="text" name="contact" placeholder="Contact">
            <input type="email" name="email" placeholder="Email">
            <input type="number" name="members" placeholder="Members Count">

            <div class="modal-actions">
                <button type="submit" class="save-btn">Save</button>
                <button type="button" class="cancel-btn" onclick="closeMemberModal()">Cancel</button>
            </div>
        </form>
    </div>
</div>

<div id="logoutModal" style="display:none;position:fixed;inset:0;background:rgba(0,0,0,0.8);justify-content:center;align-items:center;z-index:1000;padding:20px;">
    <div style="background:#111111; padding:35px 30px; border-radius:20px; border:1px solid #7c622d; text-align:center; width:100%; max-width:440px;">
        <h5 style="margin-bottom:30px; color:#c5a059; font-size:16px;">Are you sure you want to logout?</h5>
        <div style="display:flex; justify-content:center; gap:15px;">
            <button onclick="location.href='/LandingPage/landingpage.html'" style="padding:10px 30px; background:#a17b1d; border:none; border-radius:6px; cursor:pointer;">Yes</button>
            <button onclick="closeModal()" style="padding:10px 25px; background:transparent; color:#c5a059; border:1px solid #443515; border-radius:6px; cursor:pointer;">Cancel</button>
        </div>
    </div>
</div>

<script>
    function toggleSidebar() {
        const sidebar = document.getElementById('sidebar');
        const overlay = document.getElementById('overlay');
        sidebar.classList.toggle('drawer-active');
        overlay.style.display = sidebar.classList.contains('drawer-active') ? 'block' : 'none';
    }

    function openAddMember(){
        document.getElementById("memberModal").style.display="flex";
    }

    function closeMemberModal(){
        document.getElementById("memberModal").style.display="none";
    }

    function confirmLogout(e){
        e.preventDefault();
        document.getElementById("logoutModal").style.display="flex";
    }

    function closeModal(){
        document.getElementById("logoutModal").style.display="none";
    }
</script>

</body>
</html>