<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trang chủ - PolyOE</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- CSS riêng -->
  <link rel="stylesheet" href="/css/style.css">
<style type="text/css">
body {
    background-color: #343a40; /* nền tối */
    color: #f8f9fa; /* chữ trắng */
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}

.container {
    max-width: 800px;
    margin: 50px auto;
    padding: 30px;
    background-color: #495057; /* nền xám */
    border-radius: 8px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.3);
}

h1, p {
    text-align: center;
    color: #f8f9fa;
}

ul.list-group {
    padding: 0;
    margin-top: 20px;
    list-style: none;
}

.list-group-item {
    background-color: #6c757d; /* nền xám cho item */
    border: none;
    border-radius: 8px;
    margin-bottom: 12px;
    padding: 15px;
    transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

.list-group-item:hover {
    background-color: #5a6268;
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}

.list-group-item a {
    color: #f8f9fa;
    font-weight: bold;
    text-decoration: none;
    transition: color 0.3s ease;
}

.list-group-item a:hover {
    color: #f8f900; /* màu vàng khi hover */
}

.list-group-item small {
    font-size: 0.9rem;
    color: #dee2e6;
    display: block;
    margin-top: 5px;
}
</style>


    

</head>
<body>

    <div class="container">
        <h1 class="text-center mb-4">Bài Lab Java 4 - PolyOE</h1>
        <p class="text-center">Chọn một chức năng để xem:</p>

        <ul class="list-group">
            <li class="list-group-item">
                <a href="${pageContext.request.contextPath}/profile">
                    Bài 3: Video yêu thích của người dùng
                </a>
                <small class="d-block">(Hiển thị danh sách video mà một người dùng đã thích)</small>
            </li>
            <li class="list-group-item">
                <a href="${pageContext.request.contextPath}/favorite-report">
                    Bài 4: Thống kê video yêu thích
                </a>
                <small class="d-block">(Hiển thị danh sách video và số người dùng đã thích)</small>
            </li>
            <li class="list-group-item">
		        <a   href="<c:url value='/share-report' />">
		            Bài 1-Lab4: Thống kê Chia sẻ dùng JPQL
		        </a>
		        <small class="d-block">(Hiển thị tổng hợp số lượt chia sẻ, ngày đầu, ngày cuối)</small>
		    </li>

	        <li class="list-group-item">
	        <a   href="<c:url value='/login' />">
	            Bài 2-Lab4: Đăng nhập
	        </a>
	        <small class="d-block">(Đăng nhập bằng ID hoặc Email)</small>
	    	
        </ul>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
