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
                    <a class="nav-link" href="adminHomePage.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admin-products">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admin-categories">Categories</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admin-users">Users</a>
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

    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0">User Management</h2>
    </div>

    <!-- Users Table -->
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

<!-- Scripts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
<script>
    // Handle user delete
    function deleteUser(userId) {
        if (confirm('Are you sure you want to delete this user?')) {
            window.location.href = 'admin-user-delete?userId=' + userId;
        }
    }

    // Auto-hide alerts after 5 seconds
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