<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notices | Gajra Avenue</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manager/notices.css">

</head>

<body>

<div class="dashboard">

    <div class="sidebar">
        <h4><b>GAJRA<br>AVENUE</b></h4>
        <hr>
        <a href="${pageContext.request.contextPath}/manager/dashboard"><i class="fa-solid fa-chart-line"></i> Dashboard</a>
        <a href="${pageContext.request.contextPath}/manager/residents"><i class="fa-solid fa-users"></i> Residents</a>
        <a href="${pageContext.request.contextPath}/manager/maintenance"><i class="fa-solid fa-building"></i> Maintenance</a>
        <a href="${pageContext.request.contextPath}/manager/complaints"><i class="fa-solid fa-clipboard-list"></i> Complaints</a>
        <a href="${pageContext.request.contextPath}/manager/visitors"><i class="fa-solid fa-shield-halved"></i> Security Logs</a>
        <a href="${pageContext.request.contextPath}/manager/notices"><i class="fa-solid fa-money-bill"></i> Notices</a>
        <a href="${pageContext.request.contextPath}/manager/service_providers"><i class="fa-solid fa-bell"></i> Service</a>
        <a href="/" onclick="confirmLogout(event)"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
    </div>


    <div class="content">

        <h1>Society Notices</h1>

        <div>
            <button class="n" onclick="openNoticeModal()">+ Add Notice</button>
        </div>

        <div id="noticeContainer">

            <c:forEach var="notice" items="${allNotices}">
                <div class="notice" style="position: relative; padding-bottom: 50px; border: 1px solid #7c622d; margin-bottom: 15px; border-radius: 12px; padding: 20px; background: #1a1a1a;">

                    <div class="notice-header" style="display: flex; justify-content: space-between; align-items: center;">
                        <div class="notice-title" style="color: #c5a059; font-size: 1.2rem; font-weight: bold;">${notice.title}</div>
                        <span class="badge ${notice.category}" style="text-transform: capitalize;">${notice.category}</span>
                    </div>

                    <p style="color: #ddd; margin: 15px 0;">${notice.content}</p>

                    <div class="notice-footer" style="display: flex; justify-content: space-between; align-items: center; margin-top: 10px;">
                        <div class="notice-date" style="color: #888; font-size: 0.9rem;">📅 ${notice.date}</div>

                        <a href="${pageContext.request.contextPath}/manager/deleteNotice/${notice.id}"
                           onclick="return confirm('Delete this notice permanently?')"
                           style="background: #a17b1d; color: #111; padding: 5px 12px; border-radius: 4px; text-decoration: none; font-size: 13px; font-weight: 600; transition: 0.3s;">
                           <i class="fa-solid fa-trash-can"></i> Delete
                        </a>
                    </div>
                </div>
            </c:forEach>

            <c:if test="${empty allNotices}">
                <div style="text-align: center; color: #888; margin-top: 20px;">
                    <p>No notices have been published yet.</p>
                </div>
            </c:if>

        </div>

    </div>
</div>

<footer class="py-2 text-center">
    <p class="small text-white-50 mb-0">Gajra Avenue Manager System <i class="fa-solid fa-at"></i> 2026</p>
</footer>

<div id="noticeModal" style="display:none;position:fixed;inset:0;background:rgba(0,0,0,0.8);justify-content:center;align-items:center;z-index:1000;">
    <div style="background:#111111; padding:35px 30px; border-radius:20px; border:1px solid #7c622d; text-align:center; min-width:480px; box-shadow: 0 4px 15px rgba(0,0,0,0.5);">
        <h5 style="margin-bottom:25px; font-family: 'Cinzel', serif; color:#c5a059; letter-spacing:1px; font-size:16px; text-transform: uppercase;">Create New Notice</h5>

        <form action="${pageContext.request.contextPath}/manager/saveNotice" method="POST">

        <div class="form-group" style="text-align: left; margin-bottom: 15px;">
                <label style="color: #c5a059;">Notice Title</label>
                <input type="text" name="title" id="noticeTitle" class="form-control bg-dark text-white border-secondary" placeholder="e.g., Power Outage Schedule" required>
            </div>

            <div class="form-group" style="text-align: left; margin-bottom: 15px;">
                <label style="color: #c5a059;">Category</label>
                <select name="category" class="form-control bg-dark text-white border-secondary" required>
                    <option value="general">General</option>
                    <option value="important">Important</option>
                </select>
            </div>

            <div class="form-group" style="text-align: left; margin-bottom: 15px;">
                <label style="color: #c5a059;">Description</label>
                <textarea name="content" id="noticeDesc" class="form-control bg-dark text-white border-secondary" rows="4" placeholder="Write notice details here..." required></textarea>
            </div>

            <div class="form-group" style="text-align: left; margin-bottom: 15px;">
                <label style="color: #c5a059;">Date</label>
                <input type="date" name="date" id="modalDate" class="form-control bg-dark text-white border-secondary" required>
            </div>

            <div style="display:flex; justify-content:center; gap:15px; margin-top: 30px;">
                <button type="submit" style="padding:10px 30px; background:#a17b1d; color:#111; border:none; border-radius:6px; cursor:pointer; font-family:'Montserrat', sans-serif; font-weight: 500; font-size:14px; min-width:80px;">Publish</button>
                <button type="button" onclick="closeNoticeModal()" style="padding:10px 25px; background:transparent; color:#c5a059; border:1px solid #443515; border-radius:6px; cursor:pointer; font-family:'Montserrat', sans-serif; font-weight: 500; font-size:14px; min-width:80px;">Cancel</button>
            </div>
        </form>
    </div>
</div>

<div id="logoutModal" style="display:none;position:fixed;inset:0;background:rgba(0,0,0,0.8);justify-content:center;align-items:center;z-index:1000;">
    <div style="background:#111111; padding:35px 30px; border-radius:20px; border:1px solid #7c622d; text-align:center; min-width:440px; box-shadow: 0 4px 15px rgba(0,0,0,0.5);">
        <h5 style="margin-bottom:30px; font-family: 'Cinzel', serif; color:#c5a059; letter-spacing:1px; font-size:16px; text-transform: uppercase;">Are you sure you want to logout?</h5>
        <div style="display:flex; justify-content:center; gap:15px;">
            <button onclick="logout()" style="padding:10px 30px; background:#a17b1d; color:#111; border:none; border-radius:6px; cursor:pointer; font-family:'Montserrat', sans-serif; font-weight: 500; font-size:14px; min-width:80px;">Yes</button>
            <button onclick="closeModal()" style="padding:10px 25px; background:transparent; color:#c5a059; border:1px solid #443515; border-radius:6px; cursor:pointer; font-family:'Montserrat', sans-serif; font-weight: 500; font-size:14px; min-width:80px;">Cancel</button>
        </div>
    </div>
</div>

<script>
    /* LOGOUT SCRIPT */
    function confirmLogout(e){
        e.preventDefault();
        document.getElementById("logoutModal").style.display="flex";
    }

    function closeModal(){
        document.getElementById("logoutModal").style.display="none";
    }

    function logout(){
        window.location.href="/LandingPage/landingpage.html";
    }

    /* MODAL TOGGLES */
    function openNoticeModal() {
        document.getElementById("noticeModal").style.display = "flex";
        const today = new Date().toISOString().split('T')[0];
        document.getElementById("modalDate").value = today;
    }

    function closeNoticeModal() {
        document.getElementById("noticeModal").style.display = "none";
        // FIXED: Added missing field clears mapped to correct IDs
        document.getElementById("noticeTitle").value = "";
        document.getElementById("noticeDesc").value = "";
    }
</script>

</body>
</html>