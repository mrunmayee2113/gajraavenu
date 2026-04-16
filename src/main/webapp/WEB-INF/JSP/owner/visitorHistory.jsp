<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Visitor History | Gajra Avenue</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owner/visitorHistory.css">

</head>

<body>

<section class="header">
    <h1>Visitor History</h1>
    <p class="text-white-50">All visitor entries for your flat</p>
</section>

<div class="container py-5">

    <div class="table-wrapper">

        <h4 class="mb-3" style="color:var(--gold)">Visitor Logs :</h4>

        <table class="table table-hover">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Flat</th>
                <th>Phone</th>
                <th>Purpose</th>
                <th>Status</th>
            </tr>
            </thead>

            <tbody id="historyTable">
            <c:forEach var="v" items="${visitors}">
                <tr>
                    <td>${v.id}</td>
                    <td>${v.name}</td>
                    <td>${v.flatNumber}</td>
                    <td>${v.phone}</td>
                    <td>${v.purpose}</td>
                    <td><span class="badge-in">Expected</span></td>
                </tr>
            </c:forEach>

            <c:if test="${empty visitors}">
                <tr>
                    <td colspan="6" class="text-center py-4">No visitor records found in MySQL.</td>
                </tr>
            </c:if>
            </tbody>
        </table>

        <div class="text-center mt-3">
            <a href="/add-visitor" class="btn btn-gold">
                Add New Entry
            </a>
        </div>

    </div>

</div>

</body>
</html>