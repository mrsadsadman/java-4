<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>Thống kê Chia sẻ</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
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
    text-align: center;
}

h2 {
    color: #f8f9fa;
    margin-bottom: 30px;
}

.report-table {	
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 30px;
    border-radius: 8px;
}

.report-table th, .report-table td {
    padding: 12px;
    border: 1px solid #616161;
    text-align: center;
}

.report-table thead th {
    background-color: #6c757d;
    color: #f8f9fa;
}

.report-table tbody tr {
    background-color: #424242;
    transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

.report-table tbody tr:hover {
    background-color: #5a6268;
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}

.report-table td {
    color: #f8f9fa;
}

.no-data {
    background-color: #424242;
    color: #dee2e6;
    padding: 15px;
    border-radius: 5px;
}

.btn-back {
    padding: 12px 25px;
    background-color: #ff6600;
    color: #fff;
    font-weight: bold;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.btn-back:hover {
    background-color: #e65c00;
}
</style>

</head>
<body>

    <div class="container">
        <h2>Thống kê thông tin chia sẻ</h2>
        
        <table class="report-table rounded">
            <thead>
                <tr>
                    <th>Tiêu đề video</th>
                    <th>Số lượt chia sẻ</th>
                    <th>Ngày chia sẻ đầu tiên</th>
                    <th>Ngày chia sẻ cuối cùng</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${reportList}">
                    <tr>
                        <td>${item.videoTitle}</td>
                        <td>${item.shareCount}</td>
                        <td><fmt:formatDate value="${item.firstDate}" pattern="dd/MM/yyyy" /></td>
                        <td><fmt:formatDate value="${item.lastDate}" pattern="dd/MM/yyyy" /></td>
                    </tr>
                </c:forEach>
                
                <c:if test="${empty reportList}">
                    <tr>
                        <td colspan="4" class="no-data">Chưa có video nào được chia sẻ.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
        
        <div style="text-align:center;">
            <button type="button" class="btn-back" onclick="history.back()">Quay về trang trước</button>
        </div>
    </div>

</body>
</html>
