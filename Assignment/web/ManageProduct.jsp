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
                                <i class="fas fa-table me-1"></i>
                                List of products
                                <div class="d-flex my-2">
                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#add-product">
                                        <i class="bi bi-plus-circle-fill"></i> Add New
                                    </button>
                                    <!-- Modal -->
                                    <div class="modal fade" id="add-product" tabindex="-1" aria-labelledby="add-product" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="add-account"> Create Product</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="add-product" method="post">
                                                        <div class="row">
                                                            <div class="mb-3">
                                                                <label class="form-label">Name</label>
                                                                <input type="text" class="form-control" name="name">
                                                            </div>
                                                            <div class="mb-3">
                                                                <label class="form-label">Quantity</label>
                                                                <input type="number" class="form-control" name="quantity">
                                                            </div>
                                                            <div class="mb-3">
                                                                <label class="form-label">Price</label>
                                                                <input type="number" step="any" class="form-control" name="price">
                                                            </div>
                                                            <div class="mb-3">
                                                                <label class="form-label">Description</label>
                                                                <textarea type="text" class="form-control" name="description"></textarea>
                                                            </div>
                                                            <label class="form-label">Image</label>
                                                            <div class="input-group mb-3">
                                                                <span class="input-group-text" id="basic-addon3">https://</span>
                                                                <input type="text" name="image_url" class="form-control" id="basic-url" aria-describedby="basic-addon3" value="${product.image_url}">
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="category" class="form-label">Category</label>
                                                                <select id="category" class="form-select" name="categoryIdChoose">
                                                                    <c:forEach items="${listCategory}" var="c">
                                                                        <option value="${c.id}">${c.name}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                                </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>
                                            <th>Image</th>
                                            <th>Quantity</th>
                                            <th>Price</th>
                                            <th>Description</th>
                                            <th>Category</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listProduct}" var="p">
                                            <tr>
                                                <td>${p.id}</td>
                                                <td>${p.name}</td>
                                                <td><a href="detail?productId=${p.id}"><img src="${p.image_url}" alt="" width="80"/></a></td>
                                                <td>${p.quantity}</td>
                                                <td>${p.price}</td>
                                                <td>${p.description}</td>
                                                <td>${p.category}</td>
                                                <td>
                                                    <div class="d-flex my-4">
                                                        <a href="update-product?productId=${p.id}" class="btn btn-primary flex-shrink-0 me-2"><i class="bi bi-pencil-fill"></i> Edit</a>
                                                        <a href="#" onclick="showMessDel(${p.id})" class="btn btn-danger flex-shrink-0 me-4"><i class="bi bi-trash-fill"></i> Remove</a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <script>
                    function showMessDel(id) {
                        var option = confirm('Are you sure to delete?')
                        if (option === true) {
                            window.location.href = 'delete-product?productId=' + id;
                        }
                    }
                </script>
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

