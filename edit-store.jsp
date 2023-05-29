<%-- 
    Document   : add-product
    Created on : May 21, 2023, 9:30:02 AM
    Author     : satpu
--%>

<%@page import="connection.dbo.conn"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <%@include file="bootstrap5/cdn.jsp"%>
    </head>
    <body>
       
         <div class="container-fluid p-0 d-flex">
                 <%@include file="dashboard.jsp"%>
            
                 <div class="container-fluid p-0 admin-header" style="margin-left:17.8rem">
                     <div class="bg-white">
                         <h3 class="p-3">Edit Store Address</h3>
                     </div>
                     <div>
                         <div class="container-fluid p-0 allproducts">
                             <form action="editstore" method="post">
                                  <%
                                String id= request.getParameter("id");
                        ResultSet rs=null;
                        try{
                        Connection con = conn.getcon();
                        String query;
                        query = "Select * from [add-store] where id='"+id+"'";
                        Statement statement = con.createStatement();
                        rs = statement.executeQuery(query);
                        while(rs.next()){
                      %>
                                <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
                                 <table class="add-product d-flex flex-column border">
                                     <tr>
                                         <td>Store Name</td>
                                         <td><input type="text" placeholder="Enter the Store Name" name="txtstore" class="form-control inputs" required value="<%=rs.getString(2)%>"></td>
                                     </tr>
                                     <tr>
                                         <td>Store Address</td>
                                         <td><textarea placeholder="Add the Address..." class="form-control inputs" cols="5" rows="3" name="txtaddress" required><%=rs.getString(3)%></textarea></td>
                                     </tr>
                                     <tr>
                                         <td><input type="submit" value="Edit Store Address" class="btn btn-primary add" name="add"></td>
                                     </tr>
                                 </table>
                                       <%
                          }
                          }
                          catch(Exception e)
                          {
                           out.print(e);
                          }
                      %>
                             </form>
                         </div>
                     </div>
                 </div>
            </div>
        </div>
    </body>
</html>
