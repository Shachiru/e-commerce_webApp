<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ElectroTech - Admin Panel</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="styles.css" rel="stylesheet">
    <style>
        .admin-card {
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .admin-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand" href="#">
            <i class="fas fa-bolt"></i>ElectroTech Admin
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="#dashboard">Dashboard</a>
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
                <li class="nav-item">
                    <a class="nav-link" href="#orders">Orders</a>
                </li>
            </ul>
            <div class="navbar-action-buttons">
                <a href="index.jsp" class="btn btn-navbar btn-login">
                    <i class="fas fa-sign-out-alt me-2"></i>Logout
                </a>
            </div>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <div class="row" id="dashboard">
        <div class="col-md-4 mb-4">
            <div class="card admin-card text-center p-4">
                <i class="fas fa-box fa-3x text-primary mb-3"></i>
                <h3>Total Products</h3>
                <p class="display-4 fw-bold">124</p>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card admin-card text-center p-4">
                <i class="fas fa-tags fa-3x text-primary mb-3"></i>
                <h3>Total Categories</h3>
                <p class="display-4 fw-bold">12</p>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card admin-card text-center p-4">
                <i class="fas fa-shopping-cart fa-3x text-primary mb-3"></i>
                <h3>Pending Orders</h3>
                <p class="display-4 fw-bold">37</p>
            </div>
        </div>
    </div>

    <div class="row mt-5" id="products">
        <div class="col-12">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2>Product Management</h2>
                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addProductModal">
                    <i class="fas fa-plus me-2"></i>Add New Product
                </button>
            </div>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Stock</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>iPhone 15 Pro</td>
                    <td>Smartphones</td>
                    <td>$999.99</td>
                    <td>45</td>
                    <td>
                        <button class="btn btn-sm btn-info me-2"><i class="fas fa-edit"></i></button>
                        <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                    </td>
                </tr>
                <!-- More product rows would be dynamically populated -->
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Add Product Modal -->
<div class="modal fade" id="addProductModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add New Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Product Name</label>
                            <input type="text" class="form-control" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Category</label>
                            <select class="form-select" required>
                                <option>Smartphones</option>
                                <option>Laptops</option>
                                <option>Accessories</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Price</label>
                            <input type="number" class="form-control" step="0.01" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Stock</label>
                            <input type="number" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Description</label>
                        <textarea class="form-control" rows="3"></textarea>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Product Image</label>
                        <input type="file" class="form-control">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary">Save Product</button>
            </div>
        </div>
    </div>
</div>

<!-- Add Category Modal -->
<div class="modal fade" id="addCategoryModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add New Category</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-3">
                        <label class="form-label">Category Name</label>
                        <input type="text" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Description</label>
                        <textarea class="form-control" rows="3"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary">Save Category</button>
            </div>
        </div>
    </div>
</div>

<footer class="py-4 mt-5">
    <div class="container text-center">
        <p class="mb-0">&copy; 2025 ElectroTech Admin Panel. All rights reserved.</p>
    </div>
</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>