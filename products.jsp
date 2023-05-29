
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
        <%@include file="header.jsp"%>
          <% 
              HttpSession s;
              s=request.getSession(false);
            String username = "";
            if (s != null) {
                username = (String) s.getAttribute("name");
            }
         %>
        <div class="container-fluid products-header d-flex justify-content-between align-items-center">
            <div class="product-login">
                <%
                    if(username == null || username.isEmpty())
                    {
                    %>
                    <a href="login.jsp">Login</a>
                    <%
                    }
                    else
                        {
                        %>
                        <a href="logout">Logout</a>
                        <%
                        }
                %>
                  <%
                    if(username == null || username.isEmpty())
                    {
                    %>
                    <a href="login.jsp">My Orders</a>
                    <%
                    }
                    else
                        {
                        %>
                        <a href="order.jsp">My Orders</a>
                        <%
                        }
                %>
              
            </div>
            <div class="product d-flex">
                <%
                    if(username == null || username.isEmpty())
                    {
                    %>
                     <a href="login.jsp" class="shop"><i class="fas fa-shopping-cart ms-2 fs-3 icon" style="color:#fff;
                                       hover{ color:#f195b2;}"></i></a>
                    <%
                    }
                    else
                        {
                        ResultSet rs1=null;
                        int count = 0;
                        try{
                        Connection con = conn.getcon();
                        String query;
                        query = "Select COUNT(*) AS cartCount from [cart] where Username='" + username + "'";
                        Statement statement = con.createStatement();
                        rs1 = statement.executeQuery(query);
                        if (rs1.next()) {
                         count = rs1.getInt("cartCount");
                         }
                        %>
                         <a href="cart.jsp" class="shop"><i class="fas fa-shopping-cart ms-2 fs-3 icon" style="color:#fff;
                              "></i><span><sup style="color:#fff" class="fs-3"><%= count %></sup></span></a>
                        <%
                               
                          }
                          catch(Exception e)
                          {
                           out.print(e);
                          }
                        }
                %>
           
            </div>
        </div>
        <div class="product-image">
                <img src="./assets/image/fresh.jpg" alt="..." class="d-block w-100">
        </div>
         <div class="container-fluid p-0 admin-header">
                     <div class="bg-white">
                         <%
                             if(username == null || username.isEmpty())
                             {
                             %>
                               <h3 class="p-3">Welcome Guest</h3>
                               <%
                              }
                            else{
                               %>

                        <h3 class="p-3">Welcome <%= username %></h3>
                                <%
                                }
                         %>
                         
                     </div>
                         <br>
           <form action="" method="post">
         <div class="cat">
         <ul class="d-flex justify-content-center align-items-center list-unstyled" style="gap:1.5rem">
            <li><input  type="submit" name="category" value="All Category" class="btn btn-outline-success"></li> 
            <li><input type="submit" name="category" value="Fruits and Veggies" class="btn btn-outline-success"></li>
            <li><input type="submit" name="category" value="Snacks and Drinks" class="btn btn-outline-success"></li>
            <li><input type="submit" name="category" value="Dairy and Frozen" class="btn btn-outline-success"></li>
            <li><input type="submit" name="category" value="Cleaning" class="btn btn-outline-success"></li>
            <li><input type="submit" name="category" value="Clothing" class="btn btn-outline-success"></li>
            <li><input type="submit" name="category" value="Home and Kitchen" class="btn btn-outline-success"></li>
          </ul>
              <input type="hidden" name="selectedCategory" id="selectedCategory">
         </div>
         </form>
             
                         
                         <div class="show-products d-flex justify-content-between" style="flex-wrap: wrap;
    gap: 2.5rem;">
                  
                      <%
                          
                        ResultSet rs=null;
                        String selectedCategory = request.getParameter("selectedCategory");

                        try{
                        Connection con = conn.getcon();
                        String query;
                        if(selectedCategory!=null && !selectedCategory.equals("All Category"))
                         {
                          PreparedStatement ps=con.prepareStatement("Select * From [add-product] Where category='"+ selectedCategory +"'");
                             rs = ps.executeQuery();
                     
                          }
                      else
                         {
                       PreparedStatement ps=con.prepareStatement("Select * From [add-product]");
                         rs = ps.executeQuery();
                       
                         }
                        int index=0;
                        while(rs.next()){
                        index++;
                          byte[] imageBytes = rs.getBytes(5);
                         String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                         
                      %>
  <div class="card " style="width: 18rem;background-image: url('./assets/image/bg.jpg');">
    
  <img src="data:image/jpeg;base64, <%= base64Image %>" class="card-img-top bg-white img-hover" alt="..." style="height:180px">
  <div class="card-body">
     <h5 class="card-title" style="display:none;"><%=rs.getString(1)%></h5>
    <h5 class="card-title"><%=rs.getString(2)%></h5>
    <h5 class="card-title">₹ <%=rs.getString(3)%></h5>
    <form action="cart" method="post">
    <select class="form-control" name="quantity" id=<%=index%>>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
    </select>
    <br>
<input type="hidden" name="productId" value="<%= rs.getString(1) %>">
<input type="hidden" name="productName" value="<%= rs.getString(2) %>">
<input type="hidden" name="productPrice" value="<%= rs.getString(3) %>">
<input type="hidden" name="productCategory" value="<%= rs.getString(4) %>">
<input type="hidden" name="productimg" value="<%= base64Image %>">

     <h5 class="card-title" style="display:none;"><%=rs.getString(4)%></h5>
    <%
                             if(username == null || username.isEmpty())
                             {
                             %>
                              <a href="login.jsp" class="btn btn-primary fs-5">Add to Cart</a>
                               <%
                              }
                            else{
                               %>

                        <button type="submit" class="btn btn-primary fs-5">Add to Cart</button>
                                <%
                                }
                         %>
    
  </div>
</div>


   </form>
                      <%
                          }
                          }
                          catch(Exception e)
                          {
                           out.print(e);
                          }
                      %>
                     </div>
                 </div>
        
        <%@include file="footer.jsp"%>
    </body>
<script>
    document.querySelectorAll('.cat input[type="submit"]').forEach(function(button) {
        button.addEventListener('click', function(event) {
            event.preventDefault();
            document.getElementById('selectedCategory').value = button.value;
            document.forms[0].submit();
        });
    });
    
      document.querySelector('.cat input[value="All Category"]').addEventListener('click', function(event) {
        event.preventDefault();
        document.getElementById('selectedCategory').value = 'All Category';
        document.forms[0].submit();
    });
</script>


</html>
