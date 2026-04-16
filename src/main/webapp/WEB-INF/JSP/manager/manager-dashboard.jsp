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
        <a href="${pageContext.request.contextPath}/manager/settings"><i class="fa-solid fa-gear"></i> Settings</a>
        <a href="/" onclick="confirmLogout(event)"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
    </div>

    <div class="main">

        <div class="topbar">
            <div class="d-flex align-items-center gap-3">
                <i class="fa-solid fa-building-columns fa-lg"></i>
                <h2>Manager Dashboard</h2>
            </div>

            <div class="d-flex align-items-center gap-3">
                <span class="badge bg-warning text-dark">Manager</span>
                <i class="fa-solid fa-bell"></i>
                <img src="https://i.pravatar.cc/40" class="rounded-circle" width="35" alt="Avatar">
            </div>
        </div>

        <div class="row g-4 mb-4">
            <div class="col-md-3">
                <div class="card-box">
                    <h5>Total Residents</h5>
                    <h3>56</h3>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card-box">
                    <h5>Active Complaints</h5>
                    <h3>4</h3>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card-box">
                    <h5>Security Alerts</h5>
                    <h3>2</h3>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card-box">
                    <h5>Pending Payments</h5>
                    <h3>8</h3>
                </div>
            </div>
        </div>

        <div class="table-wrapper">
            <h5 class="mb-3" style="font-family:'Cinzel'; color:var(--gold);">Recent Complaints</h5>

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
                <tr>
                    <td>A-203</td>
                    <td>Water Leakage</td>
                    <td><span class="badge-warning">Pending</span></td>
                    <td>21 Feb 2026</td>
                </tr>
                <tr>
                    <td>B-101</td>
                    <td>Lift Maintenance</td>
                    <td><span class="badge-success">Resolved</span></td>
                    <td>20 Feb 2026</td>
                </tr>
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
        window.location.href="/";
    }
</script>

</body>
</html>