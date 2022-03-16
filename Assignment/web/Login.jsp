<%-- 
    Document   : Login
    Created on : Mar 16, 2022, 11:38:35 AM
    Author     : MyPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Login | DSoftware</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/icon-36x36.png" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <div class="container p-5">
            <div class="d-flex justify-content-center">
                <form action="login" method="post" class="bg-light" style="border: 1px solid #ccc; border-radius: 5px; padding: 3rem">
                    <h1 class="h3 mb-2 font-weight-normal text-center">Sign-In</h1>

                    <h5 class="sr-only">Username</h5>
                    <input type="text" class="form-control mb-2" placeholder="Enter Username" required name="username">
                    <h5 class="sr-only">Password</h5>
                    <input type="password" class="form-control mb-2" placeholder="Enter Password" required name="password">
                    <div class="checkbox mb-3">
                        <label>
                            <input type="checkbox" name="remember"> Remember me
                        </label>
                    </div>
                    <h5 class="text-dangger">${notify}</h5>
                    <div class="col-md-12 text-center">
                        <button class="btn btn-primary btn-block px-5 w-100" type="submit">Login</button>
                    </div>
                    <div class="text-center pt-2 px-2">
                        Do not have an account? <a href="register">Register now</a>
                    </div>
                    <div class="text-center pt-2">
                        <a href="home">Back to shop</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>

