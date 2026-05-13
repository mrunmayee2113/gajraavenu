<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Service Providers | Gajra Avenue</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manager/service_provider.css">

</head>

<body>

<div class="dashboard">

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
        <a href="/" onclick="confirmLogout(event)"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
    </div>


    <div class="content">

        <h2>SERVICE PROVIDERS</h2>

        <div>
            <button class="n" onclick="openProviderModal()">+ Add Provider</button>
        </div>

        <div class="providers-grid" id="providersContainer">

            <c:forEach var="provider" items="${allProviders}">
                <div class="provider-card" style="position: relative; padding-bottom: 35px;">
                    <div class="service-icon">
                        <c:choose>
                            <c:when test="${provider.serviceType eq 'Plumber'}"><i class="fa fa-wrench"></i></c:when>
                            <c:when test="${provider.serviceType eq'Electrician'}"><i class="fa fa-bolt"></i></c:when>
                            <c:when test="${provider.serviceType eq 'Carpenter'}"><i class="fa fa-hammer"></i></c:when>
                            <c:when test="${provider.serviceType eq 'Cleaning'}"><i class="fa fa-broom"></i></c:when>
                            <c:when test="${provider.serviceType eq 'Appliance Repair'}"><i class="fa fa-plug"></i></c:when>
                            <c:otherwise><i class="fa fa-bell"></i></c:otherwise>
                        </c:choose>
                    </div>
                    <h3>${provider.name}</h3>
                    <p><strong>Service:</strong> ${provider.serviceType}</p>
                    <p><strong>Contact:</strong> ${provider.contact}</p>
                    <p><strong>Shop:</strong> ${provider.location}</p>
                    <a href="tel:${provider.contact}" class="call-btn"><i class="fa-solid fa-phone me-1"></i> Call</a>

                    <div style="position: absolute; bottom: 15px; right: 15px; display: flex; gap: 12px;">
                        <a href="javascript:void(0)"
                           onclick="openEditModal('${provider.id}', '${provider.name}', '${provider.serviceType}', '${provider.contact}', '${provider.location}')"
                           style="color: #c5a059; text-decoration: none; font-size: 16px;"
                           title="Edit Provider">
                            <i class="fa-solid fa-pen-to-square"></i>
                        </a>

                        <a href="/deleteProvider?id=${provider.id}"
                           onclick="return confirm('Are you sure you want to delete this service provider?')"
                           style="color: #a17b1d; text-decoration: none; font-size: 16px;"
                           title="Delete Provider">
                            <i class="fa-solid fa-trash-can"></i>
                        </a>
                    </div>
                </div>
            </c:forEach>

            <c:if test="${empty allProviders}">
                <div style="grid-column: 1 / -1; text-align: center; color: #888; margin-top: 20px;">
                    <p>No service providers added yet.</p>
                </div>
            </c:if>

        </div>

    </div>

</div>

<footer class="py-2 text-center">
    <p class="small text-white-50 mb-0">Gajra Avenue Manager System <i class="fa-solid fa-at"></i> 2026</p>
</footer>

<div id="providerModal" style="display:none;position:fixed;inset:0;background:rgba(0,0,0,0.8);justify-content:center;align-items:center;z-index:1000;">
    <div style="background:#111111; padding:35px 30px; border-radius:20px; border:1px solid #7c622d; text-align:center; min-width:450px; box-shadow: 0 4px 15px rgba(0,0,0,0.5);">
        <h5 id="modalTitle" style="margin-bottom:25px; font-family: 'Cinzel', serif; color:#c5a059; letter-spacing:1px; font-size:16px; text-transform: uppercase;">Add Service Provider</h5>

        <form action="/saveProvider" method="POST">
            <input type="hidden" name="id" id="providerId">

            <div class="form-group" style="text-align: left; margin-bottom: 15px;">
                <label style="color: #c5a059;">Full Name</label>
                <input type="text" name="name" id="pName" class="form-control bg-dark text-white border-secondary" placeholder="e.g., Anil Shinde" required>
            </div>

            <div class="form-group" style="text-align: left; margin-bottom: 15px;">
                <label style="color: #c5a059;">Service Type</label>
                <select name="serviceType" id="pService" class="form-control bg-dark text-white border-secondary" required>
                    <option value="Plumber">Plumber</option>
                    <option value="Electrician">Electrician</option>
                    <option value="Carpenter">Carpenter</option>
                    <option value="Cleaning">Cleaning</option>
                    <option value="Appliance Repair">Appliance Repair</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <div class="form-group" style="text-align: left; margin-bottom: 15px;">
                <label style="color: #c5a059;">Contact Number</label>
                <input type="text" name="contact" id="pContact" class="form-control bg-dark text-white border-secondary" placeholder="e.g., 9876543210" required>
            </div>

            <div class="form-group" style="text-align: left; margin-bottom: 15px;">
                <label style="color: #c5a059;">Shop / Location</label>
                <input type="text" name="location" id="pLocation" class="form-control bg-dark text-white border-secondary" placeholder="e.g., Gangapur Road" required>
            </div>

            <div style="display:flex; justify-content:center; gap:15px; margin-top: 30px;">
                <button type="submit" id="submitBtn" style="padding:10px 30px; background:#a17b1d; color:#111; border:none; border-radius:6px; cursor:pointer; font-family:'Montserrat', sans-serif; font-weight: 500; font-size:14px; min-width:80px;">Save</button>
                <button type="button" onclick="closeProviderModal()" style="padding:10px 25px; background:transparent; color:#c5a059; border:1px solid #443515; border-radius:6px; cursor:pointer; font-family:'Montserrat', sans-serif; font-weight: 500; font-size:14px; min-width:80px;">Cancel</button>
            </div>
        </form>
    </div>
</div>

<div id="logoutModal" style="display:none;position:fixed;inset:0;background:rgba(0,0,0,0.8);justify-content:center;align-items:center;z-index:1000;">
    <div style="background:#111111; padding:35px 30px; border-radius:20px; border:1px solid #7c622d; text-align:center; min-width:440px; box-shadow: 0 4px 15px rgba(0,0,0,0.5);">
        <h5 style="margin-bottom:30px; font-family: 'Cinzel', serif; color:#c5a059; letter-spacing:1px; font-size:16px; text-transform: uppercase;">Are you sure you want to logout?</h5>
        <div style="display:flex; justify-content:center; gap:15px;">
            <button onclick="logout()" style="padding:10px 30px; background:#a17b1d; color:#111; border:none; border-radius:6px; cursor:pointer; font-family:'Montserrat', sans-serif; font-weight: 500; font-size:14px; min-width:80px;">Yes</button>
            <button onclick="closeModal()" style="padding:10px 25px; background:transparent; color:#c5a059; border:1px solid #443515; border-radius:6px; cursor:pointer; font-family:'Montserrat', sans-serif; font-weight: 500; font-size:14px; min-width:80px;">Cancel</button>
        </div>
    </div>
</div>

<script>
    /* LOGOUT SCRIPTS */
    function confirmLogout(e){
        e.preventDefault();
        document.getElementById("logoutModal").style.display="flex";
    }

    function closeModal(){
        document.getElementById("logoutModal").style.display="none";
    }

    function logout(){
        window.location.href="/";
    }

    /* MODAL SCRIPTS */
    function openProviderModal() {
        // Reset to "Add" state
        document.getElementById("modalTitle").innerText = "Add Service Provider";
        document.getElementById("providerId").value = "";
        document.getElementById("pName").value = "";
        document.getElementById("pService").value = "Plumber";
        document.getElementById("pContact").value = "";
        document.getElementById("pLocation").value = "";
        document.getElementById("submitBtn").innerText = "Save";

        document.getElementById("providerModal").style.display = "flex";
    }

    function openEditModal(id, name, service, contact, location) {
        // Change to "Edit" state and populate fields
        document.getElementById("modalTitle").innerText = "Edit Service Provider";
        document.getElementById("providerId").value = id;
        document.getElementById("pName").value = name;
        document.getElementById("pService").value = service;
        document.getElementById("pContact").value = contact;
        document.getElementById("pLocation").value = location;
        document.getElementById("submitBtn").innerText = "Update";

        document.getElementById("providerModal").style.display = "flex";
    }

    function closeProviderModal() {
        document.getElementById("providerModal").style.display = "none";
    }
</script>

</body>
</html>