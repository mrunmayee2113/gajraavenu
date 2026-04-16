<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Gajra Avenue | Resident Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/landingpage/login.css">

</head>

<body>

<div class="brand">
    <h1>GAJRA AVENUE</h1>
</div>

<div class="auth-card">
    <div class="text-center mb-4">
        <h4 class="fw-bold mb-1">LOGIN</h4>
        <p class="text-muted small">Access your digital society dashboard</p>
    </div>

    <form id="loginForm" action="/login" method="post">
        <div class="mb-3">
            <label class="form-label">Credentials</label>

            <input type="text" class="form-control" id="username"
                   name="username" placeholder="Email or Flat Number" required>
            <div class="invalid-feedback">
                Please enter your credentials.
            </div>
        </div>

        <div class="mb-4">
            <label class="form-label">Password</label>
            <input type="password" class="form-control" id="loginPassword"
                   name="password" placeholder="Enter Password" required>
            <div class="invalid-feedback">
                Password is required.
            </div>
        </div>

        <div class="d-flex justify-content-end mb-4">
            <a href="#" class="link small">Forgot Password?</a>
        </div>

        <button type="submit" class="btn btn-main w-100">Login</button>
        <div class="text-danger text-center">
            ${error}
        </div>
    </form>

    <div class="text-center mt-5">
        <p class="text-muted small mb-0">
            New to the Avenue?
            <a href="/signup" class="link ms-1">Sign-up</a>
        </p>

    </div>
</div>

<script>
    const loginForm = document.getElementById("loginForm");
    loginForm.addEventListener("submit", function(event){
        let valid = true;

        loginForm.querySelectorAll("input").forEach(input => {
            if(!input.checkValidity()){
                input.classList.add("is-invalid");
                valid = false;
            } else {
                input.classList.remove("is-invalid");
            }
        });

        if(!valid){
            event.preventDefault();
            return;
        }

        const btn = event.target.querySelector('button');
        btn.innerHTML = '<i class="fa-solid fa-circle-notch fa-spin"></i> Logging in...';
    });

</script>

</body>
</html>