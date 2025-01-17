<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce Application</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Custom Styles (Optional) -->
    <style>
        body {
            background-color: #f8f9fa; /* Light gray background */
        }
        header {
            background-color: #007bff; /* Bootstrap primary color */
            color: white;
        }
        nav a {
            color: white;
            margin: 0 10px;
        }
        nav a:hover {
            text-decoration: underline;
        }
        footer {
            background-color: #343a40; /* Dark gray footer */
            color: white;
            padding: 10px 0;
            text-align: center;
        }
    </style>
</head>
<body>
<header class="py-3">
    <div class="container d-flex justify-content-between align-items-center">
        <h1 class="h3">Welcome to Our E-Commerce Store</h1>
        <nav>
            <a href="home.jsp" class="text-decoration-none">Home</a>
            <a href="product_list.jsp" class="text-decoration-none">Products</a>
            <a href="cart.jsp" class="text-decoration-none">Cart</a>
            <a href="profile.jsp" class="text-decoration-none">My Profile</a>
            <a href="login.jsp" class="text-decoration-none">Login</a>
        </nav>
    </div>
</header>

<main class="container my-5">
    <section id="featured-products" class="bg-white p-4 shadow rounded-lg">
        <h2 class="text-2xl font-bold mb-4 text-center">Featured Products</h2>
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead class="table-dark">
                <tr>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Category</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <%
                    // Simulate fetching product data
                    // Replace this section with data from your ProductServlet or Database
                    String[][] products = {
                            {"Product A", "$20.00", "Category 1"},
                            {"Product B", "$35.00", "Category 2"},
                            {"Product C", "$50.00", "Category 3"}
                    };

                    for (String[] product : products) {
                %>
                <tr>
                    <td><%= product[0] %></td>
                    <td><%= product[1] %></td>
                    <td><%= product[2] %></td>
                    <td>
                        <a href="add_to_cart?product=<%= product[0] %>"
                           class="btn btn-primary btn-sm">
                            Add to Cart
                        </a>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </section>
</main>

<footer>
    <p>&copy; 2025 E-Commerce Application. All rights reserved.</p>
</footer>

<!-- Bootstrap JS (Optional, for dynamic components) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
