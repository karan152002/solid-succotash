
import static connection.dbo.conn.getcon;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;
@WebServlet(urlPatterns = {"/pay"})
public class pay extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          HttpSession s;
              s=request.getSession(false);
            int totals = 0;
            if (s != null) {
                totals = (int) s.getAttribute("totals");
            }
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("name");
        String address = request.getParameter("address");
        String apart = request.getParameter("apart");
        String city=request.getParameter("city");
        String country = request.getParameter("country");
        String state=request.getParameter("state");
        String zip = request.getParameter("zip");
        String add = address +","+ apart +","+ city +","+ country +","+ state +","+ zip;
        int total=  totals;
          try{
           
            Connection con=getcon();
            String query;
            query = "Insert into [pay](Username,address,status,total)values(?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, add);
            ps.setString(3, "pending");
            ps.setInt(4, total);
           ps.executeUpdate();
             
           response.sendRedirect("pay.jsp");
           
             
        }
        catch(IOException | SQLException e)
        {
           System.out.println(e);
        }
    }
}
