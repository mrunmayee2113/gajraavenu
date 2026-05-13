<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gajra Avenue | Rental Flats</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/landingpage/rental.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
</head>

<body>
<div class="brand">
    <h1>Rental <span style="color:white;">Flats</span></h1>
            <p>Exclusive Residences in Wing A, B, C & D</p>
</div>


<div class="container" style="margin-top:-60px;">
    <div class="row">

        <h3 style="color:white;">Total Rentals: ${fn:length(rentals)}</h3>

        <c:if test="${empty rentals}">
            <h3 style="color:white;">No rentals available</h3>
        </c:if>

        <c:forEach var="r" items="${rentals}">

            <div class="col-lg-6 mb-4">

                <div class="flat-card">

                    <!-- 🔥 IMAGE GALLERY -->
                    <div class="flat-gallery">

                        <c:if test="${not empty r.imagePaths}">

                            <c:forEach var="img" items="${r.imagePaths}" varStatus="status">

                                <c:if test="${status.index < 3}">

                                    <div class="flat-img-box">

                                        <img src="/uploads/${img}" class="flat-img">

                                        <!-- +MORE overlay -->
                                        <c:if test="${status.index == 2 && fn:length(r.imagePaths) > 3}">
                                            <div class="more-overlay">
                                                +${fn:length(r.imagePaths) - 3}
                                            </div>
                                        </c:if>

                                    </div>

                                </c:if>

                            </c:forEach>

                        </c:if>

                        <c:if test="${empty r.imagePaths}">
                            <div class="flat-img-box">
                                <img src="/images/default.png" class="flat-img">
                            </div>
                        </c:if>

                    </div>

                    <!-- 🔥 DETAILS -->
                    <h4>
                        ${r.ownerName}
                        <span style="color:gold;">[${r.flatType}]</span>
                    </h4>

                    <p class="text-white-50">${r.description}</p>

                    <div class="d-flex justify-content-between align-items-center">

                        <div class="rent-badge">
                            ₹ ${r.rentAmount}
                        </div>

                        <button class="btn btn-main px-4"
                                onclick="window.location.href='/flat-details?id=${r.id}'">
                            Contact
                        </button>

                    </div>

                </div>

            </div>

        </c:forEach>

    </div>
</div>

</body>
</html>