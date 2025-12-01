<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ - Hệ thống Quản lý</title>
    <style>
        /* --- Cấu hình chung --- */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5; /* Màu nền xám nhẹ dịu mắt */
            margin: 0;
            padding: 0;
            color: #333;
        }

        /* --- Thanh điều hướng (Navbar) --- */
        .navbar {
            background: linear-gradient(to right, #667eea, #764ba2); /* Đồng bộ màu với trang Login */
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between; /* Đẩy nội dung sang 2 bên */
            align-items: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .navbar-brand {
            font-size: 1.5em;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .navbar-right {
            display: flex;
            align-items: center;
            gap: 20px; /* Khoảng cách giữa các phần tử */
        }

        /* Bộ đếm lượt xem trên Navbar */
        .visitor-counter {
            background-color: rgba(255, 255, 255, 0.2);
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.9em;
            backdrop-filter: blur(5px);
            border: 1px solid rgba(255,255,255,0.3);
        }

        /* --- Phần nội dung chính (Container) --- */
        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .card {
            background: white;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            text-align: center;
        }

        .welcome-title {
            color: #4a4a4a;
            margin-bottom: 20px;
        }

        .user-highlight {
            color: #764ba2;
            font-weight: bold;
        }

        /* --- Nút bấm (Buttons) --- */
        .btn {
            display: inline-block;
            padding: 10px 25px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s ease;
            margin-top: 15px;
            border: none;
            cursor: pointer;
        }

        .btn-primary {
            background: #764ba2;
            color: white;
            box-shadow: 0 4px 6px rgba(118, 75, 162, 0.3);
        }

        .btn-primary:hover {
            background: #5b3a7d;
            transform: translateY(-2px);
        }

        .btn-outline {
            border: 2px solid #764ba2;
            color: #764ba2;
            background: transparent;
        }

        .btn-outline:hover {
            background: #764ba2;
            color: white;
        }

        /* --- Trạng thái thông báo --- */
        .status-box {
            margin: 20px 0;
            padding: 15px;
            border-radius: 8px;
            background-color: #e8f5e9;
            color: #2e7d32;
            border-left: 5px solid #2e7d32;
            text-align: left;
        }
        
        .status-box.warning {
            background-color: #fff3e0;
            color: #ef6c00;
            border-left: 5px solid #ef6c00;
        }

    </style>
</head>
<body>

    <nav class="navbar">
        <div class="navbar-brand">FPT Polytechnic</div>
        <div class="navbar-right">
            <div class="visitor-counter">
                <span>👁️ Khách truy cập: <strong>${applicationScope.visitors}</strong></span>
            </div>
            
            <c:if test="${not empty sessionScope.user}">
                <a href="${pageContext.request.contextPath}/login" style="color: white; text-decoration: none; font-size: 0.9em;">Đăng xuất</a>
            </c:if>
        </div>
    </nav>

    <div class="container">
        <div class="card">
            
            <c:if test="${not empty sessionScope.user}">
                <h1 class="welcome-title">Xin chào, <span class="user-highlight">${sessionScope.user.fullname}</span>!</h1>
                
                <div class="status-box">
                    <strong>Trạng thái:</strong> Bạn đã đăng nhập thành công vào hệ thống.
                    <br>
                    Email: ${sessionScope.user.email}
                    <br>
                    Quyền quản trị: ${sessionScope.user.admin ? 'Có' : 'Không'}
                </div>

                <p>Chào mừng bạn quay trở lại. Hãy chọn các chức năng trên thanh menu để tiếp tục làm việc.</p>
                <button class="btn btn-primary">Vào trang quản trị</button>
            </c:if>

            <c:if test="${empty sessionScope.user}">
                <h1 class="welcome-title">Chào mừng đến với Website</h1>
                
                <div class="status-box warning">
                    <strong>Thông báo:</strong> Bạn hiện đang xem trang với tư cách khách.
                </div>

                <p>Vui lòng đăng nhập để truy cập đầy đủ các tính năng của hệ thống.</p>
                
                <a href="login" class="btn btn-primary">Đăng nhập ngay</a>
            </c:if>

            <hr style="margin-top: 30px; border: 0; border-top: 1px solid #eee;">
            <p style="color: #999; font-size: 0.9em;">Lab 5 - Lập trình Java 4 - FPT Polytechnic</p>
        </div>
    </div>

</body>
</html>