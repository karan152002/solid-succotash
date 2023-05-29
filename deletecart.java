import static connection.dbo.conn.getcon;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/deletecart"})
public class deletecart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           HttpSession s;
              s=request.getSession(false);
            String username = "";
            if (s != null) {
                username = (String) s.getAttribute("name");
            }
         String cartId = request.getParameter("pid");
    if (cartId != null) {
        try {
            Connection con = getcon();
            String query = "Delete FROM [cart] WHERE pid = '"+ cartId +"' And Username='"+ username +"'";
            Statement statement = con.createStatement();
            int rowsAffected = statement.executeUpdate(query);
            if (rowsAffected > 0) {
                response.sendRedirect("cart.jsp"); // Redirect to the view page after deletion
            } else {
                response.getWriter().println("Failed to delete the store.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error occurred while deleting the store.");
        }
    } else {
        response.getWriter().println("Invalid store ID.");
    }
        
        }
    }

  


