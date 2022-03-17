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
        <title>My Profile | DSoftware</title>
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

        <section class="py-5">
            <div class="container" style="min-height: 600px">
                <form action="profiles" method="post">
                    <div class="row">
                        <h3 class="text-center">My profile</h3>
                        <div class="d-flex justify-content-center">
                            <div class="col-md-6" style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem">
                                
                                <div class="mb-3">
                                    <label for="name" class="form-label">Username</label>
                                    <input type="text" class="form-control" name="Username" readonly value="${username}">
                                    <input hidden name="id" value="${id}">
                                </div>
                                <div class="mb-3">
                                    <label for="name" class="form-label">Name</label>
                                    <input type="text" class="form-control" name="name" value="${displayName}">
                                </div>
                                <div class="mb-3">
                                    <label for="name" class="form-label">Email</label>
                                    <input type="email" class="form-control" name="email" value="${email}">
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Phone</label>
                                    <input type="text" class="form-control" name="phone" value="${phone}">
                                </div>
                                <div class="mb-3">
                                    <label for="address" class="form-label">Address</label>
                                    <input type="text" class="form-control" name="address" value="${address}">
                                </div>
                                <div class="mb-3">
                                    <label for="address" class="form-label">Role</label>
                                    <input type="text" class="form-control" name="address" value="${role.equals('ADMIN')?"Manager":"Customer"}" readonly>
                                </div>
                            </div>

                        </div>
                        <div class="form-group btn-lg text-center py-3">
                            <button class="btn btn-primary btn-block w-50">Save</button>
                        </div>

                    </div>

                </form>
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
