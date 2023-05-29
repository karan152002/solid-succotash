<%-- 
    Document   : store
    Created on : May 7, 2023, 2:55:13 PM
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
        <%@include file="header.jsp"%>
        <%
                        ResultSet rs=null;
                        try{
                        Connection con = conn.getcon();
                        String query;
                        query = "Select * from [add-store]";
                        Statement statement = con.createStatement();
                        rs = statement.executeQuery(query);
                        while(rs.next()){
                      %>
           <div class="about-image">
                <img src="./assets/image/fresh.jpg" alt="..." class="d-block w-100">
            </div>
        <div class="store-head">
             <h2><b>Our Store Locations</b></h2>
        </div>
           <div class="store-details d-flex justify-content-between">
               <div class="alldetails d-flex justify-content-between flex-column">
               <i class="fas fa-home"></i>
               <div class="store-address">
                   <h4><%=rs.getString(2)%></h4>
                   <p><%=rs.getString(3)%></p>
               </div>
               </div>
                 <%
                          }
                          }
                          catch(Exception e)
                          {
                           out.print(e);
                          }
                      %>
           </div>
        <%@include file="footer.jsp"%>
    </body>
</html>
