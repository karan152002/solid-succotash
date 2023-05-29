<%-- 
    Document   : add-product
    Created on : May 21, 2023, 9:30:02 AM
    Author     : satpu
--%>

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
                         <h3 class="p-3">Add Products</h3>
                     </div>
                     <div>
                         <div class="container-fluid p-0 allproducts">
                             <form action="AddProductServlet" method="post" enctype="multipart/form-data">
                                 <table class="add-product d-flex flex-column border">
                                     <tr>
                                         <td>Product Name</td>
                                         <td><input type="text" placeholder="Enter the Product Name" name="txtname" class="form-control inputs" required></td>
                                     </tr>
                                     <tr>
                                         <td>Product Price</td>
                                         <td><input type="text" placeholder="Enter the Product Price" name="txtprice" class="form-control inputs" required></td>
                                     </tr>
                                     <tr>
                                         <td>Product Category</td>
                                         <td>
                                     <select  name="txtcat" class="form-control inputs" required>
                                         <option value="">--Select Category--</option>
                                         <option value="Fruits and Veggies">Fruits and Veggies</option>
                                         <option value="Snacks and Drinks">Snacks and Drinks</option>
                                         <option value="Dairy and Frozen">Dairy and Frozen</option>
                                         <option value="Cleaning">Cleaning</option>
                                         <option value="Clothing">Clothing</option>
                                         <option value="Home and Kitchen">Home and Kitchen</option>
                                     </select></td>
                                     </tr>
                                     <tr>
                                         <td>Product Image</td>
                                         <td><input type="file" name="file" id="customfile" class="form-control inputs">
                                            
                                <label for="customfile" class="form-control1"></label>
                                     </td></tr>
                                     <tr>
                                         <td><input type="submit" value="Add Product" class="btn btn-primary add" name="add"></td>
                                        
                                     </tr>
                                 </table>
                             </form>
                         </div>
                     </div>
                 </div>
            </div>
        </div>
    </body>
<script>
    document.querySelectorAll('.cat input[type="submit"]').forEach(function(button) {
        button.addEventListener('click', function() {
            document.getElementById('selectedCategory').value = button.value;
        });
    });
</script>

</html>
