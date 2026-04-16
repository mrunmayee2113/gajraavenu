<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Flat Details | Gajra Avenue</title>

   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/landingpage/flat-details.css">

</head>

<body>

<div class="container pb-4">

    <div class="header">
        <h1 id="flatId"></h1>
    </div>

    <div class="carousel-wrapper">

        <div id="carouselExample" class="carousel slide">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://housing-images.n7net.in/012c1500/0864ae45c3a7d3562f9e7ef83d36cd87/v0/fs.jpeg" class="d-block  w-100" alt="living area">
                </div>
                <div class="carousel-item">
                    <img src="https://housing-images.n7net.in/012c1500/20d9ccbf78c1ba260380e11bc80649f6/v0/fs-large.jpeg" class="d-block w-100" alt="kichen">
                </div>
                <div class="carousel-item">
                    <img src="https://housing-images.n7net.in/012c1500/6be663fa3c5ede4e6d04c8d038218e92/v0/fs.jpeg" class="d-block w-100" alt="bed">
                </div>
                <div class="carousel-item">
                    <img src="https://housing-images.n7net.in/012c1500/996c9c0331994711e778a9d5f7c89b9d/v0/fs.jpeg" class="d-block w-100" alt="bed">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>


    <div class="details-card">

        <h3>Property Details</h3>

        <div class="row mt-3">

            <div class="col-md-6">
                <h3>Type: ${type}</h3>
            </div>

            <div class="col-md-6">
                <h3>Rent: ${rent} Rs./ month</h3>
            </div>

            <div class="col-md-6 mt-2">
                <strong>Location:</strong> Pathardi, Nashik
            </div>

            <div class="col-md-6 mt-2">
                <strong>Availability:</strong> Ready to Move
            </div>

        </div>

        <p class="mt-4">
            This premium apartment offers spacious rooms, modern fittings,
            balcony view and parking facility. Located in **Gajra Avenue Pathardi Nashik**
            with excellent connectivity to city center, schools and hospitals.
        </p>

        <h4 class="mt-4">Amenities</h4>

        <div class="amenities">

            <div class="amenity"><i class="fa-solid fa-check"></i> Parking</div>
            <div class="amenity"><i class="fa-solid fa-check"></i> Lift</div>
            <div class="amenity"><i class="fa-solid fa-check"></i> Security</div>
            <div class="amenity"><i class="fa-solid fa-check"></i> Water Supply</div>
            <div class="amenity"><i class="fa-solid fa-check"></i> Balcony</div>
            <div class="amenity"><i class="fa-solid fa-check"></i> Garden Area</div>

        </div>

    </div>

    <div class="contact-card">

        <h4 style="color:var(--gold)">Contact Owner</h4>

        <p><strong>Name:</strong> Rajesh Patil</p>

        <p><strong>Phone:</strong> +91 9876543210</p>

        <div class="d-flex gap-3">

            <a  class="btn btn-main">
                <i class="fa-solid fa-phone"></i> Call Owner
            </a>

            <a class="btn btn-success">
                <i class="fa-solid fa-message"></i> WhatsApp
            </a>

        </div>

    </div>

</div>

<script>

    const params = new URLSearchParams(window.location.search);

    document.getElementById("flatId").innerText =
        "Flat " + params.get("id");

    document.getElementById("flatType").innerText =
        params.get("type");

    document.getElementById("flatRent").innerText =
        params.get("rent");

</script>

</body>
</html>