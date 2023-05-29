<%-- 
    Document   : add-product
    Created on : May 21, 2023, 9:30:02 AM
    Author     : satpu
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connection.dbo.conn"%>
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
                         <h3 class="p-3">Edit Products</h3>
                     </div>
                     <div>
                         <div class="container-fluid p-0 allproducts">
                            <form action="edit" method="post" enctype="multipart/form-data">
                                <%
                                String id= request.getParameter("id");
                        ResultSet rs=null;
                        try{
                        Connection con = conn.getcon();
                        String query;
                        query = "Select * from [add-product] where id='"+id+"'";
                        Statement statement = con.createStatement();
                        rs = statement.executeQuery(query);
                        while(rs.next()){
                          byte[] imageBytes = rs.getBytes(5);
                         String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                      %>
                                <input type="hidden" name="id" value="<%= id%>">
                                 <table class="add-product d-flex flex-column border">
                                     <tr>
                                         <td>Product Name</td>
                                         <td><input type="text" id="productName" placeholder="Enter the Product Name" value="<%=rs.getString(2)%>" name="txtname" class="form-control inputs" required></td>
                                     </tr>
                                     <tr>
                                         <td>Product Price</td>
                                         <td><input type="text" id="productPrice" placeholder="Enter the Product Price" name="txtprice" value="<%=rs.getString(3)%>" class="form-control inputs" required></td>
                                     </tr>
                                     <tr>
                                         <td>Product Category</td>
                                    <td>
    <select name="txtcat" class="form-control inputs" required id="productCategory">
        <option value="">--Select Category--</option>
        <option value="Fruits and Veggies" <%= rs.getString(4).equals("Fruits and Veggies") ? "selected" : "" %>>Fruits and Veggies</option>
        <option value="Snacks and Drinks" <%= rs.getString(4).equals("Snacks and Drinks") ? "selected" : "" %>>Snacks and Drinks</option>
        <option value="Dairy and Frozen" <%= rs.getString(4).equals("Dairy and Frozen") ? "selected" : "" %>>Dairy and Frozen</option>
        <option value="Cleaning" <%= rs.getString(4).equals("Cleaning") ? "selected" : "" %>>Cleaning</option>
        <option value="Clothing" <%= rs.getString(4).equals("Clothing") ? "selected" : "" %>>Clothing</option>
        <option value="Home and Kitchen" <%= rs.getString(4).equals("Home and Kitchen") ? "selected" : "" %>>Home and Kitchen</option>
    </select>
</td>

                                     </tr>
                                     <tr>
                                         <td>Product Image</td>
                                         <td>
                                             <input type="file" name="file" id="customfile" class="form-control inputs"  value=<%=base64Image%>>
                                            
                                <label for="customfile"></label>
                                <input type="hidden" name="upload_Old" value="<%=base64Image%>">
                                     </td></tr>
                                     <tr>
                                         <td><input type="submit" value="Edit Product" class="btn btn-primary add" name="update"></td>
                                        
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
