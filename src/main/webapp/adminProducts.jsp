<%@ page import="lk.ijse.aadassignment_01.dto.ProductDTO" %>
<%@ page import="lk.ijse.aadassignment_01.dto.CategoryDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ElectroTech - Product Management</title>
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
                    <a class="nav-link" href="adminHomePage.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="admin-products">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admin-categories">Categories</a>
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
        <h2 class="mb-0">Product Management</h2>
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addProductModal">
            <i class="fas fa-plus me-2"></i>Add Product
        </button>
    </div>

    <div class="card">
        <div class="card-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Product Name</th>
                    <th>Category</th>
                    <th>Quantity</th>
                    <th>Unit Price</th>
                    <th class="text-end">Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    List<ProductDTO> products = (List<ProductDTO>) request.getAttribute("products");
                    if (products != null && !products.isEmpty()) {
                        for (ProductDTO product : products) {
                %>
                <tr>
                    <td><%= product.getProductId() %></td>
                    <td><%= product.getProductName() %></td>
                    <td><%= product.getCategory().getCategoryName() %></td>
                    <td><%= product.getQty() %></td>
                    <td>$<%= String.format("%.2f", product.getUnitPrice()) %></td>
                    <td class="text-end">
                        <button class="btn btn-sm btn-outline-primary me-2"
                                onclick="editProduct(<%= product.getProductId() %>,
                                        '<%= product.getProductName() %>',
                                    <%= product.getQty() %>,
                                    <%= product.getUnitPrice() %>,
                                    <%= product.getCategory().getCategoryId() %>)">
                            <i class="fas fa-edit"></i> Edit
                        </button>
                        <button class="btn btn-sm btn-outline-danger"
                                onclick="deleteProduct(<%= product.getProductId() %>)">
                            <i class="fas fa-trash"></i> Delete
                        </button>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="6" class="text-center">No products found</td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Add Product Modal -->
<div class="modal fade" id="addProductModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add New Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form action="admin-product-save" method="post">
                    <div class="mb-3">
                        <label class="form-label">Product Name</label>
                        <input type="text" class="form-control" name="productName" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Quantity</label>
                        <input type="number" class="form-control" name="qty" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Unit Price</label>
                        <input type="number" step="0.01" class="form-control" name="unitPrice" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Category</label>
                        <select class="form-control" name="categoryId" required>
                            <%
                                List<CategoryDTO> categories = (List<CategoryDTO>) request.getAttribute("categories");
                                if (categories != null) {
                                    for (CategoryDTO category : categories) {
                            %>
                            <option value="<%= category.getCategoryId() %>"><%= category.getCategoryName() %></option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                    <div class="modal-footer px-0 pb-0">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary">Add Product</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Edit Product Modal -->
<div class="modal fade" id="editProductModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form action="admin-product-update" method="post">
                    <input type="hidden" name="productId" id="editProductId">
                    <div class="mb-3">
                        <label class="form-label">Product Name</label>
                        <input type="text" class="form-control" name="productName" id="editProductName" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Quantity</label>
                        <input type="number" class="form-control" name="qty" id="editProductQty" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Unit Price</label>
                        <input type="number" step="0.01" class="form-control" name="unitPrice" id="editProductPrice" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Category</label>
                        <select class="form-control" name="categoryId" id="editProductCategory" required>
                            <%
                                if (categories != null) {
                                    for (CategoryDTO category : categories) {
                            %>
                            <option value="<%= category.getCategoryId() %>"><%= category.getCategoryName() %></option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                    <div class="modal-footer px-0 pb-0">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary">Update Product</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
<script>
    // Handle product edit
    function editProduct(productId, productName, qty, unitPrice, categoryId) {
        document.getElementById('editProductId').value = productId;
        document.getElementById('editProductName').value = productName;
        document.getElementById('editProductQty').value = qty;
        document.getElementById('editProductPrice').value = unitPrice;
        document.getElementById('editProductCategory').value = categoryId;
        new bootstrap.Modal(document.getElementById('editProductModal')).show();
    }

    // Handle product delete
    function deleteProduct(productId) {
        if (confirm('Are you sure you want to delete this product?')) {
            window.location.href = 'admin-product-delete?productId=' + productId;
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