<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ElectroTech - Your Ultimate Electronics Store</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #1a1a1a 0%, #404040 100%);
            --secondary-gradient: linear-gradient(135deg, #2a2a2a 0%, #505050 100%);
        }

        body {
            font-family: 'Inter', sans-serif;
            background: #f8f8f8;
        }

        .navbar {
            background: white !important;
        }

        .navbar-brand {
            font-size: 1.5rem;
            font-weight: bold;
            color: #000000 !important;
            -webkit-text-fill-color: #000000 !important;
        }

        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.9)), url('/api/placeholder/1920/600');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 100px 0;
        }

        .feature-card {
            transition: transform 0.3s;
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background: white;
            overflow: hidden;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
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
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        }

        .btn-outline-primary {
            border: 2px solid #000000;
            color: #000000;
            border-radius: 10px;
            padding: 10px 22px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-outline-primary:hover {
            background: #000000;
            color: white;
            border-color: #000000;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        }

        .text-primary {
            color: #000000 !important;
        }

        .bg-primary {
            background: #000000 !important;
        }

        .bg-light {
            background: #f8f8f8 !important;
        }

        .footer {
            background: #1a1a1a;
        }

        .footer a {
            color: #e2e8f0;
            transition: color 0.3s ease;
        }

        .footer a:hover {
            color: #ffffff;
        }

        .categoryDTO-card {
            background: white;
        }

        .nav-link {
            color: #404040 !important;
        }

        .nav-link:hover, .nav-link.active {
            color: #000000 !important;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top shadow-sm">
    <div class="container">
        <a class="navbar-brand text-primary" href="#">
            <i class="fas fa-bolt me-2"></i>ElectroTech
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="customerCategory.jsp">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminCategories.jsp">Categories</a>
                </li>
                <%--<li class="nav-item">
                    <a class="nav-link" href="#">Deals</a>
                </li>--%>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
            </ul>
            <div class="d-flex align-items-center">
                <form class="d-flex me-3">
                    <input class="form-control me-2" type="search" placeholder="Search products...">
                    <button class="btn btn-outline-primary" type="submit">
                        <i class="fas fa-search"></i>
                    </button>
                </form>
                <a href="login.jsp" class="btn btn-outline-primary me-2">
                    <i class="fas fa-user me-1"></i> Login
                </a>
                <a href="#" class="btn btn-primary">
                    <i class="fas fa-shopping-cart me-1"></i> Cart (0)
                </a>
            </div>
        </div>
    </div>
</nav>

<section class="hero-section">
    <div class="container text-center">
        <h1 class="display-4 fw-bold mb-4">Welcome to ElectroTech</h1>
        <p class="lead mb-4">Discover the Latest in Electronics and Technology</p>
        <a href="#" class="btn btn-primary btn-lg me-2">Shop Now</a>
        <a href="#" class="btn btn-outline-light btn-lg">Learn More</a>
    </div>
</section>

<section class="py-5">
    <div class="container">
        <h2 class="text-center mb-4">Popular Categories</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="categoryDTO-card">
                    <img src="" alt="Smartphones" class="img-fluid w-100">
                    <div class="card-body text-center p-3">
                        <h5 class="card-title">Smartphones</h5>
                        <a href="#" class="btn btn-outline-primary">View All</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="categoryDTO-card">
                    <img src="/api/placeholder/400/300" alt="Laptops" class="img-fluid w-100">
                    <div class="card-body text-center p-3">
                        <h5 class="card-title">Laptops</h5>
                        <a href="#" class="btn btn-outline-primary">View All</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="categoryDTO-card">
                    <img src="/api/placeholder/400/300" alt="Accessories" class="img-fluid w-100">
                    <div class="card-body text-center p-3">
                        <h5 class="card-title">Accessories</h5>
                        <a href="#" class="btn btn-outline-primary">View All</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="bg-light py-5">
    <div class="container">
        <h2 class="text-center mb-4">Featured Products</h2>
        <div class="row g-4">
            <div class="col-md-3">
                <div class="card feature-card h-100">
                    <img src="assets/iphone15proresize.jpg" class="card-img-top" alt="Product 1">
                    <div class="card-body">
                        <h5 class="card-title">iPhone 15 Pro</h5>
                        <p class="card-text text-muted">Latest Apple smartphone with advanced features</p>
                        <p class="text-primary fw-bold">$999.99</p>
                        <button class="btn btn-primary w-100">Add to Cart</button>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card feature-card h-100">
                    <img src="/api/placeholder/300/200" class="card-img-top" alt="Product 2">
                    <div class="card-body">
                        <h5 class="card-title">MacBook Air M2</h5>
                        <p class="card-text text-muted">Powerful laptop for professionals</p>
                        <p class="text-primary fw-bold">$1,299.99</p>
                        <button class="btn btn-primary w-100">Add to Cart</button>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card feature-card h-100">
                    <img src="/api/placeholder/300/200" class="card-img-top" alt="Product 3">
                    <div class="card-body">
                        <h5 class="card-title">AirPods Pro</h5>
                        <p class="card-text text-muted">Premium wireless earbuds</p>
                        <p class="text-primary fw-bold">$249.99</p>
                        <button class="btn btn-primary w-100">Add to Cart</button>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card feature-card h-100">
                    <img src="/api/placeholder/300/200" class="card-img-top" alt="Product 4">
                    <div class="card-body">
                        <h5 class="card-title">iPad Pro</h5>
                        <p class="card-text text-muted">Versatile tablet for creativity</p>
                        <p class="text-primary fw-bold">$799.99</p>
                        <button class="btn btn-primary w-100">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="py-5">
    <div class="container">
        <div class="row g-4">
            <div class="col-md-3 text-center">
                <i class="fas fa-truck fa-3x text-primary mb-3"></i>
                <h5>Free Shipping</h5>
                <p class="text-muted">On orders over $50</p>
            </div>
            <div class="col-md-3 text-center">
                <i class="fas fa-undo fa-3x text-primary mb-3"></i>
                <h5>Easy Returns</h5>
                <p class="text-muted">30-day return policy</p>
            </div>
            <div class="col-md-3 text-center">
                <i class="fas fa-lock fa-3x text-primary mb-3"></i>
                <h5>Secure Payment</h5>
                <p class="text-muted">100% secure checkout</p>
            </div>
            <div class="col-md-3 text-center">
                <i class="fas fa-headset fa-3x text-primary mb-3"></i>
                <h5>24/7 Support</h5>
                <p class="text-muted">Round the clock assistance</p>
            </div>
        </div>
    </div>
</section>

<section class="bg-primary text-white py-5">
    <div class="container text-center">
        <h3>Subscribe to Our Newsletter</h3>
        <p class="mb-4">Get the latest updates on new products and upcoming sales</p>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <form class="d-flex">
                    <input type="email" class="form-control me-2" placeholder="Enter your email">
                    <button class="btn btn-light">Subscribe</button>
                </form>
            </div>
        </div>
    </div>
</section>

<footer class="bg-dark text-light py-4">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <h5>ElectroTech</h5>
                <p>Your ultimate destination for premium electronics and accessories.</p>
            </div>
            <div class="col-md-3">
                <h5>Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-light">About Us</a></li>
                    <li><a href="#" class="text-light">Contact</a></li>
                    <li><a href="#" class="text-light">Shipping Policy</a></li>
                    <li><a href="#" class="text-light">Privacy Policy</a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <h5>Contact Info</h5>
                <ul class="list-unstyled">
                    <li><i class="fas fa-map-marker-alt me-2"></i> 123 Tech Street, CA 94043</li>
                    <li><i class="fas fa-phone me-2"></i> (555) 123-4567</li>
                    <li><i class="fas fa-envelope me-2"></i> info@electrotech.com</li>
                </ul>
            </div>
            <div class="col-md-3">
                <h5>Follow Us</h5>
                <div class="d-flex gap-3">
                    <a href="#" class="text-light"><i class="fab fa-facebook fa-lg"></i></a>
                    <a href="#" class="text-light"><i class="fab fa-twitter fa-lg"></i></a>
                    <a href="#" class="text-light"><i class="fab fa-instagram fa-lg"></i></a>
                    <a href="#" class="text-light"><i class="fab fa-linkedin fa-lg"></i></a>
                </div>
            </div>
        </div>
        <hr class="my-4">
        <div class="text-center">
            <p class="mb-0">&copy; 2025 ElectroTech. All rights reserved.</p>
        </div>
    </div>
</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>