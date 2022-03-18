<%-- 
    Document   : DashboardNavbar
    Created on : Mar 18, 2022, 8:14:52 AM
    Author     : DPV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<!DOCTYPE html>
<html>
    <c:if test="${sessionScope.account != null}">
        <div class="ms-lg-2">
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i> ${sessionScope.account.username}</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="profiles">Profiles</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="manage">Manage</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="purchase">Purchased</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="logout">Logout <i class="bi bi-box-arrow-right ms-5"></i></a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </c:if>
</html>
