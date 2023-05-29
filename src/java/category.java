
import static connection.dbo.conn.getcon;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 *
 * @author satpu
 */
@WebServlet(urlPatterns = {"/category"})
public class category extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
             String selectedCategory = request.getParameter("selectedCategory");
             try{
                 Connection con=getcon();
                  if(selectedCategory!=null)
              {
                   PreparedStatement ps=con.prepareStatement("Select * From [add-product] Where category='"+ selectedCategory +"'");
                
                   ResultSet rs = ps.executeQuery();
                   response.sendRedirect("products.jsp");
              }
                  else
                  {
                       PreparedStatement ps=con.prepareStatement("Select * From [add-product]");
                        ResultSet rs = ps.executeQuery();
                          response.sendRedirect("products.jsp");
                  }
             }
              catch (SQLException e) {
    
                e.printStackTrace();
            }
             }
    }

  


