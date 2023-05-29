
import static connection.dbo.conn.getcon;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.Base64;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/cart"})
public class cart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          HttpSession session = request.getSession();
         String name=(String) session.getAttribute("name");
        String productId = request.getParameter("productId");
        String productName = request.getParameter("productName");
        String productPrice = request.getParameter("productPrice");
        String productCategory = request.getParameter("productCategory");
        String productimg = request.getParameter("productimg");
        String quantity = request.getParameter("quantity");
        byte[] imageBytes = Base64.getDecoder().decode(productimg);
          try(PrintWriter out = response.getWriter()){
           Connection con=getcon();
            ResultSet rs = null;
           String check="Select * from [cart] where id='"+ productId +"'";
             PreparedStatement p = con.prepareStatement(check);
             rs = p.executeQuery();
             if(rs.next())
             {
                  String username = rs.getString("Username");
                 if (username.equals(name)) {
                 out.println("<script>alert('Product is already added in cart')</script>");
                   response.setHeader("Refresh", "0; URL=products.jsp");
                 }
             }
             else{
           String query = "INSERT INTO cart (id, name, price, category, quantity, image,Username) VALUES (?, ?, ?, ?, ?, ?, ?)";
              PreparedStatement ps = con.prepareStatement(query);
                 ps.setString(1, productId);
                ps.setString(2, productName);
                 ps.setString(3, productPrice);
                  ps.setString(4, productCategory);
                   ps.setString(5, quantity);
                    ps.setBytes(6, imageBytes);
                    ps.setString(7, name);
                ps.executeUpdate();
                response.sendRedirect("products.jsp");
             }
          }
        catch(IOException | SQLException e)
        {
           System.out.println(e);
        }
    }
}
