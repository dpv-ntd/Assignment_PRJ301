<%-- 
    Document   : Detail
    Created on : Mar 14, 2022, 11:37:40 AM
    Author     : MyPC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>${products.getName()} | DSoftware</title>
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

        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${products.getImage_url()}" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">Product</div>
                        <h1 class="display-5 fw-bolder">${products.name}</h1>
                        <div class="fs-5 mb-5">
                            <span class="text-decoration-line-through">$${products.price*(1 + 0.1)}</span>
                            <span>$${products.price}</span>
                        </div>
                        <p class="lead">${products.description}</p>
                        <c:choose>
                            <c:when test="${products.quantity > 0}">
                                <div class="fs-5 mb-4">Available: ${products.quantity} products</div>
                            </c:when>
                            <c:otherwise>
                                <div class="fs-5 mb-4">This product is no longer available!</div>
                            </c:otherwise>
                        </c:choose>

                        <div class="d-flex">
                            <a href="add-to-cart?productId=${products.id}" class="btn btn-outline-dark flex-shrink-0 me-2" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                Add to cart
                            </a>
                            <a href="add-to-cart?action=buynow&productId=${products.id}" class="btn btn-outline-danger flex-shrink-0" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                Buy Now
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Related products</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

                    <c:forEach items="${relatedProducts}" var="r">
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Sale badge-->
                                <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                                <!-- Product image-->
                                <a href="detail?productId=${r.id}">
                                    <img class="card-img-top" src="${r.image_url}" alt="..." />
                                </a>
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder">${r.name}</h5>
                                        <!-- Product reviews-->
                                        <div class="d-flex justify-content-center small text-warning mb-2">
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                            <div class="bi-star-fill"></div>
                                        </div>
                                        <!-- Product price-->
                                        <span class="text-muted text-decoration-line-through">$${r.price}</span>
                                        $${r.price}
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="add-to-cart?productId=${r.id}">Add to cart</a></div>
                                </div>

                            </div>
                        </div>
                    </c:forEach>

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

