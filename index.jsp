
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="bootstrap5/cdn.jsp"%>
    </head>
    <body>
        <%@include file="header.jsp"%>
      <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
     <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="5" aria-label="Slide 6"></button>
 
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="./assets/image/dairy1.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="./assets/image/clothing.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="./assets/image/fruite.jpg" class="d-block w-100" alt="...">
    </div>
        <div class="carousel-item">
      <img src="./assets/image/snacks1.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="./assets/image/clean.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="./assets/image/home.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
       
      <section>
            <div class=" section1 my-5">
                <div class="section1-content">
                    <h2 class=""><b>Welcome to Freshpick</b></h2>
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
                    <a href="about.jsp" class="btn btn-warning fs-5">Know More About Us...</a>
                </div>
                <div class="section1-image">
                    <img src="./assets/image/grocery.jpg" alt="10" class=" w-md-100 ">
                </div>
            </div>
        </section>
        
      <section class="section2">
            <h2><b>Our Top Catergories</b></h2>
            <div class="all-category">
                <div class="section2-fruits">
                    <div class="section2-image">
                        <img src="./assets/image/grocery.jpg" alt="1">
                    </div>
                    <div class="section2-name">
                        <p>Fruits and Veggies</p>
                    </div>
                </div>
                <div class="section2-fruits">
                    <div class="section2-image">
                        <img src="./assets/image/snacks.jpg" alt="1">
                    </div>
                    <div class="section2-name">
                        <p>Snacks and drinks</p>
                    </div>
                </div>
                <div class="section2-fruits">
                    <div class="section2-image">
                        <img src="./assets/image/dairy.jpg" alt="1">
                    </div>
                    <div class="section2-name">
                        <p>Dairy and Frozen</p>
                    </div>
                </div>
                <div class="section2-fruits">
                    <div class="section2-image">
                        <img src="./assets/image/cleaning.jpg" alt="1">
                    </div>
                    <div class="section2-name">
                        <p>Cleaning</p>
                    </div>
                </div>
                <div class="section2-fruits">
                    <div class="section2-image">
                        <img src="./assets/image/clothing.webp" alt="1">
                    </div>
                    <div class="section2-name">
                        <p>Clothing</p>
                    </div>
                </div>
                <div class="section2-fruits">
                    <div class="section2-image">
                        <img src="./assets/image/kitchen.png" alt="1">
                    </div>
                    <div class="section2-name">
                        <p>Home and Kitchen</p>
                    </div>
                </div>
            </div>
        </section>
      
      <section class="section3">
            <div class="section3-image">
                <img src="./assets/image/fresh.jpg" alt="..." class="d-block w-100">
            </div>
        </section>
        
         <%@include file="footer.jsp"%>
    </body>
</html>
