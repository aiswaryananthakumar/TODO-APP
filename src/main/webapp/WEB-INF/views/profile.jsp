<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>
<style>
/* Reset and base styling */
* { margin: 0; padding: 0; box-sizing: border-box; }

body {
    font-family: 'Poppins', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #667eea, #764ba2);
    color: #333;
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
}

/* Container card */
.container {
    max-width: 900px;
    width: 90%;
    background: #ffffff;
    padding: 50px 60px;
    border-radius: 18px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.15);
    text-align: center;
    animation: fadeIn 0.8s ease;
}

h1 {
    font-size: 2.2rem;
    color: #2d3436;
    margin-bottom: 25px;
    font-weight: 600;
    letter-spacing: 1px;
}

h1::after {
    content: "";
    display: block;
    width: 60px;
    height: 4px;
    background: linear-gradient(90deg, #007bff, #00c6ff);
    margin: 12px auto 0;
    border-radius: 2px;
}

/* Profile box */
.profile-box {
    text-align: left;
    margin-top: 30px;
    background: #f8f9fa;
    padding: 25px 35px;
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.05);
}

.profile-item {
    margin-bottom: 18px;
    font-size: 1.05rem;
}

.profile-item strong {
    color: #007bff;
    width: 140px;
    display: inline-block;
}

/* Navigation bar */
nav {
    margin-top: 35px;
}

nav a {
    display: inline-block;
    margin: 10px 15px;
    padding: 12px 28px;
    background: linear-gradient(90deg, #007bff, #00bfff);
    color: #fff;
    text-decoration: none;
    font-weight: 600;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0, 123, 255, 0.3);
    transition: all 0.3s ease;
}

nav a:hover {
    background: linear-gradient(90deg, #0056b3, #0083d6);
    transform: translateY(-3px);
    box-shadow: 0 6px 15px rgba(0, 123, 255, 0.4);
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(-10px); }
    to { opacity: 1; transform: translateY(0); }
}

/* Responsive */
@media (max-width: 600px) {
    .container { padding: 35px 25px; }
    .profile-item strong { display: block; margin-bottom: 6px; }
    nav a { display: block; margin: 12px auto; width: 80%; }
}
</style>
</head>
<body>

<div class="container">
    <h1>My Profile</h1>

    <div class="profile-box">
        <div class="profile-item">
            <strong>Name:</strong> ${user.name}
        </div>
        <div class="profile-item">
            <strong>Email:</strong> ${user.email}
        </div>
        <div class="profile-item">
            <strong>Phone Number:</strong> ${user.phoneNo}
        </div>
        <div class="profile-item">
            <strong>Password:</strong> ********
        </div>
    </div>

    <nav>
        <a href="home">Home</a>
        <a href="task">My Tasks</a>
        <a href="logout">Logout</a>
    </nav>
</div>

</body>
</html>
