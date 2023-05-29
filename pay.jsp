<%-- 
    Document   : pay.jsp
    Created on : May 28, 2023, 1:50:01 PM
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
            
             HttpSession s1;
              s1=request.getSession(false);
            int totals = 0;
            if (s1 != null) {
                totals = (int) s1.getAttribute("totals");
            }
         %>
         <div class="container-fluid p-0" >
            <div class="heading-pay" >
                <h3 class="p-3 m-0" >PAYMENT</h3>
            </div>
        </div>
          <div class="about-image">
                <img src="./assets/image/fresh.jpg" alt="..." class="d-block w-100">
            </div>
         <div class="container my-5 p-3 bg-white">
           <% 
        int counter = 1;
        ResultSet rs1 = null;
        try {
            Connection con = conn.getcon();
            String query = "SELECT * FROM cart WHERE Username='" + username + "'";
            Statement statement = con.createStatement();
            rs1 = statement.executeQuery(query);
                int total_pro = 0;
            while (rs1.next()) {
                int price = rs1.getInt(4);
                int quantity = rs1.getInt(6);
                 total_pro += price * quantity;
                  byte[] imageBytes = rs1.getBytes("image");
                  String base64Image = Base64.getEncoder().encodeToString(imageBytes);
    %>
    <p>
        <button class="btn btn-primary w-100 text-start fs-5" type="button" data-bs-toggle="collapse" data-bs-target="#collapse<%= counter %>" aria-expanded="false" aria-controls="collapse<%= counter %>">
            Product Id :  <%= rs1.getString(1) %>
        </button>
    </p>
    <div class="collapse" id="collapse<%= counter %>">
        <div class="card card-body">
           <table class="table table-bordered fetch">
                             <thead class="bg-dark">
                             <th>Image</th>
                             <th>Name</th>
                             <th>Price</th>
                             <th>Quantity</th>
                             </thead>
                             <tbody class="" style="background-color:aliceblue">
                                 <tr>
                          <td><img src="data:image/jpeg;base64, <%= base64Image %>" width="150px" height="110px"/></td>
                          
                          <td><%=rs1.getString(3)%></td>
                          <td><%=rs1.getString(4)%></td>
                          <td><%=rs1.getString(6)%></td>
                          </tr>
                             </tbody>
           </table>
        </div>
    </div>
    <% 
                counter++;
            }
        } catch (Exception e) {
            out.print(e);
        }
    %>
     <hr>
    <div class="d-flex justify-content-between">
        <p class="fs-5">Total Amount</p>
         <p class="fs-5 float-end" name="total" id="tot" value=<%= totals%>>₹ <%= totals%></p>
         <p class="fs-5 float-end" id="user" value=<%= username%> style="display:none;"></p>
    </div>
    <input type="submit" name="submit" value="Pay Now" id="sub" class="btn btn-success" onclick="pay();">
         </div>
    </body>
    
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
 <script>
          function pay(){
          var name= document.getElementById('user').value;
          var price = parseInt(document.getElementById('tot').innerText.replace('₹', ''));
          var options = {
            "key" : "rzp_test_oFhX5qHyUp78vU",
            "amount" : price * 100,
            "Currency" : "INR",
            "name" : name,
            "image" : "./assets/image/logo.png",
            "handler" : function(response)
            {
            window.location.href='paydelete';
            }

          };

          var rzpl=new Razorpay(options);
            rzpl.open();
        }
         </script>

</html>
