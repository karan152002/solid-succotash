<%-- 
    Document   : cart
    Created on : May 27, 2023, 11:29:23 PM
    Author     : satpu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Base64"%>
<%@ page import="connection.dbo.conn" %>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <%@include file="bootstrap5/cdn.jsp"%>
    </head>
    <body>
         <% 
              HttpSession s;
              s=request.getSession(false);
            String username = "";
            if (s != null) {
                username = (String) s.getAttribute("name");
            }
         %>
       <div class="container-fluid p-0">
            <div class="heading-cart">
                <h3 class="p-3 m-0">Shopping Cart</h3>
            </div>
        </div>
        <div class="container-fluid p-0">
            <div class="My-cart">
                 <h3 class="p-3 m-0">My Cart</h3>
            </div>
        </div>
        
        <div class="container-fluid d-flex justify-content-between" style="padding-inline:1.5rem;">
             <div class="cart d-flex flex-column" style="width: 807px;">
            <%
                        ResultSet rs=null;
                        try{
                        Connection con = conn.getcon();
                        String query;
                        query = "Select * from [cart] where Username='"+ username +"'";
                        Statement statement = con.createStatement();
                        rs = statement.executeQuery(query);
                         if (!rs.isBeforeFirst()) {  // Check if the result set is empty
                %>
                        <div class="empty-cart d-flex justify-content-center align-items-center flex-column">
                            <img src="./assets/image/empty.png" alt="...">
                            <h2 class="p-3">Your cart is empty.</h2>
                        </div>
                <%
                        } else {
                         while(rs.next()){
                          byte[] imageBytes = rs.getBytes("image");
                         String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                         
                      %>
                   
    <div class="inner-cart d-flex border " style="height: 180px; margin-bottom:2rem">
        <div class="image bg-white">
            <img src="data:image/jpeg;base64, <%= base64Image %>" class="img-fluid rounded-start" alt="..." style="height: 180px;
                        width: 180px;">
        </div>
        <div class="contains p-5">
            <h5 style="display:none;"><%=rs.getString(1)%></h5>
                        <h5 style="display:none;"><%=rs.getString(2)%></h5>
                        <h5 >Product Name : <%=rs.getString(3)%></h5>
                         <h5>Price : ₹<%=rs.getString(4)%></h5>
                          <h5>Quantity : <%=rs.getString(6)%></h5>
                           <h5><a href="deletecart?pid=<%=rs.getInt(1)%>"><i class="fa fa-trash pe-3 fs-5"></i></a></h5> 
        </div>
    </div>

         <%
                          }
                          }
}
                          catch(Exception e)
                          {
                           out.print(e);
                          }
                      %>
                      </div> 
                        
                        <% 
            int total = 0;
            int total_row = 0;
            
            try {
                Connection con = conn.getcon();
                String query = "SELECT * FROM cart WHERE Username='" + username + "'";
                Statement statement = con.createStatement();
                ResultSet rs1 = statement.executeQuery(query);
                
                while (rs1.next()) {
                    total_row++;
                    int price = rs1.getInt(4);
                    int quantity = rs1.getInt(6);
                    total += price * quantity;
                }
            } catch (Exception e) {
                out.print(e);
            }
        %>
               <div class=" payment-details "style="width:350px">
        <div class="pay border bg-white  p-3">
            <h4 class=" m-0">Price Details</h4>
            <hr>          

            <div class="price d-flex justify-content-between p1">
                <p>Total Price(<%=total_row%> Items)</p>
                <p>₹ <%=total%></p>
            </div>
            <div class="delivery d-flex justify-content-between p1">
                <p>Delivery Charges</p>
                <p style="color:green;">FREE</p>
            </div>
            <hr>
            <div class="amount d-flex justify-content-between p1">
                <p><b>Amount Payable</b></p>
                <p>₹ <%=total%></p>
            </div>
        </div>
            <br>
             <a href="products.jsp" class="btn btn-primary fs-5">Continue Shopping</a>
             <a href="checkout.jsp" class="btn btn-warning float-end fs-5">Checkout</a>
            
      </div>
</div>
    </body>
</html>
