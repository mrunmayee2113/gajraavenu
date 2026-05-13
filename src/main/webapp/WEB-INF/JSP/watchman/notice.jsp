<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Society Updates | Gajra Avenue</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/watchman/notice.css">


</head>

<body>

<section class="header">
    <h1>Society Notices</h1>
    <p class="text-white-50">Authorized Personnel Updates</p>
</section>

<div class="container py-5">

    <%-- Loop through notices from Manager --%>
    <c:forEach var="n" items="${notices}" varStatus="status">
        <div class="update-card ${status.index >= 2 ? 'extra d-none' : ''}">
            <span class="badge-cat">${n.category}</span>
            <h6>${n.title}</h6>
            <p>${n.content}</p>
            <small class="text-white-50">📅 Posted on: ${n.date}</small>
        </div>
    </c:forEach>

    <%-- Show button ONLY if there are more than 2 notices --%>
    <c:if test="${not empty notices && notices.size() > 2}">
        <div class="text-center mt-4">
            <button onclick="toggleUpdates()" class="btn btn-gold" id="btn">
                Show All
            </button>
        </div>
    </c:if>

    <c:if test="${empty notices}">
        <div class="text-center">
            <p class="text-white-50">No active notices available at the moment.</p>
        </div>
    </c:if>
</div>

<script>
    let expanded = false;

    function toggleUpdates(){
        const items = document.querySelectorAll(".extra");
        const btn = document.getElementById("btn");

        items.forEach(i => i.classList.toggle("d-none"));

        expanded = !expanded;
        btn.innerText = expanded ? "Show Less" : "Show All";
    }
</script>

</body>
</html>