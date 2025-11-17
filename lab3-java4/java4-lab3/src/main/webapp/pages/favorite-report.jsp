<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Favorite Report</title>

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

.title {
    text-align: center;
    font-weight: 700;
    color: #f8f9fa;
}

.alert {
    padding: 15px;
    border-radius: 5px;
    margin-bottom: 20px;
}

.alert-warning {
    background-color: #ffc107;
    color: #212529;
    text-align: center;
}

.report-table table {
    width: 100%;
    border-collapse: collapse;
}

.report-table th, .report-table td {
    padding: 12px;
    text-align: center;
}

.report-table thead {
    background-color: #6c757d;
    color: #f8f9fa;
}

.report-table tbody tr {
    background-color: #424242;
    border-bottom: 1px solid #616161;
    transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

.report-table tbody tr:hover {
    background-color: #5a6268;
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}

.report-table td {
    color: black;
}

.table-responsive {
    overflow-x: auto;
    border-radius: 8px;
}

.table-striped tbody tr:nth-of-type(odd) {
    background-color: #3e444a;
}

.table-bordered th, .table-bordered td {
    border: 1px solid #616161;
}
</style>



</head>
<body>

<div class="container mt-4">

    <h2 class="text-center mb-4 title">Favorite Report</h2>

    <!-- Không có report -->
    <c:if test="${empty reports}">
        <div class="alert alert-warning text-center">
            No favorites found!
        </div>
    </c:if>

    <!-- Có report -->
    <c:if test="${not empty reports}">
        <div class="table-responsive report-table shadow-sm ">
            <table class="table table-striped table-bordered mb-0">
                <thead class="table-dark text-center">
                    <tr>
                        <th>ID</th>
                        <th>Video </th>
                        <th>User ID</th>
                        <th>Like Date</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="fav" items="${reports}">
                        <tr>
                            <td class="text-center">${fav.id}</td>
                            <td class="text-center">${fav.video.title}</td>
                            <td class="text-center">${fav.user.id}</td>
                            <td class="text-center">${fav.likeDate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>
   <p style="text-align: center; margin-top: 20px;">
           <a href="javascript:history.back()" class="btn btn-secondary">Quay lại</a>
        </p>

</div>

</body>
</html>

