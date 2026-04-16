<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Settings | Gajra Avenue</title>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manager/settings.css">

</head>
<body>

<div class="sidebar">
    <h4><b>GAJRA<br>AVENUE</b></h4>
    <hr>
    <a href="/dashboard"><i class="fa-solid fa-chart-line"></i> Dashboard</a>
    <a href="/residents"><i class="fa-solid fa-users"></i> Residents</a>
    <a href="/complaints"><i class="fa-solid fa-clipboard-list"></i> Complaints</a>
    <a href="/notices"><i class="fa-solid fa-money-bill"></i> Notices</a>
    <a href="/service_providers"><i class="fa-solid fa-bell"></i> Service</a>
    <a href="/settings" class="active"><i class="fa-solid fa-gear"></i> Settings</a>
    <a href="/logout"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
</div>

<div class="content">
    <h1>Settings</h1>
    <div class="settings-card">
        <div class="settings-nav">
            <div class="nav-tab active" onclick="showTab('general', this)"><i class="fa fa-building"></i> Society Profile</div>
            <div class="nav-tab" onclick="showTab('billing', this)"><i class="fa fa-credit-card"></i> Maintenance</div>
        </div>
        <div style="flex: 1;">
            <form th:action="@{/saveSettings}" th:object="${settings}" method="POST">
                <input type="hidden" th:field="*{id}">
                <div id="general" class="settings-pane active">
                    <h4 style="color:var(--gold); font-family:'Cinzel'; margin-bottom:25px;">Society Details</h4>
                    <div class="form-group">
                        <label>Society Name</label>
                        <input type="text" th:field="*{societyName}">
                    </div>
                    <div class="form-group">
                        <label>Registration Number</label>
                        <input type="text" th:field="*{registrationNumber}">
                    </div>
                    <button type="submit" class="btn-gold">Save Changes</button>
                </div>
                <div id="billing" class="settings-pane">
                    <h4 style="color:var(--gold); font-family:'Cinzel'; margin-bottom:25px;">Billing Rules</h4>
                    <div class="form-group">
                        <label>Maintenance Rate (per sq ft)</label>
                        <input type="text" th:field="*{maintenanceRate}">
                    </div>
                    <div class="form-group">
                        <label>Monthly Due Date</label>
                        <select th:field="*{dueDate}">
                            <option value="1">1st of Month</option>
                            <option value="10">10th of Month</option>
                        </select>
                    </div>
                    <button type="submit" class="btn-gold">Update Rules</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function showTab(tabId, element) {
        document.querySelectorAll('.settings-pane').forEach(p => p.classList.remove('active'));
        document.querySelectorAll('.nav-tab').forEach(t => t.classList.remove('active'));
        document.getElementById(tabId).classList.add('active');
        element.classList.add('active');
    }
</script>
</body>
</html>