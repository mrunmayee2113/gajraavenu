<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Owner Notices | Gajra Avenue</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owner/Owner_notice.css">

</head>

<body>

<section class="notice-header">
    <h1>Society Notice Board</h1>
    <p class="text-white-50">Important announcements for Flat Owners</p>
</section>

<div class="container">


    <div class=" mb-5 mt-4 row g-4" id="noticeContainer">

        <c:forEach var="n" items="${notices}">
            <div class="col-lg-4 col-md-6 notice-item-card d-flex"
                 data-category="${n.category}"
                 data-date="${n.date}">
                <div class="notice-card">
                    <span class="badge-custom">${n.category}</span>
                    <h5 class="notice-title">${n.title}</h5>
                    <p class="notice-date">${n.date}</p>
                    <p class="text-white-70">${n.content}</p>
                </div>
            </div>
        </c:forEach>

        <c:if test="${empty notices}">
            <div class="col-12 text-center py-5">
                <i class="fa-solid fa-folder-open fa-3x mb-3" style="color: var(--gold);"></i>
                <p class="text-white-50">No notices found in the society records.</p>
            </div>
        </c:if>

    </div>

</div>
//service 

<footer class="py-4 text-center">
    <p class="small text-white-50">Gajra Avenue Owner Portal © 2026</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const searchInput = document.getElementById("searchInput");
    const categoryFilter = document.getElementById("categoryFilter");
    const sortOption = document.getElementById("sortOption");
    const noticeContainer = document.getElementById("noticeContainer");

    function filterAndSortNotices() {
        const searchValue = searchInput.value.toLowerCase();
        const selectedCategory = categoryFilter.value;
        const sortValue = sortOption.value;

        let notices = Array.from(document.querySelectorAll(".notice-item-card"));

        notices.forEach(card => {
            const title = card.innerText.toLowerCase();
            const category = card.dataset.category;

            const matchesSearch = title.includes(searchValue);
            const matchesCategory = selectedCategory === "all" || category === selectedCategory;

            card.style.display = (matchesSearch && matchesCategory) ? "block" : "none";
        });

        notices.sort((a, b) => {
            const dateA = new Date(a.dataset.date);
            const dateB = new Date(b.dataset.date);
            return sortValue === "latest" ? dateB - dateA : dateA - dateB;
        });

        notices.forEach(card => noticeContainer.appendChild(card));
    }

    searchInput.addEventListener("keyup", filterAndSortNotices);
    categoryFilter.addEventListener("change", filterAndSortNotices);
    sortOption.addEventListener("change", filterAndSortNotices);
</script>
</body>
</html>
