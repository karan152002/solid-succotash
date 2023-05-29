<%-- 
    Document   : about
    Created on : May 7, 2023, 2:54:33 PM
    Author     : satpu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <%@include file="bootstrap5/cdn.jsp"%>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="about-image">
                <img src="./assets/image/fresh.jpg" alt="..." class="d-block w-100">
            </div>
        <div class="section1-detail">
            <h2><b>About Us</b></h2>
            <p class="fs-5"> Freshpick is a grocery store operating in Mumbai, Bangalore, Pune, Delhi and 
                        Kolkata with deliveries to all cities across India. We offer a wide range of food 
                        products for all your everyday needs and even offer grocery home delivery as well as 
                        a grocery shop online for you to purchase from. Our online grocery store has fresh 
                        fruits and vegetables, fresh and frozen meats and seafood, a wide range of breads and 
                        other packaged bakery products as well as a range of fresh cheeses from around the 
                        world. We even have a range of every staple and international cuisine product to 
                        meet your needs along with organic products for fresh and packaged food items. 
                        With our offerings, we have the best online food shop & online grocery shopping 
                        platform available for all your grocery products as well as physical grocery stores 
                        in select cities.</p>
        </div>
        <div class="d-flex justify-content-between align-items-center about-img">
            <img src="./assets/image/img1.jpg"  alt="..">
            <img src="./assets/image/img2.jpg" alt="..">
            <img src="./assets/image/img3.jpg" alt="..">
        </div>
         
        <%@include file="footer.jsp"%>
    </body>
</html>
