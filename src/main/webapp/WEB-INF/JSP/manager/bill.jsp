<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <title>Maintenance Bill | Gajra Avenue</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@600&family=Montserrat:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manager/bill.css">

</head>

<body>

<div class="container">
    <img src="gajaralogo.jpeg" alt="Logo" class="bill-logo">

    <h1>GAJRA AVENUE APARTMENT</h1>

    <div class="address">
        S.No.109, Pathardi Gaulane Road, Nashik - 422010
    </div>

    <h2>BILL / INVOICE</h2>

    <div class="form-grid">
        <div class="form-group">
            <label>Invoice No:</label>
            <input type="text">
        </div>

        <div class="form-group">
            <label>Date:</label>
            <input type="date">
        </div>

        <div class="form-group">
            <label>Wing / Flat No:</label>
            <input type="text">
        </div>

        <div class="form-group">
            <label>Owner Name:</label>
            <input type="text">
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
            <td><input type="text"></td>
            <td><input type="text"></td>
        </tr>
        <tr class="total-row">
            <td colspan="2">TOTAL</td>
            <td><input type="text"></td>
        </tr>
    </table>

    <div class="footer">
        <div>Cheque Subject to realisation</div>
        <div>Manager Signature</div>
    </div>

    <div class="btn-container">
        <button class="btn">Send</button>
    </div>
</div>

</body>
</html>