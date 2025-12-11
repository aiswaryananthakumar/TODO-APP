<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Task Manager</title>
<style>
/* 🌟 General Reset & Fonts */
body {
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
    margin: 0;
    padding: 0;
    color: #333;
}

/* 🌟 Container Styling */
.container {
    max-width: 1100px;
    margin: 60px auto;
    background: #ffffff;
    padding: 40px 50px;
    border-radius: 18px;
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
    animation: fadeIn 0.8s ease;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(10px); }
    to { opacity: 1; transform: translateY(0); }
}

/* 🌟 Heading Styles */
h2 {
    text-align: center;
    color: #1a1a2e;
    margin-bottom: 25px;
    font-size: 28px;
    letter-spacing: 0.5px;
}

h3 {
    color: #2f3640;
    margin-top: 40px;
    font-size: 22px;
    border-bottom: 3px solid #6c63ff;
    display: inline-block;
    padding-bottom: 5px;
}

/* 🌟 Form Styling */
form {
    display: flex;
    flex-wrap: wrap;
    gap: 20px 25px;
    align-items: flex-end;
    justify-content: space-between;
}

label {
    width: 100%;
    color: #555;
    font-weight: 600;
    margin-bottom: 6px;
}

form input[type="text"],
form input[type="date"],
form select {
    width: 100%;
    padding: 12px 14px;
    border: 1px solid #ccc;
    border-radius: 8px;
    font-size: 14px;
    background: #f9fafc;
    transition: all 0.3s ease;
}

form input[type="text"]:focus,
form input[type="date"]:focus {
    border-color: #6c63ff;
    box-shadow: 0 0 6px rgba(108, 99, 255, 0.4);
    outline: none;
}

/* 🌟 Button Styling */
input[type="submit"] {
    background: linear-gradient(135deg, #6c63ff, #5a67d8);
    color: #fff;
    border: none;
    padding: 12px 26px;
    border-radius: 8px;
    cursor: pointer;
    font-weight: 600;
    letter-spacing: 0.5px;
    transition: all 0.3s ease;
    box-shadow: 0 4px 10px rgba(108, 99, 255, 0.3);
}

input[type="submit"]:hover {
    background: linear-gradient(135deg, #5a67d8, #4c51bf);
    transform: translateY(-2px);
    box-shadow: 0 6px 12px rgba(108, 99, 255, 0.4);
}

/* 🌟 Table Styling */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 25px;
    font-size: 14px;
    border-radius: 8px;
    overflow: hidden;
}

th, td {
    padding: 14px 16px;
    text-align: left;
    border-bottom: 1px solid #e0e0e0;
}

th {
    background: linear-gradient(135deg, #6c63ff, #5a67d8);
    color: #fff;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

tr:nth-child(even) {
    background-color: #f9f9ff;
}

tr:hover {
    background-color: #eef1ff;
    transition: 0.2s ease;
}

/* 🌟 Action Links */
td a {
    color: #6c63ff;
    font-weight: 500;
    transition: color 0.3s ease;
}

td a:hover {
    color: #4c51bf;
    text-decoration: underline;
}

/* 🌟 No Task Message */
.no-task {
    text-align: center;
    color: #999;
    font-style: italic;
    padding: 15px 0;
    background: #f8f9fa;
    border-radius: 8px;
}

/* 🌟 Message Boxes */
.message-box {
    padding: 14px 20px;
    border-radius: 10px;
    font-weight: bold;
    margin-bottom: 25px;
    text-align: center;
    font-size: 15px;
    box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);
}

.message-success { background: #28a745; color: #fff; }
.message-deleted { background: #ffc107; color: #333; }
.message-failed { background: #dc3545; color: #fff; }

/* 🌟 Home Link */
.home-link {
    display: inline-block;
    margin-top: 35px;
    color: #6c63ff;
    font-weight: 600;
    font-size: 15px;
    transition: color 0.3s ease;
}

.home-link:hover {
    color: #4c51bf;
    text-decoration: underline;
}

/* 🌟 Responsive Layout */
@media (max-width: 768px) {
    .container {
        width: 90%;
        padding: 25px 20px;
    }

    form {
        flex-direction: column;
    }

    input[type="submit"] {
        width: 100%;
    }

    table {
        font-size: 13px;
    }

    th, td {
        padding: 10px;
    }
}
</style>
</head>
<body>
<div class="container">

<h2>Task Manager</h2>

<!-- Popup message -->
<c:if test="${not empty param.message}">
    <div class="message-box
        ${param.message == 'success' ? 'message-success' : 
          (param.message == 'deleted' ? 'message-deleted' : 'message-failed')}">
        <c:choose>
            <c:when test="${param.message == 'success'}">✅ Task saved successfully!</c:when>
            <c:when test="${param.message == 'deleted'}">🗑️ Task deleted successfully!</c:when>
            <c:otherwise>❌ Failed to save task!</c:otherwise>
        </c:choose>
    </div>
</c:if>

<!-- Task Form -->
<form:form action="addTask" method="post" modelAttribute="task">
    <form:hidden path="id"/>

    <label>Title:</label>
    <form:input path="title" /><br>

    <label>Description:</label>
    <form:input path="description" /><br>

    <label>Due Date:</label>
    <form:input path="dueDate" type="date" /><br>
    
    <label>Priority:</label>
    <form:select path="priority">
        <form:options items="${priorities}" />
    </form:select><br>

    <label>Status:</label>
    <form:select path="status">
        <form:options items="${status}" />
    </form:select><br>

    <c:choose>
        <c:when test="${task.id == 0}">
            <input type="submit" value="Add Task" />
        </c:when>
        <c:otherwise>
            <input type="submit" value="Update Task" />
        </c:otherwise>
    </c:choose>
</form:form>

<hr>

<h3>All Tasks</h3>

<c:choose>
    <c:when test="${taskList == null || taskList.size() == 0}">
        <p class="no-task">No tasks yet. Add your first task above!</p>
    </c:when>
    <c:otherwise>
        <table>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Due Date</th>
                <th>Priority</th>
                <th>Status</th>
                <th>Created Date</th>
                <th>Created Time</th>
                <th>Updated At</th>
                <th>Actions</th>
            </tr>

            <c:forEach var="t" items="${taskList}">
                <tr>
                    <td>${t.id}</td>
                    <td>${t.title}</td>
                    <td>${t.description}</td>
                    <td>${t.dueDate}</td>
                    <td>${t.priority}</td>
                    <td>${t.status}</td>
                    <td>${t.createDate}</td> <!-- ✅ Added Created Date -->
                    <td>${t.createTime}</td> <!-- ✅ Added Created Time -->
                    <td>${t.updatedAt}</td>  <!-- ✅ Added Updated At -->
                    <td>
                        <a href="task?id=${t.id}">Edit</a> |
                        <a href="deleteTask/${t.id}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:otherwise>
</c:choose>

<a class="home-link" href="home">← Back to Home</a>
</div>
</body>
</html>
