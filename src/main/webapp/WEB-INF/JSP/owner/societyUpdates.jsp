<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Society Updates | Gajra Avenue</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owner/societyUpdates.css">
</head>

<body>

<section class="header">
    <h1>Society Updates</h1>
    <p class="text-white-50">Latest announcements & activities</p>
</section>

<div class="container py-5">

    <div class="row justify-content-center mb-5">
        <div class="col-md-6">
            <div class="input-group custom-input">
                <span class="input-group-text"><i class="fa-solid fa-magnifying-glass"></i></span>
                <input type="text" id="searchInput" class="form-control" placeholder="Search updates...">
            </div>
        </div>
    </div>

    <div id="updates">
        <c:forEach var="n" items="${notices}" varStatus="status">
            <div class="update-card ${status.index >= 3 ? 'extra d-none' : ''}">
                <h6>${n.title}</h6>
                <p>${n.content}</p>
                <div class="d-flex justify-content-between">
                    <small class="text-white-50">${n.date}</small>
                    <span class="badge border border-warning text-warning" style="font-size: 10px;">${n.category}</span>
                </div>
            </div>
        </c:forEach>

        <c:if test="${empty notices}">
            <div class="text-center py-5">
                <p class="text-white-50">No updates found.</p>
            </div>
        </c:if>
    </div>

    <div class="text-center mt-4">
        <c:if test="${notices.size() > 3}">
            <button onclick="toggleUpdates()" class="btn btn-gold" id="btn">Show All</button>
        </c:if>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    let expanded = false;

    function toggleUpdates(){
        const items = document.querySelectorAll(".extra");
        const btn = document.getElementById("btn");
        items.forEach(i => i.classList.toggle("d-none"));
        expanded = !expanded;
        btn.innerText = expanded ? "Show Less" : "Show All";
    }

    // --- ADDED: SEARCH LOGIC ---
    document.getElementById("searchInput").addEventListener("keyup", function() {
        const val = this.value.toLowerCase();
        document.querySelectorAll(".update-card").forEach(card => {
            card.style.display = card.innerText.toLowerCase().includes(val) ? "block" : "none";
        });
    });
</script>

</body>
</html>