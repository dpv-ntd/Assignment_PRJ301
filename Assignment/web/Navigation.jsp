<%-- 
    Document   : Navigation
    Created on : Mar 14, 2022, 12:23:52 PM
    Author     : MyPC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<!DOCTYPE html>
<html>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="home">DSoftware</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="home">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <c:choose>
                            <c:when test="${sessionScope.urlPrev.equals('home')}"></c:when>
                            <c:otherwise>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Category</a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <c:forEach items="${sessionScope.listCategory}" var="c">
                                        <li><a class="dropdown-item ${c.id == tag?"active":""}" href="category?id=${c.id}">${c.name}</a></li>
                                        </c:forEach>
                                </ul>
                            </li>
                        </c:otherwise>
                    </c:choose> 
                </ul>
                <form class="d-flex mx-auto" action="search" method="get">
                    <input class="form-control me-2" type="search" name="keyword" placeholder="Search" aria-label="Search">
                    <button class="btn btn-light" type="submit">Search</button>
                </form>

                <div class="d-flex my-2">
                    <a class="btn btn-outline-light" href="cart?action=view-cart">    
                        <i class="bi-cart-fill me-1"></i>
                        Cart
                        <span class="badge bg-light text-black ms-1 rounded-pill">${sessionScope.carts.size()}</span>
                    </a>
                </div> 

                <c:choose>
                    <c:when test="${sessionScope.account != null}">
                        <div class="ms-lg-2">
                            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i> ${sessionScope.account.username}</a>
                                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                        <li><a class="dropdown-item" href="profiles">Profiles</a></li>
                                            <c:if test="${sessionScope.account.role.equals('Admin')}">
                                            <li><hr class="dropdown-divider" /></li>
                                            <li><a class="dropdown-item" href="manage">Manage</a></li>
                                            </c:if>
                                        <li><hr class="dropdown-divider" /></li>
                                        <li><a class="dropdown-item" href="purchase">Purchased</a></li>
                                        <li><hr class="dropdown-divider" /></li>
                                        <li><a class="dropdown-item" href="logout">Logout <i class="bi bi-box-arrow-right ms-5"></i></a></li>

                                    </ul>
                                </li>
                            </ul>
                        </div>

                    </c:when>
                    <c:otherwise>
                        <div>
                            <a href="login" class="btn btn-outline-light ms-lg-2">Login</a>
                        </div>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
    </nav>

</html>
