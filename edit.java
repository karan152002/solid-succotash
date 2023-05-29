import static connection.dbo.conn.getcon;
import java.io.IOException;
import java.io.InputStream;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.sql.*;
/**
 *
 * @author satpu
 */
@WebServlet(urlPatterns = {"/edit"})
@MultipartConfig(maxFileSize = 16177215)
public class edit extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productId = request.getParameter("id");
        if(productId.equals(0)){
             productId = request.getParameter("id");
        }
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

        try {
            Connection con = getcon();
            String query = "UPDATE [add-product] SET name=?, price=?, category=?, image=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, productName);
            ps.setString(2, price);
            ps.setString(3, category);
            System.out.println(inputStream);
            if (filePart.getSize() > 0) {
                byte[] byteArray = inputStream.readAllBytes();
                ps.setBytes(4, byteArray);
            } 
            else
            {
                 String oldImageValue = request.getParameter("upload_Old");
                 byte[] oldImageBytes = null;
    
    // Retrieve the existing image data from the database using the old image value
    try (Connection con1 = getcon();
         PreparedStatement ps1 = con1.prepareStatement("SELECT image FROM [add-product] WHERE id = ?")) {
        ps1.setString(1, productId);
        try (ResultSet rs = ps1.executeQuery()) {
            if (rs.next()) {
                oldImageBytes = rs.getBytes("image");
            }
        }
    } catch (SQLException e) {
        // Handle any database-related errors
        e.printStackTrace();
    }
    
           ps.setBytes(4, oldImageBytes);
            }
            ps.setString(5, productId);
            ps.executeUpdate();

            response.sendRedirect("view-product.jsp");
        } 
         catch(IOException | SQLException e)
        {
           System.out.println(e);
        }


        
}
}