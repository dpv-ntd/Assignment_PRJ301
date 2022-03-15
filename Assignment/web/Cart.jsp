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
        <title>Cart | DSoftware</title>
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
            <c:when test="${sessionScope.carts.size() == 0 || sessionScope.carts == null}">
                <section class="py-5">
                    <div class="container" style="min-height: 350px">
                        <div class="mx-auto p-1 text-center">
                            <img src="assets/cart-empty.png" alt=""/>
                            <h5>Your shopping cart is empty</h5>                
                            <a href="home" class="btn btn-danger">BUY NOW</a>
                        </div> 
                    </div>
                </section>
            </c:when>
            <c:otherwise>
                <section class="py-5">
                    <div class="container" style="min-height: 500px">
                        <h5>Your cart</h5>
                        <table class="table table-bordered text-center">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Total</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <c:forEach items="${sessionScope.carts}" var="c">
                                <form action="update-cart">
                                    <tr>
                                        <td>${c.key}</td>
                                        <td><img src="${c.value.products.image_url}" width="80"/></td>
                                        <td>${c.value.products.name}</td>
                                        <td>${c.value.products.price}</td>
                                        <td><input onchange="this.form.submit()" type="number" name="quantity" value="${c.value.quantity}"/></td>
                                    <input type="hidden" name="productId" value="${c.value.products.id}">
                                    <td>${c.value.products.price*c.value.quantity}</td>
                                    <td><a href="cart?action=delete-cart&productId=${c.value.products.id}" class="btn btn-danger"><i class="bi bi-trash"></i> Delete</a></td>
                                    </tr>
                                </form>
                            </c:forEach>
                        </table>
<br>
                        <div class="row">
                            <div class="col-md-6 ">
                                <a class="btn btn-outline-primary btn-sm btn-block" href="home">Continue Shopping</a>
                            </div>
                            <div class="col-md-6" >
                                <div class="row justify-content-end">
                                    <div class="col-md-7">
                                        <div class="row">
                                            <div class="col-md-12 text-end border-bottom mb-5">
                                                <h3 class="text-black">CART TOTALS</h3>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <span class="text-black">Subtotal</span>
                                            </div>
                                            <div class="col-md-6 text-end">
                                                <strong class="text-black">$${totalAmount}</strong>
                                            </div>
                                        </div>
                                        <div class="row mb-5">
                                            <div class="col-md-6">
                                                <span class="text-black">Total</span>
                                            </div>
                                            <div class="col-md-6 text-end">
                                                <strong class="text-black">$${totalAmount}</strong>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 text-center">
                                                <button class="btn btn-primary btn-lg text-uppercase " onclick="window.location = 'checkout'">Proceed To Checkout</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

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
