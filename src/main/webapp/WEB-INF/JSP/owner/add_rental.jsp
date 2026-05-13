<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Rental Details | Gajra Avenue</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@500;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owner/add_rental.css">

</head>

<body>

<div class="brand pt-5">
    <h1>GAJRA AVENUE</h1>
</div>

<div class="form-box">
    <h2 class="form-title">Add Rental Details</h2>
    <p class="tagline">List Your Property With Architectural Elegance</p>

    <form action="${pageContext.request.contextPath}/save-rental"
          method="POST"
          enctype="multipart/form-data">

        <h5 class="section-title mb-3">Owner Information</h5>

        <div class="mb-3">
            <label>Owner Name</label>
            <input type="text" name="ownerName" class="form-control" placeholder="Enter owner name" required>
        </div>

        <div class="mb-3">
            <label>Contact Number</label>
            <input type="tel" name="contactNumber" class="form-control" placeholder="Enter contact number" required>
        </div>

        <div class="mb-3">
            <label>Email Address</label>
            <input type="email" name="email" class="form-control" placeholder="Enter email address" required>
        </div>

        <hr>

        <h5 class="section-title mb-3">Flat Details</h5>

        <div class="mb-3">
            <label>Rent Amount (₹)</label>
            <input type="number" name="rentAmount" class="form-control" placeholder="Enter rent amount" required>
        </div>

        <div class="mb-3">
            <label>Flat Type</label>
            <select name="flatType" class="form-control">
                <option value="1 RK" class="op">1 RK</option>
                <option value="1 BHK" class="op">1 BHK</option>
                <option value="2 BHK" class="op">2 BHK</option>
                <option value="3 BHK" class="op">3 BHK</option>
            </select>
        </div>

        <div class="mb-3">
            <label>Description</label>
            <textarea name="description" class="form-control" rows="3" placeholder="Enter flat description"></textarea>
        </div>

        <hr>

        <h5 class="section-title mb-3">Upload Flat Photos</h5>

        <label class="file-box" id="dropArea">
            <small class="text-white-50">Upload multiple photos</small>
<input type="file" name="imageFile" multiple accept="image/*" class="form-control">
        </label>

        <div class="preview-container" id="previewContainer"></div>

        <button type="submit" class="btn btn-gold">Save Rental Details</button>
    </form>
</div>

<script>
const input = document.getElementById("imageInput");
const previewContainer = document.getElementById("previewContainer");
const dropArea = document.getElementById("dropArea");

input.addEventListener("change", () => previewFiles(input.files));

dropArea.addEventListener("dragover", e => {
    e.preventDefault();
    dropArea.classList.add("dragover");
});

dropArea.addEventListener("dragleave", () => {
    dropArea.classList.remove("dragover");
});

dropArea.addEventListener("drop", e => {
    e.preventDefault();
    dropArea.classList.remove("dragover");

    const dt = new DataTransfer();   // ✅ IMPORTANT FIX

    Array.from(e.dataTransfer.files).forEach(file => {
        dt.items.add(file);
    });

    input.files = dt.files;   // ✅ NOW multiple files go to backend
    previewFiles(input.files);
});

function previewFiles(files) {
    previewContainer.innerHTML = "";

    Array.from(files).forEach(file => {
        const reader = new FileReader();
        reader.onload = function (e) {
            const div = document.createElement("div");
            div.innerHTML = `<img src="${e.target.result}" width="100">`;
            previewContainer.appendChild(div);
        };
        reader.readAsDataURL(file);
    });
}
</script>
</body>
</html>