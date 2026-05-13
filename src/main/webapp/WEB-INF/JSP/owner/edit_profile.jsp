<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Profile | Gajra Avenue</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body { background-color: #0d0d0d; font-family: 'Montserrat', sans-serif; color: #fff; }
        .section-title { color: #c5a059; font-family: 'Cinzel', serif; text-align: center; margin: 60px 0 30px; letter-spacing: 2px; }
        .edit-card { background: #141414; border: 1px solid #222; border-radius: 15px; padding: 40px; max-width: 500px; margin: 0 auto; box-shadow: 0 10px 30px rgba(0,0,0,0.5); }
        .form-label { color: #c5a059; font-size: 0.8rem; text-transform: uppercase; letter-spacing: 1px; font-weight: 600; }
        .form-control { background-color: #1a1a1a; border: 1px solid #333; color: #fff; padding: 12px; margin-bottom: 20px; border-radius: 8px; }
        .form-control:focus { background-color: #1a1a1a; border-color: #c5a059; color: #fff; box-shadow: none; }
        .btn-save { background-color: #c5a059; color: #000; font-weight: 700; width: 100%; border: none; padding: 14px; border-radius: 8px; text-transform: uppercase; transition: 0.3s; }
        .btn-save:hover { background-color: #e2b86b; transform: translateY(-2px); }
        .back-link { color: #888; text-decoration: none; font-size: 0.85rem; display: block; text-align: center; margin-top: 20px; }
        .back-link:hover { color: #c5a059; }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="section-title">EDIT PERSONAL INFO</h2>
        <div class="edit-card">
            <form action="${pageContext.request.contextPath}/owner/update-profile" method="POST">
                <input type="hidden" name="id" value="${loggedUser.id}">
                <label class="form-label">Full Name</label>
                <input type="text" name="name" class="form-control" value="${loggedUser.name}" required>

                <label class="form-label">Phone Number</label>
                <input type="text" name="phone" class="form-control" value="${loggedUser.phone}" required>

                <label class="form-label">Email Address</label>
                <input type="email" name="email" class="form-control" value="${loggedUser.email}" required>

                <button type="submit" class="btn-save">Save Changes</button>
            </form>
            <a href="${pageContext.request.contextPath}/owner/profile" class="back-link">Cancel and Go Back</a>
        </div>
    </div>
</body>
</html>