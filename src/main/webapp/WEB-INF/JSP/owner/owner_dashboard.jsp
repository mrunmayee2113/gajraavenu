<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flat Owner Portal | Gajra Avenue</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owner/owner_dashboard.css">

</head>

<body>

<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand logo-text" href="/dashboard">GAJRA AVENUE</a>
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navMenu">
            <ul class="navbar-nav ms-auto align-items-lg-center text-center">
                <li class="nav-item"><a class="nav-link" href="/notice">Notice</a></li>
                <li class="nav-item"><a class="nav-link" href="/service">Service</a></li>
                <li class="nav-item"><a class="nav-link" href="/payments">Payments</a></li>
                <li class="nav-item"><a class="nav-link" href="#mycomplains">Complaints</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbRI9GmSaA5hC7JCHlIyAl55F3xLseNCQcjQ&s" class="profile-avatar">
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="#">Profile</a></li>
                        <li><a class="dropdown-item" href="#">Settings</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger" href="/">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<section class="dashboard-header text-white">
    <div class="container">
        <h2 class="glow-text">Welcome Back, Sayali </h2>
        <p class="mt-2 text-white-50">Flat A - 203 - A Wing</p>
    </div>
</section>

<div class="container py-5">
    <div class="row justify-content-center g-3 mb-5 text-center">
        <div class="col-12 col-md-6 col-lg-3">
            <div class="card-box w-100">
                <h3>₹ 2,500</h3>
                <h6 class="text-white-50 text-uppercase">Maintenance Due</h6>
                <a href="/pay-now" class="btn btn-gold btn-sm mt-2">Pay Now</a>
            </div>
        </div>

        <div class="col-12 col-md-6 col-lg-3">
            <div class="card-box w-100 text-center">
                <h3>Visitors</h3>
                <h6 class="text-white-50 text-uppercase">Manage Entry</h6>
                <div class="d-flex gap-4 justify-content-center mt-1">
                    <a href="/add-visitor" class="btn btn-success btn-sm"><i class="fa fa-plus"></i></a>
                    <a href="/visitor-history" class="btn btn-primary btn-sm"><i class="fa fa-clock"></i></a>
                </div>
            </div>
        </div>

        <div class="col-12 col-md-6 col-lg-3">
            <div class="card-box w-100 text-center" onclick="location.href='/add-rental'" style="cursor:pointer;">
                <h3><i class="fa fa-plus"></i></h3>
                <h6 class="text-white-50 text-uppercase">Add Rental Details</h6>
                <p>Upload Flat Details</p>
            </div>
        </div>

        <div class="col-12 col-md-6 col-lg-3">
            <a href="/notice" style="text-decoration:none; color:inherit;">
                <div class="card-box w-100 text-center">
                    <h3>3</h3>
                    <h6 class="text-white-50 text-uppercase">Latest Notices</h6>
                    <p>Water Maintenance</p>
                </div>
            </a>
        </div>


    </div>

    <div id="mycomplains" class="table-wrapper mb-5">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>Issue</th>
                <th>Status</th>
                <th>Date</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Water Leakage</td>
                <td class="text-warning">Pending</td>
                <td>20 Feb 2026</td>
            </tr>
            <tr>
                <td>Lift Noise</td>
                <td class="text-success">Resolved</td>
                <td>15 Feb 2026</td>
            </tr>
            <tr class="extra-complaint d-none">
                <td>Parking Issue</td>
                <td class="text-warning">Pending</td>
                <td>10 Feb 2026</td>
            </tr>
            <tr class="extra-complaint d-none">
                <td>Electric Fault</td>
                <td class="text-success">Resolved</td>
                <td>05 Feb 2026</td>
            </tr>
            <tr onclick="toggleComplaints()" style="cursor:pointer;">
                <td colspan="3" id="expandText" style="background:rgba(197, 160, 89, 0.1); color:var(--gold); font-weight:600;">SHOW ALL</td>
            </tr>
            </tbody>
        </table>
        <div class="text-center mt-3">
            <a href="/raise-complaint" class="btn btn-gold">RAISE COMPLAINT</a>
        </div>
    </div>

    <div class="table-wrapper mb-5">
        <h4 class="section-title">Visitor Notifications</h4>
        <div class="card-box mb-3 h-auto py-3">
            <div class="d-flex justify-content-between align-items-center w-100">
                <div>
                    <h6 style="color:var(--gold); margin:0;"><i class="fa-solid fa-user me-2"></i> Pranjal Jadhav</h6>
                    <small class="text-white-50">Personal Visit • 10:30 AM</small>
                </div>
                <div class="text-warning fw-semibold">Waiting at Gate</div>
            </div>
        </div>
        <div class="card-box mb-3 h-auto py-3">
            <div class="d-flex justify-content-between align-items-center w-100">
                <div>
                    <h6 style="color:var(--gold); margin:0;"><i class="fa-solid fa-box me-2"></i> Amazon Delivery</h6>
                    <small class="text-white-50">Package Delivery • 09:15 AM</small>
                </div>
                <div class="text-success fw-semibold">Entered Society</div>
            </div>
        </div>
        <div class="text-center mt-4">
            <a href="/visitor-history" class="btn btn-gold px-4 py-2"><i class="fa fa-clock me-2"></i> View History</a>
        </div>
    </div>
</div>

<footer class="py-4 text-center border-top border-secondary border-opacity-10">
    <p class="small text-white-50">Gajra Avenue Owner System © 2026</p>
</footer>

<script>
    let expanded = false;
    function toggleComplaints() {
        const rows = document.querySelectorAll(".extra-complaint");
        const text = document.getElementById("expandText");
        rows.forEach(row => row.classList.toggle("d-none"));
        expanded = !expanded;
        text.innerText = expanded ? "SHOW LESS" : "SHOW ALL";
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>