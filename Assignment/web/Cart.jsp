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
        <section class="py-5">
            <div class="container" style="min-height: 500px">
                <table class="table">
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
                    <c:forEach items="${carts}" var="c">
                        <c:set var="stt" value="${stt+1}"></c:set>
                        <form action="update-quantity">
                            <tr>
                            <td>${stt}</td>
                            <td><img src="${c.value.products.image_url}" width="80"/></td>
                            <td>${c.value.products.name}</td>
                            <td>${c.value.products.price}</td>
                            <td><input onchange="this.form.submit()" type="number" name="quantity" value="${c.value.quantity}"/></td>
                            <td>${c.value.products.price*c.value.quantity}</td>
                            <td><a href="cart?action=delete-cart&productId=${c.value.products.id}" class="btn btn-danger"><i class="bi bi-trash"></i> Delete</a></td>
                            </tr>
                        </form>
                    </c:forEach>

                </table>
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
