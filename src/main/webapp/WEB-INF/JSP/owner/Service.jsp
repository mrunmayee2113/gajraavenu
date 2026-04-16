<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                    <div class="provider-row d-flex justify-content-between align-items-center">
                        <div>
                            <div class="provider-name">Rajesh Electrical Works</div>
                            <div class="rating">4.8 <i class="fa-solid fa-star"></i></div>
                        </div>
                        <div>
                            <a href="tel:9876543210" class="btn btn-gold btn-sm"><i class="fa-solid fa-phone"></i></a>
                            <a href="https://wa.me/919876543210" target="_blank" class="btn btn-whatsapp btn-sm"><i class="fa-brands fa-whatsapp"></i></a>
                        </div>
                    </div>
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
                    <div class="provider-row d-flex justify-content-between align-items-center">
                        <div>
                            <div class="provider-name">AquaFix Plumbing</div>
                            <div class="rating">4.7 <i class="fa-solid fa-star"></i></div>
                        </div>
                        <div>
                            <a href="tel:9876543210" class="btn btn-gold btn-sm"><i class="fa-solid fa-phone"></i></a>
                            <a href="https://wa.me/919876543210" target="_blank" class="btn btn-whatsapp btn-sm"><i class="fa-brands fa-whatsapp"></i></a>
                        </div>
                    </div>
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
                    <div class="provider-row d-flex justify-content-between align-items-center">
                        <div>
                            <div class="provider-name">ShinePro Cleaners</div>
                            <div class="rating">4.8 <i class="fa-solid fa-star"></i></div>
                        </div>
                        <div>
                            <a href="tel:9123987654" class="btn btn-gold btn-sm"><i class="fa-solid fa-phone"></i></a>
                            <a href="https://wa.me/919123987654" target="_blank" class="btn btn-whatsapp btn-sm"><i class="fa-brands fa-whatsapp"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="accordion-item service-group">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#painter">
                    <i class="fa-solid fa-palette me-2"></i> Painter
                </button>
            </h2>
            <div id="painter" class="accordion-collapse collapse" data-bs-parent="#serviceAccordion">
                <div class="accordion-body">
                    <div class="provider-row d-flex justify-content-between align-items-center">
                        <div>
                            <div class="provider-name">ColorCraft Painters</div>
                            <div class="rating">4.7 <i class="fa-solid fa-star"></i></div>
                        </div>
                        <div>
                            <a href="tel:9345678901" class="btn btn-gold btn-sm"><i class="fa-solid fa-phone"></i></a>
                            <a href="https://wa.me/919345678901" target="_blank" class="btn btn-whatsapp btn-sm"><i class="fa-brands fa-whatsapp"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="accordion-item service-group">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#movers">
                    <i class="fa-solid fa-truck-moving me-2"></i> Packers & Movers
                </button>
            </h2>
            <div id="movers" class="accordion-collapse collapse" data-bs-parent="#serviceAccordion">
                <div class="accordion-body">
                    <div class="provider-row d-flex justify-content-between align-items-center">
                        <div>
                            <div class="provider-name">SafeMove Relocations</div>
                            <div class="rating">4.7 <i class="fa-solid fa-star"></i></div>
                        </div>
                        <div>
                            <a href="tel:9898989898" class="btn btn-gold btn-sm"><i class="fa-solid fa-phone"></i></a>
                            <a href="https://wa.me/919898989898" target="_blank" class="btn btn-whatsapp btn-sm"><i class="fa-brands fa-whatsapp"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="accordion-item service-group">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#internet">
                    <i class="fa-solid fa-globe me-2"></i> Internet Providers
                </button>
            </h2>
            <div id="internet" class="accordion-collapse collapse" data-bs-parent="#serviceAccordion">
                <div class="accordion-body">
                    <div class="provider-row d-flex justify-content-between align-items-center">
                        <div><div class="provider-name">Jio Fiber</div></div>
                        <div><a href="tel:18008899999" class="btn btn-gold btn-sm"><i class="fa-solid fa-phone"></i></a></div>
                    </div>
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
                    <div class="provider-row d-flex justify-content-between align-items-center">
                        <div>
                            <div class="provider-name">WoodCraft Interiors</div>
                            <div class="rating">4.7 <i class="fa-solid fa-star"></i></div>
                        </div>
                        <div>
                            <a href="tel:9876543210" class="btn btn-gold btn-sm"><i class="fa-solid fa-phone"></i></a>
                            <a href="https://wa.me/919876543210" target="_blank" class="btn btn-whatsapp btn-sm"><i class="fa-brands fa-whatsapp"></i></a>
                        </div>
                    </div>
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