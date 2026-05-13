<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Watchman Profile | Gajra Avenue</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/watchman/profile.css">


</head>

<body>

<div class="container">

    <h1 class="title">Watchman Profile</h1>

    <div class="row justify-content-center" style="margin: 20px;">

        <div class="col-md-6">

            <div class="profile-card">

                <img src="https://thumbs.dreamstime.com/b/guardian-radio-transmitter-cartoon-character-guardian-radio-transmitter-cartoon-character-bodyguard-flat-vector-142265240.jpg" class="profile-img">

                <h3>${user.name}</h3>
                <p class="role">Security Guard</p>

                <div class="info-box">
                    <span class="info-title">Employee ID</span>
                    <span>WCH-${user.id}</span>
                </div>

                <div class="info-box">
                    <span class="info-title">Phone</span>
                    <span>${user.phone}</span>
                </div>

                <div class="info-box">
                    <span class="info-title">Shift</span>
                    <span>${user.shift}</span>
                </div>

                <div class="info-box">
                    <span class="info-title">Society</span>
                    <span>Gajra Avenue</span>
                </div>

                <a href="${pageContext.request.contextPath}/watchman/edit-profile"
                   class="btn btn-gold">
                   Edit Profile
                </a>

            </div>

        </div>

    </div>

</div>

</body>
</html>