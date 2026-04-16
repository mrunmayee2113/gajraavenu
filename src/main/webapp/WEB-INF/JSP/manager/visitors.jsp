<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Visitors | Gajra Avenue</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700;800&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manager/visitors.css">

</head>
<body>

<div class="sidebar">
    <h4><b>GAJRA<br>AVENUE</b></h4>
    <hr>
    <a href="${pageContext.request.contextPath}/manager/dashboard"><i class="fa-solid fa-chart-line"></i> Dashboard</a>
    <a href="${pageContext.request.contextPath}/manager/residents"><i class="fa-solid fa-users"></i> Residents</a>
    <a href="${pageContext.request.contextPath}/manager/maintenance"><i class="fa-solid fa-building"></i> Maintenance</a>
    <a href="${pageContext.request.contextPath}/manager/complaints"><i class="fa-solid fa-clipboard-list"></i> Complaints</a>
    <a href="${pageContext.request.contextPath}/manager/visitors"><i class="fa-solid fa-shield-halved"></i> Security Logs</a>
    <a href="${pageContext.request.contextPath}/manager/notices"><i class="fa-solid fa-money-bill"></i> Notices</a>
    <a href="${pageContext.request.contextPath}/manager/service_providers"><i class="fa-solid fa-bell"></i> Service</a>
    <a href="${pageContext.request.contextPath}/manager/settings"><i class="fa-solid fa-gear"></i> Settings</a>
    <a href="/" onclick="confirmLogout(event)"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
</div>


    <div class="content">
        <h2>Visitors Overview</h2>

        <div class="cards">
            <div class="card">
                <h3>Total Visitors Today</h3>
                <h2><c:out value="${totalToday}"/></h2>
            </div>
            <div class="card">
                <h3>Currently Inside</h3>
                <h2><c:out value="${currentlyInside}"/></h2>
            </div>
            <div class="card">
                <h3>Deliveries</h3>
                <h2><c:out value="${deliveries}"/></h2>
            </div>
        </div>

        <div class="section">
            <h2>Visitor Log</h2>
            <div class="table-container">
                <table>
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Mobile</th>
                        <th>Type</th>
                        <th>Flat</th>
                        <th>Purpose</th>
                        <th>Check In</th>
                        <th>Check Out</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="entry" items="${entries}">
                        <tr>
                            <td>${entry.visitorName}</td>
                            <td>${entry.mobileNumber}</td>
                            <td>${entry.entryType}</td>
                            <td>${entry.wing}-${entry.flatNumber}</td>
                            <td>${entry.purpose}</td>
                            <td>
                                <fmt:parseDate value="${entry.entryTime}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedIn" type="both" />
                                <fmt:formatDate value="${parsedIn}" pattern="hh:mm a" />
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty entry.exitTime}">
                                        <fmt:parseDate value="${entry.exitTime}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedOut" type="both" />
                                        <fmt:formatDate value="${parsedOut}" pattern="hh:mm a" />
                                    </c:when>
                                    <c:otherwise>
                                        <span class="status-inside">Inside</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<footer class="py-2 text-center">
    <p class="small text-white-50 mb-0">Gajra Avenue Manager System <i class="fa-solid fa-at"></i> 2026</p>
</footer>

<script>
    function confirmLogout(e){
        e.preventDefault();
        // Simple alert or show your custom modal here
        if(confirm("Are you sure you want to logout?")) {
            window.location.href="/";
        }
    }
</script>

</body>
</html>