<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
/* Reset default spacing */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Body with gradient background */
body {
    font-family: 'Poppins', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #74ABE2, #5563DE);
    color: #333;
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
}

/* Centered container with animation */
.container {
    max-width: 950px;
    width: 90%;
    background: #ffffff;
    padding: 50px 60px;
    border-radius: 20px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.15);
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.container:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 28px rgba(0,0,0,0.2);
}

/* Stylish heading */
h1 {
    font-size: 2.2rem;
    color: #2d3436;
    margin-bottom: 25px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1px;
    position: relative;
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

/* Message alert */
.message {
    margin: 20px auto;
    padding: 14px 20px;
    border-radius: 8px;
    background: linear-gradient(90deg, #28a745, #54d98c);
    color: #fff;
    font-weight: 500;
    box-shadow: 0 3px 10px rgba(40,167,69,0.3);
    animation: fadeIn 0.6s ease;
}

/* Navigation bar */
nav {
    margin-top: 40px;
}

/* Animated navigation buttons */
nav a {
    display: inline-block;
    margin: 12px 18px;
    padding: 14px 30px;
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

/* Glow effect when focused */
nav a:active {
    transform: scale(0.96);
}

/* Fade-in animation */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(-10px); }
    to { opacity: 1; transform: translateY(0); }
}

/* Responsive adjustments */
@media (max-width: 600px) {
    .container {
        padding: 35px 25px;
    }
    h1 {
        font-size: 1.6rem;
    }
    nav a {
        display: block;
        margin: 12px auto;
        width: 80%;
    }
}
</style>
</head>
<body>

<div class="container">

    <h1>Welcome to To-Do App</h1>

    <c:if test="${not empty message}">
        <div class="message">
            ${message}
        </div>
    </c:if>

    <nav>
        <a href="task">Task</a>
        <a href="profile">Profile</a>
        <a href="logout">Logout</a>
    </nav>

</div>

</body>
</html>
