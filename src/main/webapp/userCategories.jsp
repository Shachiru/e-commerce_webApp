<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Modern E-commerce Shop</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
  <!-- Tailwind CSS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.js"></script>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

  <style>
    :root {
      --primary-color: #1a1a1a;
      --secondary-color: #333333;
      --accent-color: #4a4a4a;
      --hover-color: #2d2d2d;
    }

    body {
      background-color: #f8f9fa;
      font-family: 'Inter', sans-serif;
    }

    /* Navbar Styling */
    .navbar-custom {
      background-color: white;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      padding: 1rem 0;
    }

    .search-input {
      transition: all 0.3s ease;
      border: 1px solid #e2e2e2;
      border-radius: 8px;
      padding: 0.5rem 1rem;
      width: 300px;
    }

    .search-input:focus {
      box-shadow: 0 0 0 2px rgba(26, 26, 26, 0.1);
      border-color: var(--primary-color);
      outline: none;
    }

    /* Category Pills */
    .category-container {
      display: flex;
      gap: 1rem;
      padding: 1rem 0;
      overflow-x: auto;
      scrollbar-width: none;
    }

    .category-container::-webkit-scrollbar {
      display: none;
    }

    .category-pill {
      transition: all 0.2s ease;
      padding: 0.5rem 1.5rem;
      border-radius: 25px;
      font-weight: 500;
      cursor: pointer;
      white-space: nowrap;
      background-color: white;
      border: 1px solid #e2e2e2;
    }

    .category-pill.active {
      background-color: var(--primary-color);
      color: white;
      border: none;
    }

    .category-pill:not(.active):hover {
      background-color: #f3f3f3;
      transform: translateY(-1px);
    }

    /* Product Grid */
    .product-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
      gap: 2rem;
      padding: 2rem 0;
    }

    /* Product Cards */
    .product-card {
      background-color: white;
      border-radius: 12px;
      overflow: hidden;
      transition: all 0.3s ease;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
    }

    .product-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
    }

    .product-image-container {
      position: relative;
      overflow: hidden;
      height: 200px;
    }

    .product-image {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: transform 0.3s ease;
    }

    .product-card:hover .product-image {
      transform: scale(1.05);
    }

    .product-badge {
      position: absolute;
      top: 1rem;
      left: 1rem;
      background-color: var(--primary-color);
      color: white;
      padding: 0.25rem 0.75rem;
      border-radius: 15px;
      font-size: 0.8rem;
    }

    .product-details {
      padding: 1.5rem;
    }

    .product-title {
      font-size: 1.1rem;
      font-weight: 600;
      color: var(--primary-color);
      margin-bottom: 0.5rem;
    }

    .product-description {
      color: #666;
      font-size: 0.9rem;
      line-height: 1.4;
      margin-bottom: 1rem;
    }

    .product-price {
      font-weight: 700;
      font-size: 1.2rem;
      color: var(--primary-color);
    }

    .product-meta {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-top: 1rem;
    }

    /* Cart Button */
    .btn-cart {
      background-color: var(--primary-color);
      color: white;
      border-radius: 8px;
      padding: 0.5rem 1.5rem;
      transition: all 0.2s ease;
      border: none;
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }

    .btn-cart:hover {
      background-color: var(--hover-color);
      transform: translateY(-1px);
    }

    .btn-cart.added {
      background-color: #28a745;
    }

    /* Toast Notification */
    .toast-notification {
      position: fixed;
      bottom: 20px;
      right: 20px;
      background-color: var(--primary-color);
      color: white;
      padding: 1rem 1.5rem;
      border-radius: 8px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
      z-index: 1000;
      opacity: 0;
      transform: translateY(20px);
      transition: all 0.3s ease;
    }

    .toast-notification.show {
      opacity: 1;
      transform: translateY(0);
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      .search-input {
        width: 100%;
      }

      .product-grid {
        grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
        gap: 1rem;
      }
    }
  </style>
</head>
<body>
<!-- Navigation -->
<nav class="navbar-custom sticky-top">
  <div class="container">
    <div class="d-flex justify-content-between align-items-center">
      <a href="#" class="text-2xl font-bold text-gray-800">SHOP</a>
      <div class="d-flex align-items-center gap-4">
        <div class="search-container">
          <input type="text" class="search-input" placeholder="Search products...">
        </div>
        <div class="relative">
          <button class="btn btn-link position-relative">
            <i class="fas fa-shopping-cart text-gray-600 text-xl"></i>
            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-dark" id="cart-count">
                            0
                        </span>
          </button>
        </div>
      </div>
    </div>
  </div>
</nav>

<!-- Main Content -->
<div class="container py-4">
  <!-- Categories -->
  <div class="category-container">
    <div class="category-pill active">All Products</div>
    <div class="category-pill">Electronics</div>
    <div class="category-pill">Clothing</div>
    <div class="category-pill">Home & Living</div>
    <div class="category-pill">Books</div>
    <div class="category-pill">Sports</div>
    <div class="category-pill">Beauty</div>
  </div>

  <!-- Product Grid -->
  <div class="product-grid">
    <%-- Example Product Data --%>
    <c:forEach var="product" items="${products}">
      <div class="product-card">
        <div class="product-image-container">
          <img src="${product.imageUrl}" alt="Product" class="product-image">
          <span class="product-badge">${product.badge}</span>
        </div>
        <div class="product-details">
          <h3 class="product-title">${product.title}</h3>
          <p class="product-description">${product.description}</p>
          <div class="product-meta">
            <span class="product-price">${product.price}</span>
            <button class="btn-cart" onclick="addToCart(${product.id})">
              <i class="fas fa-shopping-cart"></i>
              Add to Cart
            </button>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>

<!-- Toast Notification -->
<div class="toast-notification" id="toast">
  Product added to cart!
</div>

<!-- Scripts -->
<script>
  let cartCount = 0;

  function addToCart(productId) {
    // Update cart count
    cartCount++;
    document.getElementById('cart-count').textContent = cartCount;

    // Get clicked button
    const button = event.target.closest('.btn-cart');

    // Show added state
    button.classList.add('added');
    button.innerHTML = '<i class="fas fa-check"></i> Added';

    // Reset button after delay
    setTimeout(() => {
      button.classList.remove('added');
      button.innerHTML = '<i class="fas fa-shopping-cart"></i> Add to Cart';
    }, 2000);

    // Show toast notification
    const toast = document.getElementById('toast');
    toast.classList.add('show');
    setTimeout(() => {
      toast.classList.remove('show');
    }, 3000);
  }

  // Category selection
  document.querySelectorAll('.category-pill').forEach(pill => {
    pill.addEventListener('click', () => {
      // Remove active class from all pills
      document.querySelectorAll('.category-pill').forEach(p => {
        p.classList.remove('active');
      });
      // Add active class to clicked pill
      pill.classList.add('active');
    });
  });
</script>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
