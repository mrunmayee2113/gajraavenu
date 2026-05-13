<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Settings | Gajra Avenue</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body { background-color: #0d0d0d; font-family: 'Montserrat', sans-serif; color: #fff; }
        .section-title { color: #c5a059; font-family: 'Cinzel', serif; text-align: center; margin: 80px 0 40px; letter-spacing: 3px; }
        .settings-card { background: #141414; border: 1px solid #222; border-radius: 12px; padding: 40px; max-width: 500px; margin: 0 auto; box-shadow: 0 10px 30px rgba(0,0,0,0.5); }
        .form-label { color: #fff; font-size: 0.9rem; margin-bottom: 8px; text-transform: uppercase; letter-spacing: 1px; }
        .form-control { background-color: #1a1a1a; border: 1px solid #333; color: #fff; padding: 12px; margin-bottom: 20px; }
        .form-control:focus { background-color: #1a1a1a; border-color: #c5a059; color: #fff; box-shadow: none; }
        .btn-update { background-color: #c5a059; color: #000; font-weight: 700; width: 100%; border: none; padding: 14px; border-radius: 8px; text-transform: uppercase; transition: 0.3s; }
        .btn-update:hover { background-color: #e2b86b; transform: scale(1.02); }

        /* Style for the alert messages */
        .alert { border-radius: 8px; font-size: 0.9rem; border: none; }
        .alert-danger { background-color: #441a1a; color: #ff8080; }
        .alert-success { background-color: #1a441a; color: #80ff80; }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="section-title">SETTINGS</h2>

        <div class="settings-card">

            <c:if test="${not empty error}">
                <div class="alert alert-danger mb-4 text-center">${error}</div>
            </c:if>
            <c:if test="${not empty message}">
                <div class="alert alert-success mb-4 text-center">${message}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/owner/update-password" method="POST">

                <label class="form-label">Current Password</label>
                <input type="password" name="currentPassword" class="form-control" placeholder="Enter current password" required>

                <label class="form-label">New Password</label>
                <input type="password" name="newPassword" class="form-control" placeholder="Enter new password" required>

                <label class="form-label">Confirm Password</label>
                <input type="password" name="confirmPassword" class="form-control" placeholder="Confirm new password" required>

                <button type="submit" class="btn-update">Update Password</button>
            </form>

            <div class="text-center mt-4">

                <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-outline-secondary">
                    Back to Dashboard
                </a>
            </div>
        </div>
    </div>
</body>
</html>