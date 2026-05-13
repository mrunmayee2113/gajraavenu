<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gajra Avenue</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/landingpage/landingpage.css">

</head>
<body>



<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container">
        <a class="navbar-brand logo-text text-uppercase" >GAJRA AVENUE</a>
        <button class="navbar-toggler border-0 text-white" type="button" data-bs-toggle="collapse" data-bs-target="#navLuxury">
            <i class="fa-solid fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navLuxury">
            <ul class="navbar-nav ms-auto align-items-lg-center">
                <li class="nav-item"><a class="nav-link" href="#location">LOCATION</a></li>
                <li class="nav-item"><a class="nav-link" href="/rentals">RENTALS</a></li>
                <li class="nav-item"><a class="nav-link" href="/contact">CONTACT</a></li>
                <li class="nav-item ms-lg-3"><a class="btn-outline-gold" href="/login">LOGIN</a></li>
                <li class="nav-item ms-lg-2"><a class="btn-solid-gold" href="/signup">JOIN AVENUE</a></li>
            </ul>
        </div>
    </div>
</nav>

<section class="hero">
    <div class="container">
        <div class="row justify-content-lg-start justify-content-center">
            <div class=" hero-content col-lg-9 " data-aos="fade-up">
                <h1 class="hero-title">
                    <span >The Ultimate Landmark</span>
                    <span class="glow-text text-uppercase">Gajra Avenue</span>
                </h1>
                <p class="lead text-white-50 mb-5 mx-auto mx-lg-0" style="max-width: 550px;">
                    Architectural finesse meets digital intelligence. Experience a life where every detail is managed with precision.
                </p>
                <div class="d-flex flex-wrap gap-3">
                    <button class="btn-solid-gold px-5" data-bs-toggle="modal" data-bs-target="#tourModal">Virtual Tour</button>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="py-5">
    <div class="container">
        <div class="row g-4">
            <div class="col-md-3 stat-box" data-aos="fade-up" >
                <div class="stat-number">112</div>
                <div class="small text-white-50">RESIDENTIAL FLATS</div>
            </div>
            <div class="col-md-3 stat-box" data-aos="fade-up" >
                <div class="stat-number">24/7</div>
                <div class="small text-white-50">COMMUNITY SUPPORT</div>
            </div>
            <div class="col-md-3 stat-box" data-aos="fade-up" >
                <div class="stat-number">100%</div>
                <div class="small text-white-50">TRUSTED MANAGEMENT</div>
            </div>
            <div class="col-md-3 stat-box" data-aos="fade-up" >
                <div class="stat-number">3+</div>
                <div class="small text-white-50">SERVICE PROVIDERS</div>
            </div>
        </div>
    </div>
</section>


<section id="about" class="py-5" style="background: var(--obsidian); border-top: 1px solid rgba(197, 160, 89, 0.1);">
    <div class="container py-5">
        <div class="row align-items-center g-5">

            <div class="col-lg-6" data-aos="fade-right">
                <div class="about-img-container">
                    <div class="gold-frame"></div>
                    <img src="/images/landingpage/about-image.jpg" alt="Gajra Avenue Building" class="img-fluid main-about-img">
                    <div class="experience-badge">
                        <div class="number" style="font-size: 2.2rem; font-weight: 800; font-family: 'Cinzel';">112</div>
                        <div class="text " style="font-size: 0.7rem; text-transform: uppercase; font-weight: 700; letter-spacing: 1px;">Premium Residences</div>
                    </div>
                </div>
            </div>

            <div class="col-lg-6" data-aos="fade-left">
                <div class="ps-lg-5">
                    <h6 class="text-uppercase mb-3" style="color: var(--gold); letter-spacing: 5px; font-weight: 600;">
                        About Gajra Avenue
                    </h6>

                    <h2 class="display-5 fw-bold mb-4" style="font-family: 'Cinzel', serif; color: var(--white); line-height: 1.2;">
                        Modern Living in <br>
                        <span style="color: var(--gold);font-size: 26px;">Pathardi Phata, Nashik</span>
                    </h2>

                    <p class="mb-4" style="color: rgba(255,255,255,0.8); line-height: 1.8; font-size: 1.05rem;">
                        Gajra Avenue is a thoughtfully planned residential community located in the rapidly developing area of Pathardi Phata, Nashik. Designed to offer comfort, convenience, and secure living.
                    </p>

                    <p class="mb-5" style="color: rgba(255,255,255,0.6); line-height: 1.8;">
                        With 112 well-designed residences and organized management, Gajra Avenue ensures a balanced lifestyle for families with easy access to schools and hospitals.
                    </p>

                    <div class="row g-4 mb-5">
                        <div class="col-sm-6 about-feature-box">
                            <div class="d-flex align-items-start">
                                <i  class="fa-solid fa-location-dot me-2"></i>
                                <div>
                                    <h6 class="fw-bold text-white">Prime Location</h6>
                                    <small class="text-white-50">Near Mumbai<i class="fa-solid fa-minus"></i>Agra Highway</small>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6 about-feature-box">
                            <div class="d-flex align-items-start">
                                <i class="fa-solid fa-compass-drafting me-2"></i>
                                <div>
                                    <h6 class="fw-bold text-white">Well-Planned</h6>
                                    <small class="text-white-50">Spacious Residences</small>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6 about-feature-box">
                            <div class="d-flex align-items-start">
                                <i class="fa-solid fa-shield-halved me-2"></i>
                                <div>
                                    <h6 class="fw-bold text-white">Secure Living</h6>
                                    <small class="text-white-50">Dedicated Management</small>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6 about-feature-box">
                            <div class="d-flex align-items-start">
                                <i class="fa-solid fa-users me-2"></i>
                                <div>
                                    <h6 class="fw-bold text-white">Community</h6>
                                    <small class="text-white-50">Family Environment</small>
                                </div>
                            </div>
                        </div>
                    </div>

                    <a href="/contact" class="btn-solid-gold px-5 py-3 text-decoration-none">
                        Enquire Now
                    </a>
                </div>
            </div>

        </div>
    </div>
</section>
<section id="amenities" class="py-5" style="background: var(--obsidian); border-top: 1px solid rgba(197, 160, 89, 0.1);">
    <div class="container py-5">

        <!-- Section Heading -->
        <div class="text-center mb-5" data-aos="fade-up">
            <h6 class="text-uppercase" style="color: var(--gold); letter-spacing: 5px;">Luxury Features</h6>
            <h2 class="display-5 fw-bold text-uppercase" style="font-family: 'Cinzel', serif;">Premium Amenities</h2>
            <div style="width: 80px; height: 2px; background: var(--gold); margin: 20px auto;"></div>
        </div>

        <!-- Amenities Grid -->
        <div class="row g-4">

            <!-- Amenity Item -->
            <!-- 1. Security (Highest Priority) -->
            <div class="col-lg-4 col-md-6" data-aos="fade-up">
                <div class="amenity-card text-center p-4">
                    <i class="fa-solid fa-shield-halved amenity-icon"></i>
                    <h5 class="mt-3">24/7 Security</h5>
                    <p class="text-white-50 small">CCTV surveillance and controlled entry system for complete safety.</p>
                </div>
            </div>

            <!-- 2. Power Backup -->
            <div class="col-lg-4 col-md-6" data-aos="fade-up">
                <div class="amenity-card text-center p-4">
                    <i class="fa-solid fa-bolt amenity-icon"></i>
                    <h5 class="mt-3">Power Backup</h5>
                    <p class="text-white-50 small">Uninterrupted power supply for common areas and essential services.</p>
                </div>
            </div>

            <!-- 3. Lift -->
            <div class="col-lg-4 col-md-6" data-aos="fade-up">
                <div class="amenity-card text-center p-4">
                    <i class="fa-solid fa-elevator amenity-icon"></i>
                    <h5 class="mt-3">Lift Facility</h5>
                    <p class="text-white-50 small">Lift available in each building for convenient access.</p>
                </div>
            </div>

            <!-- 4. Spacious Parking -->
            <div class="col-lg-4 col-md-6" data-aos="fade-up">
                <div class="amenity-card text-center p-4">
                    <i class="fa-solid fa-car amenity-icon"></i>
                    <h5 class="mt-3">Spacious Parking</h5>
                    <p class="text-white-50 small">Dedicated parking spaces for residents and guests.</p>
                </div>
            </div>

            <!-- 5. Clubhouse -->
            <div class="col-lg-4 col-md-6" data-aos="fade-up">
                <div class="amenity-card text-center p-4">
                    <i class="fa-solid fa-house amenity-icon"></i>
                    <h5 class="mt-3">Clubhouse</h5>
                    <p class="text-white-50 small">Well-equipped clubhouse for society meetings and events.</p>
                </div>
            </div>

            <!-- 6. Modern Gym -->
            <div class="col-lg-4 col-md-6" data-aos="fade-up">
                <div class="amenity-card text-center p-4">
                    <i class="fa-solid fa-dumbbell amenity-icon"></i>
                    <h5 class="mt-3">Modern Gym</h5>
                    <p class="text-white-50 small">Fully equipped fitness center for healthy living.</p>
                </div>
            </div>

            <!-- 7. Kids Play Area -->
            <div class="col-lg-4 col-md-6" data-aos="fade-up">
                <div class="amenity-card text-center p-4">
                    <i class="fa-solid fa-child-reaching amenity-icon"></i>
                    <h5 class="mt-3">Kids' Play Area</h5>
                    <p class="text-white-50 small">Safe and fun environment designed for children.</p>
                </div>
            </div>

            <!-- 8. Pandavleni View -->
            <div class="col-lg-4 col-md-6" data-aos="fade-up">
                <div class="amenity-card text-center p-4">
                    <i class="fa-solid fa-tree amenity-icon"></i>
                    <h5 class="mt-3">Pandavleni View</h5>
                    <p class="text-white-50 small">Scenic view of the historic Pandavleni hills.</p>
                </div>
            </div>

            <!-- 9. Beautiful Mountain View -->
            <div class="col-lg-4 col-md-6" data-aos="fade-up">
                <div class="amenity-card text-center p-4">
                    <i class="fa-solid fa-mountain-city amenity-icon"></i>
                    <h5 class="mt-3">Beautiful Mountain View</h5>
                    <p class="text-white-50 small">Pleasant views of surrounding mountains and greenery.</p>
                </div>
            </div>

        </div>
    </div>
</section>


<section id="committee" class="py-5" style="background: var(--obsidian);">
    <div class="container py-5">
        <div class="text-center mb-5" data-aos="fade-up">
            <h6 class="text-uppercase" style="color: var(--gold); letter-spacing: 5px;">Leadership</h6>
            <h2 class="display-5 fw-bold text-uppercase" style="font-family: 'Cinzel', serif;">Managing Committee</h2>
            <div style="width: 80px; height: 2px; background: var(--gold); margin: 20px auto;"></div>
        </div>

        <div class="row g-4 justify-content-center">
            <div class="col-lg-3 col-md-6" data-aos="fade-up" >
                <div class="committee-card">
                    <div class="member-img-wrapper">
                        <img src="/images/landingpage/image3.jpeg" alt="President">
                        <div class="member-overlay">
                            <div class="social-links">
                                <a href="#"><i class="bi bi-linkedin"></i></a>
                                <a href="#"><i class="bi bi-envelope"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="member-info text-center mt-4">
                        <h5 class="fw-bold mb-1">Mr. Dada Wadgaonkar</h5>
                        <p class="text-uppercase small" style="color: var(--gold); letter-spacing: 2px;">Chairman</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6" data-aos="fade-up" >
                <div class="committee-card">
                    <div class="member-img-wrapper">
                       <img src="/images/landingpage/image1.jpeg" alt="Chairman">
                        <div class="member-overlay">
                            <div class="social-links">
                                <a href="#"><i class="bi bi-linkedin"></i></a>
                                <a href="#"><i class="bi bi-envelope"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="member-info text-center mt-4">
                        <h5 class="fw-bold mb-1">Mrs. Jayashree Jadhav</h5>
                        <p class="text-uppercase small" style="color: var(--gold); letter-spacing: 2px;">Vice Chairman</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6" data-aos="fade-up" >
                <div class="committee-card">
                    <div class="member-img-wrapper">
                        <img src="/images/landingpage/image2.jpeg" alt="Vice Chairman">
                        <div class="member-overlay">
                            <div class="social-links">
                                <a href="#"><i class="bi bi-linkedin"></i></a>
                                <a href="#"><i class="bi bi-envelope"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="member-info text-center mt-4">
                        <h5 class="fw-bold mb-1">Mr. Rahul Deshmukh</h5>
                        <p class="text-uppercase small" style="color: var(--gold); letter-spacing: 2px;">Treasurer</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6" data-aos="fade-up">
                <div class="committee-card">
                    <div class="member-img-wrapper">
                        <img src="/images/landingpage/managerimg.jpeg" alt="manager">
                        <div class="member-overlay">
                            <div class="social-links">
                                <a href="#"><i class="bi bi-linkedin"></i></a>
                                <a href="#"><i class="bi bi-envelope"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="member-info text-center mt-4">
                        <h5 class="fw-bold mb-1">Mrs. Kanchan Kute</h5>
                        <p class="text-uppercase small" style="color: var(--gold); letter-spacing: 2px;">Manager</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section id="location" class="py-5">
    <div class="container py-5">
        <div class="row align-items-center g-5">
            <div class="col-lg-5" data-aos="fade-right">
                <h6 class="text-uppercase" style="color: var(--gold); letter-spacing: 5px;">The Address</h6>
                <h2 class="display-5 fw-bold" style="font-family: 'Cinzel', serif;">Pathardi Phata, Nashik</h2>
                <p class="text-white-50">Strategically located at the pulse of Nashik, offering hillside views with urban connectivity.</p>
                <ul class="list-unstyled text-white-50">
                    <li class="mb-2"><i class="fa-solid fa-check text-gold me-2"></i> Mumbai - Agra Highway Connectivity</li>
                    <li class="mb-2"><i class="fa-solid fa-check text-gold me-2"></i> Close to Premium Hospitals & Schools</li>
                </ul>
            </div>
            <div class="col-lg-7" data-aos="zoom-in">
                <div class="map-container">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3749.88876483525!2d73.76634731491544!3d19.93120198660351!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bdd95738805f641%3A0x6291a826477e3076!2sGajra%20Avenue!5e0!3m2!1sen!2sin!4v1700000000000" height="400" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="modal fade" id="tourModal" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content bg-dark border-secondary">
            <div class="modal-body p-0">
                <div class="ratio ratio-16x9">
                    <iframe src="https://www.youtube.com/embed/UO6UAJoLfcg" allowfullscreen></iframe>
                </div>
            </div>
        </div>
    </div>
</div>

<footer class="py-4 text-center border-top border-secondary border-opacity-10">
    <p class="small text-white-50">Managed by <span style="color:var(--gold)">Gajra Avenu Systems 2026</span></p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>


    AOS.init({ once: true, duration: 1000 });

    window.addEventListener('scroll', function() {
        const nav = document.querySelector('.navbar');
        if (window.scrollY > 50) nav.classList.add('scrolled');
        else nav.classList.remove('scrolled');
    });
</script>
</body>
</html>