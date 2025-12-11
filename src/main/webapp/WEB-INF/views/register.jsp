<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>

<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
        margin: 0;
    }

    .register-container {
        background: #fff;
        padding: 40px 45px;
        border-radius: 16px;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        width: 420px;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .register-container:hover {
        transform: translateY(-5px);
        box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 30px;
        font-size: 26px;
        letter-spacing: 0.5px;
    }

    label {
        display: block;
        margin-bottom: 6px;
        font-weight: 600;
        color: #444;
        font-size: 14px;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"],
    input[type="tel"] {
        width: 100%;
        padding: 12px;
        margin-bottom: 18px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 14px;
        transition: all 0.3s ease;
        background-color: #f9fafc;
    }

    input[type="text"]:focus,
    input[type="password"]:focus,
    input[type="email"]:focus,
    input[type="tel"]:focus {
        border-color: #6a5acd;
        box-shadow: 0 0 5px rgba(106, 90, 205, 0.4);
        background-color: #fff;
        outline: none;
    }

    input[type="submit"] {
        width: 100%;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: #fff;
        border: none;
        padding: 12px;
        border-radius: 8px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 600;
        letter-spacing: 0.5px;
        transition: all 0.3s ease;
    }

    input[type="submit"]:hover {
        background: linear-gradient(135deg, #5a67d8 0%, #6b46c1 100%);
        transform: translateY(-2px);
        box-shadow: 0 4px 10px rgba(118, 75, 162, 0.3);
    }

    .error {
        color: #e74c3c;
        font-size: 13px;
        margin-top: -12px;
        margin-bottom: 10px;
        display: block;
        text-align: left;
        font-weight: 500;
    }

    /* Responsive Design */
    @media (max-width: 480px) {
        .register-container {
            width: 90%;
            padding: 30px 25px;
        }

        h2 {
            font-size: 22px;
        }
    }
</style>
</head>
<body>

<div class="register-container">
    <h2>Register</h2>

    <form:form action="register" method="post" modelAttribute="register">
        <label for="name">Full Name</label>
        <form:input path="name" id="name" placeholder="Enter your full name"/>
        <form:errors path="name" cssClass="error"/>

        <label for="phoneNo">Phone Number</label>
        <form:input path="phoneNo" id="phoneNo" placeholder="Enter your phone number"/>
        <form:errors path="phoneNo" cssClass="error"/>

        <label for="email">Email</label>
        <form:input path="email" id="email" placeholder="Enter your email" type="email"/>
        <form:errors path="email" cssClass="error"/>

        <label for="password">Password</label>
        <form:password path="password" id="password" placeholder="Enter your password"/>
        <form:errors path="password" cssClass="error"/>

        <input type="submit" value="Register"/>
    </form:form>
</div>

</body>
</html>
