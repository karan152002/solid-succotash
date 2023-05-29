
import static connection.dbo.conn.getcon;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet(urlPatterns = {"/addstore"})
public class addstore extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String txtstore = request.getParameter("txtstore");
        String txtaddress = request.getParameter("txtaddress");
          try{
           
            Connection con=getcon();
            String query;
            query = "Insert into [add-store](sname,saddress)values(?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, txtstore);
            ps.setString(2, txtaddress);
           ps.executeUpdate();
             
           response.sendRedirect("add-store.jsp");
           
             
        }
        catch(IOException | SQLException e)
        {
           System.out.println(e);
        }
    }
}
