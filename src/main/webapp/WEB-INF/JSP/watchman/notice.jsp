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
    <p class="text-white-50">Latest Announcements</p>
</section>

<div class="container py-5">

    <div class="update-card">
        <h6>Water Supply Maintenance</h6>
        <p>Water unavailable from 2 PM to 4 PM</p>
        <small class="text-white-50">Today</small>
    </div>

    <div class="update-card">
        <h6>Parking Notice</h6>
        <p>Use designated visitor parking only</p>
        <small class="text-white-50">Yesterday</small>
    </div>

    <!-- HIDDEN -->
    <div class="update-card extra d-none">
        <h6>Lift Servicing</h6>
        <p>Routine servicing completed</p>
        <small class="text-white-50">2 Days Ago</small>
    </div>

    <div class="update-card extra d-none">
        <h6>New CCTV Installed</h6>
        <p>Security improved</p>
        <small class="text-white-50">3 Days Ago</small>
    </div>

    <div class="text-center mt-4">
        <button onclick="toggleUpdates()" class="btn btn-gold" id="btn">
            Show All
        </button>
    </div>

</div>

<script>
    let expanded=false;

    function toggleUpdates(){
        const items=document.querySelectorAll(".extra");
        const btn=document.getElementById("btn");

        items.forEach(i=>i.classList.toggle("d-none"));

        expanded=!expanded;
        btn.innerText=expanded ? "Show Less" : "Show All";
    }
</script>

</body>
</html>