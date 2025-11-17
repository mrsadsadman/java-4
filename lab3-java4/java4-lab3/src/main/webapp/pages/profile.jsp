<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<style type="text/css">
body {
    background-color: #343a40;
    color: #f8f9fa;
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}

.container {
    max-width: 900px;
    margin: 50px auto;
    padding: 30px;
    background-color: #495057; /* nền container */
    border-radius: 8px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.3);
}

h2, h3, h4 {
    color: #f8f9fa;
    text-align: center;
}

.profile-card {
    background-color: #424242;
    border-radius: 12px;
    border: 1px solid #616161;
    padding: 20px;
    color: #f8f9fa;
}

.info-label {
    font-weight: 600;
    color: #e0e0e0;
}

.alert {
    padding: 15px;
    border-radius: 5px;
    margin-bottom: 20px;
    text-align: center;
}

.alert-danger {
    background-color: #c62828;
    color: #f8f9fa;
}

table.table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

table.table th, table.table td {
    padding: 12px;
    text-align: center;
    border: 1px solid #616161;
}

table.table-dark thead {
    background-color: #6c757d;
    color: #f8f9fa;
}

table.table-striped tbody tr:nth-of-type(odd) {
    background-color: #3e444a;
}

table.table-hover tbody tr:hover {
    background-color: #5a6268;
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}

.text-center {
    text-align: center;
}

.shadow-sm {
    box-shadow: 0 2px 8px rgba(0,0,0,0.15);
}
</style>


</head>
<body>

<div class="container mt-4">

    <h2 class="mb-4">User Profile</h2>

    <!-- If user NOT FOUND -->
    <c:if test="${empty user}">
        <div class="alert alert-danger text-center">
            User not found!
        </div>
    </c:if>

    <!-- If user EXISTS -->
    <c:if test="${not empty user}">
        <div class="card profile-card shadow-sm mx-auto p-4" style="max-width: 450px;">
            <h4 class="text-center mb-3">${user.fullname}</h4>

            <p><span class="info-label">User ID:</span> ${user.id}</p>
            <p><span class="info-label">Email:</span> ${user.email}</p>
            <p><span class="info-label">Role:</span>
                <c:out value="${user.admin ? 'Admin' : 'User'}"/>
            </p>
        </div>

        <!-- Favorite Videos -->
        <h3 class="mt-4 text-center">Favorite Videos</h3>

        <table class="table table-dark table-striped table-hover mt-3 shadow-sm">
            <thead class="text-center">
                <tr>
                    <th>ID</th>
                    <th>Video Title</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="fav" items="${reports}">
                    <tr class="text-center">
                        <td>${fav.id}</td>
                        <td>${fav.video.title}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </c:if>
    <p style="text-align: center; margin-top: 20px;">
           <a href="javascript:history.back()" class="btn btn-secondary">Quay lại</a>
        </p>

</div>

</body>
</html>
