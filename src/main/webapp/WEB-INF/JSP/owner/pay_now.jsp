<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pay Maintenance | Gajra Avenue</title>


<!-- CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owner/pay_now.css">

<!-- Razorpay -->
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>


</head>

<body>

<div class="container">


<!-- HEADER -->
<div class="page-header text-center my-4">
    <h1>Pay Maintenance Bill</h1>
    <p class="text-white-50">Gajra Avenue Owner Billing Portal</p>
</div>

<!-- CARD -->
<div class="luxury-card p-4">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h5 style="color:var(--gold);">Bill Summary</h5>
        <span class="text-white-50">
            Flat No: <strong>${sessionScope.loggedUser.wing}-${sessionScope.loggedUser.flatNumber}</strong>
        </span>
    </div>

    <!-- BILL DETAILS -->
    <div class="bill-box mb-4">

        <div class="d-flex justify-content-between">
            <span>Monthly Maintenance</span>
            <span>Rs. ${bill.monthlyMaintenance}</span>
        </div>

        <div class="d-flex justify-content-between">
            <span>Parking Charges</span>
            <span>Rs. ${bill.parkingCharges}</span>
        </div>

        <div class="d-flex justify-content-between">
            <span>Water Charges</span>
            <span>Rs. ${bill.waterCharges}</span>
        </div>

        <hr>

        <div class="d-flex justify-content-between fw-bold">
            <span>Total Due</span>
            <span>Rs. ${bill.totalAmount}</span>
        </div>

    </div>

    <!-- PAY BUTTON -->
    <button onclick="handlePayment(${bill.totalAmount})" class="btn btn-warning">
        Pay Now Rs. ${bill.totalAmount}
    </button>

</div>


</div>

<!-- SCRIPT -->

<script>
function handlePayment(amount) {

    console.log("PAY CLICKED:", amount);

    fetch('${pageContext.request.contextPath}/create-order?amount=' + amount, {
        method: 'POST'
    })
    .then(response => response.json())
    .then(order => {

        console.log("ORDER:", order);

        var options = {
            "key": "rzp_test_SfeTEH5J2doZUV",
            "amount": order.amount,
            "currency": "INR",
            "name": "Gajra Avenue",
            "description": "Maintenance Payment",
            "order_id": order.id,

            "handler": function (response){

                fetch('${pageContext.request.contextPath}/verify-payment', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({
                        razorpay_payment_id: response.razorpay_payment_id,
                        amount: amount
                    })
                })
                .then(() => {
                    window.location.href = "${pageContext.request.contextPath}/payment-success";
                });
            },

            "prefill": {
                "name": "${sessionScope.loggedUser.name}",
                "email": "${sessionScope.loggedUser.email}",
                "contact": "${sessionScope.loggedUser.phone}"
            },

            "theme": {
                "color": "#c5a059"
            }
        };

        var rzp = new Razorpay(options);
        rzp.open();
    })
    .catch(error => {
        console.error("ERROR:", error);
        alert("Payment failed!");
    });
}
</script>

</body>
</html>
