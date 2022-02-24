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
        <title>Phần mềm bản quyền</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="header-top">
        </div>
        <div class="header">
            <div class="header-logo">
                <a href="home">DSoftware</a>
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
            <h1>Phần mềm bản quyền chất lượng cao</h1>
            <h3>Uy tín tạo nên thương hiệu với hơn 10 năm cung cấp các phần mềm bản quyền chính hãng</h3>
        </div>


        <div class="content">

            <div class="catagories">
                <div class="card bg-light mb-3">
                    <div class="title-catagories">&nbsp <i class="fa fa-list"></i> Danh mục sản phẩm</div>
                    <ul >
                        <c:forEach items="${listCC}" var="c">
                            <li style="background-color: white; color: black"><a class="${tag == c.cid ? "active" : ""}"  href="catagory?cid=${c.cid}">${c.cname}</a></li>
                            </c:forEach>

                    </ul>
                </div>
            </div>

            <div class="product">
                <c:forEach items="${listP}" var="p">
                    <div class="item">
                        <a href="#" title="View Product"><img src="${p.image}" alt=""/></a>
                        <div class="text-overflow">
                            <a href="#" title="View Product">${p.title}</a>
                            <p> <del>${p.price}$</del> &nbsp;${p.price *(1-0.15)} $ </p>
                        </div>
                        <div>
                            <a href="#" class="btn btn-success btn-block">Add to cart</a>
                        </div>
                    </div>
                </c:forEach>



            </div>
        </div>

        <div class="footer">
            <div class="footer-content">
                <h5>GIỚI THIỆU</h5>
                <p>Game bản quyền là gì?</p>
                <p>Giới thiệu DSortware</p>
                <p>Điều khoản dịch vụ</p>
                <p>Chính sách bảo mật</p>
            </div>
            <div class="footer-content">
                <h5>TÀI KHOẢN</h5>
                <p>Đăng nhập</p>
                <p>Đăng ký</p>
            </div>
            <div class="footer-content">
                <h5>LIÊN HỆ</h5>
                <p>Hotline chăm sóc khách hàng: 1900 633 305 và 096 4567 247</p>
                <p>(Các ngày trong tuần từ 8h đến 24h)</p>
                <p>Email liên hệ: hotro@dsortware.vn</p>
                <p>Địa chỉ giao dịch trực tiếp</p>
            </div>
        </div>
    </body>
</html>
