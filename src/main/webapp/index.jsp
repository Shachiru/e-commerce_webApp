<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ElectroTech - Your Ultimate Electronics Store</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="styles.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand" href="#">
            <i class="fas fa-bolt"></i>ElectroTech
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="customerCategory.jsp">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Categories</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#contact">Contact</a>
                </li>
            </ul>
            <div class="search-container me-3">
                <i class="fas fa-search search-icon"></i>
                <input type="search" class="form-control" placeholder="Search products">
            </div>
            <div class="navbar-action-buttons">
                <a href="login.jsp" class="btn btn-navbar btn-login">
                    <i class="fas fa-user me-2"></i>Login
                </a>
                <a href="#" class="btn btn-navbar btn-cart">
                    <i class="fas fa-shopping-cart"></i>
                    <span>Cart</span>
                    <span class="cart-count">0</span>
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
                <div class="category-card">
                    <img src="https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&q=80&w=800" alt="Smartphones" class="img-fluid w-100">
                    <div class="card-body text-center p-3">
                        <h5 class="card-title">Smartphones</h5>
                        <a href="#" class="btn btn-outline-primary">View All</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="category-card">
                    <img src="https://images.unsplash.com/photo-1496181133206-80ce9b88a853?auto=format&q=80&w=800" alt="Laptops" class="img-fluid w-100">
                    <div class="card-body text-center p-3">
                        <h5 class="card-title">Laptops</h5>
                        <a href="#" class="btn btn-outline-primary">View All</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="category-card">
                    <img src="https://images.unsplash.com/photo-1625961332771-3f40b0e2bdf9?auto=format&q=80&w=800" alt="Accessories" class="img-fluid w-100">
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
                    <img src="https://images.unsplash.com/photo-1696446701796-da61225697cc?auto=format&q=80&w=800" class="card-img-top" alt="iPhone 15 Pro">
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
                    <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&q=80&w=800" class="card-img-top" alt="MacBook Air M2">
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
                    <img src="https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?auto=format&q=80&w=800" class="card-img-top" alt="AirPods Pro">
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
                    <img src="https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?auto=format&q=80&w=800" class="card-img-top" alt="iPad Pro">
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

<section class="newsletter-section py-5">
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

<footer class="py-4" id="contact">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <h5>ElectroTech</h5>
                <p>Your ultimate destination for premium electronics and accessories.</p>
            </div>
            <div class="col-md-3">
                <h5>Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact</a></li>
                    <li><a href="#">Shipping Policy</a></li>
                    <li><a href="#">Privacy Policy</a></li>
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
                    <a href="#"><i class="fab fa-facebook fa-lg"></i></a>
                    <a href="#"><i class="fab fa-twitter fa-lg"></i></a>
                    <a href="#"><i class="fab fa-instagram fa-lg"></i></a>
                    <a href="#"><i class="fab fa-linkedin fa-lg"></i></a>
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