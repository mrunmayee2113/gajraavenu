<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${not empty visitor.id ? 'Edit' : 'Add'} Visitor | Gajra Avenue</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owner/addVisitor.css">
</head>

<body>

<section class="service-header">
    <h1>${not empty visitor.id ? 'Update Visitor' : 'Pre-Approve Guests'}</h1>
    <p>${not empty visitor.id ? 'Modify current guest details' : 'Let security know who to expect'}</p>
</section>

<div class="form-card">
    <form action="${pageContext.request.contextPath}/save-visitor" method="POST">

        <input type="hidden" name="id" value="${visitor.id}">

        <div class="mb-3">
            <label class="form-label"><i class="fa fa-user label-icon"></i> Guest Name</label>
            <input type="text" name="name" class="form-control" value="${visitor.name}" required>
        </div>

        <div class="mb-3">
            <label class="form-label"><i class="fa fa-phone label-icon"></i> Mobile Number</label>
            <input type="tel" name="phone" class="form-control" value="${visitor.phone}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">
                <i class="fa fa-building label-icon"></i> Flat Number
            </label>
            <input type="text" name="flatNumber" class="form-control" value="${visitor.flatNumber}" readonly>
        </div>

        <div class="mb-3">
            <label class="form-label"><i class="fa fa-info-circle label-icon"></i> Purpose</label>
            <select name="purpose" class="form-select">
                <option value="Personal Visit" ${visitor.purpose == 'Personal Visit' ? 'selected' : ''}>Personal Visit</option>
                <option value="Delivery" ${visitor.purpose == 'Delivery' ? 'selected' : ''}>Delivery</option>
                <option value="Maintenance" ${visitor.purpose == 'Maintenance' ? 'selected' : ''}>Service Providers</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label"><i class="fa fa-calendar label-icon"></i> Visit Date</label>
            <input type="date" name="visitDate" class="form-control" value="${visitor.visitDate}">
        </div>

        <div class="mb-3">
            <label class="form-label"><i class="fa fa-clock label-icon"></i> Expected Time</label>
            <input type="time" name="visitTime" class="form-control" value="${visitor.visitTime}">
        </div>

        <div class="mb-3">
            <label class="form-label"><i class="fa fa-note-sticky label-icon"></i> Additional Notes</label>
            <textarea name="notes" class="form-control" rows="2">${visitor.notes}</textarea>
        </div>

        <div class="text-center mt-4">
            <button type="submit" class="btn btn-gold px-4 py-2">
                <i class="fa fa-check me-2"></i> ${not empty visitor.id ? 'Update' : 'Add'} Visitor
            </button>
        </div>
    </form>
</div>

</body>
</html>