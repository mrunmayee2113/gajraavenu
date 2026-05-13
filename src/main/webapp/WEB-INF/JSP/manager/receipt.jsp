<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Maintenance Receipt</title>

    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            padding: 20px;
        }

        h1, h2 {
            text-align: center;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            margin-top: 20px;
        }

        .form-group label {
            font-weight: bold;
        }

        table {
            width: 100%;
            margin-top: 30px;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid black;
        }

        th, td {
            padding: 10px;
            text-align: center;
        }
    </style>

</head>

<body>

<h1>GAJRA AVENUE APARTMENT</h1>
<h2>Maintenance Receipt</h2>

<div class="form-grid">

    <div class="form-group">
        <label>Receipt No:</label>
        <p>${payment.id}</p>
    </div>

    <div class="form-group">
        <label>Date:</label>
        <p>${paymentDate}</p>
    </div>

    <div class="form-group">
        <label>Flat No:</label>
        <p>${payment.flatNumber}</p>
    </div>

    <div class="form-group">
        <label>Received From:</label>
        <p>Owner</p>
    </div>

</div>

<table>

    <tr>
        <th>No.</th>
        <th>Particulars</th>
        <th>Amount</th>
    </tr>

    <tr>
        <td>1</td>
        <td>Maintenance Charges</td>
        <td>₹ ${payment.amount}</td>
    </tr>

    <tr>
        <td colspan="2"><b>Total</b></td>
        <td>₹ ${payment.amount}</td>
    </tr>

</table>

</body>
</html>