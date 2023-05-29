<%-- 
    Document   : checkout
    Created on : May 28, 2023, 9:37:21 AM
    Author     : satpu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Base64"%>
<%@ page import="connection.dbo.conn"%>
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
              s = request.getSession(false);
            String username = "";
            if (s != null) {
                username = (String) s.getAttribute("name");
            }
         %>
         <div class="container-fluid p-0">
            <div class="heading-cart">
                <h3 class="p-3 m-0">CHECKOUT</h3>
            </div>
        </div>
         
            <div class="container-fluid p-0 d-flex justify-content-between ">
            <div class="outer" style="width:50%">
                        <div class="address d-flex flex-column p-3" >
                            <div class="My-cart">
                                <h3 class="mb-3">Customer Information</h3>
                            </div>
                            <form action="pay" method="post">
                            <input type="text" class="form-control text fs-5" value="<%=username%>" readonly name="name" required>
                            <div class="My-cart">
                                <h3 class="mb-3">Billing Address</h3>
                            </div>
                           
                            <input type="text" class="form-control fs-5 text" placeholder="Address *" name="address" required>
                               <input type="text" class="form-control fs-5 text" placeholder="Appartment, suite, etc *" name="apart" required>
                                 <input type="text" class="form-control fs-5 text" placeholder="City *" name="city" required>
                                   <input type="text" class="form-control fs-5 text" placeholder="State *" name="state" required>
                                  <input type="text" class="form-control fs-5 text" placeholder="Country *" name="country" required>
                                    <input type="text" class="form-control fs-5 text" placeholder="ZipCode *"  name="zip" required>
                                 <input type="submit" value="Proceed to Pay" class="btn btn-primary fs-5 text-center" name="pay" >

                                </div>
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
                  session.setAttribute("totals", total);
                }
            } catch (Exception e) {
                out.print(e);
            }
        %>
            <div class="container-fluid" style="width:50%;">
               <div class="My-cart">
                <h3 class="m-3">Order Summary</h3>
               </div>
                <hr>
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
         <p class="fs-5 float-end" name="total">₹ <%= total%></p>
    </div>
    
            </div>
            
        </div>
      </form>
    </body>
</html>
