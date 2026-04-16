<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log New Entry | Gajra Avenue</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/watchman/log-entry.css">

<body>
<section class="py-5">
    <div class="container">
        <h2 class="section-title">Log New Entry</h2>
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="form-card">

                    <form action="${pageContext.request.contextPath}/watchman/save-entry" method="post">

                        <div class="row g-4">

                            <!-- Row 1 -->
                            <div class="col-md-6">
                                <label class="form-label required">Visitor Name</label>
                                <input type="text" name="visitorName" class="form-control" placeholder="Enter visitor name" required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label required">Mobile Number</label>
                                <input type="tel" name="mobileNumber" class="form-control" placeholder="Enter mobile number" required>
                            </div>

                            <!-- Row 2 -->
                            <div class="col-md-6">
                                <label class="form-label required">Entry Type</label>
                                <select name="entryType" class="form-select" id="entryType" required>

                                    <option value="" disabled selected hidden>Select Type</option>
                                    <option value="visitor">Visitor</option>
                                    <option value="delivery">Delivery</option>
                                    <option value="service">Service Provider</option>
                                    <option value="manager">Manager</option>
                                </select>
                            </div>

                            <div class="col-md-6 residence-field">
                                <label class="form-label required">Wing</label>
                                <select name="wing" class="form-select" id="wingSelect">

                                    <option value="" disabled selected hidden>Select Wing</option>
                                    <option value="A">A Wing</option>
                                    <option value="B">B Wing</option>
                                    <option value="C">C Wing</option>
                                    <option value="D">D Wing</option>
                                    <option value="managermeet">Meet manager</option>
                                </select>
                            </div>

                            <!-- Row 3 -->
                            <div class="col-md-6 residence-field">
                                <label class="form-label required">Flat Number</label>
                                <select name="flatNumber" class="form-select" id="flatSelect">
                                    <option value="" disabled selected hidden>Select Flat</option>
                                </select>
                            </div>
                            <div class="col-12" id="notifySection" style="display:none;">
                                <div class="alert alert-warning d-flex justify-content-between align-items-center"
                                     style="background:#111;border:1px solid #c5a059;color:white;">
                                    <span id="ownerInfo">Owner: </span>
                                    <button type="button" class="btn btn-sm btn-gold" onclick="notifyOwner()">
                                        Notify Owner
                                    </button>

                                </div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Vehicle Number</label>
                                <input type="text" name="vehicleNumber" class="form-control" placeholder="MH-12-AB-1234">

                            </div>

                            <!-- Row 4 -->
                            <div class="col-md-6">
                                <label class="form-label">ID Proof Type</label>
                                <select name="idProof" class="form-select">

                                    <option value="" disabled selected hidden>Select ID</option>
                                    <option>Aadhar Card</option>
                                    <option>PAN Card</option>
                                    <option>Driving License</option>
                                    <option>Other</option>
                                </select>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Purpose of Visit</label>
                                <textarea name="purpose" class="form-control" rows="3" placeholder="Enter visit details"></textarea>
                            </div>

                            <!-- Button -->
                            <div class="col-12 text-center mt-4">
                                <button type="submit" class="btn btn-gold px-5">
                                    <i class="fa-solid fa-check"></i> Save Entry
                                </button>
                            </div>

                        </div>

                    </form>

                </div>
            </div>
        </div>

    </div>
</section>
<script>

    const entryType = document.getElementById("entryType");
    const residenceFields = document.querySelectorAll(".residence-field");
    const wingSelect = document.getElementById("wingSelect");
    const flatSelect = document.getElementById("flatSelect");
    const notifySection = document.getElementById("notifySection");
    const ownerInfo = document.getElementById("ownerInfo");

    /* Dummy owner database */
    const owners = {
        "A-101": "Mr. Patil",
        "A-102": "Mrs. Sharma",
        "B-101": "Mr. Mehta",
        "C-103": "Mrs. Desai"
    };
    /* Hide Wing & Flat for Manager */
    entryType.addEventListener("change", function() {

        if (this.value === "manager") {
            residenceFields.forEach(field => field.style.display = "none");
            notifySection.style.display = "none";
        } else {
            residenceFields.forEach(field => field.style.display = "block");
        }

    });

    /* Wing → Generate Flats */
    wingSelect.addEventListener("change", function() {

        const wing = this.value;
        flatSelect.innerHTML = '<option value="" disabled selected hidden>Select Flat</option>';
        notifySection.style.display = "none";

        // ✅ If "Meet manager" selected → hide flat field
        if (wing === "managermeet") {
            flatSelect.closest(".residence-field").style.display = "none";
            return;
        } else {
            flatSelect.closest(".residence-field").style.display = "block";
        }

        // Generate flats normally
        for (let i = 101; i <= 128; i++) {
            const option = document.createElement("option");

            option.value = i;
            option.textContent = wing + "-" + i;

            flatSelect.appendChild(option);
        }

    });

    /* When Flat Selected → Show Notify */
    flatSelect.addEventListener("change", function() {

        const selectedFlat = this.value;

        if (selectedFlat) {

            const ownerName = owners[selectedFlat] || "Flat Owner";
            ownerInfo.textContent = "Owner: " + ownerName + " (" + selectedFlat + ")";
            notifySection.style.display = "block";

        }

    });

    /* Notify Button */
    function notifyOwner() {
        alert("Notification sent to Flat Owner successfully!");
    }

</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


</body>
</html>