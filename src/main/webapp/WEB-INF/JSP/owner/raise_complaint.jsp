<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.time.LocalDate" %>

<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Raise Complaint | Gajra Avenue</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>

/* ================= ROOT ================= */
:root{
    --gold:#c5a059;
    --gold-light:#e2c275;
    --obsidian:#0a0a0b;
    --card:#111111;
    --white:#ffffff;
    --transition: all 0.4s ease;
}

/* ================= BODY ================= */
body{
    font-family:'Montserrat',sans-serif;
    background: linear-gradient(rgba(10,10,11,0.85), rgba(10,10,11,0.95)),
    url('../../images/owner/img.jpg');
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    color:var(--white);
}

/* ================= HEADER ================= */
.header-title{
    font-family:'Cinzel',serif;
    color:var(--gold);
    text-align:center;
    margin:30px 0;
    letter-spacing:2px;
}

/* ================= CARD ================= */
.entry-card{
    background:var(--card);
    border-radius:15px;
    padding:40px;
    max-width:900px;
    margin:auto;
    border:1px solid rgba(197,160,89,0.2);
}

/* ================= FORM ================= */
.form-label{
    font-size:0.8rem;
    text-transform:uppercase;
    font-weight:600;
}
.form-control,.form-select{
    background:#1a1a1a;
    border:1px solid rgba(197,160,89,0.3);
    color:white;
}
.form-control:focus,.form-select:focus{
    border-color:var(--gold);
    box-shadow:0 0 8px rgba(197,160,89,0.4);
}

/* ================= BUTTONS ================= */
.btn-save{
    background:var(--gold);
    color:#000;
    padding:12px 30px;
    border:none;
    border-radius:8px;
    font-weight:600;
    transition:var(--transition);
}
.btn-save:hover{
    background:var(--gold-light);
    transform:translateY(-2px);
}

/* 🔥 NEW CANCEL BUTTON */
.btn-cancel{
    background:transparent;
    color:var(--gold);
    border:1px solid var(--gold);
    padding:12px 30px;
    border-radius:8px;
    font-weight:600;
    transition:var(--transition);
    text-decoration:none;
}
.btn-cancel:hover{
    background:var(--gold);
    color:#000;
    transform:translateY(-2px);
}

/* ================= HISTORY ================= */
.history-container{
    max-width:900px;
    margin:40px auto;
}
.history-table{
    width:100%;
}
.history-table th{
    color:var(--gold);
}
.history-table td{
    background:#111;
    padding:12px;
}

/* ACTION ICONS */
.action-icon{
    color:#888;
    margin:0 8px;
}
.action-icon:hover{
    color:var(--gold);
}
.icon-delete:hover{
    color:red;
}
/* ================= NEW BACK BUTTON ================= */
.btn-back {
    background: rgba(255, 255, 255, 0.05);
    color: var(--white);
    border: 1px solid rgba(255, 255, 255, 0.2);
    padding: 12px 30px;
    border-radius: 8px;
    font-weight: 600;
    transition: var(--transition);
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 8px;
}

.btn-back:hover {
    background: rgba(255, 255, 255, 0.1);
    color: var(--gold);
    border-color: var(--gold);
    transform: translateY(-2px);
}
</style>

</head>

<body>
<h1 class="header-title">Raise Complaint</h1>

<div class="entry-card">

<form action="${pageContext.request.contextPath}/owner/submit-complaint" method="post">

<input type="hidden" name="id" value="${complaint.id}">

<div class="row">

<div class="col-md-4">
<label class="form-label">System ID</label>
<input type="text" class="form-control" value="${complaint.id != null ? complaint.id : 'AUTO'}" readonly>
</div>

<div class="col-md-4">
<label class="form-label">Date</label>
<input type="text" class="form-control" value="${complaint.date != null ? complaint.date : LocalDate.now()}" readonly>
</div>

<div class="col-md-4">
<label class="form-label">Status</label>
<input type="text" class="form-control" value="${complaint.status != null ? complaint.status : 'Pending'}" readonly>
</div>

<div class="col-md-6">
<label class="form-label">Flat No</label>
<input type="text" name="location" class="form-control" value="${complaint.location}" required>
</div>

<div class="col-md-6">
<label class="form-label">Category</label>
<select name="category" class="form-select" required>
<option value="">Select</option>
<option value="Maintenance">Maintenance</option>
<option value="Plumbing">Plumbing</option>
<option value="Electricity">Electricity</option>
<option value="Security">Security</option>
<option value="Other">Other</option>
</select>
</div>

<div class="col-12">
<label class="form-label">Description</label>
<textarea name="description" class="form-control" rows="4" required>${complaint.description}</textarea>
</div>

</div>

<!-- 🔥 SAVE + CANCEL -->

<div class="d-flex justify-content-center gap-3 mt-3">

    <!-- New Back Button -->
    <a href="${pageContext.request.contextPath}/dashboard" class="btn-back">
        <i class="fa-solid fa-arrow-left"></i> Back
    </a>

    <button type="submit" class="btn-save">
        <i class="fa fa-check"></i> Save
    </button>

    <a href="${pageContext.request.contextPath}/dashboard" class="btn-cancel">
        <i class="fa fa-xmark"></i> Cancel
    </a>

</div>
</div>

</form>
</div>

<!-- ================= HISTORY ================= -->

<div class="history-container">
<h5 style="color:var(--gold)">Previous Complaints</h5>

<table class="history-table">
<thead>
<tr>
<th>ID</th>
<th>Date</th>
<th>Flat</th>
<th>Category</th>
<th>Status</th>
<th>Actions</th>
</tr>
</thead>

<tbody>
<c:forEach var="c" items="${complaints}">
<tr>
<td>${c.id}</td>
<td>${c.date}</td>
<td>${c.location}</td>
<td>${c.category}</td>
<td>${c.status}</td>
<td>
<a href="${pageContext.request.contextPath}/owner/edit-complaint/${c.id}" class="action-icon">
<i class="fa fa-pen"></i>
</a>
<a href="${pageContext.request.contextPath}/owner/delete-complaint/${c.id}" class="action-icon icon-delete">
<i class="fa fa-trash"></i>
</a>
</td>
</tr>
</c:forEach>
</tbody>
</table>

</div>

</body>
</html>
