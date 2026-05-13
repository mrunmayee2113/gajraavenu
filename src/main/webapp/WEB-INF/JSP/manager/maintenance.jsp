<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <a href="/" onclick="confirmLogout(event)"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
    </div>


    <div class="content">
        <h1 style="margin-bottom:30px;">Maintenance Overview - March 2026</h1>

       <div class="stats-grid">
           <div class="stat-card">
               <h5>Total Expected</h5>
               <p>Rs. ${expected}</p>
           </div>
           <div class="stat-card">
               <h5>Total Collected</h5>
               <p>Rs. ${collected}</p>
           </div>
           <div class="stat-card">
               <h5>Pending Amount</h5>
               <p>Rs. ${pending}</p>
           </div>
           <div class="stat-card">
               <h5>Available Balance</h5>
               <p>Rs. ${balance}</p>
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
                   <c:choose>
                       <c:when test="${not empty maintenanceList}">
                           <c:forEach var="item" items="${maintenanceList}">
                               <tr>
                                   <td>${item.flatNumber}</td>
                                   <td>${item.ownerName}</td>
                                   <td>Rs. ${item.totalAmount != null ? item.totalAmount : 0}</td>
                                   <td>${item.billingMonth}</td>
                                   <td><span class="status-badge">${item.status}</span></td>
                                   <td>
                                       <i class="fa fa-edit" onclick="editBill('${item.id}')"></i>
                                       <i class="fa fa-trash" onclick="confirmDelete('${item.id}')" style="color:red; cursor:pointer;"></i>
                                   </td>
                               </tr>
                           </c:forEach>
                       </c:when>
                       <c:otherwise>
                           <tr>
                               <td colspan="6" style="text-align:center; padding: 20px; color: #888;">
                                   No maintenance records found. Click "+ Add Entry" to begin.
                               </td>
                           </tr>
                       </c:otherwise>
                   </c:choose>
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
                 <c:choose>
                     <c:when test="${not empty expenseList}">
                         <c:forEach var="exp" items="${expenseList}">
                             <tr>
                                 <td>${exp.type}</td>
                                 <td>Rs. ${exp.amount}</td>
                                 <td>${exp.date}</td>
                                 <td>${exp.approvedBy}</td>
                                 <td>
                                     <i class="fa fa-trash" onclick="deleteExpense('${exp.id}')" style="color:red; cursor:pointer;"></i>
                                 </td>
                             </tr>
                         </c:forEach>
                     </c:when>
                     <c:otherwise>
                         <tr>
                             <td colspan="5" style="text-align:center; padding: 20px; color: #888;">
                                 No expense records found in database.
                             </td>
                         </tr>
                     </c:otherwise>
                 </c:choose>
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
function saveExpense() {
    const type = document.getElementById("expenseType").value;
    const amount = document.getElementById("expenseAmount").value;
    const approved = document.getElementById("approvedBy").value;

    const today = new Date().toISOString().split('T')[0];

    if (type && amount && approved) {
        const data = {
            type: type,   // ✅ FIXED
            amount: parseFloat(amount),
            approvedBy: approved,
            date: today
        };

        fetch('/manager/add-expense', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(data)
        })
        .then(res => res.text())
        .then(result => {
            if (result === "SUCCESS") {
                location.reload();
            } else {
                alert("Failed to save");
            }
        });
    } else {
        alert("Please fill all fields");
    }
}

   function editBill(id) {
       // Find the table row that contains this specific ID
       const table = document.getElementById("flatTable");
       const rows = table.getElementsByTagName("tr");
       let targetRow = null;

       // Loop through rows to find the one matching the ID (using the onclick attribute as a hint)
       for (let i = 1; i < rows.length; i++) {
           if (rows[i].innerHTML.includes("editBill('" + id + "')")) {
               targetRow = rows[i];
               break;
           }
       }

       if (targetRow) {
           // Fill the modal fields with the data from the table cells
           document.getElementById("flatNumber").value = targetRow.cells[0].innerText;
           document.getElementById("flatOwner").value = targetRow.cells[1].innerText;
           // Clean the "Rs." prefix from the amount
           document.getElementById("flatAmount").value = targetRow.cells[2].innerText.replace('Rs. ', '');
           document.getElementById("flatDueDate").value = targetRow.cells[3].innerText;
           document.getElementById("flatStatus").value = targetRow.cells[4].innerText;

           // Change modal title and show it
           document.getElementById("flatModalTitle").innerText = "Edit Entry";
           document.getElementById("flatModal").style.display = "flex";

           // Store the ID globally so saveFlatEntry knows it's an update
           window.currentEditingId = id;
       }
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

  function saveFlatEntry() {
      const flat = document.getElementById("flatNumber").value;
      const owner = document.getElementById("flatOwner").value;
      const amount = document.getElementById("flatAmount").value;
      const due = document.getElementById("flatDueDate").value;
      const status = document.getElementById("flatStatus").value;

      if (flat && owner && amount) {

          const data = {
              id: window.currentEditingId || null,
              flatNumber: flat.trim().toUpperCase(),   // ✅ IMPORTANT (match DB like C-101)
              ownerName: owner,

              // 🔥 ONLY THIS MATTERS
              monthlyMaintenance: parseFloat(amount),

              // keep as is
              parkingCharges: 0.0,
              waterCharges: 0.0,

              billingMonth: due,
              status: status
          };

          fetch('/manager/add-maintenance-entry', {
              method: 'POST',
              headers: { 'Content-Type': 'application/json' },
              body: JSON.stringify(data)
          })
          .then(res => res.text())
          .then(result => {
              if (result === "SUCCESS") {
                  window.currentEditingId = null;
                  location.reload();
              } else {
                  alert("Error saving entry");
              }
          });

      } else {
          alert("Please fill Flat, Owner, and Amount.");
      }
  }
   function confirmDelete(id) {
       if (!id || id === 'undefined') {
           alert("Invalid ID. Try refreshing.");
           return;
       }
       if (confirm("Permanently delete this bill?")) {
           window.location.href = "/manager/delete-maintenance/" + id;
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
   function confirmDelete(id) {
       // This check is key: if id is missing, it won't trigger a 404
       if (!id || id === 'undefined' || id === '') {
           alert("Cannot delete: Row ID is missing. Try refreshing the page.");
           return;
       }

       if (confirm("Are you sure you want to permanently delete this record?")) {
           // We hardcode /manager/ because that's your @RequestMapping
           window.location.href = "/manager/delete-maintenance/" + id;
       }
   }
  function saveExpense() {
      const type = document.getElementById("expenseType").value;
      const amount = document.getElementById("expenseAmount").value;
      const approved = document.getElementById("approvedBy").value;

      // Ensure the date is in YYYY-MM-DD format
      const today = new Date().toISOString().split('T')[0];

      if (type && amount && approved) {
          const data = {
              type: type,
              amount: parseFloat(amount),
              approvedBy: approved,
              date: today // Use the formatted ISO date
          };

          fetch('/manager/add-expense', {
              method: 'POST',
              headers: { 'Content-Type': 'application/json' },
              body: JSON.stringify(data)
          })
          .then(res => res.text())
          .then(result => {
              if (result === "SUCCESS") {
                  location.reload();
              } else {
                  alert("Failed to save: Check if the backend received the data correctly.");
              }
          })
          .catch(err => console.error("Error:", err));
      } else {
          alert("Please fill all fields");
      }
  }
  function deleteExpense(id) {
      if (!id || id === 'undefined') {
          alert("Invalid ID. Try refreshing.");
          return;
      }

      if (confirm("Are you sure you want to delete this expense?")) {
          window.location.href = "<%= request.getContextPath() %>/manager/delete-expense/" + id;
      }
  }

</script>

</body>
</html>