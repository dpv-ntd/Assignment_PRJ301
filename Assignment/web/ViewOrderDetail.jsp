<%-- 
    Document   : Manage
    Created on : Mar 17, 2022, 1:58:43 AM
    Author     : DPV
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Manage Product | DSoftware</title>
        <script src="js/scripts.js" type="text/javascript"></script>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="home">DSoftware</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            </form>
            <!-- Navbar-->
            <%@include file="DashboardNavbar.jsp" %>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="manage">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        Manage DSoftware
                    </div>
                </nav>
            </div>

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>

                        <%@include file="DashboardMainButton.jsp" %>

                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-bar me-1"></i>
                                Edit products
                            </div>
                            <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas>
                                <form action="view-order-detail" method="post">
                                    <div class="row">
                                        <div class="d-flex justify-content-center">
                                            <div class="col-md-6" style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem">

                                                <div class="mb-3">
                                                    <label class="form-label">Order ID</label>
                                                    <input type="text" class="form-control" name="id" readonly value="${order.id}">
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Username</label>
                                                    <input type="text" class="form-control" name="username" value="${order.username}" readonly>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">All Product</label>
                                                    <c:forEach items="${order.listProduct}" var="a">
                                                        <input type="text" class="form-control mb-1" name="customerName" value="${a.toString()}" readonly>
                                                    </c:forEach>

                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Total Price</label>
                                                    <input type="number" step="any" class="form-control" name="totalprice" value="${order.totalprice}" readonly>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Customer Name</label>
                                                    <input type="text" class="form-control" name="customerName" value="${order.customerName}" readonly>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Phone</label>
                                                    <input type="tel" class="form-control" name="phone" value="${order.phone}" readonly>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Email</label>
                                                    <input type="email"class="form-control" name="email" value="${order.email}" readonly>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Address</label>
                                                    <textarea class="form-control" name="address" readonly >${order.address}</textarea>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Note</label>
                                                    <textarea class="form-control" name="note" readonly>${order.note}</textarea>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Created Date</label>
                                                    <input type="date" class="form-control" name="dateCreated" value="${order.dateCreated}" readonly>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="form-group btn-lg text-center py-3">
                                            <a class="btn btn-primary me-2" href="manage">Return</a>
                                            <button class="btn btn-primary btn-block">Save</button>
                                        </div>

                                    </div>

                                </form>
                            </div>
                        </div>

                    </div>
                </main>

                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; DSoftware 2022</div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js" type="text/javascript"></script>

    </body>
</html>

