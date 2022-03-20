<%-- 
    Document   : Checkout
    Created on : Mar 15, 2022, 10:02:46 PM
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
        <title>Checkout | DSoftware</title>
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
        <!-- Checkout section-->
        <c:choose>
            <c:when test="${sessionScope.carts.size() == 0 || sessionScope.carts == null}">
                <section class="py-5">
                    <div class="container" style="min-height: 350px">
                        <div class="mx-auto p-1 text-center">
                            <img src="assets/cart-empty.png" alt=""/>
                            <h5>Your shopping cart is empty</h5>                
                            <a href="home" class="btn btn-danger">SHOPPING NOW</a>
                        </div> 
                    </div>
                </section>
            </c:when>
            <c:otherwise>
                <section class="py-5">
                    <div class="container" style="min-height: 600px">
                        <h3>Billing Details</h3>
                        <form action="checkout" method="post">
                            <div class="row">
                                <div class="col-md-6" style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem">
                                    <div class="mb-3">
                                        <label for="name" class="form-label">Name</label>
                                        <input type="text" class="form-control" id="name" name="name"value="${account.displayName}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="phone" class="form-label">Phone</label>
                                        <input type="tel" class="form-control" id="phone" name="phone" value="${account.phone}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="phone" class="form-label">Email</label>
                                        <input type="email" class="form-control" id="phone" name="phone" value="${account.email}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="address" class="form-label">Address</label>
                                        <input type="text" class="form-control" id="address" name="address" value="${account.address}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="note" class="form-label">Note</label>
                                        <textarea class="form-control" id="note" name="note" rows="3"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-1"></div>
                                <div class="col-md-5 " style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem">
                                    <h4>Your Order</h4>
                                    <table class="table site-block-order-table mb-5">
                                        <thead>
                                        <th>Product</th>
                                        <th>Total</th>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${sessionScope.carts}" var="b">
                                                <tr>
                                                    <td>${b.value.products.name} <strong class="mx-2">x</strong> ${b.value.quantity}</td>
                                                    <td>$${b.value.products.price}</td>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td class="text-black font-weight-bold"><strong>Cart Subtotal</strong></td>
                                                <td class="text-black">$0</td>
                                            </tr>
                                            <tr>
                                                <td class="text-black font-weight-bold"><strong>Order Total</strong></td>
                                                <td class="text-black font-weight-bold"><strong>$${totalAmount}</strong></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="form-group btn-lg text-end py-3">
                                <button class="btn btn-primary  btn-block" type="submit">Place Order</button>
                            </div>
                        </form>
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
