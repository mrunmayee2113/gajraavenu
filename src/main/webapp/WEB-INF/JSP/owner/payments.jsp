<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html lang="en">
<head>
    <title>Payments | Gajra Avenue</title>


<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;600;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owner/payments.css">


</head>

<body>

<section class="service-header">
    <h1>Maintenance Payments</h1>
</section>

<div class="container py-5">


<div class="row g-4">
    <div class="col-md-6">
        <div class="payment-card">
            <h5>Current Due</h5>
            <p class="amount">Rs. ${bill.totalAmount}</p>
            <p class="text-white-50 small">${bill.billingMonth}</p>

            <a href="${pageContext.request.contextPath}/owner/pay-now"
               class="btn-gold mt-3 d-inline-block">
                Proceed to Pay
            </a>
        </div>
    </div>

    <div class="col-md-6">
        <div class="payment-card">
            <h5>Flat Record</h5>
            <p class="amount">${loggedUser.flatNumber}</p>
            <p class="text-white-50 small">${loggedUser.name}</p>
        </div>
    </div>
</div>

<div class="mt-5">
    <h4>Payment History</h4>

    <table class="table text-center">
        <thead>
        <tr>
            <th>Type</th>
            <th>Txn ID</th>
            <th>Amount</th>
            <th>Status</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="p" items="${paymentList}">
            <tr>
                <td>${p.paymentType}</td>
                <td>${p.transactionId}</td>
                <td>Rs. ${p.amount}</td>
                <td>SUCCESS</td>
            </tr>
        </c:forEach>
        </tbody>

    </table>
</div>


</div>

</body>
</html>
