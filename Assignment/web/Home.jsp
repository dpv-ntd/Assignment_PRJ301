<%-- 
    Document   : Home
    Created on : Feb 19, 2022, 9:44:53 PM
    Author     : MyPC
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Products"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <div class="header-top">
        </div>
        <div class="header">
            <div class="header-logo">
                <a href="Home.jsp">Technology</a>
            </div>

            <div class="header-search">
                <form action="">
                    <input type="text" name="search" id="search" placeholder="Tìm kiếm sản phẩm">
                    <button type="submit"><i class="fa fa-search"></i></button>
                </form>
            </div>

            <div class="header-log-reg">
                <form action="">
                    <button><i class="fa fa-user"></i></button>
                    <a href="#">Đăng nhập</a>
                    <a>|</a>
                    <a href="#">Đăng ký</a>
                </form>
            </div>

            <div class="header-cart">
                <form action="">
                    <button><i class="fa fa-shopping-cart"></i></button>
                    <a href="#">Giỏ hàng</a>
                    <a>0</a>
                </form>
            </div>
        </div>
        <div class="header-bottom">
            <h1>Siêu thị giày chất lượng cao</h1>
            <h3>Uy tín tạo nên thương hiệu với hơn 10 năm cung cấp các sản phầm giày nhập từ Trung Quốc</h3>
        </div>


        <div class="content">

            <div class="catagories">
                <div class="card bg-light mb-3">
                    <div class="title-catagories">&nbsp <i class="fa fa-list"></i> Danh mục sản phẩm</div>
                    <ul >
                        <c:forEach items="${listCC}" var="c">
                            <li style="background-color: white; color: black"><a class="" href="#">${c.cname}</a></li>
                            </c:forEach>

                    </ul>
                </div>
            </div>

            <div class="product">
                <c:forEach items="${listP}" var="p">
                    <div class="item">
                        <a href="#" title="View Product"><img src="${p.image}" alt=""/></a>
                        <h4><a href="#" title="View Product">${p.title}</a></h4>
                        <p> <del>900$</del> &nbsp;750 $ </p>
                        <div>Buy Now</div>
                    </div>
                </c:forEach>



            </div>
        </div>

        <div class="footer">
            <div class="footer-content">
                <h5>About</h5>
                <p>Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.</p>
            </div>
            <div class="footer-content">
                <h5>About</h5>
                <p>Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.</p>
            </div>
            <div class="footer-content">
                <h5>About</h5>
                <p>Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.</p>
            </div>
            <div class="footer-content">
                <h5>About</h5>
                <p>Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.</p>
            </div>
        </div>
    </body>
</html>
