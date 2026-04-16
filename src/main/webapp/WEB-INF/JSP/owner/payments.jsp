<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payments | Gajra Avenue</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owner/payments.css">


</head>

<body>
<section class="service-header">
    <h1>Maintenance Payments</h1>
    <p class="text-white-50">Secure Billing Portal for Gajra Avenue Residents</p>
</section>

<div class="container py-5">

    <div class="row g-4">
        <div class="col-md-6">
            <div class="payment-card text-center text-md-start">
                <h5><i class="fa-solid fa-wallet me-2" style="color:var(--gold);"></i>Current Due</h5>
                <p class="amount mt-3">Rs. 3,850</p>
                <p class="text-white-50 small">Billing Period: February 2026</p>
                <a href="/pay-now" class="btn-gold mt-3 text-decoration-none d-inline-block">
                    <i class="fa-solid fa-credit-card me-2"></i>Proceed to Pay
                </a>
            </div>
        </div>

        <div class="col-md-6">
            <div class="payment-card text-center text-md-start">
                <h5><i class="fa-solid fa-building-user me-2" style="color:var(--gold);"></i>Flat Record</h5>
                <p class="amount mt-3">A-302</p>
                <p class="text-white-50 small">Owner: Sayali Jadhav</p>
                <p class="text-white-50 small">Wing: A-Wing, Gajra Avenue</p>
            </div>
        </div>
    </div>

    <div class="mt-5">
        <h4 style="color:var(--gold); font-family:'Cinzel'; margin-bottom: 20px;">
            <i class="fa-solid fa-clock-rotate-left me-2"></i>Payment History
        </h4>

        <div class="table-responsive">
            <table class="table table-hover text-center align-middle">
                <thead>
                <tr>
                    <th>Payment Type</th>
                    <th>Transaction ID</th>
                    <th>Amount</th>
                    <th>Status</th>
                    <th>Receipt</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="p" items="${paymentList}">
                        <tr>
                            <td class="fw-bold">${p.paymentType}</td>
                            <td class="text-muted">${p.transactionId}</td>
                            <td class="fw-bold text-dark">Rs. ${p.amount}</td>
                            <td><span class="badge-success">SUCCESS</span></td>
                            <td>
                                <a href="/download-receipt" class="btn-receipt">
                                    <i class="fa-solid fa-file-pdf me-1"></i> DOWNLOAD
                                </a>
                            </td>
                        </tr>
                    </c:forEach>

                    <%-- Fallback static rows for demo --%>
                    <c:if test="${empty paymentList}">
                        <tr>
                            <td class="fw-bold">Monthly Maintenance</td>
                            <td class="text-muted">#GAJ-99281-302</td>
                            <td class="fw-bold text-dark">Rs. 3,850</td>
                            <td><span class="badge-success">SUCCESS</span></td>
                            <td>
                                <a href="/download-receipt" class="btn-receipt">
                                    <i class="fa-solid fa-file-pdf me-1"></i> DOWNLOAD
                                </a>
                            </td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>

            <c:if test="${empty paymentList}">
                <p class="text-center text-white-50 mt-3 small italic">Showing latest system records</p>
            </c:if>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    </html>