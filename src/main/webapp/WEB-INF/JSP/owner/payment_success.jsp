<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Successful - Gajra Avenue</title>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<!-- Your CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owner/payment_success.css">


</head>

<body>

<div class="success-card text-center">


<div class="icon-box">✔</div>

<h2 class="mb-3">Payment Successful!</h2>

<p class="text-muted mb-4">
    Your maintenance payment for
    <strong>Flat ${loggedUser.flatNumber}</strong>
    has been processed successfully.
</p>

<!-- Download Receipt -->
<a href="${pageContext.request.contextPath}/download-receipt"
   class="btn-custom-receipt">
    <i class="bi bi-file-earmark-pdf"></i> Download Receipt
</a>

<br><br>

<!-- Payment History -->
<a href="${pageContext.request.contextPath}/payments"
   class="btn-custom-history">
    View Payment History
</a>

<div class="mt-4">
    <!-- Back to Dashboard -->
    <a href="${pageContext.request.contextPath}/owner-dashboard"
       class="text-decoration-none text-primary">
        Back to Dashboard
    </a>
</div>


</div>

</body>
</html>
