<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flat Owner Portal | Gajra Avenue</title>


<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owner/owner_dashboard.css">


</head>

<body>

<!-- NAVBAR -->

<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand logo-text" href="${pageContext.request.contextPath}/dashboard">GAJRA AVENUE</a>


    <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navMenu">
        <ul class="navbar-nav ms-auto align-items-lg-center text-center">
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/notice">Notice</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/owner/services">Service</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/payments">Payments</a></li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbRI9GmSaA5hC7JCHlIyAl55F3xLseNCQcjQ&s" class="profile-avatar">
                </a>
                <ul class="dropdown-menu dropdown-menu-end shadow border-0" style="background-color: #141414;">
                    <li><a class="dropdown-item text-white" href="${pageContext.request.contextPath}/owner/profile">
                        <i class="fa-regular fa-user me-2" style="color: #c5a059;"></i> Profile</a></li>
                    <li><a class="dropdown-item text-white" href="${pageContext.request.contextPath}/owner/settings">
                        <i class="fa-solid fa-gear me-2" style="color: #c5a059;"></i> Settings</a></li>
                    <li><hr class="dropdown-divider" style="background-color: #333;"></li>
                    <li><a class="dropdown-item text-danger" href="/">
                        <i class="fa-solid fa-right-from-bracket me-2"></i> Logout</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>


</nav>

<!-- HEADER -->

<section class="dashboard-header text-white">
    <div class="container">
        <h2 class="glow-text">Welcome Back, ${sessionScope.loggedUser.name}</h2>
        <p class="mt-2 text-white-50">
            Flat ${sessionScope.loggedUser.wing} - ${sessionScope.loggedUser.flatNumber} - ${sessionScope.loggedUser.wing} Wing
        </p>
    </div>
</section>

<!-- CARDS -->

<div class="container py-5">
    <div class="row justify-content-center g-3 mb-5 text-center">


    <!-- ✅ CLEAN MAINTENANCE CARD -->
    <div class="col">
        <div class="card-box">
            <c:choose>
                <%-- Only show the Green Checkmark if status is explicitly 'Paid' --%>
                <c:when test="${bill != null && bill.status == 'Paid'}">
                    <h3 class="text-success">✔</h3>
                    <h6 class="text-success fw-bold">Maintenance Paid</h6>
                    <p class="small text-white-50">No Pending Dues</p>
                </c:when>

                <%-- For everything else (new users, pending bills), show ONLY the button --%>
                <c:otherwise>
                    <h3 style="color:var(--gold)">Pay Maintenance</h3>
                    <div class="mt-4">
                        <a href="${pageContext.request.contextPath}/owner/pay-now"
                           class="btn btn-gold w-100 py-2 fw-bold">
                           PAY NOW
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <!-- Visitors -->
    <div class="col">
        <div class="card-box text-center">
            <h3>Visitors</h3>
            <h6 class="text-white-50">Manage Entry</h6>
            <div class="d-flex gap-3 justify-content-center mt-2">
                <a href="${pageContext.request.contextPath}/add-visitor" class="btn btn-success btn-sm">
                    <i class="fa fa-plus"></i>
                </a>
                <a href="${pageContext.request.contextPath}/visitor-history" class="btn btn-primary btn-sm">
                    <i class="fa fa-clock"></i>
                </a>
            </div>
        </div>
    </div>

    <!-- Rental -->
    <div class="col">
        <div class="card-box text-center"
             onclick="location.href='${pageContext.request.contextPath}/add-rental'"
             style="cursor:pointer;">
            <h3><i class="fa fa-plus"></i></h3>
            <h6 class="text-white-50">Add Rental Details</h6>
            <p>Upload Flat Details</p>
        </div>
    </div>

</div>

<!-- COMPLAINTS -->
<div id="mycomplains">
    <h4 class="section-title mb-4">MY COMPLAINTS</h4>

    <div class="table-container">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>Date</th>
                <th>Category</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            </thead>

           <!-- Inside owner_dashboard.jsp -->
           <tbody>
               <c:choose>
                   <c:when test="${not empty allComplaints}">
                       <c:forEach var="comp" items="${allComplaints}">
                           <tr>
                               <td>${comp.date}</td>
                               <td><b>${comp.category}</b><br><small>${comp.description}</small></td>
                               <td>
                                   <!-- ✅ Status CSS Fix: Adding dynamic badges based on status -->
                                   <span class="badge ${comp.status == 'Resolved' ? 'bg-success' : 'bg-warning text-dark'}">
                                       ${comp.status}
                                   </span>
                               </td>
                               <td>
                                   <!-- ✅ Action Buttons -->
                                   <a href="${pageContext.request.contextPath}/owner/edit-complaint/${comp.id}" class="text-info me-2">
                                       <i class="fa fa-pen"></i>
                                   </a>
                                   <a href="${pageContext.request.contextPath}/owner/delete-complaint/${comp.id}" class="text-danger">
                                       <i class="fa fa-trash"></i>
                                   </a>
                               </td>
                           </tr>
                       </c:forEach>
                   </c:when>
                   <c:otherwise>
                       <tr>
                           <td colspan="4" class="text-center">No complaints</td>
                       </tr>
                   </c:otherwise>
               </c:choose>
           </tbody>
        </table>
    </div>

    <div class="text-center mt-3">
        <a href="${pageContext.request.contextPath}/owner/raise-complaint" class="btn btn-gold">
            RAISE NEW COMPLAINT
        </a>
    </div>
</div>


</div>

<footer class="text-center py-4">
    <p class="text-white-50">© 2026 Gajra Avenue</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
