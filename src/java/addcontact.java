
import static connection.dbo.conn.getcon;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet(urlPatterns = {"/addcontact"})
public class addcontact extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String txtname = request.getParameter("txtname");
        String txtemail = request.getParameter("txtemail");
        String txtmes = request.getParameter("txtmes");
          try{
           
            Connection con=getcon();
            String query;
            query = "Insert into [contact](contact_name,contact_email,contact_mess)values(?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, txtname);
            ps.setString(2, txtemail);
            ps.setString(3, txtmes);
           ps.executeUpdate();
             
           response.sendRedirect("contact.jsp");
           
             
        }
        catch(IOException | SQLException e)
        {
           System.out.println(e);
        }
    }

  

}
