<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Gajra Avenue | Rentals</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/landingpage/wing.css">

</head>

<body>

<header>
    <h1>WING RENTALS</h1>
</header>

<div class="container py-2">

    <div class="row g-4">

        <!-- FLAT 1 -->

        <div class="col-lg-6">

            <div class="flat-card">

                <div class="flat-gallery">

                    <div class="flat-img-box">
                        <img src="https://housing-images.n7net.in/012c1500/0864ae45c3a7d3562f9e7ef83d36cd87/v0/fs-large.jpeg">
                    </div>

                    <div class="flat-img-box">
                        <img src="https://housing-images.n7net.in/012c1500/6be663fa3c5ede4e6d04c8d038218e92/v0/fs.jpeg">
                    </div>

                    <div class="flat-img-box"  onclick="openGallery()">
                        <img src="https://housing-images.n7net.in/012c1500/20d9ccbf78c1ba260380e11bc80649f6/v0/fs-large.jpeg">
                        <div class="more-overlay">+5</div>

                    </div>

                </div>

                <h4>UNIT A-101 <span style="color:var(--gold);font-size:14px;">[2 BHK]</span></h4>

                <p class="text-white-50">
                    Premium luxury apartment with modern fittings.
                </p>

                <div class="d-flex justify-content-between align-items-center">

                    <div class="rent-badge">18,000 Rs./MO</div>

                    <button class="btn btn-main px-4"
                            onclick="openFlat('A-101','2 BHK','18000')">
                        Contact
                    </button>

                </div>

            </div>

        </div>


        <!-- FLAT 2 -->

        <div class="col-lg-6">

            <div class="flat-card">

                <div class="flat-gallery">

                    <div class="flat-img-box">
                        <img src="https://housing-images.n7net.in/012c1500/0864ae45c3a7d3562f9e7ef83d36cd87/v0/fs-large.jpeg">
                    </div>

                    <div class="flat-img-box">
                        <img src="https://housing-images.n7net.in/012c1500/6be663fa3c5ede4e6d04c8d038218e92/v0/fs.jpeg">
                    </div>

                    <div class="flat-img-box"  onclick="openGallery()">
                        <img src="https://housing-images.n7net.in/012c1500/20d9ccbf78c1ba260380e11bc80649f6/v0/fs-large.jpeg">
                        <div class="more-overlay">+6</div>

                    </div>

                </div>

                <h4>UNIT A-102 <span style="color:var(--gold);font-size:14px;">[1 BHK]</span></h4>

                <p class="text-white-50">
                    Spacious flat with balcony and parking facility.
                </p>

                <div class="d-flex justify-content-between align-items-center">

                    <div class="rent-badge">15,000 Rs./MO</div>

                    <button class="btn btn-main px-4"
                            onclick="openFlat('A-102','1 BHK','15000')">
                        Contact
                    </button>

                </div>

            </div>

        </div>


        <!-- FLAT 3 -->

        <div class="col-lg-6">

            <div class="flat-card">

                <div class="flat-gallery">

                    <div class="flat-img-box">
                        <img src="https://housing-images.n7net.in/012c1500/0864ae45c3a7d3562f9e7ef83d36cd87/v0/fs-large.jpeg">
                    </div>

                    <div class="flat-img-box">
                        <img src="https://housing-images.n7net.in/012c1500/6be663fa3c5ede4e6d04c8d038218e92/v0/fs.jpeg">
                    </div>

                    <div class="flat-img-box"  onclick="openGallery()">
                        <img src="https://housing-images.n7net.in/012c1500/20d9ccbf78c1ba260380e11bc80649f6/v0/fs-large.jpeg">
                        <div class="more-overlay">+5</div>

                    </div>

                </div>

                <h4>UNIT A-103 <span style="color:var(--gold);font-size:14px;">[3 BHK]</span></h4>

                <p class="text-white-50">
                    Large executive residence with premium interiors.
                </p>

                <div class="d-flex justify-content-between align-items-center">

                    <div class="rent-badge">25,000 Rs./MO</div>

                    <button class="btn btn-main px-4"
                            onclick="openFlat('A-103','3 BHK','25000')">
                        Contact
                    </button>

                </div>

            </div>

        </div>


        <!-- FLAT 4 -->

        <div class="col-lg-6">

            <div class="flat-card">

                <div class="flat-gallery">

                    <div class="flat-img-box">
                        <img src="https://housing-images.n7net.in/012c1500/0864ae45c3a7d3562f9e7ef83d36cd87/v0/fs-large.jpeg">
                    </div>

                    <div class="flat-img-box">
                        <img src="https://housing-images.n7net.in/012c1500/6be663fa3c5ede4e6d04c8d038218e92/v0/fs.jpeg">
                    </div>

                    <div class="flat-img-box"  onclick="openGallery()">
                        <img src="https://housing-images.n7net.in/012c1500/20d9ccbf78c1ba260380e11bc80649f6/v0/fs-large.jpeg">
                        <div class="more-overlay">+4</div>

                    </div>

                </div>

                <h4>UNIT A-104 <span style="color:var(--gold);font-size:14px;">[2 BHK]</span></h4>

                <p class="text-white-50">
                    Well ventilated flat with modern amenities.
                </p>

                <div class="d-flex justify-content-between align-items-center">

                    <div class="rent-badge">20,000 Rs./MO</div>

                    <button class="btn btn-main px-4"
                            onclick="openFlat('A-104','2 BHK','20000')">
                        Contact
                    </button>

                </div>

            </div>

        </div>

    </div>
</div>

<!-- FULL SCREEN IMAGE SLIDER -->

<div id="galleryModal" class="gallery-modal">

    <button class="gallery-back" onclick="closeGallery()"><i class="fa-solid fa-arrow-left"></i> Back</button>

    <div class="slider-container">

        <button class="arrow left" onclick="prevSlide()"><i class="fa-solid fa-less-than"></i></button>

        <img id="sliderImage" src="https://housing-images.n7net.in/012c1500/0864ae45c3a7d3562f9e7ef83d36cd87/v0/fs-large.jpeg">

        <button class="arrow right" onclick="nextSlide()"><i class="fa-solid fa-greater-than"></i> </button>

        <div class="image-counter">
            <span id="current">1</span> / <span id="total">6</span>
        </div>

    </div>

</div>


<script>

    let images = [
        "https://housing-images.n7net.in/012c1500/0864ae45c3a7d3562f9e7ef83d36cd87/v0/fs-large.jpeg",
        "https://housing-images.n7net.in/012c1500/20d9ccbf78c1ba260380e11bc80649f6/v0/fs-large.jpeg",
        "https://housing-images.n7net.in/012c1500/6be663fa3c5ede4e6d04c8d038218e92/v0/fs.jpeg",
        "https://housing-images.n7net.in/012c1500/61da632d14cdf1251ce75b8deba68657/v0/fs.jpeg",
        "https://housing-images.n7net.in/012c1500/996c9c0331994711e778a9d5f7c89b9d/v0/fs.jpeg",
        "https://housing-images.n7net.in/3dphydev/b2dccd7137d3ff9600df94f22a8522c4/v0/fs.png"
    ];

    let index = 0;

    function openGallery(){
        document.getElementById("galleryModal").style.display="block";
        updateImage();
    }

    function closeGallery(){
        document.getElementById("galleryModal").style.display="none";
    }

    function updateImage(){
        document.getElementById("sliderImage").src = images[index];
        document.getElementById("current").innerText = index + 1;
        document.getElementById("total").innerText = images.length;
    }

    function nextSlide(){
        index++;
        if(index >= images.length) index = 0;
        updateImage();
    }

    function prevSlide(){
        index--;
        if(index < 0) index = images.length - 1;
        updateImage();
    }

</script>
<script>

    function openFlat(id,type,rent){

        window.location.href =
            "/flat-details?id="+id+
            "&type="+type+
            "&rent="+rent;
    }

</script>

<script>

    let startX = 0;

    document.getElementById("sliderImage").addEventListener("touchstart", function(e){
        startX = e.touches[0].clientX;
    });

    document.getElementById("sliderImage").addEventListener("touchend", function(e){

        let endX = e.changedTouches[0].clientX;

        if(startX > endX + 50){
            nextSlide();
        }

        if(startX < endX - 50){
            prevSlide();
        }

    });

</script>
<script>

    function openGallery(){
        document.getElementById("galleryModal").style.display="block";
    }

    function closeGallery(){
        document.getElementById("galleryModal").style.display="none";
    }

</script>
</body>
</html>