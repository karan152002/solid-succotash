import static connection.dbo.conn.getcon;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.Part;

@WebServlet(urlPatterns = {"/editstore"})
public class editstore extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String productId = request.getParameter("id");
        String sname = request.getParameter("txtstore");
        String saddress = request.getParameter("txtaddress");
        try {
            Connection con = getcon();
            String query = "UPDATE [add-store] SET sname=?, saddress=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, sname);
            ps.setString(2, saddress);
            ps.setString(3, productId);
            ps.executeUpdate();

            response.sendRedirect("view-store.jsp");
        } 
         catch(IOException | SQLException e)
        {
           System.out.println(e);
        }
    }


}
