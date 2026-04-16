<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Add Visitor | Gajra Avenue</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owner/addVisitor.css">

</head>

<body>

<section class="service-header">
    <h1>Pre-Approve Guests</h1>
    <p>Let security know who to expect</p>
</section>


<div class="form-card">

    <form action="/process-visitor" method="POST">

        <div class="mb-3">
            <label class="form-label">
                <i class="fa fa-user label-icon"></i> Guest Name
            </label>
            <input type="text" name="name" class="form-control" placeholder="Enter guest name" required>
        </div>

        <div class="mb-3">
            <label class="form-label">
                <i class="fa fa-phone label-icon"></i> Mobile Number
            </label>
            <input type="tel" name="phone" class="form-control" placeholder="Enter mobile number" required>
        </div>

        <div class="mb-3">
            <label class="form-label">
                <i class="fa fa-building label-icon"></i> Flat Number
            </label>
            <input type="text" name="flatNumber" class="form-control" value="A-203" readonly>
        </div>

        <div class="mb-3">
            <label class="form-label">
                <i class="fa fa-info-circle label-icon"></i> Purpose
            </label>
            <select name="purpose" class="form-select">
                <option value="Personal Visit">Personal Visit</option>
                <option value="Delivery">Delivery</option>
                <option value="Maintenance">Maintenance</option>
                <option value="Other">Other</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">
                <i class="fa fa-calendar label-icon"></i> Visit Date
            </label>
            <input type="date" class="form-control">
        </div>

        <div class="mb-3">
            <label class="form-label">
                <i class="fa fa-clock label-icon"></i> Expected Time
            </label>
            <input type="time" class="form-control">
        </div>

        <div class="mb-3">
            <label class="form-label">
                <i class="fa fa-note-sticky label-icon"></i> Additional Notes
            </label>
            <textarea class="form-control" rows="2" placeholder="Optional notes"></textarea>
        </div>

        <div class="text-center mt-4">
            <button type="submit" class="btn btn-gold px-4 py-2">
                <i class="fa fa-check me-2"></i> Add Visitor
            </button>
        </div>

    </form>

</div>

</body>
</html>