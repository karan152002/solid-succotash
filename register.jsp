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
                <h3 class="p-3 m-0">Register</h3>
            </div>
        </div>
        <div class="login d-flex flex-column">
            <form action="register" method="post">
                <input type="text" id="txtuser" class="form-control fs-5" name="txtuser" placeholder="Enter the Username" required>
                <input type="password"  id="txtpass" class="form-control fs-5" name="txtpass" placeholder="Enter the Password" required>
                <input type="password" id="txtcon" class="form-control fs-5" name="txtcon" placeholder="Enter the Confirm Password" required>
                <input type="submit" value="Register Now" class="btn btn-warning">
                <a href="login.jsp" class="fs-5 none" style="text-decoration: none; color:#3e606b; float:right">Login</a>
            </form>
        </div>
    </body>
</html>
