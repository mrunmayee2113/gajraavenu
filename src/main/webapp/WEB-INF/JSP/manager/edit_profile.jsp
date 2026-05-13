<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile | Gajra Avenue</title>

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
            padding: 20px 0;
        }

        .edit-card {
            background: var(--card);
            border: 1px solid rgba(197, 160, 89, 0.3);
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
        }

        h3 {
            font-family: 'Cinzel', serif;
            color: var(--gold);
            letter-spacing: 2px;
            font-weight: 700;
        }

        .form-label {
            color: var(--gold-light);
            font-weight: 600;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .form-control {
            background: #1a1a1a;
            border: 1px solid #333;
            color: #fff;
            border-radius: 8px;
            padding: 12px;
            transition: 0.3s;
        }

        .form-control:focus {
            background: #1a1a1a;
            border-color: var(--gold);
            color: #fff;
            box-shadow: 0 0 10px rgba(197, 160, 89, 0.2);
        }

        .btn-save {
            background: var(--gold);
            color: #000;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            border: none;
            padding: 14px;
            transition: 0.4s;
            border-radius: 8px;
        }

        .btn-save:hover {
            background: var(--gold-light);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(197, 160, 89, 0.3);
        }

        .btn-cancel {
            color: #888;
            text-decoration: none;
            font-size: 0.9rem;
            transition: 0.3s;
        }

        .btn-cancel:hover {
            color: var(--gold);
        }

        .profile-icon-wrapper {
            width: 80px;
            height: 80px;
            background: rgba(197, 160, 89, 0.1);
            border: 1px solid var(--gold);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="edit-card animate__animated animate__fadeIn">
                    <div class="text-center mb-4">
                        <div class="profile-icon-wrapper">
                            <i class="fa fa-user-pen fa-2x" style="color: var(--gold);"></i>
                        </div>
                        <h3>Update Profile</h3>
                        <p style="color: #666; font-size: 0.85rem;">Modify manager account details</p>
                    </div>

                    <form action="${pageContext.request.contextPath}/manager/update-profile" method="POST">
                        <div class="mb-3">
                        <input type="hidden" name="id" value="${loggedUser.id}">
                            <label class="form-label">Full Name</label>
                            <input type="text" name="name" class="form-control" value="${loggedUser.name}" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email Address</label>
                            <input type="email" name="email" class="form-control" value="${loggedUser.email}" required>
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Phone Number</label>
                            <input type="text" name="phone" class="form-control" value="${loggedUser.phone}" required>
                        </div>

                        <button type="submit" class="btn btn-save mb-3">
                            <i class="fa fa-check-circle me-2"></i> Save Changes
                        </button>

                        <div class="text-center">
                            <a href="${pageContext.request.contextPath}/manager/profile" class="btn-cancel">
                                <i class="fa fa-arrow-left me-1"></i> Cancel & Return
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>