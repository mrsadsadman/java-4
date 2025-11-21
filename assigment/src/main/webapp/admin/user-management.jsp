<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-ENjdO4Dr2bkBIFxQpeoA6d8G6fYd1ZjF2QIOZ3Qm4XvI1pY3S5R1p5i+Xf2weG9m" crossorigin="anonymous">
<h3 style="color: #2e8b57; font-weight: bold;">QUẢN LÝ NGƯỜI DÙNG</h3>
<hr>

<c:if test="${not empty message}">
    <div class="alert alert-info">${message}</div>
</c:if>

<div class="admin-tabs">
    <a href="#" class="active">User Edition</a>
    <a href="#">User List</a>
</div>

<div class="admin-form-container">
    <form id="userForm" method="post" class="admin-form">
        <div class="form-right" style="flex: 1;">
            <div class="form-group">
                <label>USERNAME?</label>
                <input type="text" name="id" class="form-control" 
                       value="${formUser != null ? formUser.id : ''}" 
                       ${formState == 'edit' ? 'readonly' : ''} 
                       placeholder="${formState == 'create' ? 'Enter new username...' : ''}">
            </div>
            <div class="form-group">
                <label>PASSWORD?</label>
                <input type="text" name="password" class="form-control" 
                       value="${formUser != null ? formUser.password : ''}">
            </div>
            <div class="form-group">
                <label>FULLNAME?</label>
                <input type="text" name="fullname" class="form-control" 
                       value="${formUser != null ? formUser.fullname : ''}">
            </div>
            <div class="form-group">
                <label>EMAIL ADDRESS?</label>
                <input type="email" name="email" class="form-control" 
                       value="${formUser != null ? formUser.email : ''}">
            </div>
            <div class="form-group-radio">
                <strong>Role:</strong>
                <input type="radio" id="admin" name="admin" value="true" 
                       ${formUser != null && formUser.admin ? 'checked' : ''}>
                <label for="admin">Admin</label>
                
                <input type="radio" id="user" name="admin" value="false" 
                       ${formUser != null && !formUser.admin ? 'checked' : ''}>
                <label for="user">User</label>
            </div>
        </div>
        
        <div class="form-actions">
            <button type="submit" name="action" value="create" class="btn-action btn-create " 
                    ${formState == 'edit' ? 'disabled' : ''}>
                Add User
            </button>
            <button type="submit" name="action" value="update" class="btn-action btn-update" 
                    ${formState == 'create' ? 'disabled' : ''}>
                Update
            </button>
            <button type="submit" name="action" value="delete" class="btn-action btn-delete" 
                    ${formState == 'create' ? 'disabled' : ''} 
                    onclick="return confirm('Bạn có chắc muốn xóa người dùng này?');">
                Delete
            </button>
            <a href="<c:url value='/admin/user-management'/>" 
               class="btn-action btn-reset">
                Reset
            </a>
        </div>
    </form>
</div>

<div class="admin-tabs" style="margin-top: 20px;">
    <a href="#">User Edition</a>
    <a href="#" class="active">User List</a>
</div>

<div class="admin-table-container">
    <table class="admin-table">
        <thead>
            <tr>
                <th>Username</th>
                <th>Password</th>
                <th>Fullname</th>
                <th>Email</th>
                <th>Role</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${userList}">
                <tr class="${user.id == formUser.id ? 'active-row' : ''}">
                    <td>${user.id}</td>
                    <td>${user.password}</td>
                    <td>${user.fullname}</td>
                    <td>${user.email}</td>
                    <td>${user.admin ? 'Admin' : 'User'}</td>
                    <td>
                        <a href="<c:url value='/admin/user-management?action=edit&id=${user.id}'/>" 
                           class="btn-edit">
                            Edit
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <div class="admin-pagination">
        <span>${totalUsers} users</span>
        <nav>
            <ul>
                <li><a href="<c:url value='/admin/user-management?page=1'/>">|&lt;</a></li>
                <li><a href="<c:url value='/admin/user-management?page=${currentPage - 1}'/>">&lt;&lt;</a></li>
                
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <li class="${i == currentPage ? 'active' : ''}">
                        <a href="<c:url value='/admin/user-management?page=${i}'/>">${i}</a>
                    </li>
                </c:forEach>
                
                <li><a href="<c:url value='/admin/user-management?page=${currentPage + 1}'/>">&gt;&gt;</a></li>
                <li><a href="<c:url value='/admin/user-management?page=${totalPages}'/>">&gt;|</a></li>
            </ul>
        </nav>
    </div>
</div>
