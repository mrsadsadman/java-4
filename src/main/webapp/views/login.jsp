<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập hệ thống</title>
    <style>
        /* Cấu hình chung cho toàn trang */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        /* Thanh hiển thị số lượt truy cập (Bài 2) */
        .visitor-badge {
            position: fixed;
            top: 20px;
            right: 20px;
            background-color: rgba(255, 255, 255, 0.2);
            color: white;
            padding: 8px 15px;
            border-radius: 20px;
            font-size: 0.9em;
            backdrop-filter: blur(5px);
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        /* Khung chứa form đăng nhập (Card) */
        .login-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 15px 25px rgba(0,0,0,0.2);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 30px;
            color: #333;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-size: 24px;
        }

        /* Input styling */
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #666;
            font-size: 14px;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            box-sizing: border-box; /* Đảm bảo padding không làm vỡ khung */
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        .form-group input:focus {
            outline: none;
            border-color: #764ba2;
        }

        /* Button styling */
        .btn-login {
            width: 100%;
            padding: 12px;
            background: linear-gradient(to right, #667eea, #764ba2);
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
            margin-top: 10px;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(118, 75, 162, 0.4);
        }

        .btn-login:active {
            transform: translateY(0);
        }

        /* Thông báo lỗi */
        .alert-error {
            background-color: #ffebee;
            color: #c62828;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            font-size: 14px;
            display: none; /* Ẩn mặc định, hiện khi có nội dung */
        }
        
        /* Hiện alert nếu có nội dung */
        .alert-error:not(:empty) {
            display: block;
        }
    </style>
</head>
<body>

    <div class="visitor-badge">
        👁️ Lượt truy cập: <strong>${applicationScope.visitors}</strong>
    </div>

    <div class="login-container">
        <h2>Đăng Nhập</h2>

        <div class="alert-error">${message}</div>
        
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group">
                <label for="username">Tên đăng nhập</label>
                <input type="text" id="username" name="id" placeholder="Nhập ID (User ID)..." required>
            </div>

            <div class="form-group">
                <label for="password">Mật khẩu</label>
                <input type="password" id="password" name="password" placeholder="Nhập mật khẩu..." required>
            </div>

            <button type="submit" class="btn-login">ĐĂNG NHẬP</button>
        </form>
    </div>

</body>
</html>