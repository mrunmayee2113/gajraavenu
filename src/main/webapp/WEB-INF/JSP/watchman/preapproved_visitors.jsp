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

</head>

<body>

<section class="header">
    <h1>Preapproved Visitors</h1>
    <p class="text-white-50">Latest announcements & activities</p>
</section>

<div class="container py-5">

    <div class="visitor-card">
        <div>
            <h6>Priya Sharma</h6>
            <small class="text-white-50">Flat A-203 <i class="fa-solid fa-minus"></i> 5:30 PM <i class="fa-solid fa-minus"></i> Personal</small>
        </div>

        <div class="d-flex gap-2 align-items-center">
            <span class="badge-expected">Expected</span>
            <button class="btn btn-visited btn-sm">Visited</button>
        </div>
    </div>

    <div class="visitor-card">
        <div>
            <h6>Zomato Delivery</h6>
            <small class="text-white-50">Flat B-101 <i class="fa-solid fa-minus"></i> 1:15 PM <i class="fa-solid fa-minus"></i> Delivery</small>
        </div>

        <div class="d-flex gap-2 align-items-center">
            <span class="badge-expected">Expected</span>
            <button class="btn btn-visited btn-sm">Visited</button>
        </div>
    </div>

</div>

</body>
</html>