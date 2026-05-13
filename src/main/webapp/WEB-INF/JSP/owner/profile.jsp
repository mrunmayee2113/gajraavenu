<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Owner Profile | Gajra Avenue</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body { background-color: #0d0d0d; font-family: 'Montserrat', sans-serif; color: #fff; }
        .section-title { color: #c5a059; font-family: 'Cinzel', serif; text-align: center; margin: 50px 0 30px; letter-spacing: 2px; }
        .profile-card { background: #141414; border: 1px solid #222; border-radius: 15px; padding: 40px; max-width: 450px; margin: 0 auto; box-shadow: 0 10px 30px rgba(0,0,0,0.5); }
        .profile-img { width: 100px; height: 100px; border-radius: 50%; border: 2px solid #c5a059; margin-bottom: 20px; object-fit: cover; }
        .info-box { background: #1a1a1a; border-radius: 8px; padding: 12px 15px; margin-bottom: 15px; display: flex; justify-content: space-between; align-items: center; }
        .label-text { color: #888; font-size: 0.8rem; text-transform: uppercase; }
        .value-text { color: #fff; font-weight: 500; }
        .btn-gold { background-color: #c5a059; color: #000; font-weight: 700; width: 100%; border: none; padding: 12px; border-radius: 8px; text-transform: uppercase; margin-top: 20px; transition: 0.3s; }
        .btn-gold:hover { background-color: #e2b86b; transform: translateY(-2px); }
        .back-link { color: #888; text-decoration: none; font-size: 0.85rem; display: block; text-align: center; margin-top: 20px; }
                .back-link:hover { color: #c5a059; }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="section-title">OWNER PROFILE</h2>
        <div class="profile-card text-center">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbRI9GmSaA5hC7JCHlIyAl55F3xLseNCQcjQ&s" class="profile-img">

            <h4 class="mb-1">${loggedUser.name}</h4>
            <p class="text-white-50 small mb-4">Residential Member</p>

            <div class="text-start">
                <div class="info-box">
                    <span class="label-text">Member ID</span>
                    <span class="value-text">OWN-${loggedUser.id}</span>
                </div>
                <div class="info-box">
                    <span class="label-text">Phone</span>
                    <span class="value-text">${loggedUser.phone}</span>
                </div>
                <div class="info-box">
                    <span class="label-text">Flat Details</span>
                    <span class="value-text">${loggedUser.wing} - ${loggedUser.flatNumber}</span>
                </div>
                <div class="info-box">
                    <span class="label-text">Society</span>
                    <span class="value-text">Gajra Avenue</span>
                </div>
            </div>

          <!-- Change edit_profile to edit-profile -->
          <a href="${pageContext.request.contextPath}/owner/edit-profile" class="btn btn-gold">
              Edit Profile
          </a>
            <a href="${pageContext.request.contextPath}/dashboard" class="back-link">
                            Cancel and Back to Dashboard
            </a>
        </div>

    </div>
</body>
</html>