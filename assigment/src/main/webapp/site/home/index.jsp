<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<div class="row">
    <c:forEach var="video" items="${videos}">
        <div class="col-md-4 mb-4"> 
            <div class="card video-card">
                
                <a href="<c:url value='/detail?id=${video.id}'/>">
                    <div class="poster-box">
                        <c:choose>
                            <%-- Trường hợp 1: Poster là URL trực tiếp --%>
                            <c:when test="${fn:substring(video.poster, 0, 4) == 'http'}">
                                <img class="card-img-top" 
                                     src="${video.poster}" 
                                     alt="${video.title}">
                            </c:when>

                            <%-- Trường hợp 2: Poster là YouTube ID (11 ký tự) --%>
                            <c:when test="${fn:length(video.poster) == 11}">
                                <img class="card-img-top"
                                     src="https://img.youtube.com/vi/${video.poster}/maxresdefault.jpg"
                                     alt="${video.title}"
                                     onerror="this.src='https://placehold.co/600x400?text=No+Image'">
                            </c:when>
                            
                            <%-- Trường hợp 3: Ảnh upload trong /logos/ --%>
                            <c:otherwise>
                                <img class="card-img-top" 
                                     src="${pageContext.request.contextPath}/logos/${video.poster}" 
                                     alt="${video.title}"
                                     onerror="this.src='https://placehold.co/600x400?text=No+Image'"> 
                            </c:otherwise>
                        </c:choose>
                    </div>
                </a>
                
                <div class="card-body">
                    <h5 class="card-title">
                        <a href="<c:url value='/detail?id=${video.id}'/>">${video.title}</a>
                    </h5>
                    
                    <a href="<c:url value='/like?id=${video.id}'/>" class="btn-like btn">Like</a>
                    <a href="<c:url value='/share?id=${video.id}'/>" class="btn-share btn">Share</a>
                </div>
            </div> 
        </div> 
    </c:forEach>
</div>


<nav aria-label="Page navigation" class="d-flex justify-content-center mt-4">
    <ul class="pagination">
        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
            <a class="page-link" href="<c:url value='/index?page=1'/>">|&lt;</a>
        </li>
        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
            <a class="page-link" href="<c:url value='/index?page=${currentPage - 1}'/>">&lt;&lt;</a>
        </li>
        
        <c:forEach begin="1" end="${totalPages}" var="i">
            <li class="page-item ${currentPage == i ? 'active' : ''}">
                <a class="page-link" href="<c:url value='/index?page=${i}'/>">${i}</a>
            </li>
        </c:forEach>

        <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
            <a class="page-link" href="<c:url value='/index?page=${currentPage + 1}'/>">&gt;&gt;</a>
        </li>
        <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
            <a class="page-link" href="<c:url value='/index?page=${totalPages}'/>">&gt;|</a>
        </li>
    </ul>
</nav>