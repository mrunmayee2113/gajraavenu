<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Visitors | Gajra Avenue</title>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/watchman/preapproved_visitors.css">
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

</head>

<body>

<section class="header">
    <h1>Preapproved Visitors</h1>
    <p class="text-white-50">Notify about the visitors in advance</p>
</section>


<div class="container py-5">

    <c:if test="${empty visitors}">
        <h4 style="color:white;">No Visitors Found</h4>
    </c:if>

    <c:forEach var="v" items="${visitors}">
        <div class="visitor-card">
            <div>
                <h6>${v.name}</h6>
                <small class="text-white-50">
                    Flat ${v.flatNumber}
                    <i class="fa-solid fa-minus"></i>
                    ${v.visitTime}
                    <i class="fa-solid fa-minus"></i>
                    ${v.purpose}
                </small>
            </div>

            <c:choose>
                <c:when test="${v.status == 'Visited'}">
                    <span class="text-success fw-bold"><i class="fa-solid fa-check"></i> Completed</span>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/watchman/markVisited/${v.id}"
                       class="btn btn-visited btn-sm">
                       Visited
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </c:forEach>

</div>

</body>
</html>