
import static connection.dbo.conn.getcon;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet(urlPatterns = {"/register"})
public class register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("txtuser");
        String pass = request.getParameter("txtpass");
         String con_pass = request.getParameter("txtcon");
          try(PrintWriter out = response.getWriter()){
            ResultSet rs = null;
            Connection con=getcon();
            String check="Select * from [register] where Username='"+ user +"'";
             PreparedStatement p = con.prepareStatement(check);
             rs = p.executeQuery();
             if(rs.next())
             {
                 out.println("<script>alert('Username has already taken')</script>");
                   response.setHeader("Refresh", "0; URL=register.jsp");
             }
             else if(user.equals("Admin")){
                  out.println("<script>alert('Username has already taken')</script>");
                   response.setHeader("Refresh", "0; URL=register.jsp");
             }
             else{
                 if(pass.equals(con_pass))
                 {
                String query;
                query = "Insert into [register](Username,Password,Con_Password)values(?,?,?)";
                PreparedStatement ps = con.prepareStatement(query);
                 ps.setString(1, user);
                ps.setString(2, pass);
                 ps.setString(3, con_pass);
                ps.executeUpdate();
              
                response.sendRedirect("register.jsp");
                 }
                 else {
                    out.println("<script>alert('Passwords must be identical');</script>");
                    response.setHeader("Refresh", "0; URL=register.jsp");
                }
             }
        }
        catch(IOException | SQLException e)
        {
           System.out.println(e);
        }
    }
}
