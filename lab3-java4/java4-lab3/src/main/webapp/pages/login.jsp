<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    
<style type="text/css">
body {
    background-color: #343a40; /* Nền xám đậm */
    color: #f8f9fa; /* Chữ trắng */
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}

/* ================================
   LOGIN FORM
================================ */
.login-form {
    max-width: 500px;
    margin: 40px auto 0 auto;
    padding: 30px;
    background-color: #495057; /* Nền xám */
    border-radius: 8px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.2);
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
    color: #f8f9fa; /* chữ trắng sáng */
}

.form-group input {
    width: 100%;
    padding: 12px;
    border: 1px solid #6c757d; /* viền xám */
    border-radius: 5px;
    font-size: 1em;
    background-color: #6c757d; /* nền input xám */
    color: #f8f9fa; /* chữ trắng */
}

.form-group input::placeholder {
    color: #dee2e6;
}

.btn-login {
    width: 100%;
    padding: 15px;
    background-color: #ff6600; /* giữ màu cam FPT */
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 1.1em;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.btn-login:hover {
    background-color: #e65c00;
}

/* Box hiển thị lỗi */
.error-message {
    background-color: #721c24; /* đỏ tối */
    border: 1px solid #f5c6cb;
    color: #f8d7da;
    padding: 15px;
    margin-bottom: 20px;
    border-radius: 5px;
    text-align: center;
}

/* Link hoặc text nhỏ */
small {
    font-size: 0.9rem;
    color: #dee2e6;
    display: block;
    margin-top: 5px;
    text-align: center;
}
</style>

</head>
<body>

    <div class="container login-form">
        <h1 style="color: #ff6600; text-align: center;">Đăng nhập PolyOE</h1>
        
        <form action="<c:url value='/login'/>" method="POST">
            
            <c:if test="${not empty errorMessage}">
                <div class="error-message">${errorMessage}</div>
            </c:if>
            
            <div class="form-group">
                <label for="usernameOrEmail">Username (ID) hoặc Email:</label>
                <input type="text" id="usernameOrEmail" name="usernameOrEmail" required>
            </div>
            
            <div class="form-group">
                <label for="password">Mật khẩu:</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            <button type="submit" class="btn-login">Đăng nhập</button>
        </form>

        <p style="text-align: center; margin-top: 20px;">
           <a href=<c:url value='/' /> class="btn btn-secondary">Quay lại</a>
        </p>
    </div>

</body>
</html>