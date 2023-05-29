<%-- 
    Document   : contact
    Created on : May 7, 2023, 2:55:23 PM
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
         <form action="addcontact" method="post">
        <div class="contact-image">
                <img src="./assets/image/fresh.jpg" alt="..." class="d-block w-100">
        </div>
        <div class="section1-contact">
             <h2><b>Contact Us</b></h2>
             <p>Do you have anything in your mind to let us know? 
                 Kindly don't delay to connect to us by means of our contact form.</p>
        </div>
        <div class="section2-contact d-flex justify-content-between align-items-center">
           
                <div class="contact-details d-flex justify-content-between align-items-center flex-column">
                <input type="text" class="form-control" placeholder="Your Name" name="txtname" required>
                <input type="text" class="form-control" placeholder="Your Email" name="txtemail" required>
                <textarea placeholder="Your Message..." class="form-control" cols="5" rows="3" name="txtmes" required></textarea>
                <input type="submit" value="Submit Now" class="btn btn-warning">
            </div>
            </form>
            <div class="contact-all d-flex justify-content-between flex-column">
                <div class="contact-address contact">
                 <h3>Address :-</h3>
                 <p>Gala No. 14 Dal Mill Industrial 
                Compound Opp. Apple Industrial Hub N. H. No. 
                8 Pelhar Vasai (E) Dist. Palghar 401208.</p>
                </div>
                <div class="contact-number contact">
                    <h3>Contact Number :-</h3>
                    <p>+919321815574 / +919702075305</p>
                </div>
                <div class="contact-opening contact">
                    <h3>Opening Hours :-</h3>
                    <p>8:00 AM - 10:00 PM</p>
                    <p>Monday – Sunday</p>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>
