<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modern Signup</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Tailwind CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #6366f1 0%, #a855f7 100%);
            --secondary-gradient: linear-gradient(135deg, #3b82f6 0%, #8b5cf6 100%);
        }

        body {
            background: #f3f4f6;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Inter', sans-serif;
        }

        .signup-container {
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

        @keyframes moveBackground {
            0% { transform: translate(0, 0); }
            100% { transform: translate(-50%, -50%); }
        }

        .custom-input {
            background: #f8fafc;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            padding: 7px 16px;
            transition: all 0.3s ease;
        }

        .custom-input:focus {
            border-color: #6366f1;
            background: white;
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1);
        }

        .custom-btn {
            background: var(--primary-gradient);
            color: white;
            border-radius: 10px;
            padding: 12px 24px;
            transition: all 0.3s ease;
            border: none;
            font-weight: 600;
        }

        .custom-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(99, 102, 241, 0.3);
        }

        .social-btn {
            background: white;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            padding: 9px;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .social-btn:hover {
            background: #f8fafc;
            transform: translateY(-2px);
        }

        .input-icon {
            position: relative;
        }

        .input-icon i {
            position: absolute;
            right: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: #94a3b8;
        }
    </style>
</head>
<body>
<div class="signup-container">
    <div class="image-side hidden md:flex">
        <div class="text-center relative z-10">
            <h3 class="text-4xl font-bold mb-4">Welcome to Our Platform</h3>
            <p class="text-lg opacity-90">Join thousands of users and start your journey today!</p>
        </div>
    </div>

    <div class="form-side">
        <div class="mb-8">
            <h2 class="text-3xl font-bold mb-2 bg-gradient-to-r from-indigo-500 to-purple-500 bg-clip-text text-transparent">Create Account</h2>
            <p class="text-gray-600">Join our community and start your journey!</p>
        </div>

        <div class="flex gap-4 mb-8">
            <button class="social-btn flex-1">
                <i class="fab fa-google text-red-500"></i>
                <span class="text-gray-700">Google</span>
            </button>
            <button class="social-btn flex-1">
                <i class="fab fa-apple text-gray-900"></i>
                <span class="text-gray-700">Apple</span>
            </button>
        </div>

        <div class="relative flex items-center justify-center mb-8">
            <hr class="w-full border-gray-200">
            <span class="absolute bg-white px-4 text-gray-500 text-sm">or</span>
        </div>

        <form action="signup-page" method="post" id="signupForm" class="space-y-6">
            <div class="input-icon">
                <input type="text" name="fullName" placeholder="Full Name" class="custom-input w-full" required>
                <i class="far fa-user"></i>
            </div>

            <div class="input-icon">
                <input type="email" name="email" placeholder="Email Address" class="custom-input w-full" required>
                <i class="far fa-envelope"></i>
            </div>

            <div class="input-icon">
                <input type="password" name="password" placeholder="Password" class="custom-input w-full" required>
                <i class="far fa-lock-alt"></i>
            </div>

            <div class="flex items-center gap-2">
                <input type="checkbox" name="terms" id="terms" class="rounded border-gray-300 text-indigo-500 focus:ring-indigo-500">
                <label for="terms" class="text-sm text-gray-600">
                    I agree to the <a href="#" class="text-indigo-500 hover:text-indigo-600">Terms</a> and
                    <a href="#" class="text-indigo-500 hover:text-indigo-600">Privacy Policy</a>
                </label>
            </div>

            <button type="submit" class="custom-btn w-full">
                Create Account
            </button>

            <p class="text-center text-gray-600">
                Already have an account?
                <a href="login.jsp" class="text-indigo-500 hover:text-indigo-600 font-medium">Sign in</a>
            </p>
        </form>
    </div>
</div>

<script>
    document.getElementById('signupForm').addEventListener('submit', function(e) {
        e.preventDefault();

        // Form submission logic can be handled by a backend servlet.
        // Example: Sending a post request to /signup for processing

        // Simulating a successful signup for now
        alert('Account created successfully!');
    });
</script>
</body>
</html>
