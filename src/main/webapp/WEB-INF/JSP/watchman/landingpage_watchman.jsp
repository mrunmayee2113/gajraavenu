<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Watchman Panel | Gajra Avenue</title>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/watchman/landingpage_watchman.css">


</head>

<body>

<nav class="navbar navbar-expand-lg fixed-top custom-navbar">
    <div class="container">

        <!-- LOGO -->
        <a class="navbar-brand logo-text" href="/watchman/dashboard">GAJRA AVENUE</a>

        <!-- HAMBURGER BUTTON -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- COLLAPSIBLE MENU -->
        <div class="collapse navbar-collapse justify-content-end" id="navbarContent">

            <ul class="navbar-nav align-items-lg-center text-center gap-3">

                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/watchman/all-entries" class="nav-item-link">
                         Entries
                    </a>
                </li>

                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/watchman/visitors" class="nav-item-link">
                        Visitors
                    </a>
                </li>

                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/watchman/notice" class="nav-item-link">
                       Notice
                    </a>
                </li>

                <!-- PROFILE -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                        <img src="https://thumbs.dreamstime.com/b/guardian-radio-transmitter-cartoon-character-guardian-radio-transmitter-cartoon-character-bodyguard-flat-vector-142265240.jpg"
                             style="width:35px;height:35px;border-radius:50%;border:2px solid #c5a059;">
                    </a>

                    <ul class="dropdown-menu dropdown-menu-end text-center">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/watchman/profile">Profile</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/watchman/settings">Settings</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger" href="/">Logout</a></li>
                    </ul>
                </li>

                <!-- ROLE -->
                <li class="nav-item">
                    <span class="role-badge">Watchman</span>
                </li>

            </ul>
        </div>

    </div>
</nav>

<section class="hero">
    <div class="container">
        <h1 class="glow-text">Gate Control & Visitor Monitoring</h1>
        <p class="mb-4">Manage entry, deliveries & security operations with precision.</p>
        <a href="/watchman/log-entry" class="btn-gold">Log New Entry</a>
    </div>
</section>

<section class="py-5">
    <div class="container">
        <h2 class="section-title display-5 fw-bold" style="font-family: 'Cinzel', serif;">Recent Entries</h2>
        <div style="width: 80px; height: 2px; background: var(--gold); margin: auto; position: relative; top: -25px;"></div> <div class="row g-4 text-center"></div>

        <div class="table-wrapper table-responsive" style="margin-top: 24px;">
            <table class="table table-bordered align-middle">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Flat</th>
                    <th>Type</th>
                    <th>Time In</th>
                    <th>Time Out</th>
                    <th>Status</th>
                </tr>
                </thead>
                <tbody id="entryTable">

                <c:forEach var="entry" items="${entries}">

                    <tr>
                        <td>${entry.visitorName}</td>
                        <td>${entry.wing}-${entry.flatNumber}</td>
                        <td>${entry.entryType}</td>

                        <!-- Time In -->
                        <td>${entry.entryTime}</td>

                        <!-- Time Out -->
                        <td class="time-out">
                            <c:choose>
                                <c:when test="${entry.exitTime != null}">
                                    ${entry.exitTime}
                                </c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </td>

                        <!-- Status -->
                        <td class="status-cell">
                            <c:choose>
                                <c:when test="${entry.exitTime == null}">
                                    <form action="${pageContext.request.contextPath}/watchman/exit/${entry.id}" method="post">
                                        <button class="btn btn-sm btn-danger">Mark Exit</button>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <span class="text-success">Left</span>
                                </c:otherwise>
                            </c:choose>
                        </td>

                    </tr>

                </c:forEach>

                </tbody>


            </table>
            <div class="text-center mt-4">
                <a href="${pageContext.request.contextPath}/watchman/all-entries"
                   class="btn btn-outline-warning px-4">
                    View All Entries
                </a>
            </div>
        </div>
    </div>
</section>

<section class="py-5">
    <div class="container">
        <h2 class="section-title display-5 fw-bold" style="font-family: 'Cinzel', serif;">Today's Overview</h2>
        <div style="width: 80px; height: 2px; background: var(--gold); margin: auto; position: relative; top: -25px;"></div> <div class="row g-4 text-center"></div>

        <div class="row g-4" style="margin-top: 24px;">

            <div class="col-6 col-sm-6 col-md-3 d-flex">
                <div class="stat-box w-100 text-center card-filter" >
                    <div class="stat-number">${visitorCount}</div>
                    Visitors
                </div>
            </div>

            <div class="col-6 col-sm-6 col-md-3 d-flex">
                <div class="stat-box w-100 text-center card-filter" >
                    <div class="stat-number">${deliveryCount}</div>
                    Deliveries
                </div>
            </div>

            <div class="col-6 col-sm-6 col-md-3 d-flex">
                <div class="stat-box w-100 text-center card-filter" >
                    <div class="stat-number">${serviceCount}</div>
                    Service Providers
                </div>
            </div>

            <div class="col-6 col-sm-6 col-md-3 d-flex">
                <div class="stat-box w-100 text-center card-filter" >
                    <div class="stat-number">${activeCount}</div>
                    Active Entries
                </div>
            </div>

        </div>
    </div>
</section>

<section class="emergency">
    <h2  style="font-weight: 560;letter-spacing: 1.5px; font-family:'Cinzel'" >Emergency Control</h2>
    <p class="text-white-50 mb-4">Activate immediate society-wide alert if required.</p>
    <button id="alertbtn"><i class="fa-solid fa-bell"></i> BROADCAST ALERT</button>
</section>

<footer class="py-4 text-center">
    <p class="small text-white-50">Gajra Avenue Watchman System <i class="fa-regular fa-copyright"></i> 2026</p>
</footer>



<script>
    document.getElementById("alertbtn").addEventListener("click", function() {
        if (confirm("Are you sure you want to broadcast emergency alert to all residents?")) {
            alert(" Emergency Alert Sent to All Residents!");
        }
    });
</script>

</body>
</html>