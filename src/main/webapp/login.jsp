<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #1a1a1a 0%, #404040 100%);
            --secondary-gradient: linear-gradient(135deg, #2a2a2a 0%, #505050 100%);
        }

        body {
            background: #f8f8f8;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Inter', sans-serif;
        }

        .login-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 100%;
            max-width: 1000px;
            display: flex;
            min-height: 600px;
        }

        .form-side {
            flex: 1;
            padding: 40px;
        }

        .image-side {
            flex: 1;
            background: var(--primary-gradient);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px;
            color: white;
            position: relative;
            overflow: hidden;
        }

        .image-side::before {
            content: '';
            position: absolute;
            width: 200%;
            height: 200%;
            background: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M11 18c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm48 25c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm-43-7c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm63 31c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM34 90c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm56-76c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM12 86c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm28-65c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm23-11c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-6 60c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm29 22c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zM32 63c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm57-13c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-9-21c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM60 91c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM35 41c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2z' fill='%23ffffff' fill-opacity='0.1' fill-rule='evenodd'/%3E%3C/svg%3E");
            opacity: 0.2;
            animation: moveBackground 30s linear infinite;
        }

        .custom-input {
            background: #f8f8f8;
            border: 2px solid #e2e2e2;
            border-radius: 10px;
            padding: 12px 16px;
            transition: all 0.3s ease;
            width: calc(100% - 40px);
        }

        .custom-input:focus {
            border-color: #000000;
            background: white;
            box-shadow: 0 0 0 4px rgba(0, 0, 0, 0.1);
        }

        .custom-btn {
            background: #000000;
            color: white;
            border-radius: 10px;
            padding: 12px 24px;
            transition: all 0.3s ease;
            border: none;
            font-weight: 600;
        }

        .custom-btn:hover {
            background: #333333;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .input-icon-wrapper {
            position: relative;
            display: flex;
            align-items: center;
            margin-bottom: 16px;
        }

        .input-icon-wrapper i {
            position: absolute;
            right: 12px;
            color: #666666;
            cursor: pointer;
        }

        #togglePassword {
            right: 12px;
            cursor: pointer;
            color: #666666;
        }

        @keyframes moveBackground {
            0% {
                transform: translate(0, 0);
            }
            100% {
                transform: translate(-50%, -50%);
            }
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="form-side">
        <div class="mb-8">
            <h2 class="text-3xl font-bold mb-2 text-black">Welcome Back!</h2>
            <p class="text-gray-600">Sign in to continue your journey</p>
        </div>
        <form action="login-page" method="POST">
            <div class="input-icon-wrapper">
                <input type="text" name="username" placeholder="Username" class="custom-input">
                <i class="fas fa-user"></i>
            </div>
            <div class="input-icon-wrapper">
                <input type="password" name="password" id="password" placeholder="Password" class="custom-input">
                <i class="fas fa-lock"></i>
                <i class="fas fa-eye" id="togglePassword" onclick="togglePasswordVisibility()"></i>
            </div>
            <div class="mb-4">
                <button type="submit" class="custom-btn w-full">Sign In</button>
            </div>
            <div class="text-sm text-gray-600">
                Don't have an account? <a href="signup.jsp" class="text-black hover:text-gray-600">Register here</a>.
            </div>
        </form>
    </div>
    <div class="image-side">
        <div>
            <h2 class="text-4xl font-bold mb-4">Discover Greatness</h2>
            <p class="text-lg">Join us and unlock your potential. We're excited to have you!</p>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>

<script>
    function togglePasswordVisibility() {
        var passwordField = document.getElementById('password');
        var toggleIcon = document.getElementById('togglePassword');

        if (passwordField.type === 'password') {
            passwordField.type = 'text';
            toggleIcon.classList.remove('fa-eye');
            toggleIcon.classList.add('fa-eye-slash');
        } else {
            passwordField.type = 'password';
            toggleIcon.classList.remove('fa-eye-slash');
            toggleIcon.classList.add('fa-eye');
        }
    }
</script>
</body>
</html>