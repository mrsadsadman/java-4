<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập hệ thống</title>
    <style>
        /* Reset CSS cơ bản */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Background toàn màn hình với gradient cam */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #ff9966 0%, #ff5e62 100%);
        }

        /* Thẻ chứa form đăng nhập (Card) */
        .login-container {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        /* Tiêu đề */
        .login-container h2 {
            margin-bottom: 20px;
            color: #d35400; /* Màu cam đậm */
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Khu vực hiển thị thông báo lỗi/thành công */
        .message-box {
            margin-bottom: 20px;
            font-size: 14px;
            min-height: 20px;
        }
        
        .message-box i {
            color: #e74c3c; /* Màu đỏ cho lỗi */
            font-style: normal;
            font-weight: bold;
        }

        /* Style cho các ô input */
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 600;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
            outline: none;
        }

        /* Hiệu ứng khi click vào ô input */
        .form-group input:focus {
            border-color: #ff9966;
            box-shadow: 0 0 5px rgba(255, 153, 102, 0.5);
        }

        /* Nút đăng nhập màu cam */
        .btn-login {
            width: 100%;
            padding: 12px;
            background: linear-gradient(to right, #ff9966, #ff5e62);
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        /* Hiệu ứng hover nút đăng nhập */
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 94, 98, 0.4);
        }

        .btn-login:active {
            transform: translateY(0);
        }

        /* Đường kẻ ngang trang trí */
        hr {
            border: 0;
            height: 1px;
            background: #eee;
            margin: 20px 0;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2>Đăng Nhập</h2>
        
        <div class="message-box">
            <c:if test="${not empty message}">
                <i>${message}</i>
            </c:if>
        </div>

        <c:url var="url" value="/login" />
        
        <form action="${url}" method="post">
            <div class="form-group">
                <label for="username">Tên đăng nhập</label>
                <input type="text" id="username" name="username" placeholder="Nhập username..." required>
            </div>
            
            <div class="form-group">
                <label for="password">Mật khẩu</label>
                <input type="password" id="password" name="password" placeholder="Nhập mật khẩu..." required>
            </div>
            
            <hr>
            
            <button type="submit" class="btn-login">LOGIN</button>
        </form>
    </div>

</body>
</html>