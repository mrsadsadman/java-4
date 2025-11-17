<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Đăng nhập thành công</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style type="text/css">
        body {
            background-color: #343a40;
            color: #f8f9fa;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        .container.login-form {
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            background-color: #495057;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.3);
            text-align: center;
        }

        h1 {
            font-weight: 700;
            margin-bottom: 20px;
        }

        h1.success {
            color: #28a745;
        }

        h1.error {
            color: #c62828;
        }

        h3 {
            margin-bottom: 30px;
            color: #f8f9fa;
        }

        p {
            color: #dee2e6;
            margin-bottom: 30px;
        }

        a.btn-logout,
        a.btn-home,
        a.btn-login {
            display: inline-block;
            margin: 5px 10px;
            padding: 12px 25px;
            background-color: #ff6600;
            color: #fff;
            font-weight: bold;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        a.btn-logout:hover,
        a.btn-home:hover,
        a.btn-login:hover {
            background-color: #e65c00;
        }

        /* Nút quay về trang trước nếu cần */
        button.btn-back {
            padding: 12px 25px;
            background-color: #6c757d;
            color: #fff;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }

        button.btn-back:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>

    <div class="container login-form">
    
        <c:if test="${not empty sessionScope.currentUser}">
            <h1 class="success">Thành công!</h1>
            <h3>Chào mừng, ${sessionScope.username}!</h3>
            <p>Bạn đã đăng nhập thành công.</p>
            
            <a href="<c:url value='/logout' />" class="btn-logout">Đăng xuất</a>
            <a href="<c:url value='/' />" class="btn-home">Về trang chủ</a>

            <!-- Nếu muốn thêm nút quay về trang trước -->
            <br/>
            <button class="btn-back" onclick="history.back()">Quay về trang trước</button>
        </c:if>

        <c:if test="${empty sessionScope.currentUser}">
            <h1 class="error">Lỗi</h1>
            <p>Bạn chưa đăng nhập. Vui lòng quay lại trang đăng nhập.</p>
            <a href="<c:url value='/login' />" class="btn-login">Đi đến Đăng nhập</a>
        </c:if>
        
    </div>

</body>
</html>
