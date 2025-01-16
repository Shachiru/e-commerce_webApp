<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cosmetic Shop</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom styles for the Cosmetic Shop */
        .navbar-brand {
            font-family: 'Georgia', serif;
            letter-spacing: 1px;
        }
        .hero-section {
            background: linear-gradient(to bottom right, #ffe4e1, #ffc1e3);
            color: #4a4a4a;
        }
        .btn-primary {
            background-color: #ff69b4;
            border-color: #ff69b4;
        }
        .btn-primary:hover {
            background-color: #ff1493;
            border-color: #ff1493;
        }
        .card-title {
            font-size: 1.25rem;
            font-weight: bold;
        }
        .card-text {
            color: #6c757d;
        }
        footer {
            background-color: #343a40;
            color: #fff;
        }
        .navbar {
            z-index: 1030;
        }
    </style>
</head>
<body class="bg-gray-50">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg bg-white shadow-md fixed-top">
    <div class="container">
        <a class="navbar-brand text-xl text-pink-500" href="#">Cosmetic Shop</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active text-gray-700 hover:text-pink-500" href="#products">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-gray-700 hover:text-pink-500" href="#about">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-gray-700 hover:text-pink-500" href="#contact">Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-gray-700 hover:text-pink-500" href="#" data-bs-toggle="modal" data-bs-target="#loginModal">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-gray-700 hover:text-pink-500" href="#" data-bs-toggle="modal" data-bs-target="#signupModal">Signup</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero-section py-20 text-center mt-5">
    <div class="container">
        <h1 class="text-4xl font-bold">Welcome to Cosmetic Shop</h1>
        <p class="text-lg mt-4">Discover the best beauty products at unbeatable prices!</p>
        <button class="btn btn-primary mt-6">Shop Now</button>
    </div>
</section>

<!-- Products Section -->
<section id="products" class="py-20">
    <div class="container">
        <h2 class="text-3xl font-bold text-center mb-8">Our Products</h2>
        <div class="row">
            <!-- Product Card -->
            <div class="col-md-4 mb-4">
                <div class="card shadow-md">
                    <img src="<%= request.getContextPath() %>/images/product1.jpg" class="card-img-top" alt="Product 1">
                    <div class="card-body">
                        <h5 class="card-title">Lipstick</h5>
                        <p class="card-text">$12.99</p>
                        <button class="btn btn-primary w-100">Add to Cart</button>
                    </div>
                </div>
            </div>
            <!-- Add more product cards as needed -->
        </div>
    </div>
</section>

<!-- About Section -->
<section id="about" class="bg-gray-100 py-20">
    <div class="container text-center">
        <h2 class="text-3xl font-bold">About Us</h2>
        <p class="text-lg mt-4">We bring the best cosmetics directly to your doorstep. Quality and customer satisfaction are our priorities.</p>
    </div>
</section>

<!-- Contact Section -->
<section id="contact" class="py-20">
    <div class="container text-center">
        <h2 class="text-3xl font-bold">Contact Us</h2>
        <p class="text-lg mt-4">Have questions? Reach out to us!</p>
        <form class="max-w-lg mx-auto mt-6">
            <div class="mb-4">
                <input type="text" class="form-control" placeholder="Your Name">
            </div>
            <div class="mb-4">
                <input type="email" class="form-control" placeholder="Your Email">
            </div>
            <div class="mb-4">
                <textarea class="form-control" rows="4" placeholder="Your Message"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Send</button>
        </form>
    </div>
</section>

<!-- Footer -->
<footer class="py-6">
    <div class="container text-center">
        <p>&copy; 2025 Cosmetic Shop. All Rights Reserved.</p>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
