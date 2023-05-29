//import static connection.dbo.conn.getcon;
//import java.io.IOException;
//import java.io.InputStream;
////import java.sql.Connection;
////import java.sql.DriverManager;
////import java.sql.PreparedStatement;
////import java.sql.SQLException;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.MultipartConfig;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.Part;
//import java.sql.*;
//import java.util.ArrayList;
//import java.util.List;

import static connection.dbo.conn.getcon;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/AddProductServlet")
@MultipartConfig(maxFileSize = 16177215) // Set the maximum file size (in this example, 16MB)
public class AddProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("txtname");
        String price = request.getParameter("txtprice");
        String category = request.getParameter("txtcat");
         Part filePart = request.getPart("file");
         
         InputStream inputStream = null;
    
    if (filePart != null) {
        long fileSize = filePart.getSize();
        String contentType = filePart.getContentType();
        inputStream = filePart.getInputStream();
    }
     try{
           
            Connection con=getcon();
            String query;
            query = "Insert into [add-product](name,price,category,image)values(?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, productName);
            ps.setString(2, price);
            ps.setString(3, category);
            byte[] byteArray = inputStream.readAllBytes();
           ps.setBytes(4, byteArray);
       
           ps.executeUpdate();
             
           response.sendRedirect("add-product.jsp");
           
             
        }
        catch(IOException | SQLException e)
        {
           System.out.println(e);
        }
     
    }
}
