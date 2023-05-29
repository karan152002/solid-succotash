<%-- 
    Document   : admin
    Created on : May 20, 2023, 11:06:10 AM
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
          <% 
            int total = 0;
            int store=0;
            int register=0;
            try {
                Connection con = conn.getcon();
                String query = "SELECT * FROM [add-product]";
                Statement statement = con.createStatement();
                ResultSet rs = statement.executeQuery(query);
                
                 String query1 = "SELECT * FROM [add-store]";
                Statement stat = con.createStatement();
                ResultSet rs1 = stat.executeQuery(query1);
                
                 String query2 = "SELECT * FROM [register]";
                Statement stat2 = con.createStatement();
                ResultSet rs2 = stat2.executeQuery(query2);
                
                while (rs.next()) {
                  total++;
                }
                while (rs1.next()) {
                  store++;
                }
                while (rs2.next()) {
                  register++;
                }
            } catch (Exception e) {
                out.print(e);
            }
        %>
        <div class="container-fluid p-0 d-flex m-0">
                 <%@include file="dashboard.jsp"%>
            
                 <div class="container-fluid p-0 admin-header" style="margin-left:17.8rem">
                     <div class="bg-white heading">
                         <h3 class="p-3 m-0">Dashboard</h3>
                     </div>
                       <div class="product-image">
                         <img src="./assets/image/fresh.jpg" alt="..." class="d-block w-100">
                       </div>
                     <h3 class="p-3 m-0">Total Summary</h3>
                     <div class="admin-summary d-flex justify-content-between">
                         <div class="total-products summary">
                             <p>Total Products</p>
                             <p><%=total%></p>
                         </div>
                          <div class="total-store summary">
                             <p>Total Stores</p>
                             <p><%=store%></p>
                         </div>
                          <div class="total-user summary">
                             <p>Total Registered User</p>
                             <p><%=register%></p>
                         </div>
                     </div>
                 </div>
            </div>
        </div>
        
    </body>
   
</html>
