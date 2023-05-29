<%-- 
    Document   : login
    Created on : May 22, 2023, 11:27:58 PM
    Author     : satpu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <%@include file="bootstrap5/cdn.jsp"%>
    </head>
    <body style="background-image:url('./assets/image/login2.jpg');background-size:cover;background-repeat:no-repeat">
        <div class="container-fluid p-0">
            <div class="heading-login">
                <h3 class="p-3 m-0">Login</h3>
            </div>
        </div>
        <div class="login d-flex flex-column justify-content-between">
            <form action="login" method="post">
                <input type="text" class="form-control fs-5" name="txtuser" placeholder="Enter the Username">
                <input type="password" class="form-control fs-5" name="txtpass" placeholder="Enter the Password" autocomplete="off">
                <input type="submit" value="Login Now" class="btn btn-warning fs-5">
                <a href="register.jsp" class="fs-5 none" style="text-decoration: none; color:#3e606b; float:right">Register Now</a>
            </form>
        </div>
    </body>
</html>
