<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Gajra Avenue | Contact Us</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/landingpage/contactus.css">

</head>
<body>

<div class="brand">
    <h1>GAJRA AVENUE</h1>
    <p>Support | Reach Out</p>
</div>

<div class="auth-card">
    <div class="mb-5">
        <h4 class="fw-bold mb-1">Get In Touch</h4>
    </div>

    <div class="row row-cols-1 row-cols-lg-2 g-5">
        <div class="col">
            <form id="contactForm" >
                <div class="mb-3">
                    <input type="text" id="name" class="form-control" placeholder="Full Name" required>
                </div>
                <div class="mb-3">
                    <input type="tel" id="phone" class="form-control"
                           placeholder="Contact Number"
                           pattern="[0-9]{10}"
                           required>
                </div>
                <div class="mb-3">
                    <input type="text" id="subject" class="form-control" placeholder="Subject">
                </div>
                <div class="mb-4">
                    <textarea id="message" class="form-control" rows="4" placeholder="How can we assist you?" required></textarea>
                </div>
                <button class="btn btn-main w-100" type="submit">Send Inquiry</button>
            </form>
        </div>

        <div class="col border-start-lg border-secondary border-opacity-25 ps-lg-5">
            <ul class="list-unstyled contact-info mb-5">
                <li>
                    <i class="bi bi-geo-alt"></i>
                    <p>Gajra Avenue, Pathardi Phata, Nashik - 422010</p>
                </li>
                <li>
                    <i class="bi bi-telephone"></i>
                    <p>+91 98765 43210 <br> <span class="small text-muted">Mon - Sat, 9:00 AM - 6:00 PM</span></p>
                </li>
                <li>
                    <i class="bi bi-envelope"></i>
                    <p>support@gajraavenue.com <br> <span class="small text-muted">Official Inquiries</span></p>
                </li>
            </ul>

            <div class="text-center text-lg-start">
                <p class="small text-muted mb-3">Resident Portal Access:</p>
                <div class="d-flex gap-3 justify-content-center justify-content-lg-start">
                    <a href="/signup" class="link">Sign-up</a>
                    <span class="text-secondary">|</span>
                    <a href="/login" class="link">Login</a>
                </div>
            </div>


        </div>
    </div>
</div>

<script>
    document.getElementById('contactForm').addEventListener('submit', function(e) {
        e.preventDefault();

        const btn = this.querySelector('button');
        const originalText = btn.innerHTML;

        btn.innerHTML = 'Sending...';
        btn.disabled = true;

        const data = {
            name: document.getElementById("name").value,
            phone: document.getElementById("phone").value,
            subject: document.getElementById("subject").value,
            message: document.getElementById("message").value
        };

        fetch("/contact", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(data)
        })
            .then(res => res.text())
            .then(response => {
                alert("Message sent successfully!");
                this.reset();
            })
            .catch(err => {
                alert("Error sending message!");
            })
            .finally(() => {
                btn.innerHTML = originalText;
                btn.disabled = false;
            });
    });
</script>

</body>
</html>