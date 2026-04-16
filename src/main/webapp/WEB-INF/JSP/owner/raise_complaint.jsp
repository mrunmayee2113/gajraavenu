<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Raise Complaint | Gajra Avenue</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owner/raise_complaint.css">
</head>
<body>

<div class="container">

    <div class="page-header">
        <h1>Raise a Complaint</h1>
        <p class="text-white-50">Gajra Avenue Owner Support Portal</p>
    </div>

    <div class="luxury-card">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h5 style="color:var(--gold);">Complaint Form</h5>
            <span class="text-white-50">Flat No: <strong>A-203</strong></span>
        </div>

        <form action="/submit-complaint" method="post">
            <div class="row g-4">
                <div class="col-md-6">
                    <label class="form-label">Complaint Category</label>
                    <select name="category" class="form-select" required>
                        <option value="" hidden>Select Category</option>
                        <option value="Lift Not Working">Lift Not Working</option>
                        <option value="Water Leakage">Water Leakage</option>
                        <option value="Electricity Issue">Electricity Issue</option>
                        <option value="Parking Problem">Parking Problem</option>
                        <option value="Security Concern">Security Concern</option>
                        <option value="Cleaning">Cleaning</option>
                    </select>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Location of Issue</label>
                    <input type="text" name="location" class="form-control" placeholder="Example: Wing B - 3rd Floor" required>
                </div>

                <div class="col-12">
                    <label class="form-label">Complaint Description</label>
                    <textarea name="description" class="form-control" rows="4" placeholder="Describe the issue clearly..." required></textarea>
                </div>
            </div>

            <div class="text-end mt-4">
                <button type="submit" class="btn btn-gold">
                    <i class="fa-solid fa-paper-plane me-2"></i>Submit Complaint
                </button>
            </div>
        </form>
    </div>

    <div class="luxury-card">
        <h5 class="mb-4" style="color:var(--gold);">Recent Complaints History</h5>

        <c:forEach var="c" items="${complaints}">
            <div class="complaint-item">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="mb-1">${c.category} - ${c.location}</h6>
                        <small class="text-white-50">ID: GA-${c.id} | Date: ${c.date}</small>
                        <p class="mt-2 mb-0 small text-white-70">${c.description}</p>
                    </div>
                    <span class="status-badge ${c.status}">${c.status}</span>
                </div>
            </div>
        </c:forEach>

        <c:if test="${empty complaints}">
            <div class="text-center py-4">
                <p class="text-white-50">No complaints raised yet.</p>
            </div>
        </c:if>
    </div>

</div>

</body>
</html>