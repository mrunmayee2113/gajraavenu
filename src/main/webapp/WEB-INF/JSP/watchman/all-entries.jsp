<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Entries | Gajra Avenue</title>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/watchman/all-entries.css">

</head>

<body>

<section class="header">
    <h1>All Entries</h1>
    <p class="text-white-50">Entry log of visitors</p>

</section>

<div class="container mt-5">

    <div class="row g-3 align-items-center justify-content-center sort-box">

        <!-- TIME SORT -->
        <div class="col-12 col-md-3">
            <select class="form-select custom-select" id="order">
                <option value="desc">Latest First</option>
                <option value="asc">Oldest First</option>
            </select>
        </div>

        <!-- WING FILTER -->
        <div class="col-12 col-md-3">
            <select class="form-select custom-select" id="wing">
                <option value="">All Wings</option>
                <option value="A">A Wing</option>
                <option value="B">B Wing</option>
                <option value="C">C Wing</option>
                <option value="D">D Wing</option>
            </select>
        </div>

        <!-- TYPE FILTER -->
        <div class="col-12 col-md-3">
            <select class="form-select custom-select" id="type">
                <option value="">All Types</option>
                <option value="visitor">Visitor</option>
                <option value="delivery">Delivery</option>
                <option value="service">Service</option>
                <option value="manager">Manager</option>
            </select>
        </div>

        <!-- APPLY -->
        <div class="col-12 col-md-2 text-center">
            <button class="btn btn-gold w-100" onclick="applyFilter()">Apply</button>
        </div>

    </div>

</div>


<div class="container py-5">

    <div class="table-wrapper table-responsive">

        <table class="table table-bordered align-middle">

            <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Flat</th>
                <th>Type</th>
                <th>Time In</th>
                <th>Time Out</th>
                <th>Status</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="entry" items="${entries}">
                <tr>
                    <td>${entry.id}</td>
                    <td>${entry.visitorName}</td>
                    <td>${entry.wing}-${entry.flatNumber}</td>
                    <td>
                        <span class="badge bg-secondary text-uppercase">
                                ${entry.entryType}
                        </span>
                    </td>

                    <td>${entry.entryTime}</td>

                    <td>
                        <c:choose>
                            <c:when test="${entry.exitTime != null}">
                                ${entry.exitTime}
                            </c:when>
                            <c:otherwise>-</c:otherwise>
                        </c:choose>
                    </td>

                    <td>
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

    </div>

</div>
<script>
    function applyFilter() {
        const order = document.getElementById("order").value;
        const wing = document.getElementById("wing").value;
        const type = document.getElementById("type").value;

        let url = "/watchman/all-entries?";

        if (order) url += "order=" + order + "&";
        if (wing) url += "wing=" + wing + "&";
        if (type) url += "type=" + type + "&";

        window.location.href = url;
    }
</script>

<script>
    document.getElementById("order").value = "${order}";
    document.getElementById("wing").value = "${wing}";
    document.getElementById("type").value = "${type}";
</script>
</body>
</html>