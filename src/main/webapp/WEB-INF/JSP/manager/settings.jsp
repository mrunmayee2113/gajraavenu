<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Security Settings | Gajra Avenue</title>

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

        .settings-card {
            background: var(--card);
            border: 1px solid rgba(197, 160, 89, 0.3);
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.6);
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
            font-size: 0.85rem;
            text-transform: uppercase;
        }

        .form-control {
            background: #1a1a1a;
            border: 1px solid #333;
            color: #fff;
            border-radius: 8px;
            padding: 12px;
        }

        .form-control:focus {
            background: #1a1a1a;
            border-color: var(--gold);
            color: #fff;
            box-shadow: 0 0 10px rgba(197, 160, 89, 0.2);
        }

        .btn-update {
            background: transparent;
            color: var(--gold);
            font-weight: 700;
            text-transform: uppercase;
            border: 1px solid var(--gold);
            padding: 14px;
            transition: 0.4s;
            border-radius: 8px;
        }

        .btn-update:hover {
            background: var(--gold);
            color: #000;
            box-shadow: 0 5px 15px rgba(197, 160, 89, 0.3);
        }

        .error-msg {
            background: rgba(220, 53, 69, 0.1);
            color: #ff4d4d;
            padding: 10px;
            border-radius: 5px;
            font-size: 0.9rem;
            border-left: 3px solid #dc3545;
        }

        .success-msg {
            background: rgba(40, 167, 69, 0.1);
            color: #2ecc71;
            padding: 10px;
            border-radius: 5px;
            font-size: 0.9rem;
            border-left: 3px solid #28a745;
        }

        .security-icon {
            color: var(--gold);
            margin-bottom: 20px;
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="settings-card shadow">
                    <div class="text-center">
                        <i class="fa fa-user-shield fa-3x security-icon"></i>
                        <h3 class="mb-4">Security Settings</h3>
                    </div>

                    <c:if test="${not empty error}">
                        <div class="error-msg mb-3"><i class="fa fa-exclamation-circle me-2"></i>${error}</div>
                    </c:if>
                    <c:if test="${not empty message}">
                        <div class="success-msg mb-3"><i class="fa fa-check-circle me-2"></i>${message}</div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/manager/update-password" method="POST">
                        <div class="mb-4">
                            <label class="form-label">Current Password</label>
                            <input type="password" name="currentPassword" class="form-control" placeholder="Type current password" required>
                        </div>

                        <div style="display: flex; align-items: center; margin-bottom: 1.5rem;">
                            <hr style="flex: 1; border-color: rgba(197, 160, 89, 0.2);">
                            <span style="padding: 0 10px; color: #555; font-size: 0.7rem; text-transform: uppercase;">New Security Credentials</span>
                            <hr style="flex: 1; border-color: rgba(197, 160, 89, 0.2);">
                        </div>

                        <div class="mb-3">
                            <label class="form-label">New Password</label>
                            <input type="password" name="newPassword" class="form-control" required>
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Confirm New Password</label>
                            <input type="password" name="confirmPassword" class="form-control" required>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-update">
                                <i class="fa fa-key me-2"></i> Save New Password
                            </button>
                        </div>

                        <div class="text-center mt-4">
                            <a href="${pageContext.request.contextPath}/manager/dashboard" style="color: #666; text-decoration: none; font-size: 0.85rem;">
                                <i class="fa fa-arrow-left me-1"></i> Return to Dashboard
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