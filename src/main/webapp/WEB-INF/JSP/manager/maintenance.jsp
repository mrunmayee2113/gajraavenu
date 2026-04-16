<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Maintenance | Gajra Avenue</title>

    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manager/maintenance.css">

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
        <a href="${pageContext.request.contextPath}/manager/settings"><i class="fa-solid fa-gear"></i> Settings</a>
        <a href="/" onclick="confirmLogout(event)"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
    </div>


    <div class="content">
        <h1 style="margin-bottom:30px;">Maintenance Overview - March 2026</h1>

        <div class="stats-grid">
            <div class="stat-card">
                <h5>Total Expected</h5>
                <p>₹ 3,00,000</p>
            </div>
            <div class="stat-card">
                <h5>Total Collected</h5>
                <p>₹ 2,50,000</p>
            </div>
            <div class="stat-card">
                <h5>Pending Amount</h5>
                <p>₹ 50,000</p>
            </div>
            <div class="stat-card">
                <h5>Available Balance</h5>
                <p>₹ 60,000</p>
            </div>
        </div>

        <div class="d-flex justify-content-between align-items-center">
            <h3>Flat-wise Payment Status</h3>
            <button class="btn-gold" onclick="openFlatModal()">+ Add Entry</button>
        </div>

        <div class="table-responsive">
            <table id="flatTable">
                <thead>
                <tr>
                    <th>Flat</th>
                    <th>Owner</th>
                    <th>Amount</th>
                    <th>Due Date</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>A-101</td>
                    <td>Rajesh Patil</td>
                    <td>2500</td>
                    <td>10 Feb 2026</td>
                    <td class="status-paid">Paid</td>
                    <td>
                        <i class="fa fa-pencil edit-icon" onclick="editFlatRow(this)" title="Edit"></i>
                        <i class="fa fa-trash delete-icon" onclick="deleteFlatRow(this)" title="Delete"></i>
                    </td>
                </tr>
                <tr>
                    <td>B-204</td>
                    <td>Anita Deshmukh</td>
                    <td>2500</td>
                    <td>10 Feb 2026</td>
                    <td class="status-pending">Pending</td>
                    <td>
                        <i class="fa fa-pencil edit-icon" onclick="editFlatRow(this)" title="Edit"></i>
                        <i class="fa fa-trash delete-icon" onclick="deleteFlatRow(this)" title="Delete"></i>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="d-flex justify-content-between align-items-center mt-4">
            <h3>Monthly Expenses</h3>
            <button class="btn-gold" onclick="openExpenseModal()">+ Add Expense</button>
        </div>

        <div class="table-responsive mb-4">
            <table id="expenseTable">
                <thead>
                <tr>
                    <th>Expense Type</th>
                    <th>Amount</th>
                    <th>Date</th>
                    <th>Approved By</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>Lift Maintenance</td>
                    <td>25,000</td>
                    <td>05 Feb 2026</td>
                    <td>Manager</td>
                    <td>
                        <i class="fa fa-pencil edit-icon" onclick="editExpenseRow(this)" title="Edit"></i>
                        <i class="fa fa-trash delete-icon" onclick="deleteExpenseRow(this)" title="Delete"></i>
                    </td>
                </tr>
                <tr>
                    <td>Security Salary</td>
                    <td>80,000</td>
                    <td>01 Feb 2026</td>
                    <td>Committee</td>
                    <td>
                        <i class="fa fa-pencil edit-icon" onclick="editExpenseRow(this)" title="Edit"></i>
                        <i class="fa fa-trash delete-icon" onclick="deleteExpenseRow(this)" title="Delete"></i>
                    </td>
                </tr>
                <tr>
                    <td>Electricity Bill</td>
                    <td>35,000</td>
                    <td>08 Feb 2026</td>
                    <td>Manager</td>
                    <td>
                        <i class="fa fa-pencil edit-icon" onclick="editExpenseRow(this)" title="Edit"></i>
                        <i class="fa fa-trash delete-icon" onclick="deleteExpenseRow(this)" title="Delete"></i>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="d-flex justify-content-center gap-3">
            <a href="bill.html" target="_blank" class="btn-gold text-decoration-none">Generate Bill</a>
            <a href="receipt.html" target="_blank" class="btn-gold text-decoration-none">Receipt</a>
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

<div id="expenseModal" class="modal-overlay">
    <div class="modal-card">
        <h3 id="expenseModalTitle">Add Expense</h3>
        <input type="text" id="expenseType" placeholder="Expense Type">
        <input type="text" id="expenseAmount" placeholder="Amount">
        <input type="text" id="expenseDate" placeholder="Date (e.g., 10 Feb 2026)">
        <input type="text" id="approvedBy" placeholder="Approved By">
        <div class="modal-actions">
            <button onclick="saveExpense()">Save</button>
            <button onclick="closeExpenseModal()" style="background:#333; color:var(--gold-light); border:1px solid rgba(197,160,89,0.3);">Cancel</button>
        </div>
    </div>
</div>

<div id="flatModal" class="modal-overlay">
    <div class="modal-card">
        <h3 id="flatModalTitle">Add/Edit Entry</h3>
        <input type="text" id="flatNumber" placeholder="Flat">
        <input type="text" id="flatOwner" placeholder="Owner">
        <input type="text" id="flatAmount" placeholder="Amount">
        <input type="text" id="flatDueDate" placeholder="Due Date (e.g., 10 Feb 2026)">
        <select id="flatStatus">
            <option value="Paid">Paid</option>
            <option value="Pending">Pending</option>
        </select>
        <div class="modal-actions">
            <button onclick="saveFlatEntry()">Save</button>
            <button onclick="closeFlatModal()" style="background:#333; color:var(--gold-light); border:1px solid rgba(197,160,89,0.3);">Cancel</button>
        </div>
    </div>
</div>

<script>
    /* Sidebar and Logout */
    function confirmLogout(e){e.preventDefault();document.getElementById("logoutModal").style.display="flex";}
    function closeModal(){document.getElementById("logoutModal").style.display="none";}
    function logout(){
        window.location.href="/LandingPage/landingpage.html";}

    /* Expense Modal Functions */
    let editingExpenseRow = null;

    function openExpenseModal(row = null){
        editingExpenseRow = row;
        const titleElement = document.getElementById("expenseModalTitle");

        if(row){
            titleElement.innerText = "Edit Expense";
            document.getElementById("expenseType").value = row.cells[0].innerText;
            document.getElementById("expenseAmount").value = row.cells[1].innerText;
            document.getElementById("expenseDate").value = row.cells[2].innerText;
            document.getElementById("approvedBy").value = row.cells[3].innerText;
        } else {
            titleElement.innerText = "Add Expense";
            document.getElementById("expenseType").value = '';
            document.getElementById("expenseAmount").value = '';
            document.getElementById("expenseDate").value = '';
            document.getElementById("approvedBy").value = '';
        }
        document.getElementById("expenseModal").style.display = "flex";
    }

    function closeExpenseModal(){
        document.getElementById("expenseModal").style.display = "none";
        editingExpenseRow = null;
    }

    function saveExpense(){
        let type = document.getElementById("expenseType").value;
        let amount = document.getElementById("expenseAmount").value;
        let date = document.getElementById("expenseDate").value;
        let approved = document.getElementById("approvedBy").value;

        if(type && amount && date && approved){
            if(editingExpenseRow){
                editingExpenseRow.cells[0].innerText = type;
                editingExpenseRow.cells[1].innerText = amount;
                editingExpenseRow.cells[2].innerText = date;
                editingExpenseRow.cells[3].innerText = approved;
            } else {
                let table = document.getElementById("expenseTable").getElementsByTagName('tbody')[0];
                let row = table.insertRow();
                row.innerHTML = `
                    <td>${type}</td>
                    <td>${amount}</td>
                    <td>${date}</td>
                    <td>${approved}</td>
                    <td>
                        <i class="fa fa-pencil edit-icon" onclick="editExpenseRow(this)" title="Edit"></i>
                        <i class="fa fa-trash delete-icon" onclick="deleteExpenseRow(this)" title="Delete"></i>
                    </td>
                `;
            }
            closeExpenseModal();
        } else {
            alert("Please fill all fields");
        }
    }

    function editExpenseRow(btn){
        let row = btn.parentElement.parentElement;
        openExpenseModal(row);
    }

    function deleteExpenseRow(btn){
        if(confirm("Are you sure you want to delete this expense?")){
            btn.parentElement.parentElement.remove();
        }
    }

    /* Flat Modal Functions */
    let editingRow = null;

    function openFlatModal(row = null){
        editingRow = row;
        const titleElement = document.getElementById("flatModalTitle");

        if(row){
            titleElement.innerText = "Edit Entry";
            document.getElementById("flatNumber").value = row.cells[0].innerText;
            document.getElementById("flatOwner").value = row.cells[1].innerText;
            document.getElementById("flatAmount").value = row.cells[2].innerText;
            document.getElementById("flatDueDate").value = row.cells[3].innerText;
            document.getElementById("flatStatus").value = row.cells[4].innerText;
        } else {
            titleElement.innerText = "Add Entry";
            document.getElementById("flatNumber").value = '';
            document.getElementById("flatOwner").value = '';
            document.getElementById("flatAmount").value = '';
            document.getElementById("flatDueDate").value = '';
            document.getElementById("flatStatus").value = 'Paid';
        }
        document.getElementById("flatModal").style.display = "flex";
    }

    function closeFlatModal(){
        document.getElementById("flatModal").style.display = "none";
        editingRow = null;
    }

    function saveFlatEntry(){
        let flat = document.getElementById("flatNumber").value;
        let owner = document.getElementById("flatOwner").value;
        let amount = document.getElementById("flatAmount").value;
        let due = document.getElementById("flatDueDate").value;
        let status = document.getElementById("flatStatus").value;

        if(flat && owner && amount && due && status){
            if(editingRow){
                editingRow.cells[0].innerText = flat;
                editingRow.cells[1].innerText = owner;
                editingRow.cells[2].innerText = amount;
                editingRow.cells[3].innerText = due;
                editingRow.cells[4].innerText = status;
                editingRow.cells[4].className = `status-${status.toLowerCase()}`;
            } else {
                let table = document.getElementById("flatTable").getElementsByTagName('tbody')[0];
                let row = table.insertRow();
                row.innerHTML = `
                    <td>${flat}</td>
                    <td>${owner}</td>
                    <td>${amount}</td>
                    <td>${due}</td>
                    <td class="status-${status.toLowerCase()}">${status}</td>
                    <td>
                        <i class="fa fa-pencil edit-icon" onclick="editFlatRow(this)" title="Edit"></i>
                        <i class="fa fa-trash delete-icon" onclick="deleteFlatRow(this)" title="Delete"></i>
                    </td>
                `;
            }
            closeFlatModal();
        } else {
            alert("Please fill all fields");
        }
    }

    function editFlatRow(btn){
        let row = btn.parentElement.parentElement;
        openFlatModal(row);
    }

    function deleteFlatRow(btn){
        if(confirm("Are you sure you want to delete this entry?")){
            btn.parentElement.parentElement.remove();
        }
    }
</script>

</body>
</html>