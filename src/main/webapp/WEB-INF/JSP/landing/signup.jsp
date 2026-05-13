<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Gajra Avenue | Resident Registration</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/landingpage/signup.css">


</head>

<body>

<div class="brand">
    <h1>GAJRA AVENUE</h1>
</div>

<div class="auth-card">
    <div class="text-center mb-4">
        <h4 class="fw-bold mb-1">Join the Avenue</h4>
        <p class="text-muted small">Register to experience architectural finesse.</p>
    </div>

    <form id="signupForm" action="/register" method="post" >
        <div class="row g-3">
            <div class="col-md-12 mb-3">
                <label class="form-label">Resident Category</label>
                <select class="form-select" id="role" name="role" required>                    <option value="" hidden>Choose Role</option>
                    <option>Society Member</option>
                    <option>Managing Committee</option>
                    <option>Security</option>
                </select>
                <div class="invalid-feedback">Please select your role.</div>
            </div>

            <div class="row g-3">

                <!-- Full Name -->
                <div class="col-12">
                    <label class="form-label">Full Name</label>
                    <input type="text" class="form-control" name="name" id="name" placeholder="Simran Palde" required>
                    <div class="invalid-feedback">Name is required.</div>
                </div>

                <!-- Flat Number -->
               <div class="col-12" id="flatField">
                   <label class="form-label">Flat Number</label>
                   <input type="text" class="form-control" name="flatAndWing" id="flat" placeholder="e.g., A-402" required>
               </div>

                <!-- Email -->
                <div class="col-12">
                    <label class="form-label">Official Email</label>
                    <input type="email" class="form-control" name="email" id="email" placeholder="name@example.com" required>
                    <div class="invalid-feedback">Enter a valid email.</div>
                </div>

                <!-- Phone -->
                <div class="col-12">
                    <label class="form-label">Mobile Number</label>
                    <input type="tel" class="form-control" name="phone" id="phone" placeholder="10-digit number" required>
                    <div class="invalid-feedback">Valid 10-digit number required.</div>
                </div>


                <div class="col-12" id="shiftField" style="display:none;">
                    <label class="form-label">Shift Timing</label>
                    <select class="form-control" name="shift" id="shift">
                        <option value="" hidden>Select Shift</option>
                        <option>Morning (6 AM - 2 PM)</option>
                        <option>Afternoon (2 PM - 10 PM)</option>
                        <option>Night (10 PM - 6 AM)</option>
                    </select>
                    <div class="invalid-feedback">Shift is required.</div>
                </div>

                <!-- Password Row -->
                <div class="col-md-6">
                    <label class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" id="password" placeholder="Password" required>
                    <div id="strengthText" class="strength"></div>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Confirm Password</label>
                    <input type="password" class="form-control" name="confirm" id="confirmPassword" placeholder="Confirm" required>
                    <div class="invalid-feedback">Keys do not match.</div>
                </div>

            </div>

            <button type="submit" class="btn btn-main w-100">Register</button>
        </div>
    </form>

    <div class="text-center mt-5">
        <p class="text-muted small mb-0">
            Already a resident?
            <a href="/login" class="link ms-1">Login Here</a>
        </p>

    </div>
</div>

<script>
    const form = document.getElementById("signupForm");
    const password = document.getElementById("password");
    const confirmPassword = document.getElementById("confirmPassword");
    const strengthText = document.getElementById("strengthText");

    /* PASSWORD STRENGTH */
    password.addEventListener("input", () => {
        const val = password.value;
        if(val.length === 0) {
            strengthText.textContent = "";
        } else if(val.length < 6){
            strengthText.textContent = "Security Level: Low";
            strengthText.className = "strength weak";
        } else if(/[A-Z]/.test(val) && /[0-9]/.test(val)){
            strengthText.textContent = "Security Level: High";
            strengthText.className = "strength strong";
        } else {
            strengthText.textContent = "Security Level: Medium";
            strengthText.className = "strength medium";
        }
    });

    /* FORM VALIDATION */
    form.addEventListener("submit", function(event){
        let valid = true;

        form.querySelectorAll("input, select").forEach(input => {
            if(!input.checkValidity()){
                input.classList.add("is-invalid");
                valid = false;
            } else {
                input.classList.remove("is-invalid");
            }
        });

        if(password.value !== confirmPassword.value){
            confirmPassword.classList.add("is-invalid");
            valid = false;
        }

        if(!valid){
            event.preventDefault();
            return;
        }

        // Show loading only if valid
        const btn = form.querySelector('button');
        btn.innerHTML = '<i class="fa-solid fa-circle-notch fa-spin"></i> Registering...';
    });

    // Auto-remove error state
    form.querySelectorAll("input, select").forEach(input => {
        input.addEventListener("input", () => {
            if(input.value !== "") input.classList.remove("is-invalid");
        });
    });

    const roleSelect = document.getElementById("role");
    const flatField = document.getElementById("flatField");
    const flatInput = document.getElementById("flat");

    const shiftField = document.getElementById("shiftField");
    const shiftInput = document.getElementById("shift");

    // Initial hide
    flatField.style.display = "none";
    flatInput.removeAttribute("required");

    shiftField.style.display = "none";
    shiftInput.removeAttribute("required");

    roleSelect.addEventListener("change", function() {

        // 👇 Society Member → show flat
        if (this.value === "Society Member") {
            flatField.style.display = "block";
            flatInput.setAttribute("required", "true");
        } else {
            flatField.style.display = "none";
            flatInput.removeAttribute("required");
            flatInput.value = "";
        }

        // 👇 Security → show shift
        if (this.value === "Security") {
            shiftField.style.display = "block";
            shiftInput.setAttribute("required", "true");
        } else {
            shiftField.style.display = "none";
            shiftInput.removeAttribute("required");
            shiftInput.value = "";
        }

    });

</script>

</body>
</html>