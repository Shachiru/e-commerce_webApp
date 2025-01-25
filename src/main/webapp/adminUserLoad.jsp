<%@ page import="lk.ijse.aadassignment_01.dto.UserDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ElectroTech - User Management</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: #f8f8f8;
        }
        .navbar {
            background: white !important;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .navbar-brand {
            font-size: 1.5rem;
            font-weight: bold;
            color: #000000 !important;
        }
        .btn-primary {
            background: #000000;
            border: none;
            border-radius: 10px;
            padding: 12px 24px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background: #333333;
            transform: translateY(-2px);
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .table {
            margin-bottom: 0;
        }
        .table th {
            border-top: none;
            background-color: #f8f9fa;
            font-weight: 600;
        }
        .table td, .table th {
            padding: 1rem;
            vertical-align: middle;
        }
        .btn-sm {
            padding: 0.4rem 0.8rem;
            font-size: 0.875rem;
        }
        .modal-content {
            border-radius: 15px;
            border: none;
        }
        .form-control {
            border-radius: 10px;
            padding: 12px;
            border: 1px solid #e2e8f0;
        }
        .form-control:focus {
            border-color: #000000;
            box-shadow: 0 0 0 0.2rem rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light sticky-top">
    <div class="container">
        <a class="navbar-brand" href="#">
            <i class="fas fa-bolt me-2"></i>ElectroTech
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="users">Users</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container py-5">
    <%
        String error = request.getParameter("error");
        String success = request.getParameter("success");
        if (error != null) {
    %>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <%= error %>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
    <%
        }
        if (success != null) {
    %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <%= success %>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
    <%
        }
    %>

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0">User Management</h2>
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addUserModal">
            <i class="fas fa-plus me-2"></i>Add User
        </button>
    </div>

    <div class="card">
        <div class="card-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th class="text-end">Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    List<UserDTO> users = (List<UserDTO>) request.getAttribute("users");
                    if (users != null && !users.isEmpty()) {
                        for (UserDTO user : users) {
                %>
                <tr>
                    <td><%= user.getUserId() %></td>
                    <td><%= user.getUserName() %></td>
                    <td><%= user.getEmail() %></td>
                    <td class="text-end">
                        <button class="btn btn-sm btn-outline-primary me-2"
                                onclick="editUser(<%= user.getUserId() %>, '<%= user.getUserName() %>', '<%= user.getEmail() %>')">
                            <i class="fas fa-edit"></i> Edit
                        </button>
                        <button class="btn btn-sm btn-outline-danger"
                                onclick="deleteUser(<%= user.getUserId() %>)">
                            <i class="fas fa-trash"></i> Delete
                        </button>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="4" class="text-center">No users found</td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Add User Modal -->
<div class="modal fade" id="addUserModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add New User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form action="users" method="post">
                    <div class="mb-3">
                        <label class="form-label">Username</label>
                        <input type="text" class="form-control" name="userName" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" class="form-control" name="password" required>
                    </div>
                    <div class="modal-footer px-0 pb-0">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary">Add User</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Edit User Modal -->
<div class="modal fade" id="editUserModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form action="users-update" method="post">
                    <input type="hidden" name="userId" id="editUserId">
                    <div class="mb-3">
                        <label class="form-label">Username</label>
                        <input type="text" class="form-control" name="userName" id="editUserName" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" name="email" id="editUserEmail" required>
                    </div>
                    <div class="modal-footer px-0 pb-0">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary">Update User</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
<script>
    function editUser(userId, userName, userEmail) {
        document.getElementById('editUserId').value = userId;
        document.getElementById('editUserName').value = userName;
        document.getElementById('editUserEmail').value = userEmail;
        new bootstrap.Modal(document.getElementById('editUserModal')).show();
    }

    function deleteUser(userId) {
        if (confirm('Are you sure you want to delete this user?')) {
            window.location.href = 'users-delete?userId=' + userId;
        }
    }

    document.addEventListener('DOMContentLoaded', function() {
        setTimeout(function() {
            const alerts = document.getElementsByClassName('alert');
            for (let alert of alerts) {
                bootstrap.Alert.getOrCreateInstance(alert).close();
            }
        }, 5000);
    });
</script>
</body>
</html>