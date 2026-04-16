<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pay Maintenance | Gajra Avenue</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owner/pay_now.css">


</head>
<body>

<div class="container">

    <div class="page-header">
        <h1>Pay Maintenance Bill</h1>
        <p class="text-white-50">Gajra Avenue Owner Billing Portal</p>
    </div>

    <div class="luxury-card" id="mainCard">

        <div class="d-flex justify-content-between align-items-center mb-4">
            <h5 style="color:var(--gold);">Bill Summary</h5>
            <span class="text-white-50">Flat No: <strong>A-302</strong></span>
        </div>

        <div id="paymentArea">
            <div class="bill-box mb-4">
                <div class="d-flex justify-content-between">
                    <span>Monthly Maintenance (Feb 2026)</span>
                    <span>Rs. 3,000</span>
                </div>
                <div class="d-flex justify-content-between">
                    <span>Parking Charges</span>
                    <span>Rs. 500</span>
                </div>
                <div class="d-flex justify-content-between">
                    <span>Water Charges</span>
                    <span>Rs. 350</span>
                </div>
                <hr style="border-color:rgba(255,255,255,0.1);">
                <div class="d-flex justify-content-between total-amount">
                    <span>Total Due</span>
                    <span>Rs. 3,850</span>
                </div>
            </div>

            <form id="payForm">
                <div class="mb-3">
                    <label class="form-label">Select Payment Method</label>
                    <select name="status" class="form-select" id="method" required>
                        <option value="" disabled selected>Choose Payment Method</option>
                        <option value="UPI">UPI</option>
                        <option value="Debit Card">Debit Card</option>
                        <option value="Credit Card">Credit Card</option>
                        <option value="Net Banking">Net Banking</option>
                    </select>
                </div>

                <div class="text-end">
                    <button type="button" onclick="handlePayment()" class="btn btn-gold">
                        <i class="fa-solid fa-credit-card me-2"></i>Pay Now Rs. 3850
                    </button>
                </div>
            </form>
        </div>

        <div id="successSection" style="display: none;" class="text-center py-4">
            <div class="mb-4">
                <i class="fa-solid fa-circle-check" style="color:var(--gold); font-size: 70px;"></i>
            </div>
            <h2 style="font-family:'Cinzel'; color:var(--gold);">Payment Successful</h2>
            <p class="text-white-50 mb-4">Your maintenance for Feb 2026 has been received.</p>

            <div class="bill-box mb-4 text-start mx-auto" style="max-width: 400px;">
                <div class="d-flex justify-content-between small mb-2">
                    <span>Transaction ID:</span>
                    <span class="text-white">#GAJ-99281-302</span>
                </div>
                <div class="d-flex justify-content-between small">
                    <span>Amount Paid:</span>
                    <span class="text-white">Rs. 3,850.00</span>
                </div>
            </div>

            <div class="d-flex gap-3 justify-content-center">
                <a href="/download-receipt" class="btn btn-gold px-4">
                    <i class="fa-solid fa-file-pdf me-2"></i>Generate Receipt
                </a>
                <a href="/owner-dashboard" class="btn btn-outline-secondary rounded-pill px-4 text-white border-secondary">
                    Dashboard
                </a>
            </div>
        </div>

    </div>

</div>

<script>
    function handlePayment() {
        const method = document.getElementById('method').value;
        if(method === "") {
            alert("Please select a payment method");
            return;
        }

        // Hide Form, Show Success
        document.getElementById('paymentArea').style.display = 'none';
        document.getElementById('successSection').style.display = 'block';
    }
</script>

</body>
</html>