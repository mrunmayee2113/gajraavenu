<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manager Profile | Gajra Avenue</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@700&family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/font-awesome.min.css">

    <style>
        :root {
            --gold: #c5a059;
            --gold-light: #e2c275;
            --obsidian: #0a0a0b;
            --card: #111111;
        }

        body {
            background-color: var(--obsidian);
            color: #ffffff;
            font-family: 'Montserrat', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
        }

        .profile-card {
            background: var(--card);
            border: 1px solid rgba(197, 160, 89, 0.3);
            border-radius: 15px;
            padding: 45px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.6);
            position: relative;
            overflow: hidden;
        }

        /* Subtle background pattern */
        .profile-card::before {
            content: "\f007";
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            position: absolute;
            top: -20px;
            right: -20px;
            font-size: 150px;
            color: rgba(197, 160, 89, 0.03);
            pointer-events: none;
        }

        .header-section h2 {
            font-family: 'Cinzel', serif;
            color: var(--gold);
            letter-spacing: 3px;
            font-weight: 700;
            margin-top: 15px;
        }

        .info-label {
            color: var(--gold-light);
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-bottom: 4px;
            font-weight: 600;
        }

        .info-value {
            color: #ffffff;
            font-size: 1.15rem;
            font-weight: 500;
            margin-bottom: 25px;
            border-bottom: 1px solid rgba(255,255,255,0.05);
            padding-bottom: 5px;
        }

        .btn-gold {
            background: var(--gold);
            color: #000;
            font-weight: 700;
            border: none;
            padding: 12px 30px;
            transition: 0.4s;
            text-transform: uppercase;
            letter-spacing: 1px;
            border-radius: 8px;
        }

        .btn-gold:hover {
            background: var(--gold-light);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(197, 160, 89, 0.4);
            color: #000;
        }

        .btn-outline {
            border: 1px solid rgba(255,255,255,0.2);
            color: #888;
            padding: 12px 30px;
            border-radius: 8px;
            text-decoration: none;
            transition: 0.3s;
            font-weight: 600;
        }

        .btn-outline:hover {
            border-color: var(--gold);
            color: var(--gold);
        }

        .alert-custom {
            background: rgba(40, 167, 69, 0.1);
            border: 1px solid #28a745;
            color: #2ecc71;
            border-radius: 8px;
            padding: 10px;
            font-size: 0.9rem;
        }

        .badge-premium {
            background: rgba(197, 160, 89, 0.1);
            color: var(--gold);
            border: 1px solid var(--gold);
            padding: 8px 15px;
            border-radius: 5px;
            font-size: 0.8rem;
            letter-spacing: 1px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="profile-card">
                    <div class="header-section text-center mb-5">
                        <div style="display: inline-block; position: relative;">
                            <img src="${pageContext.request.contextPath}/images/manager-avatar.jpg"
                                 class="rounded-circle" width="100" height="100"
                                 style="border: 3px solid var(--gold); object-fit: cover;">
                            <div style="position: absolute; bottom: 5px; right: 5px; background: #2ecc71; width: 15px; height: 15px; border-radius: 50%; border: 2px solid var(--card);"></div>
                        </div>
                        <h2>Manager Profile</h2>

                        <c:if test="${not empty message}">
                            <div class="alert-custom mt-3">
                                <i class="fa fa-check-circle me-2"></i> ${message}
                            </div>
                        </c:if>
                    </div>

                    <div class="row px-3">
                        <div class="col-sm-6">
                            <div class="info-label">Full Name</div>
                            <div class="info-value">${loggedUser.name}</div>
                        </div>
                        <div class="col-sm-6">
                            <div class="info-label">Account Role</div>
                            <div class="info-value">
                                <span class="badge-premium">Managing Committee</span>
                            </div>
                        </div>
                        <div class="col-12 mt-2">
                            <div class="info-label">Email Address</div>
                            <div class="info-value">${loggedUser.email}</div>
                        </div>
                        <div class="col-12 mt-2">
                            <div class="info-label">Contact Number</div>
                            <div class="info-value">${loggedUser.phone}</div>
                        </div>
                    </div>

                    <div class="text-center mt-5 pt-4 border-top border-secondary">
                        <a href="${pageContext.request.contextPath}/manager/edit_profile"class="btn btn-gold me-3">
                            <i class="fa fa-user-pen me-2"></i> Edit Details
                        </a>
                        <a href="${pageContext.request.contextPath}/manager/dashboard" class="btn-outline">
                            <i class="fa fa-arrow-left me-2"></i> Dashboard
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>