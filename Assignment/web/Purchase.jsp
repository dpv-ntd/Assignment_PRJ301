<%-- 
    Document   : Cart
    Created on : Mar 15, 2022, 1:18:29 PM
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
        <title>Purchase | DSoftware</title>
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
        <!-- Cart section-->
        <c:choose>
            <c:when test="${purchase.size() == 0 || purchase == null}">
                <section class="py-5">
                    <div class="container" style="min-height: 470px">
                        <div class="mx-auto p-1 text-center">
                            <img src="assets/cart-empty.png" alt=""/>
                            <h5>Your purchased cart is empty</h5>                
                            <a href="home" class="btn btn-danger">SHOPPING NOW</a>
                        </div> 
                    </div>
                </section>
            </c:when>
            <c:otherwise>
                <section class="py-5">
                    <div class="container" style="min-height: 500px">
                        <h5>Products purchased</h5>
                        <table class="table table-bordered text-center">
                            <thead>
                                <tr>
                                    <th scope="col">Image</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <c:forEach items="${purchase}" var="p">
                                <tr>
                                    <td><a href="detail?productId=${p.productId}"><img src="${p.productImage}" width="80"/></a></td>
                                    <td>${p.productName}</td>
                                    <td>${p.productPrice}</td>
                                    <td><a href="add-to-cart?action=re-buy&productId=${p.productId}" class="btn btn-danger">Re-Buy</a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </section>

            </c:otherwise>
        </c:choose>
        <!-- Footer-->
        <%@include file="Footer.jsp"%>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
