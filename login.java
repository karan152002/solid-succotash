
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

@WebServlet(urlPatterns = {"/login"})
public class login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("txtuser");
        String pass = request.getParameter("txtpass");
          try(PrintWriter out = response.getWriter()){
              if(user.equals("Admin") && pass.equals("2002"))
              {
                   response.sendRedirect("admin.jsp");
              }
              else{
                   ResultSet rs = null;
                   Connection con=getcon();
                   String check="Select * from [register] where Username='"+ user +"' and Password='"+ pass +"'";
                   PreparedStatement p = con.prepareStatement(check);
                   rs = p.executeQuery();
             
              if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("name", user);
                response.sendRedirect("products.jsp");
            } else {
                 out.println("<script>alert('Wrong Username Or Password')</script>");
                 response.setHeader("Refresh", "0; URL=login.jsp");
            }
              }
        }
        catch(IOException | SQLException e)
        {
           System.out.println(e);
        }
    }
}
