<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flat Details | Gajra Avenue</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background:#0a0a0b;
            color:white;
        }

        .main-img {
            width:100%;
            height:350px;
            object-fit:contain;
            background:#000;
            border-radius:10px;
        }

        .thumb {
            width:80px;
            height:80px;
            object-fit:cover;
            cursor:pointer;
            border-radius:6px;
            border:2px solid transparent;
        }

        .thumb:hover {
            border:2px solid gold;
        }

        .btn-main {
            background:#c5a059;
            color:black;
            font-weight:600;
        }
    </style>
</head>

<body>

<div class="container py-5">

    <div class="row">

        <!-- 🔥 IMAGE SECTION -->
        <div class="col-lg-6">

            <!-- MAIN IMAGE -->
            <img id="mainImage"
                 src="/uploads/${r.imagePaths[0]}"
                 class="main-img mb-3">

            <!-- THUMBNAILS -->
            <div class="d-flex gap-2 flex-wrap">
                <c:forEach var="img" items="${r.imagePaths}">
                    <img src="/uploads/${img}"
                         class="thumb"
                         onclick="changeImage(this)">
                </c:forEach>
            </div>

        </div>

        <!-- 🔥 DETAILS -->
        <div class="col-lg-6">

            <h2>${r.ownerName}</h2>

            <h5 style="color:gold;">${r.flatType}</h5>

            <p class="text-white-50 mt-3">${r.description}</p>

            <h4 class="mt-3">₹ ${r.rentAmount}</h4>

            <hr>

            <h5>Contact Owner</h5>

            <p>📞 ${r.contactNumber}</p>
            <p>✉️ ${r.email}</p>

            <!-- 🔥 ACTION BUTTONS -->
            <div class="d-flex gap-3 mt-4">

                <!-- CALL -->
                <a href="tel:${r.contactNumber}" class="btn btn-main">
                    📞 Call
                </a>

                <!-- WHATSAPP -->
                <a href="https://wa.me/91${r.contactNumber}"
                   target="_blank"
                   class="btn btn-success">
                    💬 WhatsApp
                </a>

            </div>

            <button class="btn btn-outline-light mt-4"
                    onclick="window.location.href='/rentals'">
                ⬅ Back
            </button>

        </div>

    </div>

</div>

<!-- 🔥 JS -->
<script>
function changeImage(img){
    document.getElementById("mainImage").src = img.src;
}
</script>

</body>
</html>