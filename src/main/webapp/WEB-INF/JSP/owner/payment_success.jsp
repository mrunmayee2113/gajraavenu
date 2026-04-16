<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Successful - Gajra Avenue</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owner/payment_success.css">

</head>
<body>

<div class="success-card">
    <div class="icon-box">✔</div>
    <h2 class="mb-3">Payment Successful!</h2>
    <p class="text-muted mb-4">Your maintenance payment for <strong>Flat A-302</strong> has been processed successfully.</p>

    <a href="/download-receipt" class="btn-custom-receipt">
        <i class="bi bi-file-earmark-pdf"></i> Download Receipt
    </a>

    <br>

    <a href="/payments" class="btn-custom-history">
        View Payment History
    </a>

    <div class="mt-4">
        <a href="/owner-dashboard" class="text-decoration-none text-primary">Back to Dashboard</a>
    </div>
</div>

</body>
</html>