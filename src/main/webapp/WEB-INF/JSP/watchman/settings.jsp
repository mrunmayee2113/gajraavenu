<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Settings | Gajra Avenue</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/watchman/settings.css">


</head>

<body>

<div class="container " >

    <h1 class="title">Settings</h1>

    <div class="row justify-content-center" style="margin: 20px;">

        <div class="col-md-6">

            <div class="settings-card">

                <form action="${pageContext.request.contextPath}/watchman/change-password" method="post">

                    <div class="mb-3">
                        <label>Current Password</label>
                        <input type="password" name="currentPassword" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label>New Password</label>
                        <input type="password" name="newPassword" class="form-control" required>
                    </div>

                    <div class="mb-4">
                        <label>Confirm Password</label>
                        <input type="password" name="confirmPassword" class="form-control" required>
                    </div>

                    <button type="submit" class="btn btn-gold w-100">
                        Update Password
                    </button>
                </form>




            </div>

        </div>

    </div>

</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    const status = "${status}";
    const message = "${message}";

    if(status === "success"){
        Swal.fire({
            icon: "success",
            title: "Success",
            text: message,
            confirmButtonColor: "#c5a059"
        });
    }

    if(status === "error"){
        Swal.fire({
            icon: "error",
            title: "Error",
            text: message,
            confirmButtonColor: "#c5a059"
        });
    }
</script>
</body>
</html>