<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
/* Reset defaults */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Beautiful gradient background */
body {
    font-family: 'Poppins', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #74ABE2, #5563DE);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    overflow: hidden;
}

/* Glassmorphic login box */
.login-container {
    background: rgba(255, 255, 255, 0.15);
    backdrop-filter: blur(12px);
    border: 1px solid rgba(255, 255, 255, 0.3);
    padding: 45px 50px;
    border-radius: 16px;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25);
    width: 360px;
    text-align: center;
    color: #fff;
    animation: fadeIn 1s ease;
}

/* Heading with glow */
h2 {
    margin-bottom: 25px;
    font-size: 2rem;
    letter-spacing: 1px;
    color: #fff;
    text-shadow: 0 0 8px rgba(255, 255, 255, 0.4);
}

/* Labels */
label {
    display: block;
    text-align: left;
    margin-bottom: 6px;
    font-weight: 500;
    color: #e2e2e2;
}

/* Input fields */
input[type="text"], input[type="password"] {
    width: 100%;
    padding: 12px;
    margin-bottom: 18px;
    border-radius: 8px;
    border: 1px solid rgba(255, 255, 255, 0.4);
    background: rgba(255, 255, 255, 0.2);
    color: #fff;
    font-size: 15px;
    outline: none;
    transition: all 0.3s ease;
}

input[type="text"]::placeholder,
input[type="password"]::placeholder {
    color: rgba(255, 255, 255, 0.7);
}

input[type="text"]:focus,
input[type="password"]:focus {
    background: rgba(255, 255, 255, 0.35);
    box-shadow: 0 0 10px rgba(0, 123, 255, 0.6);
}

/* Submit button */
input[type="submit"] {
    width: 100%;
    padding: 12px;
    border: none;
    border-radius: 8px;
    background: linear-gradient(90deg, #007bff, #00bfff);
    color: white;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    box-shadow: 0 4px 12px rgba(0, 123, 255, 0.4);
    transition: all 0.3s ease;
}

input[type="submit"]:hover {
    background: linear-gradient(90deg, #0056b3, #0083d6);
    transform: translateY(-3px);
    box-shadow: 0 6px 18px rgba(0, 123, 255, 0.5);
}

/* Message box */
.message {
    margin-top: 15px;
    padding: 10px;
    background: rgba(255, 0, 0, 0.15);
    border: 1px solid rgba(255, 0, 0, 0.3);
    color: #ffdddd;
    font-weight: 500;
    border-radius: 8px;
    animation: shake 0.4s ease;
}

/* Register link */
.register-link {
    margin-top: 18px;
    display: inline-block;
    color: #fff;
    text-decoration: none;
    font-weight: 500;
    transition: all 0.3s ease;
}

.register-link:hover {
    color: #a6e3ff;
    text-decoration: underline;
}

/* Animation for fade-in */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

/* Slight shake for error */
@keyframes shake {
    0% { transform: translateX(0); }
    25% { transform: translateX(-5px); }
    50% { transform: translateX(5px); }
    75% { transform: translateX(-5px); }
    100% { transform: translateX(0); }
}

/* Responsive design */
@media (max-width: 480px) {
    .login-container {
        width: 85%;
        padding: 35px 30px;
    }
    h2 {
        font-size: 1.8rem;
    }
}
</style>
</head>
<body>
<div class="login-container">
    <h2>Login</h2>
    <form:form action="login" method="post" modelAttribute="login">
        <label>Email OR PhoneNo:</label>
        <form:input path="email" placeholder="Enter your email or phone number" /><br>
        <label>Password:</label>
        <form:input path="password" type="password" placeholder="Enter your password" /><br>
        <input type="submit" value="Login" />
    </form:form>

    <c:if test="${not empty message}">
        <div class="message">${message}</div>
    </c:if>

    <a href="register" class="register-link">Create Account</a>
</div>
</body>
</html>
