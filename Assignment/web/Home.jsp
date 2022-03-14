<%-- 
    Document   : Home
    Created on : Feb 19, 2022, 9:44:53 PM
    Author     : MyPC
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Products"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>DSortware - Homepage</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/icon-36x36.png" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
        <%@include file="Navigation.jsp"%>
        <!-- Header-->
        <header class="bg-primary py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Software Shop</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Genuine software copyright</p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row">

                    <div class="col-md-3 mb-5">
                        <div class="card border-dark mb-3">
                            <h5 class="card-header">LIST CATEGORY</h5>
                            <ul class="list-group">
                                <c:forEach items="${listCategory}" var="c">
                                    <a class="list-group-item list-group-item-action ${c.id == tag?"active":""}" href="category?id=${c.id}">${c.name}</a>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-9">
                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 justify-content-center">
                            <c:if test="${page <= 0 || page > totalPage || listProducts == null || listProducts.size()==0}}">
                                <h5>Not founds</h5>
                            </c:if>
                            <c:choose>
                                <c:when test="${page <= 0 || page > totalPage || listProducts == null || listProducts.size()==0}">
                                    <h5>Not founds</h5>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${listProducts}" var="p">
                                        <div class="col mb-5">
                                            <div class="card h-100">
                                                <!-- Product image-->
                                                <a href="detail?productId=${p.id}">
                                                    <img class="card-img-top" src="${p.image_url}" alt="..." />
                                                </a>
                                                <!-- Product details-->
                                                <div class="card-body p-4">
                                                    <div class="text-center">
                                                        <!-- Product name-->
                                                        <h5 class="fw-bolder">${p.name}</h5>
                                                        <!-- Product price-->
                                                        ${p.price}
                                                    </div>
                                                </div>
                                                <!-- Product actions-->
                                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>

                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>

                        </div>

                        <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                            <ul class="pagination">
                                <c:if test="${page >= 1 && page <= totalPage}">
                                    <li class="page-item ${page == 1 ? "disabled":""}"><a class="page-link" href="home?page=1">First</a></li>
                                        <c:if test="${page == 1}">
                                        <li class="page-item active"><a class="page-link" href="home?page=${page}">${page}</a></li>
                                        <li class="page-item"><a class="page-link" href="home?page=${page+1}">${page+1}</a></li>
                                        <li class="page-item"><a class="page-link" href="home?page=${page+2}">${page+2}</a></li>
                                        </c:if>
                                        <c:if test="${page > 1 && page < totalPage}">
                                        <li class="page-item"><a class="page-link" href="home?page=${page-1}">${page-1}</a></li>
                                        <li class="page-item active"><a class="page-link" href="home?page=${page}">${page}</a></li>
                                        <li class="page-item"><a class="page-link" href="home?page=${page+1}">${page+1}</a></li>
                                        </c:if>
                                        <c:if test="${page == totalPage}">
                                        <li class="page-item"><a class="page-link" href="home?page=${page-2}">${page-2}</a></li>
                                        <li class="page-item"><a class="page-link" href="home?page=${page-1}">${page-1}</a></li>
                                        <li class="page-item active"><a class="page-link" href="home?page=${page}">${page}</a></li>
                                        </c:if>
                                    <li class="page-item ${page == totalPage ? "disabled":""}"><a class="page-link" href="home?page=${totalPage}">Last</a></li>
                                    </c:if>
                            </ul>
                        </nav>

                    </div>
                </div>

            </div>
        </section>
        <!-- Footer-->
        <%@include file="Footer.jsp"%>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>

