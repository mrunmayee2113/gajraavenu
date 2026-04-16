<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Edit Profile | Gajra Avenue</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/watchman/edit-profile.css">


</head>

<body>

<div class="container" >

    <h1 class="title">Edit Profile </h1>
    <P class="title" style="color: white;margin: 0px;font-family:sans-serif;font-weight: 200;">WATCHMAN ID:<SPAN class="title">WCH-${user.id}</SPAN></P><br>
    <div class="row justify-content-center" style="margin: 20px;">

        <div class="col-md-6">

            <div class="edit-card">

                <img src="https://thumbs.dreamstime.com/b/guardian-radio-transmitter-cartoon-character-guardian-radio-transmitter-cartoon-character-bodyguard-flat-vector-142265240.jpg" class="profile-img">

                <div class="upload-text">
                    Change Profile Picture

                </div>

                <form action="${pageContext.request.contextPath}/watchman/update-profile" method="post">

                    <input type="hidden" name="id" value="${user.id}">

                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input type="text" name="name" class="form-control" value="${user.name}" placeholder="Enter name">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Phone Number</label>
                        <input type="text" name="phone" class="form-control" value="${user.phone}" placeholder="Enter phone">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Shift Timing</label>
                        <select name="shift" class="form-control">
                            <option ${user.shift == 'Morning (6 AM - 2 PM)' ? 'selected' : ''}>
                                Morning (6 AM - 2 PM)
                            </option>
                            <option ${user.shift == 'Afternoon (2 PM - 10 PM)' ? 'selected' : ''}>
                                Afternoon (2 PM - 10 PM)
                            </option>
                            <option ${user.shift == 'Night (10 PM - 6 AM)' ? 'selected' : ''}>
                                Night (10 PM - 6 AM)
                            </option>
                        </select>
                    </div>

                    <div class="d-flex gap-3 mt-4">

                        <button type="submit" class="btn btn-gold w-50">
                            Save Changes
                        </button>

                        <a href="${pageContext.request.contextPath}/watchman/profile"
                           class="btn btn-cancel w-50">
                            Cancel
                        </a>

                    </div>

                </form>

            </div>

        </div>

    </div>

</div>

</body>
</html>