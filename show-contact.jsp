<%-- 
    Document   : view-product
    Created on : May 21, 2023, 9:30:40 AM
    Author     : satpu
--%>


<%@page import="java.util.Base64"%>
<%@ page import="connection.dbo.conn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="bootstrap5/cdn.jsp"%>
          <style>
        /* Custom CSS for DataTable */
        #fetch_wrapper {
            margin-top: 20px;
        }
        #fetch_length{
             display:inline-block;
              
            margin:1rem;
        }
        #fetch_length label{
            font-size:1.2rem;
        }
        #fetch_length select{
            outline:none;
            padding:5px;
            border-radius:10px;
        }
        #fetch_filter{
            display:inline-block;
            float:right;
        }
        #fetch_filter label input{
            outline:none;
            padding-block:5px;
            padding-inline:10px;
            border-radius:10px;
            margin:1rem;
            font-size:1.2rem;
        }
        #fetch_paginate{
            float:right;
        }
        #fetch_paginate .paginate_button {
            color: #fff !important;
            background-color: #007bff;
            font-size:1.2rem;
            border-radius: 3px;
            padding: 6px 12px;
            margin-right: 5px;
            text-decoration: none;
            border: none;
        }
        #fetch_paginate .paginate_button.current {
            background-color: #0056b3;
        }
        #fetch_paginate .paginate_button:hover {
            background-color: #0056b3;
            cursor: pointer;
        }
        #fetch_info {
           font-size:1.2rem;
        }
    </style>
    </head>
    <body>
         <div class="container-fluid p-0 d-flex">
                 <%@include file="dashboard.jsp"%>
            
                 <div class="container-fluid p-0 admin-header" style="margin-left:17.8rem">
                     <div class="bg-white">
                         <h3 class="p-3">All Contact Info</h3>
                     </div>
                     <div class="show-products">
                         <table class="table table-bordered fetch" id="fetch">
                             <thead class="bg-dark">
                             <th>Customer Name</th>
                             <th>Email</th>
                             <th>Message</th>
                             </thead>
                             <tbody class="" style="background-color:aliceblue">
                      <%
                        ResultSet rs=null;
                        try{
                        Connection con = conn.getcon();
                        String query;
                        query = "Select * from [contact]";
                        Statement statement = con.createStatement();
                        rs = statement.executeQuery(query);
                        while(rs.next()){
                      %>
                      <tr>
                          <td><%=rs.getString(1)%></td>
                          <td><%=rs.getString(2)%></td>
                          <td><%=rs.getString(3)%></td>
                      </tr>
                      <%
                          }
                          }
                          catch(Exception e)
                          {
                           out.print(e);
                          }
                      %>
                      </tbody>
                      </table>
                     </div>
                 </div>
            </div>
        </div>
    </body>
    <script>
           $(document).ready(function () {
               $("#fetch").DataTable({
                     dom: "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
                "<'row'<'col-sm-12'tr>>" +
                "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
            language: {
                search: "",
                searchPlaceholder: "Search Data..."
            }
               });
});
    </script>
</html>
