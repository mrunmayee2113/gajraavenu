<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Services | Gajra Avenue</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owner/Service.css">
</head>

<body>

<section class="service-header">
    <h1>Service Providers</h1>
    <p class="text-white-50">Trusted professionals for your help</p>
</section>

<div class="container py-5">

    <div class="search-box">
        <div class="input-group custom-input">
            <span class="input-group-text"><i class="fa-solid fa-magnifying-glass"></i></span>
            <input type="text" id="searchService" class="form-control" placeholder="Search Service or Provider...">
        </div>
    </div>

    <div class="accordion" id="serviceAccordion">

        <div class="accordion-item service-group">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#electrician">
                    <i class="fa-solid fa-bolt me-2"></i> Electrician
                </button>
            </h2>
            <div id="electrician" class="accordion-collapse collapse" data-bs-parent="#serviceAccordion">
                <div class="accordion-body">
                    <c:forEach var="provider" items="${allProviders}">
                        <c:if test="${provider.serviceType.equalsIgnoreCase('Electrician')}">
                            <div class="provider-row d-flex justify-content-between align-items-center border-bottom py-2">
                                <div>
                                    <div class="provider-name">${provider.name}</div>
                                    <small class="text-white-50">${provider.location}</small>
                                </div>
                                <div>
                                    <a href="tel:${provider.contact}" class="btn btn-gold btn-sm"><i class="fa-solid fa-phone"></i></a>
                                    <a href="https://wa.me/91${provider.contact}" target="_blank" class="btn btn-whatsapp btn-sm"><i class="fa-brands fa-whatsapp"></i></a>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="accordion-item service-group">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#plumber">
                    <i class="fa-solid fa-faucet me-2"></i> Plumber
                </button>
            </h2>
            <div id="plumber" class="accordion-collapse collapse" data-bs-parent="#serviceAccordion">
                <div class="accordion-body">
                    <c:forEach var="provider" items="${allProviders}">
                        <c:if test="${provider.serviceType eq 'Plumber'}">
                            <div class="provider-row d-flex justify-content-between align-items-center border-bottom py-2">
                                <div>
                                    <div class="provider-name">${provider.name}</div>
                                    <small class="text-white-50">${provider.location}</small>
                                </div>
                                <div>
                                    <a href="tel:${provider.contact}" class="btn btn-gold btn-sm"><i class="fa-solid fa-phone"></i></a>
                                    <a href="https://wa.me/91${provider.contact}" target="_blank" class="btn btn-whatsapp btn-sm"><i class="fa-brands fa-whatsapp"></i></a>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="accordion-item service-group">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#cleaning">
                    <i class="fa-solid fa-broom me-2"></i> Cleaning Services
                </button>
            </h2>
            <div id="cleaning" class="accordion-collapse collapse" data-bs-parent="#serviceAccordion">
                <div class="accordion-body">
                    <c:forEach var="provider" items="${allProviders}">
                        <c:if test="${provider.serviceType eq 'Cleaning'}">
                            <div class="provider-row d-flex justify-content-between align-items-center border-bottom py-2">
                                <div>
                                    <div class="provider-name">${provider.name}</div>
                                    <small class="text-white-50">${provider.location}</small>
                                </div>
                                <div>
                                    <a href="tel:${provider.contact}" class="btn btn-gold btn-sm"><i class="fa-solid fa-phone"></i></a>
                                    <a href="https://wa.me/91${provider.contact}" target="_blank" class="btn btn-whatsapp btn-sm"><i class="fa-brands fa-whatsapp"></i></a>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="accordion-item service-group">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#carpenter">
                    <i class="fa-solid fa-hammer me-2"></i> Carpenter
                </button>
            </h2>
            <div id="carpenter" class="accordion-collapse collapse" data-bs-parent="#serviceAccordion">
                <div class="accordion-body">
                    <c:forEach var="provider" items="${allProviders}">
                        <c:if test="${provider.serviceType eq 'Carpenter'}">
                            <div class="provider-row d-flex justify-content-between align-items-center border-bottom py-2">
                                <div>
                                    <div class="provider-name">${provider.name}</div>
                                    <small class="text-white-50">${provider.location}</small>
                                </div>
                                <div>
                                    <a href="tel:${provider.contact}" class="btn btn-gold btn-sm"><i class="fa-solid fa-phone"></i></a>
                                    <a href="https://wa.me/91${provider.contact}" target="_blank" class="btn btn-whatsapp btn-sm"><i class="fa-brands fa-whatsapp"></i></a>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="accordion-item service-group">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#appliance">
                    <i class="fa-solid fa-plug me-2"></i> Appliance Repair
                </button>
            </h2>
            <div id="appliance" class="accordion-collapse collapse" data-bs-parent="#serviceAccordion">
                <div class="accordion-body">
                    <c:forEach var="provider" items="${allProviders}">
                        <c:if test="${provider.serviceType eq 'Appliance Repair'}">
                            <div class="provider-row d-flex justify-content-between align-items-center border-bottom py-2">
                                <div>
                                    <div class="provider-name">${provider.name}</div>
                                    <small class="text-white-50">${provider.location}</small>
                                </div>
                                <div>
                                    <a href="tel:${provider.contact}" class="btn btn-gold btn-sm"><i class="fa-solid fa-phone"></i></a>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    const searchInput = document.getElementById("searchService");
    searchInput.addEventListener("keyup", function(){
        const value = this.value.toLowerCase();
        const groups = document.querySelectorAll(".service-group");
        groups.forEach(group=>{
            const text = group.innerText.toLowerCase();
            group.style.display = text.includes(value) ? "" : "none";
        });
    });
</script>

</body>
</html>