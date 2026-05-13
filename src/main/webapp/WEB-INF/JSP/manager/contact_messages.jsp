<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manager | Contact Messages</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manager.css">

    <style>
        body {
            background: #0a0a0b;
            color: #fff;
            font-family: 'Montserrat', sans-serif;
        }

        .container-box {
            margin: 40px;
            padding: 30px;
            border-radius: 15px;
            background: #111;
            border: 1px solid rgba(197,160,89,0.3);
        }

        h2 {
            color: #c5a059;
            margin-bottom: 20px;
        }

        table {
            color: white;
        }

        thead {
            color: #c5a059;
        }

        .badge-new {
            background: #c5a059;
            color: black;
        }
    </style>
</head>

<body>

<div class="container-box">

    <h2>📩 Contact Messages</h2>

    <table class="table table-dark table-hover align-middle">
        <thead>
        <tr>
            <th>Name</th>
            <th>Phone</th>
            <th>Subject</th>
            <th>Message</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="c" items="${contacts}">
            <tr>
                <td>${c.name}</td>
                <td>${c.phone}</td>
                <td>${c.subject}</td>
                <td>${c.message}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

</body>
</html>