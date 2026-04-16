<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Maintenance Receipt | Gajra Avenue</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@600&family=Montserrat:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manager/receipt.css">

</head>

<body>

<div class="container">

    <h1>GAJRA AVENUE APARTMENT</h1>
    <h2>Maintenance Receipt</h2>

    <div class="form-grid">

        <div class="form-group">
            <label>Receipt No:</label>
            <input type="text">
        </div>

        <div class="form-group">
            <label>Date:</label>
            <input type="date">
        </div>

        <div class="form-group">
            <label>Flat No:</label>
            <input type="text">
        </div>

        <div class="form-group">
            <label>Received From:</label>
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

        <tr>
            <td colspan="2"><b>Total</b></td>
            <td><input type="text"></td>
        </tr>

    </table>

    <div class="btn-container">
        <button class="btn">Send</button>
    </div>

</div>
<div class="table-container">
    <table>
        ...
    </table>
</div>

</body>
</html>