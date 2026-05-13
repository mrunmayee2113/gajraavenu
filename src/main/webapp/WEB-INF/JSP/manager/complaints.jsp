<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complaints | Gajra Avenue</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manager/complaints.css">

</head>

<body>

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

    <h1 style="margin-bottom:30px;">COMPLAINTS OVERVIEW</h1>

    <div class="cards">
        <div class="card">
            <h3>Total Complaints</h3>
            <h2 id="totalCount" th:text="${totalCount}">0</h2>
        </div>
        <div class="card">
            <h3>Active</h3>
            <h2 id="activeCount" th:text="${activeCount}">0</h2>
        </div>
        <div class="card">
            <h3>Resolved</h3>
            <h2 id="resolvedCount" th:text="${resolvedCount}">0</h2>
        </div>
    </div>

    <div class="section">
        <h2>Complaint Records</h2>
        <div class="table-container">
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Flat</th>
                    <th>Resident</th>
                    <th>Category</th>
                    <th>Status</th>
                    <th>Assigned To</th>
                    <th>Date</th>
                </tr>
                </thead>
                <tbody id="complaintsTableBody">
                <tr th:each="comp : ${allComplaints}">
                    <td th:text="'C' + ${comp.id}">C102</td>
                    <td th:text="${comp.flatNumber}">B-204</td>
                    <td th:text="${comp.residentName != null ? comp.residentName : 'Resident'}">Anita</td>
                    <td th:text="${comp.category}">Plumbing</td>
                    <td>
                        <div class="status-wrapper">
                            <button class="status"
                                    th:classappend="${comp.status == 'Pending' ? 'status-pending' : (comp.status == 'In Progress' ? 'status-in-progress' : 'status-resolved')}"
                                    onclick="toggleStatusDropdown(this)">
                                <span th:text="${comp.status}">Pending</span> <i class="fa fa-caret-down"></i>
                            </button>
                            <div class="status-dropdown">
                                <button th:onclick="'changeStatus(this, ' + ${comp.id} + ', \'Pending\')'">Pending</button>
                                <button th:onclick="'changeStatus(this, ' + ${comp.id} + ', \'In Progress\')'">In Progress</button>
                                <button th:onclick="'changeStatus(this, ' + ${comp.id} + ', \'Resolved\')'">Resolved</button>
                            </div>
                        </div>
                    </td>
                    <td th:text="${comp.assignedTo != null ? comp.assignedTo : 'Unassigned'}">Ramesh</td>
                    <td th:text="|${comp.dateFiled.dayOfMonth} ${comp.dateFiled.month} ${comp.dateFiled.year}|"></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<footer class="py-2 text-center">
    <p class="small text-white-50 mb-0">Gajra Avenue Manager System <i class="fa-solid fa-at"></i> 2026</p>
</footer>

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
    function confirmLogout(e){
        e.preventDefault();
        document.getElementById("logoutModal").style.display="flex";
    }

    function closeModal(){
        document.getElementById("logoutModal").style.display="none";
    }

    function logout(){
        window.location.href="/";
    }

    function toggleStatusDropdown(button){
        const dropdown = button.nextElementSibling;
        document.querySelectorAll('.status-dropdown').forEach(d=>{
            if(d!==dropdown) d.style.display='none';
        });
        dropdown.style.display = dropdown.style.display === 'flex' ? 'none' : 'flex';
        dropdown.style.flexDirection='column';
    }

    function changeStatus(el, status){
        const btn = el.closest('.status-wrapper').querySelector('.status');
        btn.className = 'status ' + status;
        btn.innerHTML = el.textContent + ' <i class="fa fa-caret-down"></i>';
        el.parentElement.style.display = 'none';
    }

    window.addEventListener('click', function(e){
        if(!e.target.closest('.status-wrapper')){
            document.querySelectorAll('.status-dropdown').forEach(d=>d.style.display='none');
        }
    });
    // Call this function when a Resident successfully hits "Submit" on a complaint
    function addComplaintDynamically(complaintData) {
        const tableBody = document.getElementById("complaintsTableBody");

        // Formulate a beautiful date like "18 Feb 2026"
        const date = new Date(complaintData.dateFiled);
        const formattedDate = date.toLocaleDateString('en-GB', {
            day: 'numeric', month: 'short', year: 'numeric'
        });

        // HTML structure matching your precise design
        const newRow = `
        <tr>
            <td>C${complaintData.id}</td>
            <td>${complaintData.flatNumber}</td>
            <td>${complaintData.residentName}</td>
            <td>${complaintData.category}</td>
            <td>
                <div class="status-wrapper">
                    <button class="status status-pending" onclick="toggleStatusDropdown(this)">Pending <i class="fa fa-caret-down"></i></button>
                    <div class="status-dropdown">
                        <button onclick="changeStatus(this, ${complaintData.id}, 'Pending')">Pending</button>
                        <button onclick="changeStatus(this, ${complaintData.id}, 'In Progress')">In Progress</button>
                        <button onclick="changeStatus(this, ${complaintData.id}, 'Resolved')">Resolved</button>
                    </div>
                </div>
            </td>
            <td>Unassigned</td>
            <td>${formattedDate}</td>
        </tr>`;

        // Prepend (add at the very top) the new complaint
        tableBody.insertAdjacentHTML('afterbegin', newRow);

        // Update the metric counters instantly
        document.getElementById('totalCount').innerText = parseInt(document.getElementById('totalCount').innerText) + 1;
        document.getElementById('activeCount').innerText = parseInt(document.getElementById('activeCount').innerText) + 1;
    }

    // Modernized function to hit your backend & update counters when managers shift status
    function changeStatus(el, complaintId, newStatus) {
        const btn = el.closest('.status-wrapper').querySelector('.status');
        const previousStatus = btn.innerText.trim();

        // Hit background API to update database status
        fetch(`/api/updateComplaintStatus?id=${complaintId}&status=${newStatus}`, { method: 'POST' })
            .then(response => {
                if(response.ok) {
                    // Update visuals
                    const statusClass = 'status-' + newStatus.toLowerCase().replace(" ", "-");
                    btn.className = 'status ' + statusClass;
                    btn.innerHTML = newStatus + ' <i class="fa fa-caret-down"></i>';
                    el.parentElement.style.display = 'none';

                    // Recalculate Dashboard counters
                    const activeEl = document.getElementById('activeCount');
                    const resolvedEl = document.getElementById('resolvedCount');

                    if (previousStatus !== "Resolved" && newStatus === "Resolved") {
                        activeEl.innerText = parseInt(activeEl.innerText) - 1;
                        resolvedEl.innerText = parseInt(resolvedEl.innerText) + 1;
                    } else if (previousStatus === "Resolved" && newStatus !== "Resolved") {
                        activeEl.innerText = parseInt(activeEl.innerText) + 1;
                        resolvedEl.innerText = parseInt(resolvedEl.innerText) - 1;
                    }
                }
            });
    }

</script>

</body>
</html>