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
        <title>Manage Account | DSoftware</title>
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
                                Accounts
                                <div class="d-flex my-2">
                                    <a href="add-account" class="btn btn-primary flex-shrink-0"><i class="bi bi-plus-circle-fill"></i> Add New</a>
                                </div>
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple" class="text-center">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Username</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Role</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${account}" var="ac">
                                            <tr>
                                                <td>${ac.id}</td>
                                                <td>${ac.username}</td>
                                                <td>${ac.displayName}</td>
                                                <td>${ac.email}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${ac.role.equals('Admin')}">
                                                            <i class="bi bi-person-check-fill"></i> ${ac.role}
                                                        </c:when>
                                                        <c:otherwise>
                                                            <i class="bi bi-people-fill"></i> ${ac.role}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${ac.block.equals('no')}">
                                                            <i class="bi bi-unlock-fill"></i> Unlocked
                                                        </c:when>
                                                        <c:otherwise>
                                                            <i class="bi bi-lock-fill"></i> Locked
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <a href="update-account?accountId=${ac.id}" class="btn btn-primary me-2"><i class="bi bi-eye-fill"></i> View</a>
                                                    <c:choose>
                                                        <c:when test="${ac.block.equals('no')}">
                                                            <a href="#" onclick="showMessDel(${ac.id}, 'yes')" class="btn btn-danger"><i class="bi bi-lock-fill"></i> Lock</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="#" onclick="showMessDel(${ac.id}, 'no')" class="btn btn-success"><i class="bi bi-unlock-fill"></i> Unlock</a>
                                                        </c:otherwise>
                                                    </c:choose>

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
                    function showMessDel(id, block) {
                        var option = confirm('Are you sure?')
                        if (option === true) {
                            window.location.href = 'banned-account?accountId=' + id + '&block=' + block;
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

