<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Page</title>
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

        .custom-input {
            background: #f8f8f8;
            border: 2px solid #e2e2e2;
            border-radius: 10px;
            padding: 7px 16px;
            transition: all 0.3s ease;
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

        .social-btn {
            background: white;
            border: 2px solid #e2e2e2;
            border-radius: 10px;
            padding: 9px;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .social-btn:hover {
            background: #f8f8f8;
            transform: translateY(-2px);
            border-color: #000000;
        }

        .input-icon i {
            color: #666666;
        }

        @keyframes moveBackground {
            0% { transform: translate(0, 0); }
            100% { transform: translate(-50%, -50%); }
        }

        /* Custom checkbox styles */
        input[type="checkbox"] {
            accent-color: #000000;
        }

        /* Link styles */
        a {
            color: #000000;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #404040;
        }

        .role-radio {
            display: none;
        }

        .role-label {
            display: inline-block;
            padding: 10px 20px;
            border: 2px solid #e2e2e2;
            border-radius: 10px;
            transition: all 0.3s ease;
            cursor: pointer;
            margin-right: 10px;
        }

        .role-radio:checked + .role-label {
            background: #000000;
            color: white;
            border-color: #000000;
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
            <h2 class="text-3xl font-bold mb-2 text-black">Create Account</h2>
            <p class="text-gray-600">Join our community and start your journey!</p>
        </div>

        <div class="flex gap-4 mb-8">
            <button class="social-btn flex-1">
                <i class="fab fa-google text-gray-700"></i>
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
            <div class="input-icon relative">
                <input type="text" name="fullName" placeholder="Full Name" class="custom-input w-full" required>
                <i class="far fa-user absolute right-4 top-1/2 transform -translate-y-1/2"></i>
            </div>

            <div class="input-icon relative">
                <input type="email" name="email" placeholder="Email Address" class="custom-input w-full" required>
                <i class="far fa-envelope absolute right-4 top-1/2 transform -translate-y-1/2"></i>
            </div>

            <div class="input-icon relative">
                <input type="password" name="password" id="password" placeholder="Password" class="custom-input w-full" required>
                <button type="button" id="togglePassword" class="absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-600" onclick="togglePasswordVisibility()">
                    <i class="far fa-eye"></i>
                </button>
            </div>

            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2">Select Role</label>
                <div class="flex">
                    <input type="radio" name="role" id="user" value="user" class="role-radio" required>
                    <label for="user" class="role-label">User</label>

                    <input type="radio" name="role" id="admin" value="admin" class="role-radio" required>
                    <label for="admin" class="role-label">Admin</label>
                </div>
            </div>

            <div class="flex items-center gap-2">
                <input type="checkbox" name="terms" id="terms" class="rounded border-gray-300">
                <label for="terms" class="text-sm text-gray-600">
                    I agree to the <a href="#" class="hover:text-gray-600">Terms</a> and
                    <a href="#" class="hover:text-gray-600">Privacy Policy</a>
                </label>
            </div>

            <button type="submit" class="custom-btn w-full">
                Create Account
            </button>

            <p class="text-center text-gray-600">
                Already have an account?
                <a href="login.jsp" class="hover:text-gray-600 font-medium">Sign in</a>
            </p>
        </form>
    </div>
</div>

<script>
    document.getElementById('signupForm').addEventListener('submit', function(e) {
        e.preventDefault();

        // Get selected role
        const selectedRole = document.querySelector('input[name="role"]:checked').value;

        // Simple alert to show selected role (replace with actual signup logic)
        alert(`Creating account as ${selectedRole}`);
    });

    function togglePasswordVisibility() {
        var passwordField = document.getElementById('password');
        var toggleIcon = document.getElementById('togglePassword').querySelector('i');

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