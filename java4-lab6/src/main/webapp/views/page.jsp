<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trang chủ hệ thống</title>
    <style>
        /* === 1. Reset & Global Styles === */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f4f7f6; /* Màu nền xám nhạt dịu mắt */
            color: #333;
        }

        /* === 2. Navigation Bar (Màu cam chủ đạo) === */
        .navbar {
            background: linear-gradient(to right, #ff9966, #ff5e62);
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            color: white;
        }

        .navbar-brand {
            font-size: 24px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .user-info {
            font-size: 16px;
        }
        
        .user-info span {
            font-weight: bold;
            margin-right: 15px;
        }

        .btn-logout {
            background-color: rgba(255, 255, 255, 0.2);
            color: white;
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 20px;
            font-size: 14px;
            transition: background 0.3s;
            border: 1px solid white;
        }

        .btn-logout:hover {
            background-color: white;
            color: #ff5e62;
        }

        /* === 3. Main Container === */
        .container {
            max-width: 900px;
            margin: 40px auto;
            padding: 0 20px;
        }

        /* === 4. Card Style (Khung nội dung) === */
        .card {
            background: white;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            text-align: center;
        }

        .card h1 {
            color: #d35400;
            margin-bottom: 10px;
        }

        .message-box {
            background-color: #fff3e0; /* Nền cam rất nhạt */
            color: #e67e22;
            padding: 15px;
            border-radius: 5px;
            margin: 20px 0;
            border-left: 5px solid #ff9966;
            text-align: left;
        }

        /* === 5. Quick Links Menu (Để test bài lab) === */
        .menu-title {
            margin-top: 30px;
            margin-bottom: 15px;
            color: #666;
            font-weight: 600;
            text-align: left;
            border-bottom: 1px solid #eee;
            padding-bottom: 5px;
        }

        .quick-links {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
        }

        .link-item {
            display: block;
            padding: 12px;
            background-color: #f9f9f9;
            color: #555;
            text-decoration: none;
            border-radius: 5px;
            border: 1px solid #ddd;
            transition: all 0.3s;
        }

        .link-item:hover {
            background-color: #ff9966;
            color: white;
            border-color: #ff9966;
            transform: translateY(-3px);
            box-shadow: 0 4px 8px rgba(255, 153, 102, 0.3);
        }
        
        .admin-tag {
            font-size: 11px;
            background: #e74c3c;
            color: white;
            padding: 2px 6px;
            border-radius: 4px;
            margin-left: 5px;
        }
    </style>
</head>
<body>

    <nav class="navbar">
        <div class="navbar-brand">Java 4 Lab 6</div>
        
        <div class="user-info">
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <span>Xin chào, ${sessionScope.user.id}</span>
                    <a href="${pageContext.request.contextPath}/login" class="btn-logout">Đăng xuất</a> 
                </c:when>
                <c:otherwise>
                    <span>Khách</span>
                    <a href="${pageContext.request.contextPath}/login" class="btn-logout">Đăng nhập</a>
                </c:otherwise>
            </c:choose>
        </div>
    </nav>

    <div class="container">
        <div class="card">
            <h1>Thông báo hệ thống</h1>
            
            <div class="message-box">
                <strong>Message:</strong> ${empty message ? 'Chưa có thông báo nào.' : message}
            </div>

            <h3 class="menu-title">Danh sách chức năng (Click để test Filter)</h3>
            <div class="quick-links">
                <a href="${pageContext.request.contextPath}/account/edit-profile" class="link-item">Sửa hồ sơ</a>
                <a href="${pageContext.request.contextPath}/account/change-password" class="link-item">Đổi mật khẩu</a>
                
                <a href="${pageContext.request.contextPath}/video/list" class="link-item">Xem Video</a>
                <a href="${pageContext.request.contextPath}/video/like/1" class="link-item">Like Video</a>
                
                <a href="${pageContext.request.contextPath}/admin/user" class="link-item">
                    Quản lý User <span class="admin-tag">Admin</span>
                </a>
                <a href="${pageContext.request.contextPath}/admin/video" class="link-item">
                    Quản lý Video <span class="admin-tag">Admin</span>
                </a>
            </div>
        </div>
    </div>

</body>
</html>